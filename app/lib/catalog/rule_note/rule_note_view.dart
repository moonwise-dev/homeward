import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_source_note.dart';
import '../../ui/core/ui/app_status_chip.dart';
import '../money_text.dart';

class RuleNoteView extends StatelessWidget {
  const RuleNoteView({required this.rule, super.key});

  final RuleCheck rule;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final source = rule.source;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBlockTitle(
          title: ruleLabel(rule.kind),
          status: AppStatusChip(
            label: rule.allows
                ? 'Your loan is within it'
                : 'Your loan is over it',
            tone: rule.allows ? AppTone.positive : AppTone.danger,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(moneyText(rule.maxLoan), style: styles.figureLarge),
        Text(
          'The largest loan this rule allows',
          style: styles.caption.copyWith(color: colors.textSecondary),
        ),
        if (source != null) ...[
          const SizedBox(height: AppSpacing.sm),
          InkWell(
            onTap: () => launchUrl(Uri.parse(source.url)),
            child: Text(
              '${source.publisher}: ${source.title}',
              style: styles.label.copyWith(
                color: colors.accent,
                decoration: TextDecoration.underline,
                decorationColor: colors.accent,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          AppSourceNote(
            lines: [
              'Read ${source.retrievedAt}. Sample rule for '
                  '${rule.marketName}.',
            ],
          ),
        ],
      ],
    );
  }
}
