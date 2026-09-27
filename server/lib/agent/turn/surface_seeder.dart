import 'package:a2ui_core/a2ui_core.dart';
import 'package:collection/collection.dart';

import '../validation/component_tree.dart';

typedef HeldValue = Object? Function(String surfaceId, String slice);

final class SurfaceSeeder {
  SurfaceSeeder({required this.held});

  final HeldValue held;
  final _pendingCreates = <String, CreateSurfaceMessage>{};
  final _sent = <String, Map<String, Object?>>{};

  Iterable<String> get awaitingComponents => _pendingCreates.keys;

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
      ...refresh(surfaceId, boundSlices(components), seeds),
      message.toJson(),
    ],
    _ => [message.toJson()],
  };

  List<Map<String, Object?>> refresh(
    String surfaceId,
    Iterable<String> slices,
    Map<String, Object?> seeds,
  ) => [
    for (final slice in slices)
      if (seeds.containsKey(slice) && _changes(surfaceId, slice, seeds[slice]))
        UpdateDataModelMessage(
          surfaceId: surfaceId,
          path: '/$slice',
          value: seeds[slice],
        ).toJson(),
  ];

  List<Map<String, Object?>> _hold(
    String surfaceId,
    CreateSurfaceMessage message,
  ) {
    _pendingCreates[surfaceId] = message;
    return const [];
  }

  bool _changes(String surfaceId, String slice, Object? value) {
    final sent = _sent.putIfAbsent(surfaceId, () => {});
    final current = sent.containsKey(slice)
        ? sent[slice]
        : held(surfaceId, slice);
    if (const DeepCollectionEquality().equals(current, value)) {
      return false;
    }
    sent[slice] = value;
    return true;
  }
}
