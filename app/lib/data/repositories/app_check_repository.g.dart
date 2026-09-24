// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_check_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appCheckRepository)
final appCheckRepositoryProvider = AppCheckRepositoryProvider._();

final class AppCheckRepositoryProvider
    extends
        $FunctionalProvider<
          AppCheckRepository,
          AppCheckRepository,
          AppCheckRepository
        >
    with $Provider<AppCheckRepository> {
  AppCheckRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appCheckRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appCheckRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppCheckRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppCheckRepository create(Ref ref) {
    return appCheckRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppCheckRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppCheckRepository>(value),
    );
  }
}

String _$appCheckRepositoryHash() =>
    r'5edd7acc22533555dc2476bdd892c403e478e56e';
