import 'package:common/common.dart';

const _drawing = {
  OpenDecision.storyGaps,
  OpenDecision.homeChoice,
  OpenDecision.targetMarket,
  OpenDecision.marketCoverage,
  OpenDecision.profileFields,
  OpenDecision.scenario,
};

String? surfaceDueNote(Plan plan, ResolvedMarket? market) {
  final story = plan.story;
  final begun = story.candidates.isNotEmpty || story.city != null;
  final decision =
      (begun ? openDecisions(plan, market) : financeDecisions(plan, market))
          .firstOrNull;
  return decision == null || !_drawing.contains(decision)
      ? null
      : 'The buyer used a control and you drew no surface, with '
            '${decision.name} still open. Draw the surface that decision '
            'calls for now, in an a2ui block, without repeating your text.';
}
