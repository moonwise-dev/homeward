import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../views/dynamic_recommendation_stack_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final dynamicRecommendationStackItem = catalogItemFor(
  const DynamicRecommendationStack(),
  (itemContext) {
    final data = itemContext.data as JsonMap;
    return BoundParsed<List<AssessedCandidate>>(
      dataContext: itemContext.dataContext,
      value: data['homes'],
      parse: (value) => jsonModelsOf(value, AssessedCandidate.fromJson),
      builder: (context, homes) => homes == null
          ? const WaitingForDetails()
          : DynamicRecommendationStackView(
              homes: homes,
              onChoose: data['choose'] == null
                  ? null
                  : (id) => dispatchAction(
                      itemContext,
                      data['choose'],
                      adding: {'candidateId': id},
                    ),
            ),
    );
  },
);
