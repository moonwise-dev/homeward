import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';

@freezed
abstract class LogEntry with _$LogEntry {
  const factory LogEntry(
    String message, {
    @Default({}) Map<String, Object?> fields,
  }) = _LogEntry;

  const LogEntry._();

  @override
  String toString() => message;
}
