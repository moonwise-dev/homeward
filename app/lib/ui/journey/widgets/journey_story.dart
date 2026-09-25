import 'package:flutter/material.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/motion.dart';
import '../../core/ui/app_reveal.dart';
import '../view_model/journey_view_model.dart';
import 'story_section.dart';
import 'working_card.dart';

class JourneyStory extends StatelessWidget {
  const JourneyStory({
    required this.sessionId,
    required this.sections,
    required this.onRetry,
    required this.onStop,
    this.pending,
    super.key,
  });

  final String sessionId;
  final List<JourneySection> sections;
  final AgentEntry? pending;
  final ValueChanged<String> onRetry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final pending = this.pending;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        children: [
          IgnorePointer(
            ignoring: pending != null,
            child: AnimatedOpacity(
              opacity: pending == null ? 1 : 0.55,
              duration: AppMotion.of(context, AppMotion.surface),
              child: Column(
                children: [
                  for (final (index, section) in sections.indexed)
                    StorySection(
                      key: ValueKey(section.entry.id),
                      sessionId: sessionId,
                      section: section,
                      isLatest: index == sections.length - 1,
                      onRetry: () => onRetry(section.entry.id),
                    ),
                ],
              ),
            ),
          ),
          if (pending != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppSizes.contentWidth,
                  ),
                  child: AppReveal(
                    alignment: 1,
                    child: WorkingCard(entry: pending, onStop: onStop),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
