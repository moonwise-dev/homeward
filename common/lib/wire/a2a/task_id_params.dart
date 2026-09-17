import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_id_params.freezed.dart';
part 'task_id_params.g.dart';

@freezed
abstract class TaskIdParams with _$TaskIdParams {
  const factory TaskIdParams({
    required String id,
    int? historyLength,
    Map<String, Object?>? metadata,
  }) = _TaskIdParams;

  factory TaskIdParams.fromJson(Map<String, Object?> json) =>
      _$TaskIdParamsFromJson(json);
}
