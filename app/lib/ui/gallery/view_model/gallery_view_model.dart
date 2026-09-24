import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/gallery_repository.dart';
import '../../../domain/models/gallery_entry.dart';

part 'gallery_view_model.freezed.dart';
part 'gallery_view_model.g.dart';

@riverpod
class GalleryViewModel extends _$GalleryViewModel {
  @override
  GalleryState build() => GalleryState(
    entries: ref.watch(galleryRepositoryProvider).entries,
  );
}

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState({required List<GalleryEntry> entries}) =
      _CatalogGalleryState;
}
