final class OpenDataUnavailable implements Exception {
  const OpenDataUnavailable(this.service, this.reason, {this.status});

  final String service;
  final String reason;
  final int? status;

  bool get isBusy => status == 429 || status == 503 || status == 504;

  @override
  String toString() => '$service unavailable: $reason';
}
