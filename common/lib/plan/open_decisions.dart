import '../markets/resolved_market.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import '../story/case_gaps.dart';
import '../story/story.dart';
import 'open_decision.dart';
import 'plan.dart';

List<OpenDecision> openDecisions(
  Plan plan,
  ResolvedMarket? market, {
  bool deal = true,
}) => [
  ...storyDecisions(plan.story),
  if (deal) ...financeDecisions(plan, market),
];

List<OpenDecision> storyDecisions(Story story) => [
  if (story.candidates.isEmpty && story.city == null) OpenDecision.story,
  if (!story.committed)
    caseQuestionsOpen(story)
        ? OpenDecision.caseQuestions
        : OpenDecision.caseSummary,
  if (story.chosen == null) OpenDecision.homeChoice,
];

List<OpenDecision> financeDecisions(Plan plan, ResolvedMarket? market) {
  if (plan.marketId == null) {
    return const [
      OpenDecision.targetMarket,
      OpenDecision.profileFields,
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ];
  }
  if (market == null) {
    return const [OpenDecision.marketCoverage];
  }
  return [
    if (missingProfileFields(plan.profile, market).isNotEmpty)
      OpenDecision.profileFields,
    if (plan.scenario == null) ...[
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ],
  ];
}

Set<ProfileField> missingProfileFields(
  BuyerProfile profile,
  ResolvedMarket market,
) {
  final answered = profile.toJson().keys.toSet();
  return market.requiredFields
      .where((field) => !answered.containsAll(field.profileKeys))
      .toSet();
}
