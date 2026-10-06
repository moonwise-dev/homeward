import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../catalog_item_for.dart';
import 'plan_overview_view.dart';

final planOverviewItem = catalogItemFor(const PlanOverview(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return PlanOverviewView(
    story: data['story'] as String? ?? '',
    steps: [
      for (final step in data['steps'] as List<Object?>? ?? const [])
        if (step case {'title': final String title})
          (
            title: title,
            state: PlanStepState.values.firstWhere(
              (state) => state.name == step['state'],
              orElse: () => PlanStepState.next,
            ),
            note: step['note'] as String?,
          ),
    ],
  );
});
