// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_gallery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CatalogGalleryController)
final catalogGalleryControllerProvider = CatalogGalleryControllerProvider._();

final class CatalogGalleryControllerProvider
    extends $NotifierProvider<CatalogGalleryController, CatalogGalleryState> {
  CatalogGalleryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogGalleryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogGalleryControllerHash();

  @$internal
  @override
  CatalogGalleryController create() => CatalogGalleryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogGalleryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogGalleryState>(value),
    );
  }
}

String _$catalogGalleryControllerHash() =>
    r'905195bdf1dfeefdacf992bf25ec5aa57294ff06';

abstract class _$CatalogGalleryController
    extends $Notifier<CatalogGalleryState> {
  CatalogGalleryState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CatalogGalleryState, CatalogGalleryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CatalogGalleryState, CatalogGalleryState>,
              CatalogGalleryState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
