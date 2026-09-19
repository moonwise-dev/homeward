import 'package:freezed_annotation/freezed_annotation.dart';

part 'wire_entry.freezed.dart';

enum WireDirection { sent, received, local }

@freezed
abstract class WireEntry with _$WireEntry {
  const factory WireEntry({
    required DateTime at,
    required WireDirection direction,
    required String label,
    String? detail,
    String? surfaceId,
    int? bytes,
    Map<String, Object?>? payload,
  }) = _WireEntry;
}
