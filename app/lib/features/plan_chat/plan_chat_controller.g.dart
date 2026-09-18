// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlanChatController)
final planChatControllerProvider = PlanChatControllerFamily._();

final class PlanChatControllerProvider
    extends $NotifierProvider<PlanChatController, PlanChatState> {
  PlanChatControllerProvider._({
    required PlanChatControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'planChatControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$planChatControllerHash();

  @override
  String toString() {
    return r'planChatControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlanChatController create() => PlanChatController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanChatState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlanChatControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$planChatControllerHash() =>
    r'3d72ef939f569e407cc5d6901aa7d8d27e06fb61';

final class PlanChatControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PlanChatController,
          PlanChatState,
          PlanChatState,
          PlanChatState,
          String
        > {
  PlanChatControllerFamily._()
    : super(
        retry: null,
        name: r'planChatControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlanChatControllerProvider call(String sessionId) =>
      PlanChatControllerProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'planChatControllerProvider';
}

abstract class _$PlanChatController extends $Notifier<PlanChatState> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  PlanChatState build(String sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PlanChatState, PlanChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlanChatState, PlanChatState>,
              PlanChatState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
