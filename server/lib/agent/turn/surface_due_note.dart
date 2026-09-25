import 'package:common/common.dart';

const _drawing = {
  OpenDecision.caseQuestions,
  OpenDecision.caseSummary,
  OpenDecision.homeChoice,
  OpenDecision.targetMarket,
  OpenDecision.marketCoverage,
  OpenDecision.profileFields,
  OpenDecision.scenario,
};

const _case = {OpenDecision.caseQuestions, OpenDecision.caseSummary};

String? surfaceDueNote(
  Plan plan,
  ResolvedMarket? market, {
  bool caseOnly = false,
}) {
  final story = plan.story;
  final begun = story.candidates.isNotEmpty || story.city != null;
  final decision =
      (begun ? openDecisions(plan, market) : financeDecisions(plan, market))
          .firstOrNull;
  return decision == null ||
          !_drawing.contains(decision) ||
          (caseOnly && !_case.contains(decision))
      ? null
      : 'You drew no surface, with ${decision.name} still open. Draw the '
            'surface that decision calls for now, in an a2ui block, without '
            'repeating your text.';
}
