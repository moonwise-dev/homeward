import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../ui/core/themes/colors.dart';
import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/text_styles.dart';
import 'bindings/binding_actions.dart';

typedef WaitingCard = ({
  String label,
  String type,
  ComponentNode<ComponentImplementation> button,
});

List<WaitingCard> waitingCardsIn(ComponentNode<ComponentImplementation> more) =>
    [
      for (final row in ComponentProps(more.props.value).children('children'))
        for (final button in ComponentProps(
          row.props.value,
        ).children('children'))
          if (button.context?.componentModel.properties['action'] case {
            'event': {
              'context':
                  {'label': final String label} &&
                  final Map<String, Object?> context,
            },
          })
            (
              label: label,
              type: context['type'] as String? ?? _typeOfLabel(label),
              button: button,
            ),
    ];

String _typeOfLabel(String label) => label == 'More homes'
    ? 'HomeCard'
    : planSectionHeadings.entries
              .where((heading) => heading.value == label)
              .firstOrNull
              ?.key ??
          '';

class WaitingChips extends StatelessWidget {
  const WaitingChips({required this.cards, super.key});

  final List<WaitingCard> cards;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.xs,
      children: [
        Text(
          'Also worked out for you',
          style: styles.caption.copyWith(color: colors.textTertiary),
        ),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final card in cards)
              ActionChip(
                avatar: Icon(Icons.add, size: 18, color: colors.accent),
                label: Text(card.label),
                labelStyle: styles.label.copyWith(color: colors.text),
                backgroundColor: colors.surface,
                side: BorderSide(color: colors.border),
                shape: const StadiumBorder(),
                onPressed: () => dispatchAction(card.button, 'action'),
              ),
          ],
        ),
      ],
    );
  }
}
