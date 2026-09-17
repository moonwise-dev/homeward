import 'package:freezed_annotation/freezed_annotation.dart';

part 'a2a_part.freezed.dart';
part 'a2a_part.g.dart';

@Freezed(unionKey: 'kind')
sealed class A2aPart with _$A2aPart {
  const factory A2aPart.text({
    required String text,
    Map<String, Object?>? metadata,
  }) = A2aTextPart;

  const factory A2aPart.data({
    required Map<String, Object?> data,
    Map<String, Object?>? metadata,
  }) = A2aDataPart;

  factory A2aPart.fromJson(Map<String, Object?> json) =>
      _$A2aPartFromJson(json);
}
