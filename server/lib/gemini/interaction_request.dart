import 'package:freezed_annotation/freezed_annotation.dart';

import 'function_declaration.dart';
import 'interaction_input.dart';
import 'tool_choice.dart';

part 'interaction_request.freezed.dart';

@freezed
abstract class InteractionRequest with _$InteractionRequest {
  const factory InteractionRequest({
    required InteractionInput input,
    String? systemInstruction,
    @Default([]) List<FunctionDeclaration> tools,
    ToolChoice? toolChoice,
    String? thinkingLevel,
    String? previousInteractionId,
    Map<String, Object?>? responseSchema,
  }) = _InteractionRequest;

  const InteractionRequest._();

  Map<String, Object?> toJson({required String model}) => {
    'model': model,
    'input': input.toJson(),
    'system_instruction': ?systemInstruction,
    if (tools.isNotEmpty) 'tools': [for (final tool in tools) tool.toJson()],
    if (thinkingLevel != null || toolChoice != null)
      'generation_config': {
        'thinking_level': ?thinkingLevel,
        'tool_choice': ?toolChoice?.name,
      },
    'previous_interaction_id': ?previousInteractionId,
    if (responseSchema case final schema?)
      'response_format': {
        'type': 'text',
        'mime_type': 'application/json',
        'schema': schema,
      },
    'store': true,
    'stream': true,
  };
}
