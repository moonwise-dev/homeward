import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_action.freezed.dart';
part 'client_action.g.dart';

@freezed
abstract class ClientAction with _$ClientAction {
  const factory ClientAction({
    required String name,
    required String surfaceId,
    required String sourceComponentId,
    String? timestamp,
    @Default({}) Map<String, Object?> context,
  }) = _ClientAction;

  factory ClientAction.fromJson(Map<String, Object?> json) =>
      _$ClientActionFromJson(json);
}
