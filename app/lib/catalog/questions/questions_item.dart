import 'package:common/common.dart';

import '../bindings/binding_actions.dart';
import '../catalog_item_for.dart';
import 'questions_view.dart';

final questionsItem = catalogItemFor(
  const Questions(),
  (_, node, props, _) => QuestionsView(
    title: props.string('title'),
    sendLabel: props.string('send'),
    fields: [
      for (final field in props.list('fields'))
        if (field case {'id': final String id, 'label': final String label})
          (
            id: id,
            label: label,
            kind: QuestionKind.values.firstWhere(
              (kind) => kind.name == field['kind'],
              orElse: () => QuestionKind.text,
            ),
            currency: (field['currency'] as String?)?.toUpperCase(),
            period: field['period'] as String?,
            options: [
              for (final option in field['options'] as List<Object?>? ?? [])
                if (option is String) option,
            ],
            hint: field['hint'] as String?,
          ),
    ],
    onSend: (answers, label) => dispatchAction(
      node,
      'answer',
      adding: {'answers': answers, 'label': label},
    ),
  ),
);
