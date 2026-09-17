import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_rpc.freezed.dart';
part 'json_rpc.g.dart';

@freezed
abstract class JsonRpcRequest with _$JsonRpcRequest {
  const factory JsonRpcRequest({
    required String jsonrpc,
    Object? id,
    required String method,
    Map<String, Object?>? params,
  }) = _JsonRpcRequest;

  factory JsonRpcRequest.fromJson(Map<String, Object?> json) =>
      _$JsonRpcRequestFromJson(json);
}

@freezed
abstract class JsonRpcError with _$JsonRpcError {
  const factory JsonRpcError({
    required int code,
    required String message,
    Map<String, Object?>? data,
  }) = _JsonRpcError;

  factory JsonRpcError.fromJson(Map<String, Object?> json) =>
      _$JsonRpcErrorFromJson(json);
}

sealed class JsonRpcResponse {
  static JsonRpcResponse fromJson(Map<String, Object?> json) =>
      json.containsKey('error')
      ? JsonRpcErrorResponse.fromJson(json)
      : JsonRpcResult.fromJson(json);

  Map<String, Object?> toJson();
}

@freezed
abstract class JsonRpcResult with _$JsonRpcResult implements JsonRpcResponse {
  const factory JsonRpcResult({
    @Default('2.0') String jsonrpc,
    Object? id,
    required Map<String, Object?> result,
  }) = _JsonRpcResult;

  factory JsonRpcResult.fromJson(Map<String, Object?> json) =>
      _$JsonRpcResultFromJson(json);
}

@freezed
abstract class JsonRpcErrorResponse
    with _$JsonRpcErrorResponse
    implements JsonRpcResponse {
  const factory JsonRpcErrorResponse({
    @Default('2.0') String jsonrpc,
    Object? id,
    required JsonRpcError error,
  }) = _JsonRpcErrorResponse;

  factory JsonRpcErrorResponse.fromJson(Map<String, Object?> json) =>
      _$JsonRpcErrorResponseFromJson(json);
}
