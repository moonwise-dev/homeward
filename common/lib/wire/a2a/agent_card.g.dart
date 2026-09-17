// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgentCard _$AgentCardFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AgentCard', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'protocolVersion',
          'name',
          'description',
          'url',
          'version',
          'capabilities',
          'securitySchemes',
          'security',
          'defaultInputModes',
          'defaultOutputModes',
          'skills',
        ],
      );
      final val = _AgentCard(
        protocolVersion: $checkedConvert('protocolVersion', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String),
        version: $checkedConvert('version', (v) => v as String),
        capabilities: $checkedConvert(
          'capabilities',
          (v) => AgentCapabilities.fromJson(v as Map<String, dynamic>),
        ),
        securitySchemes: $checkedConvert(
          'securitySchemes',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Map<String, dynamic>),
          ),
        ),
        security: $checkedConvert(
          'security',
          (v) => (v as List<dynamic>)
              .map(
                (e) => (e as Map<String, dynamic>).map(
                  (k, e) => MapEntry(
                    k,
                    (e as List<dynamic>).map((e) => e as String).toList(),
                  ),
                ),
              )
              .toList(),
        ),
        defaultInputModes: $checkedConvert(
          'defaultInputModes',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        defaultOutputModes: $checkedConvert(
          'defaultOutputModes',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        skills: $checkedConvert(
          'skills',
          (v) => (v as List<dynamic>)
              .map((e) => AgentSkill.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AgentCardToJson(_AgentCard instance) =>
    <String, dynamic>{
      'protocolVersion': instance.protocolVersion,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'version': instance.version,
      'capabilities': instance.capabilities.toJson(),
      'securitySchemes': instance.securitySchemes,
      'security': instance.security,
      'defaultInputModes': instance.defaultInputModes,
      'defaultOutputModes': instance.defaultOutputModes,
      'skills': instance.skills.map((e) => e.toJson()).toList(),
    };

_AgentCapabilities _$AgentCapabilitiesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AgentCapabilities', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['streaming', 'extensions']);
      final val = _AgentCapabilities(
        streaming: $checkedConvert('streaming', (v) => v as bool),
        extensions: $checkedConvert(
          'extensions',
          (v) => (v as List<dynamic>)
              .map((e) => AgentExtension.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AgentCapabilitiesToJson(_AgentCapabilities instance) =>
    <String, dynamic>{
      'streaming': instance.streaming,
      'extensions': instance.extensions.map((e) => e.toJson()).toList(),
    };

_AgentExtension _$AgentExtensionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AgentExtension', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['uri', 'required', 'params']);
      final val = _AgentExtension(
        uri: $checkedConvert('uri', (v) => v as String),
        required: $checkedConvert('required', (v) => v as bool),
        params: $checkedConvert('params', (v) => v as Map<String, dynamic>?),
      );
      return val;
    });

Map<String, dynamic> _$AgentExtensionToJson(_AgentExtension instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'required': instance.required,
      'params': ?instance.params,
    };

_AgentSkill _$AgentSkillFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_AgentSkill',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['id', 'name', 'description', 'tags']);
    final val = _AgentSkill(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$AgentSkillToJson(_AgentSkill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
    };
