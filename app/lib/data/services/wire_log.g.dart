// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wire_log.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wireLog)
final wireLogProvider = WireLogProvider._();

final class WireLogProvider
    extends $FunctionalProvider<WireLog, WireLog, WireLog>
    with $Provider<WireLog> {
  WireLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wireLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wireLogHash();

  @$internal
  @override
  $ProviderElement<WireLog> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WireLog create(Ref ref) {
    return wireLog(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WireLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WireLog>(value),
    );
  }
}

String _$wireLogHash() => r'2d66712cee9abbc5b1e037fab36b9d4d03aa767b';

@ProviderFor(wireEntries)
final wireEntriesProvider = WireEntriesProvider._();

final class WireEntriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WireEntry>>,
          List<WireEntry>,
          Stream<List<WireEntry>>
        >
    with $FutureModifier<List<WireEntry>>, $StreamProvider<List<WireEntry>> {
  WireEntriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wireEntriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wireEntriesHash();

  @$internal
  @override
  $StreamProviderElement<List<WireEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WireEntry>> create(Ref ref) {
    return wireEntries(ref);
  }
}

String _$wireEntriesHash() => r'ecb0dd82951d09977865ce332a6356e7a96e278b';
