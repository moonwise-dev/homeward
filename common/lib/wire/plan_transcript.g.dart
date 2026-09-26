// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_transcript.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordedText _$RecordedTextFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RecordedText', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['text', 'runtimeType']);
      final val = RecordedText(
        $checkedConvert('text', (v) => v as String),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RecordedTextToJson(RecordedText instance) =>
    <String, dynamic>{'text': instance.text, 'runtimeType': instance.$type};

RecordedAction _$RecordedActionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RecordedAction', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'name',
          'surfaceId',
          'sourceComponentId',
          'context',
          'runtimeType',
        ],
      );
      final val = RecordedAction(
        name: $checkedConvert('name', (v) => v as String),
        surfaceId: $checkedConvert('surfaceId', (v) => v as String),
        sourceComponentId: $checkedConvert(
          'sourceComponentId',
          (v) => v as String,
        ),
        context: $checkedConvert(
          'context',
          (v) => v as Map<String, dynamic>? ?? const {},
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RecordedActionToJson(RecordedAction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surfaceId': instance.surfaceId,
      'sourceComponentId': instance.sourceComponentId,
      'context': instance.context,
      'runtimeType': instance.$type,
    };

_TurnRecord _$TurnRecordFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TurnRecord', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'index',
          'input',
          'outputText',
          'messages',
          'slices',
          'status',
          'errorCode',
        ],
      );
      final val = _TurnRecord(
        index: $checkedConvert('index', (v) => (v as num).toInt()),
        input: $checkedConvert(
          'input',
          (v) => RecordedInput.fromJson(v as Map<String, dynamic>),
        ),
        outputText: $checkedConvert('outputText', (v) => v as String? ?? ''),
        messages: $checkedConvert(
          'messages',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => e as Map<String, dynamic>)
                  .toList() ??
              const [],
        ),
        slices: $checkedConvert(
          'slices',
          (v) => v as Map<String, dynamic>? ?? const {},
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$TurnStatusEnumMap, v),
        ),
        errorCode: $checkedConvert('errorCode', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TurnRecordToJson(_TurnRecord instance) =>
    <String, dynamic>{
      'index': instance.index,
      'input': instance.input.toJson(),
      'outputText': instance.outputText,
      'messages': instance.messages,
      'slices': instance.slices,
      'status': _$TurnStatusEnumMap[instance.status]!,
      'errorCode': ?instance.errorCode,
    };

const _$TurnStatusEnumMap = {
  TurnStatus.completed: 'completed',
  TurnStatus.failed: 'failed',
  TurnStatus.canceled: 'canceled',
};

_PlanListing _$PlanListingFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_PlanListing',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['sessionId', 'turnCount', 'title', 'updatedAt'],
    );
    final val = _PlanListing(
      sessionId: $checkedConvert('sessionId', (v) => v as String),
      turnCount: $checkedConvert('turnCount', (v) => (v as num?)?.toInt() ?? 0),
      title: $checkedConvert('title', (v) => v as String?),
      updatedAt: $checkedConvert(
        'updatedAt',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$PlanListingToJson(_PlanListing instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'turnCount': instance.turnCount,
      'title': ?instance.title,
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

_PlanTranscript _$PlanTranscriptFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PlanTranscript', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['sessionId', 'turns']);
      final val = _PlanTranscript(
        sessionId: $checkedConvert('sessionId', (v) => v as String),
        turns: $checkedConvert(
          'turns',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => TurnRecord.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$PlanTranscriptToJson(_PlanTranscript instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'turns': instance.turns.map((e) => e.toJson()).toList(),
    };
