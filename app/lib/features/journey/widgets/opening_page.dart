import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../display/story_reason_label.dart';
import '../../../ui/app_button.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/app_sizes.dart';
import '../../../ui/app_spacing.dart';
import '../../../ui/app_text_field.dart';
import '../../../ui/app_text_styles.dart';
import '../opening_example.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({
    required this.reason,
    required this.ownReason,
    required this.story,
    required this.canStart,
    required this.onReason,
    required this.onOwnReason,
    required this.onStory,
    required this.onExample,
    required this.onStart,
    super.key,
  });

  final StoryReason? reason;
  final String ownReason;
  final String story;
  final bool canStart;
  final ValueChanged<StoryReason?> onReason;
  final ValueChanged<String> onOwnReason;
  final ValueChanged<String> onStory;
  final ValueChanged<OpeningExample> onExample;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(AppSpacing.md),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.xxl),
            Text('Tell us about the move', style: AppTextStyles.display),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Homeward turns your story into what matters to you, then '
              'checks homes against it on a map.',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Why are you moving?', style: AppTextStyles.label),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final option in StoryReason.values)
                  ChoiceChip(
                    label: Text(storyReasonLabel(option)),
                    selected: reason == option,
                    onSelected: (selected) =>
                        onReason(selected ? option : null),
                  ),
              ],
            ),
            if (reason == StoryReason.other)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: AppTextField(
                  label: 'In your own words',
                  value: ownReason,
                  onChanged: onOwnReason,
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            AppTextField(
              label: 'Your story',
              hintText:
                  "Where you're going, what your days look like, and any "
                  "homes you're looking at.",
              value: story,
              onChanged: onStory,
              minLines: 4,
              maxLines: 8,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('Try', style: AppTextStyles.caption),
                for (final example in openingExamples)
                  ActionChip(
                    label: Text(example.title),
                    onPressed: () => onExample(example),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: 'Start',
              icon: Icons.arrow_forward,
              onPressed: canStart ? onStart : null,
            ),
          ],
        ),
      ),
    ),
  );
}
