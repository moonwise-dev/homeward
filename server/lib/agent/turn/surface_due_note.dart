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
  if (decision == null ||
      !_drawing.contains(decision) ||
      (caseOnly && !_case.contains(decision))) {
    return null;
  }
  final missing = [
    if (decision == OpenDecision.profileFields && market != null)
      for (final field in missingProfileFields(plan.profile, market))
        field.name,
  ];
  return 'You drew no surface, with ${decision.name} still open'
      '${missing.isEmpty ? '' : ': the profile lacks ${missing.join(', ')}'}. '
      'Draw the surface that decision calls for now, in an a2ui block, '
      'without repeating your text.';
}
