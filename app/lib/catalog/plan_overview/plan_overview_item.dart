import 'package:common/common.dart';

import '../catalog_item_for.dart';
import 'plan_overview_view.dart';

final planOverviewItem = catalogItemFor(
  const PlanOverview(),
  (_, _, props, _) => PlanOverviewView(
    story: props.string('story') ?? '',
    steps: [
      for (final step in props.list('steps'))
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
  ),
);
