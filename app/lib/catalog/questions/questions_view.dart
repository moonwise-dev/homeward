import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_text_field.dart';

enum QuestionKind { money, number, text, pick }

typedef QuestionField = ({
  String id,
  String label,
  QuestionKind kind,
  String? currency,
  String? period,
  List<String> options,
  String? hint,
});

class QuestionsView extends HookWidget {
  const QuestionsView({
    required this.fields,
    required this.onSend,
    this.title,
    this.sendLabel,
    super.key,
  });

  final String? title;
  final List<QuestionField> fields;
  final String? sendLabel;
  final void Function(Map<String, String> answers, String label) onSend;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final typed = useState(const <String, String>{});
    final sent = useState(false);
    final title = this.title;
    final answers = {
      for (final field in fields)
        field.id: ?_answer(field, typed.value[field.id]),
    };

    void set(String id, String value) =>
        typed.value = {...typed.value, id: value};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null && title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Text(title, style: styles.title),
          ),
        for (final field in fields)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: switch (field.kind) {
              QuestionKind.pick when field.options.length > 1 => _Pick(
                field: field,
                chosen: typed.value[field.id],
                enabled: !sent.value,
                onChosen: (option) => set(field.id, option),
              ),
              _ => _Typed(
                field: field,
                value: typed.value[field.id] ?? '',
                unit: _unit(field),
                enabled: !sent.value,
                onChanged: (text) => set(field.id, text),
              ),
            },
          ),
        const SizedBox(height: AppSpacing.xxs),
        AppButton(
          label: sent.value ? 'Sent' : sendLabel ?? 'Send',
          icon: sent.value ? Icons.check : null,
          fullWidth: true,
          onPressed: sent.value || answers.isEmpty
              ? null
              : () {
                  sent.value = true;
                  onSend(
                    answers,
                    [
                      for (final field in fields)
                        if (answers[field.id] case final answer?)
                          '${field.label}: $answer',
                    ].join('\n'),
                  );
                },
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Leave out what you do not know, or tell Homeward in your own '
          'words below.',
          style: styles.caption,
        ),
      ],
    );
  }

  static String? _unit(QuestionField field) {
    if (field.kind != QuestionKind.money) {
      return null;
    }
    final unit = [?field.currency, ?_per(field.period)].join(' ');
    return unit.isEmpty ? null : unit;
  }

  static String? _per(String? period) => switch (period) {
    'month' => 'a month',
    'year' => 'a year',
    _ => null,
  };

  static String? _answer(QuestionField field, String? typed) {
    final text = typed?.trim() ?? '';
    if (text.isEmpty) {
      return null;
    }
    if (field.kind != QuestionKind.money) {
      return text;
    }
    final amount = int.tryParse(text);
    return [
      ?field.currency,
      amount == null ? text : NumberFormat.decimalPattern('en').format(amount),
      ?_per(field.period),
    ].join(' ');
  }
}

class _Typed extends StatelessWidget {
  const _Typed({
    required this.field,
    required this.value,
    required this.unit,
    required this.enabled,
    required this.onChanged,
  });

  final QuestionField field;
  final String value;
  final String? unit;
  final bool enabled;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final unit = this.unit;
    final hint = field.hint;
    final whole =
        field.kind == QuestionKind.money || field.kind == QuestionKind.number;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: field.label,
          value: value,
          enabled: enabled,
          keyboardType: whole ? TextInputType.number : null,
          inputFormatters: whole
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          suffix: unit == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: Center(
                    widthFactor: 1,
                    child: Text(unit, style: styles.label),
                  ),
                ),
          onChanged: onChanged,
        ),
        if (hint != null && hint.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xxs,
              left: AppSpacing.sm,
            ),
            child: Text(hint, style: styles.caption),
          ),
      ],
    );
  }
}

class _Pick extends StatelessWidget {
  const _Pick({
    required this.field,
    required this.chosen,
    required this.enabled,
    required this.onChosen,
  });

  final QuestionField field;
  final String? chosen;
  final bool enabled;
  final ValueChanged<String> onChosen;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label, style: styles.label),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final option in field.options)
              ChoiceChip(
                label: Text(option),
                selected: chosen == option,
                showCheckmark: false,
                labelStyle: styles.body.copyWith(
                  color: chosen == option ? colors.accent : colors.text,
                  fontWeight: chosen == option ? FontWeight.w600 : null,
                ),
                selectedColor: colors.accentSoft,
                backgroundColor: colors.surface,
                side: BorderSide(
                  color: chosen == option ? colors.accent : colors.border,
                ),
                onSelected: enabled ? (_) => onChosen(option) : null,
              ),
          ],
        ),
      ],
    );
  }
}
