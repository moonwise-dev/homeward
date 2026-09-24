// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_verification_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(keyVerificationRepository)
final keyVerificationRepositoryProvider = KeyVerificationRepositoryProvider._();

final class KeyVerificationRepositoryProvider
    extends
        $FunctionalProvider<
          KeyVerificationRepository,
          KeyVerificationRepository,
          KeyVerificationRepository
        >
    with $Provider<KeyVerificationRepository> {
  KeyVerificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyVerificationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyVerificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<KeyVerificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  KeyVerificationRepository create(Ref ref) {
    return keyVerificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyVerificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyVerificationRepository>(value),
    );
  }
}

String _$keyVerificationRepositoryHash() =>
    r'df95b04c8136810abc55df7ad26e2abea1209961';
