import 'package:common/common.dart';

import '../errors/homeward_failure.dart';

abstract final class JsonRpcErrors {
  static const parse = JsonRpcError(code: -32700, message: 'Parse error');

  static const invalidRequest = JsonRpcError(
    code: -32600,
    message: 'Invalid request',
  );

  static const methodNotFound = JsonRpcError(
    code: -32601,
    message: 'Method not found',
  );

  static const taskNotFound = JsonRpcError(
    code: A2aErrorCodes.taskNotFound,
    message: 'Task not found',
  );

  static const taskNotCancelable = JsonRpcError(
    code: A2aErrorCodes.taskNotCancelable,
    message: 'Task can no longer be canceled',
  );

  static const extensionRequired = JsonRpcError(
    code: -32600,
    message: 'Activate ${A2uiExtension.uri} with ${A2uiExtension.header}',
  );

  static JsonRpcError invalidParams(String message) =>
      JsonRpcError(code: -32602, message: message);

  static JsonRpcError homeward(HomewardFailure failure) => JsonRpcError(
    code: A2aErrorCodes.homeward,
    message: failure.message,
    data: {
      'code': failure.code.wireName,
      'retryAfterSeconds': ?failure.retryAfterSeconds,
    },
  );
}
