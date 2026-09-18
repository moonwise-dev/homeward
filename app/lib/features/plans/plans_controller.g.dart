// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlansController)
final plansControllerProvider = PlansControllerProvider._();

final class PlansControllerProvider
    extends $NotifierProvider<PlansController, PlansState> {
  PlansControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plansControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plansControllerHash();

  @$internal
  @override
  PlansController create() => PlansController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlansState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlansState>(value),
    );
  }
}

String _$plansControllerHash() => r'9749af139eb7638e4bfd6114abdd7562900cbdcb';

abstract class _$PlansController extends $Notifier<PlansState> {
  PlansState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PlansState, PlansState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlansState, PlansState>,
              PlansState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
