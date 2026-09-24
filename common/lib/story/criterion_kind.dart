import 'criterion_group.dart';
import 'criterion_measure.dart';

enum CriterionKind {
  commute(
    label: 'Commute',
    group: CriterionGroup.anchors,
    measure: CriterionMeasure.route,
    noun: 'trip',
    nouns: 'trips',
  ),
  schools(
    label: 'Schools',
    group: CriterionGroup.schools,
    measure: CriterionMeasure.nearest,
    withinMeters: 1000,
    noun: 'School',
    nouns: 'schools',
  ),
  preschool(
    label: 'Preschool',
    group: CriterionGroup.schools,
    measure: CriterionMeasure.nearest,
    withinMeters: 800,
    noun: 'Preschool',
    nouns: 'preschools',
  ),
  groceries(
    label: 'Groceries',
    group: CriterionGroup.everyday,
    measure: CriterionMeasure.nearest,
    withinMeters: 500,
    noun: 'Grocery shop',
    nouns: 'grocery shops',
  ),
  pharmacy(
    label: 'Pharmacy',
    group: CriterionGroup.everyday,
    measure: CriterionMeasure.nearest,
    withinMeters: 800,
    noun: 'Pharmacy',
    nouns: 'pharmacies',
  ),
  healthcare(
    label: 'Doctor',
    group: CriterionGroup.everyday,
    measure: CriterionMeasure.nearest,
    withinMeters: 1500,
    noun: 'Clinic',
    nouns: 'clinics',
  ),
  gym(
    label: 'Gym',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 800,
    noun: 'Gym',
    nouns: 'gyms',
  ),
  swimming(
    label: 'Swimming',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 2000,
    noun: 'Pool',
    nouns: 'pools',
  ),
  parks(
    label: 'Parks',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 400,
    noun: 'Park',
    nouns: 'parks',
  ),
  running(
    label: 'Running',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 800,
    noun: 'Green space',
    nouns: 'green spaces',
  ),
  playground(
    label: 'Playground',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 400,
    noun: 'Playground',
    nouns: 'playgrounds',
  ),
  water(
    label: 'Water',
    group: CriterionGroup.activities,
    measure: CriterionMeasure.nearest,
    withinMeters: 1000,
    noun: 'Water',
    nouns: 'waterfronts',
  ),
  restaurants(
    label: 'Restaurants',
    group: CriterionGroup.evenings,
    measure: CriterionMeasure.density,
    withinMeters: 600,
    count: 10,
    noun: 'Restaurant',
    nouns: 'restaurants',
  ),
  cafes(
    label: 'Cafés',
    group: CriterionGroup.evenings,
    measure: CriterionMeasure.density,
    withinMeters: 400,
    count: 3,
    noun: 'Café',
    nouns: 'cafés',
  ),
  nightlife(
    label: 'Nightlife',
    group: CriterionGroup.evenings,
    measure: CriterionMeasure.density,
    withinMeters: 800,
    count: 3,
    noun: 'Bar',
    nouns: 'bars and clubs',
  ),
  quiet(
    label: 'Quiet evenings',
    group: CriterionGroup.evenings,
    measure: CriterionMeasure.sparse,
    withinMeters: 300,
    count: 1,
    noun: 'Bar',
    nouns: 'bars and clubs',
  ),
  transit(
    label: 'Public transport',
    group: CriterionGroup.gettingAround,
    measure: CriterionMeasure.nearest,
    withinMeters: 500,
    noun: 'Stop',
    nouns: 'stops',
  ),
  parking(
    label: 'Parking',
    group: CriterionGroup.gettingAround,
    measure: CriterionMeasure.nearest,
    withinMeters: 300,
    noun: 'Car park',
    nouns: 'car parks',
  ),
  charging(
    label: 'EV charging',
    group: CriterionGroup.gettingAround,
    measure: CriterionMeasure.nearest,
    withinMeters: 1000,
    noun: 'Charger',
    nouns: 'chargers',
  ),
  noise(
    label: 'Traffic and rail noise',
    group: CriterionGroup.downsides,
    measure: CriterionMeasure.clearance,
    withinMeters: 200,
    noun: 'Main road',
    nouns: 'main roads',
  );

  const CriterionKind({
    required this.label,
    required this.group,
    required this.measure,
    required this.noun,
    required this.nouns,
    this.withinMeters = 0,
    this.count = 0,
  });

  final String label;
  final CriterionGroup group;
  final CriterionMeasure measure;
  final String noun;
  final String nouns;
  final int withinMeters;
  final int count;
}
