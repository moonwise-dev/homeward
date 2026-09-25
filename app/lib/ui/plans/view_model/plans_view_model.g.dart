// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlansViewModel)
final plansViewModelProvider = PlansViewModelProvider._();

final class PlansViewModelProvider
    extends $NotifierProvider<PlansViewModel, PlansState> {
  PlansViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plansViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plansViewModelHash();

  @$internal
  @override
  PlansViewModel create() => PlansViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlansState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlansState>(value),
    );
  }
}

String _$plansViewModelHash() => r'f9040875ad1ddeba28fee3a81642fec83520416f';

abstract class _$PlansViewModel extends $Notifier<PlansState> {
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
