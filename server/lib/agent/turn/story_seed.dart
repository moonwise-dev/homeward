import 'package:common/common.dart';

Map<String, Object?> storySeed(Story story) {
  final kinds = {for (final criterion in story.criteria) criterion.kind};
  final first = story.anchors.firstOrNull;
  return {
    'reason': [?story.reason?.name],
    'city': ?story.city,
    'mode': [(first?.mode ?? TravelMode.transit).name],
    'maxMinutes': first?.maxMinutes ?? 30,
    'picks': {
      for (final group in CriterionGroup.values)
        if (group != CriterionGroup.anchors)
          group.name: [
            for (final kind in kinds)
              if (kind.group == group) kind.name,
          ],
    },
    'mustHaves': {
      for (final criterion in story.criteria)
        if (criterion.mustHave) criterion.kind.name,
    }.toList(),
    'note': '',
    'markers': [
      for (final Anchor(:id, :label, :point) in story.anchors)
        if (point != null)
          MapMarker(
            id: id,
            label: label,
            kind: MapMarkerKind.anchor,
            lat: point.lat,
            lng: point.lng,
          ).toJson(),
      for (final Candidate(:id, :label, :point) in story.candidates)
        if (point != null)
          MapMarker(
            id: id,
            label: label,
            kind: MapMarkerKind.candidate,
            lat: point.lat,
            lng: point.lng,
            candidateId: id,
          ).toJson(),
    ],
    'anchors': [for (final anchor in story.anchors) anchor.toJson()],
    'candidates': [
      for (final candidate in story.candidates) candidate.toJson(),
    ],
    'criteria': [for (final criterion in story.criteria) criterion.toJson()],
  };
}
