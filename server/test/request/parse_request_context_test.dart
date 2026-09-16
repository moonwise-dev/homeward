import 'package:homeward_server/request/parse_request_context.dart';
import 'package:homeward_server/request/request_context.dart';
import 'package:test/test.dart';

void main() {
  RequestContext parse(Map<String, String> headers) =>
      parseRequestContext(headers, newRequestId: () => 'r-1');

  test('reads a W3C traceparent header', () {
    expect(
      parse({
        'traceparent':
            '00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01',
      }),
      const RequestContext(
        requestId: 'r-1',
        traceId: '4bf92f3577b34da6a3ce929d0e0e4736',
        spanId: '00f067aa0ba902b7',
      ),
    );
  });

  test('reads a Cloud trace context header and converts the span to hex', () {
    expect(
      parse({
        'x-cloud-trace-context':
            '105445aa7843bc8bf206b12000100000/18446744073709551615;o=1',
      }),
      const RequestContext(
        requestId: 'r-1',
        traceId: '105445aa7843bc8bf206b12000100000',
        spanId: 'ffffffffffffffff',
      ),
    );
  });

  test('prefers traceparent when both headers are present', () {
    final context = parse({
      'traceparent': '00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01',
      'x-cloud-trace-context': '105445aa7843bc8bf206b12000100000/1;o=1',
    });

    expect(context.traceId, '4bf92f3577b34da6a3ce929d0e0e4736');
  });

  test('ignores malformed trace headers', () {
    expect(
      parse({
        'traceparent': 'garbage',
        'x-cloud-trace-context': 'also/garbage',
      }),
      const RequestContext(requestId: 'r-1'),
    );
  });
}
