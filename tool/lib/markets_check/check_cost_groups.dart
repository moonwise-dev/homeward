import 'dart:math';

import 'package:common/common.dart';
import 'package:homeward_server/markets/finding.dart';

typedef _Fact = ({String label, BuyerProfile Function(BuyerProfile) set});

typedef _Buyer = ({String label, BuyerProfile profile});

Iterable<Finding> checkCostGroups(String subject, MarketRulePack pack) sync* {
  for (final rules in [pack.purchaseCosts, pack.recurringCosts]) {
    final groups = <String, List<CostRule>>{};
    for (final rule in rules) {
      if (rule.group case final group?) {
        (groups[group] ??= []).add(rule);
      }
    }
    for (final MapEntry(key: group, value: grouped) in groups.entries) {
      for (final buyer in _buyers(grouped, pack.id)) {
        final applicable = [
          for (final rule in grouped)
            if (applicabilityOf(
              rule.appliesTo,
              profile: buyer.profile,
              market: pack.id,
            ) is Applies)
              rule,
        ];
        if (applicable.isEmpty) {
          yield findingError(
            subject,
            'No $group charge applies to ${buyer.label}',
          );
          continue;
        }
        final highest = applicable.map((rule) => rule.precedence).reduce(max);
        final winners = [
          for (final rule in applicable)
            if (rule.precedence == highest) rule.id,
        ];
        if (winners.length > 1) {
          yield findingError(
            subject,
            '${winners.join(' and ')} both charge $group to ${buyer.label}',
          );
        }
      }
    }
  }
}

Iterable<_Buyer> _buyers(List<CostRule> rules, MarketId market) {
  var buyers = [(label: 'any buyer', profile: const BuyerProfile())];
  for (final dimension in _dimensions(rules, market)) {
    buyers = [
      for (final buyer in buyers)
        for (final fact in dimension)
          (
            label: buyer.profile == const BuyerProfile()
                ? fact.label
                : '${buyer.label}, ${fact.label}',
            profile: fact.set(buyer.profile),
          ),
    ];
  }
  return buyers;
}

List<List<_Fact>> _dimensions(List<CostRule> rules, MarketId market) {
  final predicates = [for (final rule in rules) ?rule.appliesTo];
  final ages = {
    for (final predicate in predicates)
      if (predicate.age case final range?) ...[
        if (range.min case final min?) ...[min, min - 1],
        if (range.max case final max?) ...[max, max + 1],
      ],
  };
  return [
    if (predicates.any((predicate) => predicate.residency != null))
      [
        for (final residency in Residency.values)
          (
            label: residency.name,
            set: (profile) => profile.copyWith(
              taxResidence: switch (residency) {
                Residency.resident => market.countryCode,
                Residency.nonResident => abroadFrom(market),
              },
            ),
          ),
      ],
    if (predicates.any((predicate) => predicate.formerResident != null))
      [
        for (final formerResident in [true, false])
          (
            label: formerResident ? 'once resident' : 'never resident',
            set: (profile) => profile.copyWith(formerResident: formerResident),
          ),
      ],
    if (predicates.any((predicate) => predicate.residencyIntent != null))
      [
        for (final intent in ResidencyIntent.values)
          (
            label: intent.name,
            set: (profile) => profile.copyWith(residencyIntent: intent),
          ),
      ],
    if (predicates.any((predicate) => predicate.residencyRegion != null))
      [
        for (final region in Region.values)
          (
            label: 'tax resident ${region.name}',
            set: (profile) =>
                profile.copyWith(taxResidence: countryIn(market, region)),
          ),
      ],
    if (predicates.any((predicate) => predicate.citizenship != null))
      [
        for (final region in Region.values)
          (
            label: '${region.name} citizen',
            set: (profile) =>
                profile.copyWith(citizenship: countryIn(market, region)),
          ),
      ],
    if (predicates.any((predicate) => predicate.use != null))
      [
        for (final use in PropertyUse.values)
          (label: use.name, set: (profile) => profile.copyWith(use: use)),
      ],
    if (predicates.any((predicate) => predicate.firstTime != null))
      [
        for (final firstTime in [true, false])
          (
            label: firstTime ? 'first time' : 'bought before',
            set: (profile) => profile.copyWith(firstTime: firstTime),
          ),
      ],
    if (predicates.any((predicate) => predicate.employment != null))
      [
        for (final employment in Employment.values)
          (
            label: employment.name,
            set: (profile) => profile.copyWith(employment: employment),
          ),
      ],
    if (ages.isNotEmpty)
      [
        for (final age in ages)
          (label: 'aged $age', set: (profile) => profile.copyWith(age: age)),
      ],
  ];
}
