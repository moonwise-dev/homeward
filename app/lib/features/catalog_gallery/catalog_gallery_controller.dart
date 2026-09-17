import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/repository_providers.dart';
import 'catalog_gallery_state.dart';

part 'catalog_gallery_controller.g.dart';

@riverpod
class CatalogGalleryController extends _$CatalogGalleryController {
  @override
  CatalogGalleryState build() => CatalogGalleryState(
    entries: ref.watch(galleryRepositoryProvider).entries,
  );
}
