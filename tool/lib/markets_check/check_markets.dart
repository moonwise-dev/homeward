import 'package:common/common.dart';

import 'package:homeward_server/markets/finding.dart';
import 'package:homeward_server/markets/generated/subdivision_names.dart';
import 'package:homeward_server/markets/markets_data.dart';

const maxRateAgeDays = 75;
const expiryWarningDays = 30;

List<Finding> checkMarkets(MarketsData data, {required CalendarDate today}) {
  final packsById = {
    for (final pack in data.packsByFile.values) pack.id: pack,
  };
  return [
    ...data.loadFindings,
    for (final MapEntry(key: file, value: pack) in data.packsByFile.entries)
      ..._checkPack(file, pack, packsById, data, today),
    ..._checkPlaces(data, packsById),
  ];
}

Iterable<Finding> _checkPlaces(
  MarketsData data,
  Map<MarketId, MarketRulePack> packsById,
) sync* {
  final places = data.places;
  if (places == null) {
    yield findingError('places.json', 'Missing place directory');
    return;
  }
  for (final place in places.places) {
    for (final marketId in place.marketIds) {
      if (!packsById.containsKey(marketId) &&
          !subdivisionNames.containsKey(marketId.code) &&
          !countryNames.containsKey(marketId.code)) {
        yield findingError(
          'places.json',
          '${place.name} points at unknown market ${marketId.code}',
        );
      }
    }
  }
}

Iterable<Finding> _checkPack(
  String file,
  MarketRulePack pack,
  Map<MarketId, MarketRulePack> packsById,
  MarketsData data,
  CalendarDate today,
) sync* {
  final subject = pack.id.code;
  if (file != pack.id.code) {
    yield findingError(subject, 'Stored in $file.json');
  }
  final seen = <String>{};
  for (final entry in pack.entries) {
    if (!seen.add(entry.id)) {
      yield findingError(subject, 'Entry id ${entry.id} is used twice');
    }
  }
  yield* _review(subject, pack, today);

  final MarketRulePack resolved;
  try {
    resolved = resolvePackChain(pack.id, packsById);
  } on ArgumentError catch (error) {
    yield findingError(subject, '${error.message}');
    return;
  }
  final currency = resolved.currency!;
  final sourceIds = {for (final source in resolved.sources) source.id};
  for (final reference in _sourceReferences(pack)) {
    if (!sourceIds.contains(reference)) {
      yield findingError(subject, 'Unknown source $reference');
    }
  }
  yield* _amounts(subject, pack, currency);
  yield* _rates(subject, resolved, data, today);
  yield* _livingCosts(subject, resolved, data, today);
}

Iterable<Finding> _review(
  String subject,
  MarketRulePack pack,
  CalendarDate today,
) sync* {
  final expiresAt = pack.expiresAt;
  if (expiresAt == null) {
    yield findingWarning(
      subject,
      'Review pending: a second curator must verify every figure',
    );
    return;
  }
  if (pack.reviewedBy == null) {
    yield findingError(subject, 'reviewedAt is set without reviewedBy');
  }
  if (expiresAt.isBefore(today)) {
    yield findingError(subject, 'Review expired on ${expiresAt.isoDate}');
  } else if (expiresAt.isBefore(today.plusDays(expiryWarningDays))) {
    yield findingWarning(subject, 'Review expires on ${expiresAt.isoDate}');
  }
}

Iterable<String> _sourceReferences(MarketRulePack pack) => [
  for (final entry in pack.entries.whereType<Sourced>()) entry.sourceId,
  for (final rule in [...pack.purchaseCosts, ...pack.recurringCosts])
    if (rule.refund case final refund?) refund.sourceId,
];

Iterable<Finding> _amounts(
  String subject,
  MarketRulePack pack,
  Currency currency,
) sync* {
  final checks = <String, void Function()>{
    for (final rule in [...pack.purchaseCosts, ...pack.recurringCosts])
      rule.id: () => switch (rule.calculation) {
        FlatRateCalculation() => null,
        FixedCalculation(:final amount) => amount.toMoney(currency),
        PercentWithMinCalculation(:final min) => min.toMoney(currency),
        BracketsCalculation(:final brackets, :final marginal) =>
          marginal
              ? marginalCharge(
                  base: Money.zero(currency),
                  brackets: [
                    for (final bracket in brackets) bracket.toBracket(currency),
                  ],
                  rounding: rule.rounding,
                )
              : deductionCharge(
                  base: Money.zero(currency),
                  brackets: [
                    for (final bracket in brackets) bracket.toBracket(currency),
                  ],
                  rounding: rule.rounding,
                ),
      },
    for (final rule in pack.lending.leftToLiveOn)
      rule.id: () {
        rule.runningCostsMonthly.toMoney(currency);
        rule.transportMonthlyPerAdult.toMoney(currency);
      },
    for (final rule in pack.lending.interestDeduction)
      rule.id: () => marginalCharge(
        base: Money.zero(currency),
        brackets: [
          for (final bracket in rule.yearlyBrackets)
            bracket.toBracket(currency),
        ],
        rounding: Rounding.halfUp,
      ),
  };
  for (final MapEntry(key: id, value: check) in checks.entries) {
    try {
      check();
    } on FormatException catch (error) {
      yield findingError(subject, '$id: ${error.message} (${error.source})');
    } on ArgumentError catch (error) {
      yield findingError(subject, '$id: ${error.message}');
    }
  }
}

Iterable<Finding> _rates(
  String subject,
  MarketRulePack resolved,
  MarketsData data,
  CalendarDate today,
) sync* {
  for (final loanType in resolved.loanTypes) {
    final rate = data.rates[loanType.referenceRateId];
    if (rate == null) {
      yield findingError(
        subject,
        '${loanType.id}: no snapshot for ${loanType.referenceRateId}',
      );
    } else if (rate.asOf.plusDays(maxRateAgeDays).isBefore(today)) {
      yield findingError(
        subject,
        '${loanType.id}: ${rate.id} is from ${rate.asOf.isoDate}, older than $maxRateAgeDays days',
      );
    }
  }
}

Iterable<Finding> _livingCosts(
  String subject,
  MarketRulePack resolved,
  MarketsData data,
  CalendarDate today,
) sync* {
  if (resolved.lending.leftToLiveOn.isEmpty) {
    return;
  }
  final costs = data.livingCosts[resolved.id.countryCode];
  if (costs == null) {
    yield findingError(subject, 'Left to live on needs a living cost table');
  } else if (costs.currency != resolved.currency) {
    yield findingError(subject, 'Living costs are not in ${resolved.currency}');
  } else if (costs.year < today.utcMidnight.year - 1) {
    yield findingError(subject, 'Living costs are from ${costs.year}');
  }
}
