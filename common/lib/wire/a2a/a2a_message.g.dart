// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a2a_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_A2aMessage _$A2aMessageFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_A2aMessage',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'role',
        'parts',
        'messageId',
        'contextId',
        'taskId',
        'referenceTaskIds',
        'metadata',
        'extensions',
        'kind',
      ],
    );
    final val = _A2aMessage(
      role: $checkedConvert('role', (v) => $enumDecode(_$A2aRoleEnumMap, v)),
      parts: $checkedConvert(
        'parts',
        (v) => (v as List<dynamic>)
            .map((e) => A2aPart.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      messageId: $checkedConvert('messageId', (v) => v as String),
      contextId: $checkedConvert('contextId', (v) => v as String?),
      taskId: $checkedConvert('taskId', (v) => v as String?),
      referenceTaskIds: $checkedConvert(
        'referenceTaskIds',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
      extensions: $checkedConvert(
        'extensions',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      kind: $checkedConvert('kind', (v) => v as String? ?? 'message'),
    );
    return val;
  },
);

Map<String, dynamic> _$A2aMessageToJson(_A2aMessage instance) =>
    <String, dynamic>{
      'role': _$A2aRoleEnumMap[instance.role]!,
      'parts': instance.parts.map((e) => e.toJson()).toList(),
      'messageId': instance.messageId,
      'contextId': ?instance.contextId,
      'taskId': ?instance.taskId,
      'referenceTaskIds': ?instance.referenceTaskIds,
      'metadata': ?instance.metadata,
      'extensions': ?instance.extensions,
      'kind': instance.kind,
    };

const _$A2aRoleEnumMap = {A2aRole.user: 'user', A2aRole.agent: 'agent'};
