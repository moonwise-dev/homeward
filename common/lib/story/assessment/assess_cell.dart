import 'dart:math';

import '../anchor.dart';
import '../criterion.dart';
import '../criterion_measure.dart';
import 'assessed_cell.dart';
import 'distance_phrase.dart';
import 'fit_status.dart';
import 'measurement.dart';

AssessedCell assessCell({
  required String candidateId,
  required Criterion criterion,
  required Measurement measurement,
  Anchor? anchor,
}) {
  final radius = criterion.radius;
  final threshold = criterion.threshold;
  AssessedCell cell(FitStatus status, String text, [String? detail]) =>
      AssessedCell(
        candidateId: candidateId,
        status: status,
        text: text,
        detail: detail,
      );
  return switch ((criterion.kind.measure, measurement)) {
    (_, UnavailableMeasurement()) => cell(
      FitStatus.unknown,
      'Could not measure',
    ),
    (
      CriterionMeasure.route,
      RouteMeasurement(:final minutes, :final mode),
    )
        when anchor != null =>
      _route(cell, minutes, mode.phrase, anchor.maxMinutes),
    (
      CriterionMeasure.nearest,
      NearestMeasurement(:final meters, :final name),
    ) =>
      cell(
        _upTo(meters, radius, radius ~/ 2),
        '${name ?? criterion.kind.noun} · ${distancePhrase(meters)}',
        'about ${walkingMinutes(meters)} min walk',
      ),
    (CriterionMeasure.nearest, NoMeasurement()) => cell(
      FitStatus.misses,
      'No ${criterion.kind.nouns} within ${distancePhrase(radius * 2)}',
    ),
    (CriterionMeasure.density, CountMeasurement(:final count)) => cell(
      count >= threshold
          ? FitStatus.fits
          : count * 2 >= threshold
          ? FitStatus.close
          : FitStatus.misses,
      '${_counted(count, criterion)} within ${distancePhrase(radius)}',
      count >= threshold ? null : 'you wanted $threshold',
    ),
    (CriterionMeasure.clearance, NoMeasurement()) => cell(
      FitStatus.fits,
      'Nothing loud within ${distancePhrase(radius)}',
    ),
    (
      CriterionMeasure.clearance,
      NearestMeasurement(:final meters, :final name),
    ) =>
      cell(
        meters >= radius
            ? FitStatus.fits
            : meters * 2 >= radius
            ? FitStatus.close
            : FitStatus.misses,
        '${name ?? criterion.kind.noun} ${distancePhrase(meters)} away',
      ),
    (CriterionMeasure.sparse, CountMeasurement(:final count)) => cell(
      count <= threshold
          ? FitStatus.fits
          : count <= threshold * 3
          ? FitStatus.close
          : FitStatus.misses,
      count == 0
          ? 'No ${criterion.kind.nouns} within ${distancePhrase(radius)}'
          : '${_counted(count, criterion)} within ${distancePhrase(radius)}',
    ),
    _ => cell(FitStatus.unknown, 'Could not measure'),
  };
}

AssessedCell _route(
  AssessedCell Function(FitStatus, String, [String?]) cell,
  int minutes,
  String phrase,
  int maxMinutes,
) {
  final over = minutes - maxMinutes;
  return cell(
    _upTo(minutes, maxMinutes, max(5, (maxMinutes * 3 / 10).round())),
    '$minutes min $phrase',
    over <= 0 ? 'within your $maxMinutes' : '$over min over your $maxMinutes',
  );
}

FitStatus _upTo(int value, int limit, int slack) => value <= limit
    ? FitStatus.fits
    : value <= limit + slack
    ? FitStatus.close
    : FitStatus.misses;

String _counted(int count, Criterion criterion) => count == 1
    ? '1 ${criterion.kind.noun.toLowerCase()}'
    : '$count ${criterion.kind.nouns}';
