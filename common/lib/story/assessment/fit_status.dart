enum FitStatus {
  fits(1),
  close(0.5),
  misses(0),
  unknown(0.5);

  const FitStatus(this.score);

  final double score;
}
