import 'package:common/common.dart';

String locatingLabel(String place) => 'Finding $place on the map';

String nearbyLabel(Iterable<CriterionKind> kinds, Iterable<Candidate> homes) {
  final nouns = {for (final kind in kinds) kind.nouns}.toList();
  final named = nouns.length <= 3
      ? _listed(nouns)
      : '${nouns.take(2).join(', ')}, and ${nouns.length - 2} more';
  return 'Looking for $named near ${_listed([for (final home in homes) home.label])}';
}

String routeLabel(Anchor anchor) =>
    'Timing the trip to ${anchor.label} ${anchor.mode.phrase}';

String _listed(List<String> items) => switch (items) {
  [] => '',
  [final only] => only,
  [final first, final second] => '$first and $second',
  [...final rest, final last] => '${rest.join(', ')}, and $last',
};
