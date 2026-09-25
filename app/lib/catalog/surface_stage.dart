import 'package:common/common.dart';
import 'package:genui/genui.dart';

final _stages = [
  (title: 'The case', component: const StoryDraft().name),
  (title: 'The deal', component: const AffordabilitySummary().name),
  (title: 'Homes', component: const ComparisonTable().name),
  (title: 'Homes', component: const DynamicRecommendationStack().name),
  (title: 'About you', component: const HouseholdInput().name),
  (title: 'About you', component: const MoneyInput().name),
];

String? surfaceStageTitle(Iterable<SurfaceDefinition?> definitions) {
  final types = {
    for (final definition in definitions.nonNulls)
      for (final component in definition.components.values) component.type,
  };
  for (final stage in _stages) {
    if (types.contains(stage.component)) {
      return stage.title;
    }
  }
  return null;
}
