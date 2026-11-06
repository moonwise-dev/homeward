import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../catalog/homeward_catalog.dart';
import '../../domain/models/gallery_component.dart';
import 'renderer_surfaces.dart';

part 'gallery_repository.g.dart';

abstract interface class GalleryRepository {
  List<GalleryComponent> get components;

  ValueListenable<RendererSurface?> surface(String surfaceId);
}

class A2uiGalleryRepository implements GalleryRepository {
  A2uiGalleryRepository(RendererSurfaces surfaces) : _surfaces = surfaces {
    for (final component in homewardComponents) {
      _components.add(
        GalleryComponent(
          name: component.name,
          family: component.family,
          description: component.description,
          parameters: componentParameters(component),
          examples: [
            for (final (index, example) in component.examples.indexed)
              _show(componentIdOf('gallery_${component.name}_$index'), example),
          ],
        ),
      );
    }
  }

  final RendererSurfaces _surfaces;
  final _components = <GalleryComponent>[];

  @override
  List<GalleryComponent> get components => List.unmodifiable(_components);

  @override
  ValueListenable<RendererSurface?> surface(String surfaceId) =>
      _surfaces.watch(surfaceId);

  GalleryExample _show(String surfaceId, CatalogExample example) {
    _surfaces.apply({
      'version': A2uiExtension.version,
      'createSurface': {
        'surfaceId': surfaceId,
        'catalogId': homewardCatalogId,
        'components': example.components,
        'dataModel': example.dataModel,
      },
    });
    return GalleryExample(
      surfaceId: surfaceId,
      name: example.name,
      components: example.components,
      dataModel: example.dataModel,
    );
  }
}

@Riverpod(keepAlive: true)
GalleryRepository galleryRepository(Ref ref) =>
    A2uiGalleryRepository(RendererSurfaces(homewardRendererCatalog()));
