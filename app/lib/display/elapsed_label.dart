String elapsedLabel(Duration elapsed) {
  final milliseconds = elapsed.inMilliseconds;
  return milliseconds < 1000
      ? '$milliseconds ms'
      : '${(milliseconds / 1000).toStringAsFixed(1)} s';
}
