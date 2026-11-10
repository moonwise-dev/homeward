import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/text_styles.dart';
import '../ui/core/ui/app_option.dart';
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

class WaitingTiles extends StatelessWidget {
  const WaitingTiles({required this.cards, super.key});

  final List<WaitingCard> cards;

  static const _minTileWidth = 240.0;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = (constraints.maxWidth / _minTileWidth).floor().clamp(
        1,
        2,
      );
      final width =
          (constraints.maxWidth - AppSpacing.xs * (columns - 1)) / columns;
      return Wrap(
        spacing: AppSpacing.xs,
        runSpacing: AppSpacing.xs,
        children: [
          SizedBox(
            width: constraints.maxWidth,
            child: Text(
              'Also worked out for you',
              style: AppTextStyles.of(context).label,
            ),
          ),
          for (final card in cards)
            SizedBox(
              width: width,
              child: AppOptionTile(
                title: card.label,
                icon: Icons.add_rounded,
                onTap: () => dispatchAction(card.button, 'action'),
              ),
            ),
        ],
      );
    },
  );
}
