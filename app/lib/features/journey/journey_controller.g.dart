// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journey_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JourneyController)
final journeyControllerProvider = JourneyControllerFamily._();

final class JourneyControllerProvider
    extends $NotifierProvider<JourneyController, JourneyState> {
  JourneyControllerProvider._({
    required JourneyControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'journeyControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$journeyControllerHash();

  @override
  String toString() {
    return r'journeyControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  JourneyController create() => JourneyController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JourneyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JourneyState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JourneyControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$journeyControllerHash() => r'e99c9ea7b01a61ca34af5565005b5ee13e919c1f';

final class JourneyControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          JourneyController,
          JourneyState,
          JourneyState,
          JourneyState,
          String
        > {
  JourneyControllerFamily._()
    : super(
        retry: null,
        name: r'journeyControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  JourneyControllerProvider call(String sessionId) =>
      JourneyControllerProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'journeyControllerProvider';
}

abstract class _$JourneyController extends $Notifier<JourneyState> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  JourneyState build(String sessionId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<JourneyState, JourneyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<JourneyState, JourneyState>,
              JourneyState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
