// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appearanceRepository)
final appearanceRepositoryProvider = AppearanceRepositoryProvider._();

final class AppearanceRepositoryProvider
    extends
        $FunctionalProvider<
          AppearanceRepository,
          AppearanceRepository,
          AppearanceRepository
        >
    with $Provider<AppearanceRepository> {
  AppearanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appearanceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appearanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppearanceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppearanceRepository create(Ref ref) {
    return appearanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppearanceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppearanceRepository>(value),
    );
  }
}

String _$appearanceRepositoryHash() =>
    r'bc6b107d270966e432504a557447d6314284256c';

@ProviderFor(Appearance)
final appearanceProvider = AppearanceProvider._();

final class AppearanceProvider
    extends $AsyncNotifierProvider<Appearance, ThemeMode> {
  AppearanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appearanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appearanceHash();

  @$internal
  @override
  Appearance create() => Appearance();
}

String _$appearanceHash() => r'29acf39aa6f04196454568b4cf7178f34a649db7';

abstract class _$Appearance extends $AsyncNotifier<ThemeMode> {
  FutureOr<ThemeMode> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ThemeMode>, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ThemeMode>, ThemeMode>,
              AsyncValue<ThemeMode>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
