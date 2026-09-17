// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_message_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppMessageController)
final appMessageControllerProvider = AppMessageControllerProvider._();

final class AppMessageControllerProvider
    extends $NotifierProvider<AppMessageController, AppMessage?> {
  AppMessageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appMessageControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appMessageControllerHash();

  @$internal
  @override
  AppMessageController create() => AppMessageController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppMessage? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppMessage?>(value),
    );
  }
}

String _$appMessageControllerHash() =>
    r'98c370efed89daf4ae1d13923c50a5665a78e773';

abstract class _$AppMessageController extends $Notifier<AppMessage?> {
  AppMessage? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppMessage?, AppMessage?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppMessage?, AppMessage?>,
              AppMessage?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
