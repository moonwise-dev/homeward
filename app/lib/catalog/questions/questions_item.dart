import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../catalog_item_for.dart';
import 'questions_view.dart';

final questionsItem = catalogItemFor(const Questions(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return QuestionsView(
    title: data['title'] as String?,
    sendLabel: data['send'] as String?,
    fields: [
      for (final field in data['fields'] as List<Object?>? ?? const [])
        if (field case {
          'id': final String id,
          'label': final String label,
        })
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
      itemContext,
      data['answer'],
      adding: {'answers': answers, 'label': label},
    ),
  );
});
