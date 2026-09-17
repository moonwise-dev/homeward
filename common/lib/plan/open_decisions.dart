import '../markets/resolved_market.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'open_decision.dart';
import 'plan.dart';

List<OpenDecision> openDecisions(Plan plan, ResolvedMarket? market) {
  if (plan.marketId == null) {
    return OpenDecision.values
        .where((decision) => decision != OpenDecision.marketCoverage)
        .toList();
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
