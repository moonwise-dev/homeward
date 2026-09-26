import 'package:flutter/material.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/app_reveal.dart';
import '../view_model/journey_view_model.dart';
import 'exchange_section.dart';
import 'working_card.dart';

class ConversationThread extends StatelessWidget {
  const ConversationThread({
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
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final (index, section) in sections.indexed)
                ExchangeSection(
                  key: ValueKey(section.entry.id),
                  sessionId: sessionId,
                  section: section,
                  isLatest: pending == null && index == sections.length - 1,
                  onRetry: () => onRetry(section.entry.id),
                ),
              if (pending != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: AppReveal(
                    alignment: 1,
                    child: WorkingCard(entry: pending, onStop: onStop),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
