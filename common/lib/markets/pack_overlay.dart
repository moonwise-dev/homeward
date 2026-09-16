import 'identified.dart';
import 'lending_rules.dart';
import 'market_id.dart';
import 'market_rule_pack.dart';

MarketRulePack resolvePackChain(
  MarketId id,
  Map<MarketId, MarketRulePack> packs,
) => _resolve(id, packs, const {});

MarketRulePack overlayPack(MarketRulePack parent, MarketRulePack child) {
  final removed = child.removedRuleIds.toSet();
  final unknown = removed.difference({
    for (final entry in parent.entries) entry.id,
  });
  if (unknown.isNotEmpty) {
    throw ArgumentError.value(
      unknown,
      'removedRuleIds',
      '${child.id.code} removes rules ${parent.id.code} does not have',
    );
  }
  List<T> merge<T extends Identified>(List<T> inherited, List<T> own) {
    final ownById = {for (final entry in own) entry.id: entry};
    final inheritedIds = {for (final entry in inherited) entry.id};
    return [
      for (final entry in inherited)
        if (!removed.contains(entry.id)) ownById[entry.id] ?? entry,
      for (final entry in own)
        if (!inheritedIds.contains(entry.id)) entry,
    ];
  }

  final lending = parent.lending;
  final ownLending = child.lending;
  return child.copyWith(
    parent: null,
    currency: child.currency ?? parent.currency,
    effectiveFrom: parent.effectiveFrom.isBefore(child.effectiveFrom)
        ? child.effectiveFrom
        : parent.effectiveFrom,
    reviewedAt: switch ((parent.reviewedAt, child.reviewedAt)) {
      (final inherited?, final own?) =>
        inherited.isBefore(own) ? inherited : own,
      _ => null,
    },
    profileFields: merge(parent.profileFields, child.profileFields),
    lending: LendingRules(
      maxLtv: merge(lending.maxLtv, ownLending.maxLtv),
      maxDsti: merge(lending.maxDsti, ownLending.maxDsti),
      maxLti: merge(lending.maxLti, ownLending.maxLti),
      stress: merge(lending.stress, ownLending.stress),
      maxTermYears: merge(lending.maxTermYears, ownLending.maxTermYears),
      maxAgeAtMaturity: merge(
        lending.maxAgeAtMaturity,
        ownLending.maxAgeAtMaturity,
      ),
      incomeAdjustments: merge(
        lending.incomeAdjustments,
        ownLending.incomeAdjustments,
      ),
      amortization: merge(lending.amortization, ownLending.amortization),
      leftToLiveOn: merge(lending.leftToLiveOn, ownLending.leftToLiveOn),
      interestDeduction: merge(
        lending.interestDeduction,
        ownLending.interestDeduction,
      ),
      repaymentStyle: ownLending.repaymentStyle ?? lending.repaymentStyle,
    ),
    purchaseCosts: merge(parent.purchaseCosts, child.purchaseCosts),
    recurringCosts: merge(parent.recurringCosts, child.recurringCosts),
    loanTypes: merge(parent.loanTypes, child.loanTypes),
    removedRuleIds: const [],
    sources: merge(parent.sources, child.sources),
  );
}

MarketRulePack _resolve(
  MarketId id,
  Map<MarketId, MarketRulePack> packs,
  Set<MarketId> visiting,
) {
  final pack = packs[id];
  if (pack == null) {
    throw ArgumentError.value(id.code, 'id', 'No pack');
  }
  if (visiting.contains(id)) {
    throw ArgumentError.value(id.code, 'id', 'Packs inherit in a cycle');
  }
  final parentId = pack.parent;
  if (parentId == null) {
    if (pack.currency == null) {
      throw ArgumentError.value(id.code, 'id', 'A root pack needs a currency');
    }
    return pack;
  }
  return overlayPack(_resolve(parentId, packs, {...visiting, id}), pack);
}
