// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_key_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GeminiKey)
final geminiKeyProvider = GeminiKeyProvider._();

final class GeminiKeyProvider
    extends $AsyncNotifierProvider<GeminiKey, String?> {
  GeminiKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geminiKeyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geminiKeyHash();

  @$internal
  @override
  GeminiKey create() => GeminiKey();
}

String _$geminiKeyHash() => r'2ba64e53e3bafb19fa13a6de1bea8d81521ea6e5';

abstract class _$GeminiKey extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
