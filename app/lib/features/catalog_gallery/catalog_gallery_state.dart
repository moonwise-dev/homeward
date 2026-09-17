import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/gallery_entry.dart';

part 'catalog_gallery_state.freezed.dart';

@freezed
abstract class CatalogGalleryState with _$CatalogGalleryState {
  const factory CatalogGalleryState({required List<GalleryEntry> entries}) =
      _CatalogGalleryState;
}
