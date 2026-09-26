import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../catalog_item_for.dart';
import 'choice_view.dart';

final choiceItem = catalogItemFor(const Choice(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return ChoiceView(
    question: data['question'] as String? ?? '',
    options: [
      for (final option in data['options'] as List<Object?>? ?? const [])
        if (option case {'label': final String label})
          (label: label, detail: option['detail'] as String?),
    ],
    recommended: data['recommended'] as String?,
    because: data['because'] as String?,
    onChoose: (label) => dispatchAction(
      itemContext,
      data['answer'],
      adding: {'choice': label, 'label': label},
    ),
  );
});
