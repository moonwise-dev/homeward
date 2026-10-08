// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_plan.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(newPlan)
final newPlanProvider = NewPlanProvider._();

final class NewPlanProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  NewPlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newPlanHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return newPlan(ref);
  }
}

String _$newPlanHash() => r'fc55484a2e8cac851b89def5e43c5f6713d3e3bb';
