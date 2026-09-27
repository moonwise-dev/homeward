import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart' as a2ui;
import 'package:common/common.dart';
import 'package:genui/genui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../catalog/homeward_catalog.dart';
import '../../domain/models/gallery_component.dart';

part 'gallery_repository.g.dart';

abstract interface class GalleryRepository {
  List<GalleryComponent> get components;

  SurfaceContext surfaceContext(String surfaceId);
}

class GenUiGalleryRepository implements GalleryRepository {
  GenUiGalleryRepository(Catalog catalog)
    : _surfaces = SurfaceController(catalogs: [catalog]) {
    for (final component in homewardComponents) {
      _components.add(
        GalleryComponent(
          name: component.name,
          family: component.family,
          description: component.description,
          parameters: componentParameters(component),
          examples: [
            for (final (index, example) in component.examples.indexed)
              _show('gallery-${component.name}-$index', example),
          ],
        ),
      );
    }
  }

  final SurfaceController _surfaces;
  final _components = <GalleryComponent>[];

  @override
  List<GalleryComponent> get components => List.unmodifiable(_components);

  @override
  SurfaceContext surfaceContext(String surfaceId) =>
      _surfaces.contextFor(surfaceId);

  GalleryExample _show(String surfaceId, CatalogExample example) {
    for (final message in [
      {
        'createSurface': {
          'surfaceId': surfaceId,
          'catalogId': homewardCatalogId,
        },
      },
      for (final MapEntry(key: slice, :value) in example.dataModel.entries)
        {
          'updateDataModel': {
            'surfaceId': surfaceId,
            'path': '/$slice',
            'value': value,
          },
        },
      {
        'updateComponents': {
          'surfaceId': surfaceId,
          'components': example.components,
        },
      },
    ]) {
      _surfaces.handleMessage(
        a2ui.A2uiMessage.fromJson(
          jsonDecode(jsonEncode({'version': A2uiExtension.version, ...message}))
              as Map<String, dynamic>,
        ),
      );
    }
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
    GenUiGalleryRepository(homewardGenuiCatalog());
