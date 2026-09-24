import 'measurement.dart';

final class Measurements {
  const Measurements(this._cells);

  final Map<(String, String), Measurement> _cells;

  Measurement of(String candidateId, String criterionId) =>
      _cells[(candidateId, criterionId)] ?? const Measurement.unavailable();
}
