import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_context.freezed.dart';

@freezed
abstract class RequestContext with _$RequestContext {
  const factory RequestContext({
    required String requestId,
    String? traceId,
    String? spanId,
  }) = _RequestContext;

  static const zoneKey = #homewardRequestContext;

  static RequestContext? of(Zone zone) => zone[zoneKey] as RequestContext?;
}
