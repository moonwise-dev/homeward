import '../anchor.dart';
import '../candidate.dart';
import '../criterion.dart';
import '../criterion_kind.dart';
import '../story.dart';
import 'assess_cell.dart';
import 'assessed_candidate.dart';
import 'assessed_cell.dart';
import 'assessed_row.dart';
import 'assessment.dart';
import 'fit_status.dart';
import 'map_marker.dart';
import 'map_marker_kind.dart';
import 'map_route.dart';
import 'measurement.dart';
import 'measurements.dart';

const _listed = 5;

Assessment assessStory(Story story, Measurements measurements) {
  final located = [
    for (final candidate in story.candidates)
      if (candidate.point != null) candidate,
  ];
  final rows = [
    for (final criterion in story.criteria)
      ?_rowFor(criterion, story, located, measurements),
  ];
  final scores = {
    for (final candidate in located) candidate.id: _score(candidate.id, rows),
  };
  final ranked = [...located]
    ..sort((a, b) => scores[b.id]!.compareTo(scores[a.id]!));
  return Assessment(
    candidates: [
      for (final candidate in located)
        _assessed(
          candidate,
          rows,
          rank: ranked.indexOf(candidate) + 1,
          score: scores[candidate.id]!,
        ),
    ],
    rows: rows,
    markers: _markers(story, located, measurements),
    routes: _routes(story, located, measurements),
  );
}

AssessedRow? _rowFor(
  Criterion criterion,
  Story story,
  List<Candidate> located,
  Measurements measurements,
) {
  final anchor = story.anchorWith(criterion.anchorId);
  if (criterion.kind == CriterionKind.commute && anchor == null) {
    return null;
  }
  return AssessedRow(
    id: criterion.id,
    label: anchor == null ? criterion.kind.label : 'To ${anchor.label}',
    group: criterion.kind.group.label,
    mustHave: criterion.mustHave,
    cells: [
      for (final candidate in located)
        assessCell(
          candidateId: candidate.id,
          criterion: criterion,
          measurement: measurements.of(candidate.id, criterion.id),
          anchor: anchor,
        ),
    ],
  );
}

int _score(String candidateId, List<AssessedRow> rows) {
  var earned = 0.0;
  var possible = 0.0;
  for (final row in rows) {
    final weight = row.mustHave ? 3 : 1;
    possible += weight;
    earned += weight * _cellOf(row, candidateId).status.score;
  }
  return possible == 0 ? 0 : (earned / possible * 100).round();
}

AssessedCell _cellOf(AssessedRow row, String candidateId) =>
    row.cells.firstWhere((cell) => cell.candidateId == candidateId);

AssessedCandidate _assessed(
  Candidate candidate,
  List<AssessedRow> rows, {
  required int rank,
  required int score,
}) {
  final ordered = [
    ...rows.where((row) => row.mustHave),
    ...rows.where((row) => !row.mustHave),
  ];
  List<String> lines(FitStatus status, {bool withDetail = false}) => [
    for (final row in ordered)
      if (_cellOf(row, candidate.id) case final cell when cell.status == status)
        [
          '${row.label}: ${cell.text}',
          if (withDetail && cell.detail != null) cell.detail,
        ].join(', '),
  ].take(_listed).toList();
  return AssessedCandidate(
    id: candidate.id,
    label: candidate.label,
    rank: rank,
    score: score,
    missesMustHave: rows.any(
      (row) =>
          row.mustHave && _cellOf(row, candidate.id).status == FitStatus.misses,
    ),
    pros: lines(FitStatus.fits),
    cons: lines(FitStatus.misses, withDetail: true),
    close: lines(FitStatus.close, withDetail: true),
  );
}

List<MapMarker> _markers(
  Story story,
  List<Candidate> located,
  Measurements measurements,
) {
  final markers = <String, MapMarker>{};
  for (final Anchor(:id, :label, :point) in story.anchors) {
    if (point != null) {
      markers[id] = MapMarker(
        id: id,
        label: label,
        kind: MapMarkerKind.anchor,
        lat: point.lat,
        lng: point.lng,
      );
    }
  }
  for (final candidate in located) {
    final point = candidate.point!;
    markers[candidate.id] = MapMarker(
      id: candidate.id,
      label: candidate.label,
      kind: MapMarkerKind.candidate,
      lat: point.lat,
      lng: point.lng,
      candidateId: candidate.id,
    );
    for (final criterion in story.criteria) {
      if (measurements.of(candidate.id, criterion.id)
          case NearestMeasurement(
            :final name,
            point: final place?,
          )
          when criterion.kind != CriterionKind.noise) {
        final id = '${candidate.id}-${criterion.id}';
        markers[id] = MapMarker(
          id: id,
          label: name ?? criterion.kind.label,
          kind: MapMarkerKind.place,
          lat: place.lat,
          lng: place.lng,
          category: criterion.kind.name,
          candidateId: candidate.id,
        );
      }
    }
  }
  return markers.values.toList();
}

List<MapRoute> _routes(
  Story story,
  List<Candidate> located,
  Measurements measurements,
) => [
  for (final criterion in story.criteria)
    if (criterion.anchorId case final anchorId?)
      for (final candidate in located)
        if (measurements.of(candidate.id, criterion.id) case RouteMeasurement(
          :final mode,
          :final minutes,
          :final path,
        ))
          MapRoute(
            candidateId: candidate.id,
            anchorId: anchorId,
            mode: mode,
            minutes: minutes,
            label: '$minutes min',
            path: [
              for (final point in path) [point.lat, point.lng],
            ],
          ),
];
