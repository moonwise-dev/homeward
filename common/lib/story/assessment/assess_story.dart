import '../anchor.dart';
import '../candidate.dart';
import '../criterion.dart';
import '../criterion_kind.dart';
import '../story.dart';
import '../../samples/home_need.dart';
import '../../samples/listing.dart';
import '../../samples/listing_read.dart';
import '../../samples/outdoor_space.dart';
import 'assess_cell.dart';
import 'assessed_candidate.dart';
import 'assessed_cell.dart';
import 'assessed_row.dart';
import 'assessment.dart';
import 'fit_status.dart';
import 'map_marker.dart';
import 'map_marker_kind.dart';
import 'map_pin.dart';
import 'map_route.dart';
import 'measurement.dart';
import 'measurements.dart';
import 'reason.dart';

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
      for (final candidate in ranked)
        _assessed(
          candidate,
          rows,
          story,
          weeklyMinutes: weeklyMinutes(story, candidate.id, measurements),
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
  List<AssessedRow> rows,
  Story story, {
  int? weeklyMinutes,
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
  final pros = lines(FitStatus.fits);
  final cons = lines(FitStatus.misses, withDetail: true);
  final close = lines(FitStatus.close, withDetail: true);
  final listing = candidate.listing;
  final reads = listing == null
      ? const <HomeNeed, ListingRead>{}
      : {
          for (final read in story.readings)
            if (read.listingId == listing.id) read.need: read,
        };
  Reason Function(String line) measured(FitStatus status) =>
      (line) => Reason(
        text: line,
        source: ReasonSource.measured,
        status: status,
      );
  return AssessedCandidate(
    id: candidate.id,
    label: candidate.label,
    rank: rank,
    score: score,
    missesMustHave: rows.any(
      (row) =>
          row.mustHave && _cellOf(row, candidate.id).status == FitStatus.misses,
    ),
    pros: pros,
    cons: cons,
    close: close,
    why: [
      for (final need in story.needs)
        if (reads[need] case ListingRead(
          verdict: ReadVerdict.meets,
          :final quote,
        ))
          Reason(
            text: need.label,
            source: ReasonSource.listing,
            status: FitStatus.fits,
            quote: quote,
          ),
      if (listing != null) ..._buyerReasons(story, listing),
      ...pros.map(measured(FitStatus.fits)),
    ],
    shortfalls: [
      for (final need in story.needs)
        switch (reads[need]) {
          ListingRead(verdict: ReadVerdict.fails, :final quote) => Reason(
            text: need.label,
            source: ReasonSource.listing,
            status: FitStatus.misses,
            quote: quote,
          ),
          ListingRead(verdict: ReadVerdict.meets) => null,
          _ when listing == null => null,
          _ => Reason(
            text: '${need.label}: the listing never says',
            source: ReasonSource.listing,
            status: FitStatus.close,
          ),
        },
      ...close.map(measured(FitStatus.close)),
      ...cons.map(measured(FitStatus.misses)),
    ].nonNulls.toList(),
    weeklyMinutes: weeklyMinutes,
    listing: listing,
  );
}

List<Reason> _buyerReasons(Story story, Listing listing) => [
  if (story.outdoor case final outdoor?
      when outdoor != OutdoorSpace.none && listing.outdoor.satisfies(outdoor))
    Reason(
      text: _sentenceCase(listing.outdoor.phrase),
      source: ReasonSource.buyer,
      status: FitStatus.fits,
    ),
  if (story.areaIds.contains(listing.areaId))
    Reason(
      text: 'In ${listing.areaName}',
      source: ReasonSource.buyer,
      status: FitStatus.fits,
    ),
];

String _sentenceCase(String phrase) =>
    '${phrase[0].toUpperCase()}${phrase.substring(1)}';

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
    if (story.anchors
            .where((anchor) => anchor.id == criterion.anchorId)
            .firstOrNull
        case final anchor? when anchor.point != null)
      for (final candidate in located)
        if (measurements.of(candidate.id, criterion.id) case RouteMeasurement(
          :final mode,
          :final minutes,
          :final path,
        ))
          MapRoute(
            candidateId: candidate.id,
            anchorId: anchor.id,
            mode: mode,
            minutes: minutes,
            label: '$minutes min',
            origin: MapPin(
              lat: candidate.point!.lat,
              lng: candidate.point!.lng,
              label: candidate.label,
            ),
            destination: MapPin(
              lat: anchor.point!.lat,
              lng: anchor.point!.lng,
              label: anchor.label,
            ),
            perWeek: anchor.perWeek,
            path: [
              for (final point in path) [point.lat, point.lng],
            ],
          ),
];

int? weeklyMinutes(
  Story story,
  String candidateId,
  Measurements measurements,
) {
  var total = 0;
  for (final criterion in story.criteria) {
    final anchor = story.anchors
        .where((anchor) => anchor.id == criterion.anchorId)
        .firstOrNull;
    if (anchor == null) {
      continue;
    }
    if (measurements.of(candidateId, criterion.id) case RouteMeasurement(
      :final minutes,
    )) {
      total += 2 * minutes * anchor.perWeek;
    } else {
      return null;
    }
  }
  return total == 0 ? null : total;
}
