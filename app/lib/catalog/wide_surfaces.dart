import 'package:common/common.dart';
import 'package:genui/genui.dart';

final _wideComponents = {
  const LifestyleCommuteMap().name,
  const DynamicRecommendationStack().name,
  const ComparisonTable().name,
};

bool isWideSurface(SurfaceDefinition? definition) =>
    definition?.components.values.any(
      (component) => _wideComponents.contains(component.type),
    ) ??
    false;
