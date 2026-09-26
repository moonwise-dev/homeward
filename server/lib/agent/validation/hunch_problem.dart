import 'package:common/common.dart';

String? hunchProblem(Map<String, Object?> component) {
  if (component['component'] != const Hunch().name) {
    return null;
  }
  final facet = CaseFacet.values
      .where((facet) => facet.name == component['facet'])
      .firstOrNull;
  if (facet == null) {
    return null;
  }
  for (final option in component['options'] as List<Object?>? ?? const []) {
    if (option case {'label': final String label, 'value': final Object? value}
        when !(option['pin'] == true && facet == CaseFacet.place) &&
            !_fits(facet, value)) {
      return 'Hunch option "$label" has a value that does not fit '
          '${facet.name}: ${_expected(facet)}';
    }
  }
  return null;
}

bool _fits(CaseFacet facet, Object? value) {
  final text = '$value'.trim();
  bool named(List<Enum> values) => values.any((item) => item.name == text);
  final number = int.tryParse(text);
  return switch (facet) {
    CaseFacet.place => text.isNotEmpty,
    CaseFacet.mode => named(TravelMode.values),
    CaseFacet.maxMinutes => number != null && number >= 5 && number <= 120,
    CaseFacet.rooms => number != null && number >= 1 && number <= 8,
    CaseFacet.homeType => named(HomeType.values),
    CaseFacet.outdoor => named(OutdoorSpace.values),
    CaseFacet.style => named(HomeStyle.values),
    CaseFacet.criterion =>
      text != CriterionKind.commute.name && named(CriterionKind.values),
    CaseFacet.needs => HomeNeed.parse(text) != null,
    CaseFacet.household ||
    CaseFacet.photo ||
    CaseFacet.area ||
    CaseFacet.routine ||
    CaseFacet.swipe => false,
  };
}

String _expected(CaseFacet facet) => switch (facet) {
  CaseFacet.place => 'a map query',
  CaseFacet.mode => [
    for (final mode in TravelMode.values) mode.name,
  ].join(', '),
  CaseFacet.maxMinutes => 'whole minutes from 5 to 120',
  CaseFacet.rooms => 'a whole number of rooms from 1 to 8',
  CaseFacet.homeType => [
    for (final type in HomeType.values) type.name,
  ].join(', '),
  CaseFacet.outdoor => [
    for (final outdoor in OutdoorSpace.values) outdoor.name,
  ].join(', '),
  CaseFacet.style => [
    for (final style in HomeStyle.values) style.name,
  ].join(', '),
  CaseFacet.criterion => 'a criterion kind other than commute',
  CaseFacet.needs =>
    'needs from ${[for (final need in HomeNeed.values) need.name].join(', ')}, '
        'separated by commas, or ${HomeNeed.none}',
  CaseFacet.household ||
  CaseFacet.photo ||
  CaseFacet.area ||
  CaseFacet.routine ||
  CaseFacet.swipe => 'a facet a Hunch cannot answer',
};

String? caseQuestionProblem(
  Map<String, Object?> component,
  Set<CaseFacet> mustAsk,
) {
  if (mustAsk.isEmpty) {
    return null;
  }
  final needs = [for (final facet in mustAsk) facet.name].join(', ');
  if (component['component'] == const StoryDraft().name) {
    return 'The case still needs $needs: ask about one of them with a '
        'question card; the case summary comes once they are answered';
  }
  final asks = switch (component) {
    {'component': 'Hunch', 'facet': final String facet} =>
      CaseFacet.values.where((value) => value.name == facet).firstOrNull,
    {'component': 'HouseholdInput', 'adults': {'path': final String path}}
        when path.startsWith(storySlice.path) =>
      CaseFacet.household,
    {'component': 'Routine'} => CaseFacet.routine,
    {'component': 'HomeSwipe'} => CaseFacet.homeType,
    {'component': 'TradeOff'} => CaseFacet.area,
    {'component': 'PhotoLineup', 'photos': {'path': '/lineup/homes'}} =>
      CaseFacet.homeType,
    _ => null,
  };
  return asks == null || mustAsk.contains(asks)
      ? null
      : 'The case still needs $needs: ask about one of them, not '
            '${asks.name}';
}
