// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'5198d77a96071c6b91ed870fcef9b267295e5bbe';

@ProviderFor(httpClient)
final httpClientProvider = HttpClientProvider._();

final class HttpClientProvider
    extends $FunctionalProvider<http.Client, http.Client, http.Client>
    with $Provider<http.Client> {
  HttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @$internal
  @override
  $ProviderElement<http.Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  http.Client create(Ref ref) {
    return httpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(http.Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<http.Client>(value),
    );
  }
}

String _$httpClientHash() => r'7ec49beae0f15115de79f9aa98dbd250130e26d8';

@ProviderFor(homewardClient)
final homewardClientProvider = HomewardClientProvider._();

final class HomewardClientProvider
    extends $FunctionalProvider<HomewardClient, HomewardClient, HomewardClient>
    with $Provider<HomewardClient> {
  HomewardClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homewardClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homewardClientHash();

  @$internal
  @override
  $ProviderElement<HomewardClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomewardClient create(Ref ref) {
    return homewardClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomewardClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomewardClient>(value),
    );
  }
}

String _$homewardClientHash() => r'deb0afeda1d33ce60c3d781563c1a04f14d24030';

@ProviderFor(developmentServer)
final developmentServerProvider = DevelopmentServerProvider._();

final class DevelopmentServerProvider
    extends
        $FunctionalProvider<
          DevelopmentServer,
          DevelopmentServer,
          DevelopmentServer
        >
    with $Provider<DevelopmentServer> {
  DevelopmentServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'developmentServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$developmentServerHash();

  @$internal
  @override
  $ProviderElement<DevelopmentServer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DevelopmentServer create(Ref ref) {
    return developmentServer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DevelopmentServer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DevelopmentServer>(value),
    );
  }
}

String _$developmentServerHash() => r'1ff0fa5ef7de1c48a96c7a1f149897f4c6e641af';
