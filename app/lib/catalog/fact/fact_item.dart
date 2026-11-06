import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'fact_answer.dart';
import 'fact_view.dart';

final factItem = catalogItemFor(const Fact(), (_, node, props, _) {
  final fact = jsonModelOf(props.value('fact'), BriefItem.fromJson);
  if (fact == null) {
    return const SizedBox.shrink();
  }
  return FactView(
    fact: fact,
    onAnswer: props.action('answer') == null
        ? null
        : (right) =>
              dispatchAction(node, 'answer', adding: factAnswer(fact, right)),
  );
});
