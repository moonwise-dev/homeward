import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../money_text.dart';

class RuleNoteView extends StatelessWidget {
  const RuleNoteView({required this.rule, super.key});

  final RuleCheck rule;

  @override
  Widget build(BuildContext context) {
    final source = rule.source;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.gavel_outlined, size: 18, color: AppColors.accent),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ruleLabel(rule.kind),
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                'Allows a loan up to ${moneyText(rule.maxLoan)}; '
                '${rule.allows ? 'your loan is within it' : 'your loan is over it'}.',
                style: AppTextStyles.body.copyWith(
                  color: rule.allows
                      ? AppColors.textSecondary
                      : AppColors.danger,
                ),
              ),
              if (source != null) ...[
                const SizedBox(height: AppSpacing.xs),
                InkWell(
                  onTap: () => launchUrl(Uri.parse(source.url)),
                  child: Text(
                    '${source.publisher}: ${source.title}',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.accent,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.accent,
                    ),
                  ),
                ),
                Text(
                  'Read ${source.retrievedAt}. Sample rule for '
                  '${rule.marketName}.',
                  style: AppTextStyles.caption,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
