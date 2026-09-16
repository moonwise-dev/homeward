import 'request_context.dart';

typedef _Trace = ({String traceId, String spanId});

final _traceparent = RegExp(
  r'^[0-9a-f]{2}-([0-9a-f]{32})-([0-9a-f]{16})-[0-9a-f]{2}$',
);
final _cloudTraceContext = RegExp(r'^([0-9a-f]{32})/(\d+)');

RequestContext parseRequestContext(
  Map<String, String> headers, {
  required String Function() newRequestId,
}) {
  final trace =
      _fromTraceparent(headers['traceparent']) ??
      _fromCloudTraceContext(headers['x-cloud-trace-context']);
  return RequestContext(
    requestId: newRequestId(),
    traceId: trace?.traceId,
    spanId: trace?.spanId,
  );
}

_Trace? _fromTraceparent(String? header) {
  final match = header == null ? null : _traceparent.firstMatch(header);
  return match == null ? null : (traceId: match[1]!, spanId: match[2]!);
}

_Trace? _fromCloudTraceContext(String? header) {
  final match = header == null ? null : _cloudTraceContext.firstMatch(header);
  if (match == null) {
    return null;
  }
  final spanId = BigInt.parse(match[2]!).toRadixString(16).padLeft(16, '0');
  return (traceId: match[1]!, spanId: spanId);
}
