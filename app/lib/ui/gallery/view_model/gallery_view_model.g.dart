// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GalleryViewModel)
final galleryViewModelProvider = GalleryViewModelFamily._();

final class GalleryViewModelProvider
    extends $NotifierProvider<GalleryViewModel, GalleryState> {
  GalleryViewModelProvider._({
    required GalleryViewModelFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'galleryViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$galleryViewModelHash();

  @override
  String toString() {
    return r'galleryViewModelProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is GalleryViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$galleryViewModelHash() => r'337c091844213238c5b385b3c137505ef3d79129';

final class GalleryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          GalleryViewModel,
          GalleryState,
          GalleryState,
          GalleryState,
          String?
        > {
  GalleryViewModelFamily._()
    : super(
        retry: null,
        name: r'galleryViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GalleryViewModelProvider call(String? componentName) =>
      GalleryViewModelProvider._(argument: componentName, from: this);

  @override
  String toString() => r'galleryViewModelProvider';
}

abstract class _$GalleryViewModel extends $Notifier<GalleryState> {
  late final _$args = ref.$arg as String?;
  String? get componentName => _$args;

  GalleryState build(String? componentName);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}
