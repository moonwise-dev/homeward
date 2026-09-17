// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApiKeyController)
final apiKeyControllerProvider = ApiKeyControllerProvider._();

final class ApiKeyControllerProvider
    extends $NotifierProvider<ApiKeyController, ApiKeyState> {
  ApiKeyControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiKeyControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiKeyControllerHash();

  @$internal
  @override
  ApiKeyController create() => ApiKeyController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiKeyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiKeyState>(value),
    );
  }
}

String _$apiKeyControllerHash() => r'7de4ffca38f3eb2bd662884aece60c7b3fdb960a';

abstract class _$ApiKeyController extends $Notifier<ApiKeyState> {
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
