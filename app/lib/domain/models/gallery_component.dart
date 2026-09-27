import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_component.freezed.dart';

@freezed
abstract class GalleryExample with _$GalleryExample {
  const factory GalleryExample({
    required String surfaceId,
    required String name,
    required List<Map<String, Object?>> components,
    required Map<String, Object?> dataModel,
  }) = _GalleryExample;
}

@freezed
abstract class GalleryComponent with _$GalleryComponent {
  const factory GalleryComponent({
    required String name,
    required CatalogFamily family,
    required String description,
    required List<ComponentParameter> parameters,
    required List<GalleryExample> examples,
  }) = _GalleryComponent;
}
