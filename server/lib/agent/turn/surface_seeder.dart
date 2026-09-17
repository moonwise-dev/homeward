import 'package:a2ui_core/a2ui_core.dart';

import '../validation/component_tree.dart';

final class SurfaceSeeder {
  final _pendingCreates = <String, CreateSurfaceMessage>{};
  final _seededSlices = <String, Set<String>>{};

  List<Map<String, Object?>> forward(
    A2uiMessage message,
    Map<String, Object?> seeds,
  ) => switch (message) {
    CreateSurfaceMessage(:final surfaceId) => _hold(surfaceId, message),
    UpdateComponentsMessage(:final surfaceId, :final components) => [
      if (_pendingCreates.remove(surfaceId) case final create?)
        CreateSurfaceMessage(
          surfaceId: surfaceId,
          catalogId: create.catalogId,
          theme: create.theme,
          sendDataModel: true,
        ).toJson(),
      for (final slice in _slicesToSeed(surfaceId, components, seeds))
        UpdateDataModelMessage(
          surfaceId: surfaceId,
          path: '/$slice',
          value: seeds[slice],
        ).toJson(),
      message.toJson(),
    ],
    _ => [message.toJson()],
  };

  List<Map<String, Object?>> _hold(
    String surfaceId,
    CreateSurfaceMessage message,
  ) {
    _pendingCreates[surfaceId] = message;
    _seededSlices[surfaceId] = {};
    return const [];
  }

  Iterable<String> _slicesToSeed(
    String surfaceId,
    List<Map<String, Object?>> components,
    Map<String, Object?> seeds,
  ) {
    final seeded = _seededSlices.putIfAbsent(surfaceId, () => {});
    return {
      for (final path in boundPaths(components))
        if (path.startsWith('/')) path.split('/')[1],
    }.where((slice) => seeds.containsKey(slice) && seeded.add(slice)).toList();
  }
}
