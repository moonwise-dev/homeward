// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GalleryViewModel)
final galleryViewModelProvider = GalleryViewModelProvider._();

final class GalleryViewModelProvider
    extends $NotifierProvider<GalleryViewModel, GalleryState> {
  GalleryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'galleryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$galleryViewModelHash();

  @$internal
  @override
  GalleryViewModel create() => GalleryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GalleryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GalleryState>(value),
    );
  }
}

String _$galleryViewModelHash() => r'f746eefc2bd890aaf1b39da0f5f2da194e5b0130';

abstract class _$GalleryViewModel extends $Notifier<GalleryState> {
  GalleryState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GalleryState, GalleryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GalleryState, GalleryState>,
              GalleryState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
