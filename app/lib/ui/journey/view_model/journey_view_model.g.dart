// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journey_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JourneyViewModel)
final journeyViewModelProvider = JourneyViewModelFamily._();

final class JourneyViewModelProvider
    extends $NotifierProvider<JourneyViewModel, JourneyState> {
  JourneyViewModelProvider._({
    required JourneyViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'journeyViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$journeyViewModelHash();

  @override
  String toString() {
    return r'journeyViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  JourneyViewModel create() => JourneyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JourneyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JourneyState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JourneyViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$journeyViewModelHash() => r'6761c29f0f84e01208289e55618a31f5b20d9c5e';

final class JourneyViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          JourneyViewModel,
          JourneyState,
          JourneyState,
          JourneyState,
          String
        > {
  JourneyViewModelFamily._()
    : super(
        retry: null,
        name: r'journeyViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  JourneyViewModelProvider call(String sessionId) =>
      JourneyViewModelProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'journeyViewModelProvider';
}

abstract class _$JourneyViewModel extends $Notifier<JourneyState> {
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
