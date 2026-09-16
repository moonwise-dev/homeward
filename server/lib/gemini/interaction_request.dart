import 'package:freezed_annotation/freezed_annotation.dart';

import 'function_declaration.dart';
import 'interaction_input.dart';

part 'interaction_request.freezed.dart';

@freezed
abstract class InteractionRequest with _$InteractionRequest {
  const factory InteractionRequest({
    required InteractionInput input,
    String? systemInstruction,
    @Default([]) List<FunctionDeclaration> tools,
    String? thinkingLevel,
    String? previousInteractionId,
  }) = _InteractionRequest;

  const InteractionRequest._();

  Map<String, Object?> toJson({required String model}) => {
    'model': model,
    'input': input.toJson(),
    'system_instruction': ?systemInstruction,
    if (tools.isNotEmpty) 'tools': [for (final tool in tools) tool.toJson()],
    if (thinkingLevel case final level?)
      'generation_config': {'thinking_level': level},
    'previous_interaction_id': ?previousInteractionId,
    'store': true,
    'stream': true,
  };
}
