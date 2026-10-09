import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

import 'component_tree.dart';
import 'json_repair.dart';
import 'validation_failure.dart';
import 'validation_outcome.dart';

final class TurnValidator {
  TurnValidator({
    required this.turn,
    required this.catalog,
    required this.shadow,
    required this.seeds,
  }) : _inlinePattern = InlineSurfaces.idPattern(turn);

  final int turn;
  final CatalogValidator catalog;
  final MessageProcessor<ComponentApi> shadow;
  Map<String, Object?> seeds;
  final handed = <String, Map<String, Object?>>{};
  final RegExp _inlinePattern;
  final _sentThisTurn = <String, Set<String>>{};
  final _inlineCreated = <String>{};
  var _lastSurfaceId = planSurfaceId;

  String get lastSurfaceId => _lastSurfaceId;

  bool get drewThisTurn => _sentThisTurn.values.any((ids) => ids.isNotEmpty);

  List<Map<String, Object?>>? get screen => switch (_surface(planSurfaceId)) {
    final surface? => [
      for (final component in surface.componentsModel.all) component.toJson(),
    ],
    null => null,
  };

  Object? heldValue(String surfaceId, String slice) =>
      _surface(surfaceId)?.dataModel.get('/$slice');

  List<String> surfacesBinding(String slice) => [
    for (final surfaceId in [planSurfaceId, ..._inlineCreated])
      if (_surface(surfaceId) case final surface?
          when boundSlices([
            for (final component in surface.componentsModel.all)
              component.toJson(),
          ]).contains(slice))
        surfaceId,
  ];

  SurfaceModel<ComponentApi>? _surface(String surfaceId) =>
      shadow.groupModel.getSurface(surfaceId);

  ValidationOutcome validate(String source) {
    final Object? json;
    try {
      json = jsonDecode(source);
    } on FormatException catch (error) {
      if (repairedJson(source) case final repaired?) {
        return validate(jsonEncode(repaired));
      }
      return _reject(
        _surfaceIdPattern.firstMatch(source)?[1] ?? '',
        '',
        'Not valid JSON: ${error.message}${_near(source, error.offset)}',
      );
    }
    if (json is! Map<String, Object?>) {
      return _reject('', '', 'Each a2ui message must be one JSON object');
    }
    if (_unknownEnvelopeField(json) case (final path, final problem)) {
      return _reject(_surfaceIdIn(json), path, problem);
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
    if (_surface(surfaceId) != null) {
      return const Unchanged();
    }
    final inline = surfaceId != planSurfaceId;
    if (inline && _inlineCreated.length >= InlineSurfaces.maxPerTurn) {
      return _reject(
        surfaceId,
        '/createSurface',
        'A turn asks with at most ${InlineSurfaces.maxPerTurn} inline surface; '
            'put everything else on $planSurfaceId',
      );
    }
    return _apply(message, () {
      if (inline) {
        _inlineCreated.add(surfaceId);
      }
      _lastSurfaceId = surfaceId;
    });
  }

  ValidationOutcome _updateComponents(UpdateComponentsMessage message) {
    final surfaceId = message.surfaceId;
    if (_ownershipProblem(surfaceId) case final problem?) {
      return _reject(surfaceId, '/updateComponents/surfaceId', problem);
    }
    final surface = _surface(surfaceId);
    if (surface == null) {
      return _reject(
        surfaceId,
        '/updateComponents/surfaceId',
        'Create surface $surfaceId before adding components',
      );
    }
    final merged = {
      for (final component in surface.componentsModel.all)
        component.id: component.toJson(),
    };
    final named = {
      ...merged.keys,
      for (final component in message.components) component['id'],
    };
    final leftOut = {
      for (final component in [...merged.values, ...message.components])
        for (final child in childReferences(component))
          if (!named.contains(child)) child,
    };
    final filled = [for (final id in leftOut) ?handed[id]];
    if (filled.isNotEmpty) {
      return _updateComponents(
        UpdateComponentsMessage(
          surfaceId: surfaceId,
          components: [...message.components, ...filled],
        ),
      );
    }
    final data = {
      ...switch (surface.dataModel.get('/')) {
        final Map<String, Object?> data => data,
        _ => const <String, Object?>{},
      },
      ...seeds,
    };
    final sent = <String>{};
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
        if (!resolvesForBinding(data, bound)) {
          return _reject(surfaceId, path, '$bound is not in the data model');
        }
      }
      if (_unseeded(component, data) case final bound?) {
        final tool = dataModelSlices
            .where(
              (slice) =>
                  bound.startsWith('${slice.path}/') || bound == slice.path,
            )
            .firstOrNull
            ?.seededBy;
        return _reject(
          surfaceId,
          path,
          '$bound is not in the data model yet; call ${tool ?? 'the tool that '
                  'seeds it'} first, then send this message again',
        );
      }
      final id = component['id']! as String;
      merged[id] = component;
      sent.add(id);
    }
    if (structureProblem(
          merged,
          mustReach: {...?_sentThisTurn[surfaceId], ...sent},
        )
        case final problem?) {
      return _reject(surfaceId, '/updateComponents/components', problem);
    }
    return _apply(message, () {
      _sentThisTurn.putIfAbsent(surfaceId, () => {}).addAll(sent);
      _lastSurfaceId = surfaceId;
    });
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
      surfaceId == planSurfaceId || _inlinePattern.hasMatch(surfaceId)
      ? null
      : 'Surface id "$surfaceId" is neither the plan panel, '
            '"$planSurfaceId", nor an inline ask of turn $turn, such as '
            '"${InlineSurfaces.id(turn, 'budget')}"';

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

  static (String, String)? _unknownEnvelopeField(Map<String, Object?> json) {
    for (final MapEntry(key: type, value: fields) in _envelopeFields.entries) {
      if (json[type] case final Map<String, Object?> body) {
        for (final field in body.keys) {
          if (!fields.contains(field)) {
            return (
              '/$type/$field',
              '$type has no field "$field"; it takes ${fields.join(', ')}'
                  '${type == 'createSurface' ? ', and components go in their own updateComponents message' : ''}',
            );
          }
        }
      }
    }
    return null;
  }

  Rejected _reject(String surfaceId, String path, String message) => Rejected(
    ValidationFailure(surfaceId: surfaceId, path: path, message: message),
  );

  String? _unseeded(
    Map<String, Object?> component,
    Map<String, Object?> data,
  ) {
    final declared = homewardComponents
        .where((declared) => declared.name == component['component'])
        .firstOrNull;
    for (final property in declared?.boundProperties ?? const <String>[]) {
      for (final bound in boundPaths(component[property])) {
        if (!resolvesFully(data, bound)) {
          return bound;
        }
      }
    }
    return null;
  }

  static final _surfaceIdPattern = RegExp(r'"surfaceId"\s*:\s*"([^"]+)"');

  String _surfaceIdIn(Map<String, Object?> json) => switch (json) {
    {'createSurface': {'surfaceId': final String id}} => id,
    {'updateComponents': {'surfaceId': final String id}} => id,
    _ => '',
  };
}

const _envelopeFields = {
  'createSurface': {'surfaceId', 'catalogId', 'theme', 'sendDataModel'},
  'updateComponents': {'surfaceId', 'components'},
};
