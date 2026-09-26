import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

import 'case_completion.dart';
import 'component_tree.dart';
import 'hunch_problem.dart';
import 'json_repair.dart';
import 'form_completion.dart';
import 'validation_failure.dart';
import 'validation_outcome.dart';

final class TurnValidator {
  TurnValidator({
    required this.turn,
    required this.catalog,
    required this.shadow,
    required this.seeds,
  }) : _surfacePattern = InlineSurfaces.idPattern(turn);

  final int turn;
  final CatalogValidator catalog;
  final MessageProcessor<ComponentApi> shadow;
  Map<String, Object?> seeds;
  Set<String> requiredProfilePaths = const {};
  Set<CaseFacet> mustAsk = const {};
  final RegExp _surfacePattern;
  final _components = <String, Map<String, Map<String, Object?>>>{};

  Set<String> get surfacesCreated => _components.keys.toSet();

  bool get drewComponents =>
      _components.values.any((components) => components.isNotEmpty);

  Iterable<String> get emptySurfaces => [
    for (final MapEntry(:key, :value) in _components.entries)
      if (value.isEmpty) key,
  ];

  ValidationOutcome validate(String source) {
    final Object? json;
    try {
      json = jsonDecode(source);
    } on FormatException catch (error) {
      if (repairedJson(source) case final repaired?) {
        return validate(jsonEncode(repaired));
      }
      return _reject(
        '',
        '',
        'Not valid JSON: ${error.message}${_near(source, error.offset)}',
      );
    }
    if (json is! Map<String, Object?>) {
      return _reject('', '', 'Each a2ui message must be one JSON object');
    }
    final A2uiMessage message;
    try {
      message = A2uiMessage.fromJson(json);
    } on A2uiValidationError catch (error) {
      return _reject(_surfaceIdIn(json), '', error.message);
    } on TypeError catch (error) {
      return _reject(
        _surfaceIdIn(json),
        '',
        'A field has the wrong type ($error); check surfaceId, catalogId, '
            'and that components is a list of objects',
      );
    }
    return switch (message) {
      CreateSurfaceMessage() => _createSurface(message),
      UpdateComponentsMessage() => _updateComponents(message),
      UpdateDataModelMessage(:final surfaceId) => _reject(
        surfaceId,
        '/updateDataModel',
        'The server writes the data model; bind components to paths instead',
      ),
      DeleteSurfaceMessage(:final surfaceId) => _reject(
        surfaceId,
        '/deleteSurface',
        'Surfaces cannot be deleted',
      ),
      _ => _reject('', '', 'Unknown message type'),
    };
  }

  ValidationOutcome _createSurface(CreateSurfaceMessage message) {
    final surfaceId = message.surfaceId;
    if (_ownershipProblem(surfaceId) case final problem?) {
      return _reject(surfaceId, '/createSurface/surfaceId', problem);
    }
    if (message.catalogId != homewardCatalogId) {
      return _reject(
        surfaceId,
        '/createSurface/catalogId',
        'Use catalogId $homewardCatalogId',
      );
    }
    if (_components.containsKey(surfaceId)) {
      return const Unchanged();
    }
    if (_components.length >= InlineSurfaces.maxPerTurn) {
      return _reject(
        surfaceId,
        '/createSurface',
        'A turn may create at most ${InlineSurfaces.maxPerTurn} surfaces',
      );
    }
    return _apply(message, () => _components[surfaceId] = {});
  }

  ValidationOutcome _updateComponents(UpdateComponentsMessage message) {
    final surfaceId = message.surfaceId;
    if (_ownershipProblem(surfaceId) case final problem?) {
      return _reject(surfaceId, '/updateComponents/surfaceId', problem);
    }
    final existing = _components[surfaceId];
    if (existing == null) {
      return _reject(
        surfaceId,
        '/updateComponents/surfaceId',
        'Create surface $surfaceId in this turn before adding components',
      );
    }
    final merged = {...existing};
    for (final (index, component) in message.components.indexed) {
      final path = '/updateComponents/components/$index';
      final name = component['component'];
      if (!catalog.componentNames.contains(name)) {
        return _reject(
          surfaceId,
          '$path/component',
          '$name is not in the catalog',
        );
      }
      final errors = catalog.validateComponent(component) ?? const [];
      if (errors.isNotEmpty) {
        final first = errors.first;
        return _reject(
          surfaceId,
          '$path/${first.path.join('/')}',
          '$name: ${first.details ?? first.error.name}',
        );
      }
      for (final bound in boundPaths(component)) {
        if (!resolvesForBinding(seeds, bound)) {
          return _reject(surfaceId, path, '$bound is not in the data model');
        }
      }
      for (final action in actionNames(component)) {
        if (!SurfaceAction.wireNames.contains(action)) {
          return _reject(surfaceId, path, 'Unknown action $action');
        }
      }
      if (caseQuestionProblem(component, mustAsk) case final problem?) {
        return _reject(surfaceId, path, problem);
      }
      if (hunchProblem(component) case final problem?) {
        return _reject(surfaceId, '$path/options', problem);
      }
      merged[component['id']! as String] = component;
    }
    final completed = <String, Map<String, Object?>>{};
    void complete(List<Map<String, Object?>> components) {
      for (final component in components) {
        final id = component['id']! as String;
        merged[id] = component;
        completed[id] = component;
      }
    }

    complete(
      completingComponents(
        components: merged,
        requiredPaths: requiredProfilePaths,
      ),
    );
    complete(caseAnswerCompletion(merged));
    final completing = completed.values.toList();
    if (structureProblem(merged) ?? _formProblem(merged) case final problem?) {
      return _reject(surfaceId, '/updateComponents/components', problem);
    }
    return _apply(
      completing.isEmpty ? message : _completed(message, completing),
      () => _components[surfaceId] = merged,
    );
  }

  UpdateComponentsMessage _completed(
    UpdateComponentsMessage message,
    List<Map<String, Object?>> completing,
  ) {
    final replaced = {for (final component in completing) component['id']};
    return UpdateComponentsMessage(
      version: message.version,
      surfaceId: message.surfaceId,
      components: [
        for (final component in message.components)
          if (!replaced.contains(component['id'])) component,
        ...completing,
      ],
    );
  }

  String? _formProblem(Map<String, Map<String, Object?>> components) {
    final commitsProfile = components.values.any(
      (component) => actionNames(
        component,
      ).contains(SurfaceAction.commitProfile.wireName),
    );
    if (!commitsProfile) {
      return null;
    }
    final bound = {
      for (final component in components.values) ...boundPaths(component),
    };
    final unbound = requiredProfilePaths.difference(bound);
    return unbound.isEmpty
        ? null
        : 'A form sending ${SurfaceAction.commitProfile.wireName} needs '
              'inputs bound to ${unbound.join(', ')}';
  }

  static String _near(String source, int? offset) {
    if (offset == null) {
      return '';
    }
    final start = (offset - 40).clamp(0, source.length);
    final end = (offset + 40).clamp(0, source.length);
    return ' at character $offset, near `${source.substring(start, end)}`';
  }

  String? _ownershipProblem(String surfaceId) =>
      _surfacePattern.hasMatch(surfaceId)
      ? null
      : 'Surface id "$surfaceId" does not fit turn $turn: surface ids in '
            'turn $turn look like ${InlineSurfaces.id(turn, 'clue')}, lowercase '
            'letters and digits joined by hyphens';

  ValidationOutcome _apply(A2uiMessage message, void Function() record) {
    try {
      shadow.processMessages([message]);
    } on A2uiError catch (error) {
      final surfaceId = switch (message) {
        CreateSurfaceMessage(:final surfaceId) => surfaceId,
        UpdateComponentsMessage(:final surfaceId) => surfaceId,
        _ => '',
      };
      return _reject(surfaceId, '', error.message);
    }
    record();
    return Accepted(message);
  }

  Rejected _reject(String surfaceId, String path, String message) => Rejected(
    ValidationFailure(surfaceId: surfaceId, path: path, message: message),
  );

  String _surfaceIdIn(Map<String, Object?> json) => switch (json) {
    {'createSurface': {'surfaceId': final String id}} => id,
    {'updateComponents': {'surfaceId': final String id}} => id,
    _ => '',
  };
}
