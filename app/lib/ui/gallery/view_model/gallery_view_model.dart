import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/gallery_repository.dart';
import '../../../domain/models/gallery_component.dart';

part 'gallery_view_model.freezed.dart';
part 'gallery_view_model.g.dart';

@riverpod
class GalleryViewModel extends _$GalleryViewModel {
  @override
  GalleryState build(String? componentName) {
    final components = ref.watch(galleryRepositoryProvider).components;
    final selected = components
        .where((component) => component.name == componentName)
        .firstOrNull;
    return GalleryState(
      components: components,
      selected: selected,
      unknown: selected == null ? componentName : null,
    );
  }

  void showExample(int index) => state = state.copyWith(exampleIndex: index);
}

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState({
    required List<GalleryComponent> components,
    GalleryComponent? selected,
    String? unknown,
    @Default(0) int exampleIndex,
  }) = _GalleryState;

  const GalleryState._();

  GalleryExample? get example => switch (selected?.examples) {
    final examples? when exampleIndex < examples.length =>
      examples[exampleIndex],
    _ => null,
  };

  Map<CatalogFamily, List<GalleryComponent>> get byFamily => {
    for (final family in CatalogFamily.values)
      family: [
        for (final component in components)
          if (component.family == family) component,
      ],
  };
}
