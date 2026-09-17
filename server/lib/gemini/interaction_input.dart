import 'package:freezed_annotation/freezed_annotation.dart';

part 'interaction_input.freezed.dart';

@freezed
sealed class InteractionInput with _$InteractionInput {
  const factory InteractionInput.text(String text) = TextInput;

  const factory InteractionInput.functionResults(
    List<FunctionResult> results, {
    String? note,
  }) = FunctionResultsInput;

  const InteractionInput._();

  Object toJson() => switch (this) {
    TextInput(:final text) => text,
    FunctionResultsInput(:final results, :final note) => [
      for (final result in results) result.toJson(),
      if (note != null) {'type': 'text', 'text': note},
    ],
  };
}

@freezed
abstract class FunctionResult with _$FunctionResult {
  const factory FunctionResult({
    required String callId,
    required String name,
    required Object? result,
  }) = _FunctionResult;

  const FunctionResult._();

  Map<String, Object?> toJson() => {
    'type': 'function_result',
    'call_id': callId,
    'name': name,
    'result': result,
  };
}
