import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../fact/fact_view.dart';

class BriefView extends StatelessWidget {
  const BriefView({
    required this.items,
    this.kinds,
    this.title,
    this.onAnswer,
    super.key,
  });

  final List<BriefItem> items;
  final List<BriefKind>? kinds;
  final String? title;
  final void Function(BriefItem item, bool right)? onAnswer;

  @override
  Widget build(BuildContext context) {
    final onAnswer = this.onAnswer;
    final sections = [
      for (final kind in kinds ?? BriefKind.values)
        (
          kind: kind,
          items: [
            for (final item in items)
              if (item.kind == kind) item,
          ],
        ),
    ].where((section) => section.items.isNotEmpty);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title ?? 'What Homeward knows', style: AppTextStyles.label),
        if (sections.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text('Nothing here yet.', style: AppTextStyles.caption),
          ),
        for (final section in sections) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            _heading(section.kind),
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
          ),
          for (final item in section.items)
            FactView(
              fact: item,
              onAnswer: onAnswer == null
                  ? null
                  : (right) => onAnswer(item, right),
            ),
        ],
      ],
    );
  }

  static String _heading(BriefKind kind) => switch (kind) {
    BriefKind.household => 'Your household',
    BriefKind.money => 'Money',
    BriefKind.need => 'What the home needs',
    BriefKind.habit => 'Your week',
    BriefKind.want => 'What you would like',
    BriefKind.place => 'Places',
    BriefKind.open => 'Still open',
  };
}
