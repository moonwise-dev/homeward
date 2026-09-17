import 'package:freezed_annotation/freezed_annotation.dart';

import 'a2a_part.dart';
import 'a2a_role.dart';

part 'a2a_message.freezed.dart';
part 'a2a_message.g.dart';

@freezed
abstract class A2aMessage with _$A2aMessage {
  const factory A2aMessage({
    required A2aRole role,
    required List<A2aPart> parts,
    required String messageId,
    String? contextId,
    String? taskId,
    List<String>? referenceTaskIds,
    Map<String, Object?>? metadata,
    List<String>? extensions,
    @Default('message') String kind,
  }) = _A2aMessage;

  factory A2aMessage.fromJson(Map<String, Object?> json) =>
      _$A2aMessageFromJson(json);
}
