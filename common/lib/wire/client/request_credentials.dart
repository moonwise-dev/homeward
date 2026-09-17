import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_credentials.freezed.dart';

@freezed
abstract class RequestCredentials with _$RequestCredentials {
  const factory RequestCredentials({
    required String idToken,
    String? appCheckToken,
  }) = _RequestCredentials;
}
