import 'dart:developer';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:flutter/foundation.dart';

typedef RendererSurface = SurfaceModel<ComponentImplementation>;

final class RendererSurfaces {
  RendererSurfaces(CatalogImplementation catalog)
    : _processor = MessageProcessor<ComponentImplementation>(
        catalogs: [catalog],
      ) {
    _subscriptions.addAll([
      _processor.model.onSurfaceCreated.subscribe(
        (surface) => _watched(surface.id).value = surface,
      ),
      _processor.model.onSurfaceDeleted.subscribe(
        (surfaceId) => _watched(surfaceId).value = null,
      ),
      _processor.model.onError.subscribe(
        (error) => log(
          '${error.code} on ${error.surfaceId}: ${error.message}',
          name: 'a2ui',
        ),
      ),
    ]);
  }

  final MessageProcessor<ComponentImplementation> _processor;
  final _surfaces = <String, ValueNotifier<RendererSurface?>>{};
  final _subscriptions = <Subscription>[];

  EventSource<A2uiRendererAction> get onAction => _processor.model.onAction;

  RendererSurface? operator [](String surfaceId) =>
      _processor.model.getSurface(surfaceId);

  ValueListenable<RendererSurface?> watch(String surfaceId) =>
      _watched(surfaceId);

  Map<String, Object?> dataOf(String surfaceId) =>
      switch (this[surfaceId]?.dataModel.get('/')) {
        final Map<String, Object?> data => data,
        _ => const {},
      };

  void apply(Map<String, Object?> message) {
    try {
      _processor.processMessages([message]);
    } on A2uiError catch (error) {
      log('${error.code}: ${error.message}', name: 'a2ui');
    }
  }

  ValueNotifier<RendererSurface?> _watched(String surfaceId) =>
      _surfaces.putIfAbsent(
        surfaceId,
        () => ValueNotifier(_processor.model.getSurface(surfaceId)),
      );
}
