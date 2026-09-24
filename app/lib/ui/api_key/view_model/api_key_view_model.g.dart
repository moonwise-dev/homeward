// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApiKeyViewModel)
final apiKeyViewModelProvider = ApiKeyViewModelProvider._();

final class ApiKeyViewModelProvider
    extends $NotifierProvider<ApiKeyViewModel, ApiKeyState> {
  ApiKeyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiKeyViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiKeyViewModelHash();

  @$internal
  @override
  ApiKeyViewModel create() => ApiKeyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiKeyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiKeyState>(value),
    );
  }
}

String _$apiKeyViewModelHash() => r'61fe3c59379492005d04f049acaa2d8d0c3cc85e';

abstract class _$ApiKeyViewModel extends $Notifier<ApiKeyState> {
  ApiKeyState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ApiKeyState, ApiKeyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ApiKeyState, ApiKeyState>,
              ApiKeyState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
