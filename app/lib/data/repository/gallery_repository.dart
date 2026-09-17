import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart' as a2ui;
import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../models/gallery_entry.dart';

abstract interface class GalleryRepository {
  List<GalleryEntry> get entries;

  SurfaceContext surfaceContext(String surfaceId);
}

class GenUiGalleryRepository implements GalleryRepository {
  GenUiGalleryRepository(Catalog catalog)
    : _surfaces = SurfaceController(catalogs: [catalog]) {
    for (final (index, example) in surfaceExamples.indexed) {
      _show(
        GalleryEntry(
          surfaceId: 'gallery-surface-$index',
          title: example.name,
          subtitle: 'Surface example',
        ),
        example,
      );
    }
    for (final component in homewardComponents) {
      for (final (index, example) in component.examples.indexed) {
        _show(
          GalleryEntry(
            surfaceId: 'gallery-${component.name}-$index',
            title: component.name,
            subtitle: example.name,
          ),
          example,
        );
      }
    }
  }

  final SurfaceController _surfaces;
  final _entries = <GalleryEntry>[];

  @override
  List<GalleryEntry> get entries => List.unmodifiable(_entries);

  @override
  SurfaceContext surfaceContext(String surfaceId) =>
      _surfaces.contextFor(surfaceId);

  void _show(GalleryEntry entry, CatalogExample example) {
    final surfaceId = entry.surfaceId;
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
    _entries.add(entry);
  }
}
