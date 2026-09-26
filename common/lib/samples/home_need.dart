enum HomeNeed {
  stepFree(
    'Step-free entry',
    'the home can be reached from the street without steps: a level '
        'entrance, a ramp, or a lift from a level hall',
  ),
  lift('A lift', 'the building has a lift to the floor of the home'),
  entryLevelShower(
    'A walk-in shower on the entry floor',
    'a walk-in or level shower, not a bath or a shower over a bath, on the '
        'floor you enter the home on',
  ),
  entryLevelBedroom(
    'A bedroom on the entry floor',
    'a bedroom on the floor you enter the home on, not up or down a stair',
  ),
  homeOffice(
    'Room for a home office',
    'a room, an alcove, or a nook meant for a desk or for working',
  ),
  pets('Pets welcome', 'pets are allowed in the home and the building');

  const HomeNeed(this.label, this.meaning);

  final String label;
  final String meaning;

  static const none = 'none';

  static List<HomeNeed>? parse(Object? value) {
    if (value is! String) {
      return null;
    }
    if (value.trim() == none) {
      return const [];
    }
    final needs = [
      for (final name in value.split(','))
        values.where((need) => need.name == name.trim()).firstOrNull,
    ];
    return needs.isEmpty || needs.contains(null)
        ? null
        : needs.nonNulls.toList();
  }

  static String answer(List<HomeNeed> needs) =>
      needs.isEmpty ? none : [for (final need in needs) need.name].join(',');
}
