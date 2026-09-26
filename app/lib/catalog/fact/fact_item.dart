import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'fact_view.dart';

final factItem = catalogItemFor(const Fact(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final answer = data['answer'];
  return BoundParsed<BriefItem>(
    dataContext: itemContext.dataContext,
    value: data['fact'],
    parse: (value) => jsonModelOf(value, BriefItem.fromJson),
    builder: (context, fact) => fact == null
        ? const SizedBox.shrink()
        : FactView(
            fact: fact,
            onAnswer: answer == null
                ? null
                : (right) => dispatchAction(
                    itemContext,
                    answer,
                    adding: {
                      'fact': fact.id,
                      'answer': right ? 'right' : 'not_quite',
                      'label': '${right ? 'Right' : 'Not quite'}: ${fact.text}',
                    },
                  ),
          ),
  );
});
