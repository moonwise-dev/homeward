import 'package:freezed_annotation/freezed_annotation.dart';

import 'a2a_message.dart';

part 'message_send_params.freezed.dart';
part 'message_send_params.g.dart';

@freezed
abstract class MessageSendParams with _$MessageSendParams {
  const factory MessageSendParams({
    required A2aMessage message,
    Map<String, Object?>? configuration,
    Map<String, Object?>? metadata,
  }) = _MessageSendParams;

  factory MessageSendParams.fromJson(Map<String, Object?> json) =>
      _$MessageSendParamsFromJson(json);
}
