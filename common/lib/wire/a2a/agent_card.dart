import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_card.freezed.dart';
part 'agent_card.g.dart';

@freezed
abstract class AgentCard with _$AgentCard {
  const factory AgentCard({
    required String protocolVersion,
    required String name,
    required String description,
    required String url,
    required String version,
    required AgentCapabilities capabilities,
    required Map<String, Map<String, Object?>> securitySchemes,
    required List<Map<String, List<String>>> security,
    required List<String> defaultInputModes,
    required List<String> defaultOutputModes,
    required List<AgentSkill> skills,
  }) = _AgentCard;

  factory AgentCard.fromJson(Map<String, Object?> json) =>
      _$AgentCardFromJson(json);
}

@freezed
abstract class AgentCapabilities with _$AgentCapabilities {
  const factory AgentCapabilities({
    required bool streaming,
    required List<AgentExtension> extensions,
  }) = _AgentCapabilities;

  factory AgentCapabilities.fromJson(Map<String, Object?> json) =>
      _$AgentCapabilitiesFromJson(json);
}

@freezed
abstract class AgentExtension with _$AgentExtension {
  const factory AgentExtension({
    required String uri,
    required bool required,
    Map<String, Object?>? params,
  }) = _AgentExtension;

  factory AgentExtension.fromJson(Map<String, Object?> json) =>
      _$AgentExtensionFromJson(json);
}

@freezed
abstract class AgentSkill with _$AgentSkill {
  const factory AgentSkill({
    required String id,
    required String name,
    required String description,
    required List<String> tags,
  }) = _AgentSkill;

  factory AgentSkill.fromJson(Map<String, Object?> json) =>
      _$AgentSkillFromJson(json);
}
