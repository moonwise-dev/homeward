import 'package:freezed_annotation/freezed_annotation.dart';

part 'sse_event.freezed.dart';

@freezed
abstract class SseEvent with _$SseEvent {
  const factory SseEvent({String? event, required String data, String? id}) =
      _SseEvent;
}
