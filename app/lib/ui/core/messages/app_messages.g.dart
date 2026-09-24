// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_messages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppMessages)
final appMessagesProvider = AppMessagesProvider._();

final class AppMessagesProvider
    extends $NotifierProvider<AppMessages, AppMessage?> {
  AppMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appMessagesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appMessagesHash();

  @$internal
  @override
  AppMessages create() => AppMessages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppMessage? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppMessage?>(value),
    );
  }
}

String _$appMessagesHash() => r'd6f28de40db134919cc0f821dee2f5b3ba12958d';

abstract class _$AppMessages extends $Notifier<AppMessage?> {
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
