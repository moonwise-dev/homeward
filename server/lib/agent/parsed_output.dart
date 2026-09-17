import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_output.freezed.dart';

@freezed
sealed class ParsedOutput with _$ParsedOutput {
  const factory ParsedOutput.prose(String text) = ProseOutput;

  const factory ParsedOutput.a2uiLine(String line) = A2uiLineOutput;
}
