import 'package:common/common.dart';

String? hunchProblem(Map<String, Object?> component) {
  if (component case {
    'component': 'Button',
    'action': {'event': {'name': 'answer'} && final Map<String, Object?> event},
  }) {
    return switch (event['context']) {
      {'facet': 'household', 'storyPath': '/story'} => null,
      _ =>
        'A Button sending answer asks who moves: its context is always '
            '{ "facet": "household", "storyPath": "/story" }',
    };
  }
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
