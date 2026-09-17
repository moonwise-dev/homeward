// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_send_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSendParams _$MessageSendParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_MessageSendParams', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['message', 'configuration', 'metadata']);
  final val = _MessageSendParams(
    message: $checkedConvert(
      'message',
      (v) => A2aMessage.fromJson(v as Map<String, dynamic>),
    ),
    configuration: $checkedConvert(
      'configuration',
      (v) => v as Map<String, dynamic>?,
    ),
    metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
  );
  return val;
});

Map<String, dynamic> _$MessageSendParamsToJson(_MessageSendParams instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
      'configuration': ?instance.configuration,
      'metadata': ?instance.metadata,
    };
