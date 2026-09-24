// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(agentRepository)
final agentRepositoryProvider = AgentRepositoryProvider._();

final class AgentRepositoryProvider
    extends
        $FunctionalProvider<AgentRepository, AgentRepository, AgentRepository>
    with $Provider<AgentRepository> {
  AgentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'agentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$agentRepositoryHash();

  @$internal
  @override
  $ProviderElement<AgentRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AgentRepository create(Ref ref) {
    return agentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AgentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AgentRepository>(value),
    );
  }
}

String _$agentRepositoryHash() => r'c2ee69d1b2c8ccba174f21e7bf57a434cf6523f8';
