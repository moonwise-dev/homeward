import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_entry.freezed.dart';

@freezed
abstract class GalleryEntry with _$GalleryEntry {
  const factory GalleryEntry({
    required String surfaceId,
    required String title,
    required String subtitle,
  }) = _GalleryEntry;
}
