import 'package:common/common.dart';

import '../bindings/binding_actions.dart';
import '../catalog_item_for.dart';
import 'choice_view.dart';

final choiceItem = catalogItemFor(
  const Choice(),
  (_, node, props, _) => ChoiceView(
    question: props.string('question') ?? '',
    options: [
      for (final option in props.list('options'))
        if (option case {'label': final String label})
          (label: label, detail: option['detail'] as String?),
    ],
    recommended: props.string('recommended'),
    because: props.string('because'),
    onChoose: (label) => dispatchAction(
      node,
      'answer',
      adding: {'choice': label, 'label': label},
    ),
  ),
);
