// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_rpc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonRpcRequest _$JsonRpcRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_JsonRpcRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['jsonrpc', 'id', 'method', 'params'],
      );
      final val = _JsonRpcRequest(
        jsonrpc: $checkedConvert('jsonrpc', (v) => v as String),
        id: $checkedConvert('id', (v) => v),
        method: $checkedConvert('method', (v) => v as String),
        params: $checkedConvert('params', (v) => v as Map<String, dynamic>?),
      );
      return val;
    });

Map<String, dynamic> _$JsonRpcRequestToJson(_JsonRpcRequest instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': ?instance.id,
      'method': instance.method,
      'params': ?instance.params,
    };

_JsonRpcError _$JsonRpcErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_JsonRpcError', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['code', 'message', 'data']);
      final val = _JsonRpcError(
        code: $checkedConvert('code', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String),
        data: $checkedConvert('data', (v) => v as Map<String, dynamic>?),
      );
      return val;
    });

Map<String, dynamic> _$JsonRpcErrorToJson(_JsonRpcError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': ?instance.data,
    };

_JsonRpcResult _$JsonRpcResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_JsonRpcResult', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['jsonrpc', 'id', 'result']);
      final val = _JsonRpcResult(
        jsonrpc: $checkedConvert('jsonrpc', (v) => v as String? ?? '2.0'),
        id: $checkedConvert('id', (v) => v),
        result: $checkedConvert('result', (v) => v as Map<String, dynamic>),
      );
      return val;
    });

Map<String, dynamic> _$JsonRpcResultToJson(_JsonRpcResult instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': ?instance.id,
      'result': instance.result,
    };

_JsonRpcErrorResponse _$JsonRpcErrorResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_JsonRpcErrorResponse', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['jsonrpc', 'id', 'error']);
  final val = _JsonRpcErrorResponse(
    jsonrpc: $checkedConvert('jsonrpc', (v) => v as String? ?? '2.0'),
    id: $checkedConvert('id', (v) => v),
    error: $checkedConvert(
      'error',
      (v) => JsonRpcError.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$JsonRpcErrorResponseToJson(
  _JsonRpcErrorResponse instance,
) => <String, dynamic>{
  'jsonrpc': instance.jsonrpc,
  'id': ?instance.id,
  'error': instance.error.toJson(),
};
