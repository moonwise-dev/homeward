import 'dart:convert';

import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';
import 'pack_fixtures.dart';

void main() {
  Map<String, Object?> madeira() =>
      jsonDecode(madeiraPackJson) as Map<String, Object?>;
  Map<String, Object?> portugal() =>
      jsonDecode(portugalPackJson) as Map<String, Object?>;

  group('MarketRulePack', () {
    test('parses a regional pack', () {
      final pack = MarketRulePack.fromJson(madeira());

      expect(pack.id, MarketId.parse('PT-30'));
      expect(pack.parent, MarketId.parse('PT'));
      expect(pack.currency, isNull);
      expect(pack.expiresAt, CalendarDate.parse('2027-03-09'));
      expect(pack.purchaseCosts.map((rule) => rule.group), ['imt']);
      expect(pack.sources, isEmpty);
    });

    test('round trips through JSON', () {
      final pack = MarketRulePack.fromJson(portugal());

      expect(
        MarketRulePack.fromJson(
          jsonDecode(jsonEncode(pack.toJson())) as Map<String, Object?>,
        ),
        pack,
      );
    });

    test('brackets written as published reproduce the IMT table', () {
      final pack = MarketRulePack.fromJson(madeira());
      final currency = Currency.parse('EUR');
      final calculation =
          pack.purchaseCosts.first.calculation as BracketsCalculation;

      expect(
        deductionCharge(
          base: eur(35000000),
          brackets: [
            for (final bracket in calculation.brackets)
              bracket.toBracket(currency),
          ],
          rounding: pack.purchaseCosts.first.rounding,
        ),
        eur(1142752),
      );
    });

    test('carries the non-resident rate and its refund', () {
      final rule = MarketRulePack.fromJson(portugal()).purchaseCosts.last;
      final calculation = rule.calculation as FlatRateCalculation;

      expect(
        eur(35000000).applyRate(calculation.rate, rounding: rule.rounding),
        eur(2625000),
      );
      expect(rule.refund?.when.residencyIntent, ResidencyIntent.becomeResident);
      expect(rule.refund?.recomputeAs.residency, Residency.resident);
      expect(rule.refund?.deadline.years, 2);
      expect(rule.refund?.claimWindow.months, 6);
    });
  });

  group('LendingRules', () {
    final lending = LendingRules.fromJson(
      jsonDecode(swedenLendingJson) as Map<String, Object?>,
    );

    test('amortization rules become finance tiers', () {
      expect(
        requiredAmortizationRate(
          loan: sek(240000000),
          value: sek(300000000),
          tiers: lending.amortization.map((rule) => rule.tier),
        ),
        const Rate.ppm(20000),
      );
    });

    test('interest deduction brackets apply per year', () {
      final currency = Currency.parse('SEK');

      expect(
        marginalCharge(
          base: sek(15000000),
          brackets: [
            for (final bracket
                in lending.interestDeduction.single.yearlyBrackets)
              bracket.toBracket(currency),
          ],
          rounding: Rounding.halfUp,
        ),
        sek(4050000),
      );
    });

    test('left to live on and income multiples read as published', () {
      final kalp = lending.leftToLiveOn.single;

      expect(kalp.stressRate, const Rate.ppm(70000));
      expect(kalp.typicalRange?.min, const Rate.ppm(60000));
      expect(
        kalp.runningCostsMonthly.toMoney(Currency.parse('SEK')),
        sek(100000),
      );
      expect(lending.maxLti.single.multiple.scaledBy(2), 550);
      expect(lending.repaymentStyle, RepaymentStyle.straight);
    });
  });

  group('strict parsing', () {
    Map<String, Object?> edited(void Function(Map<String, Object?> json) edit) {
      final json = portugal();
      edit(json);
      return json;
    }

    List<Map<String, Object?>> costs(Map<String, Object?> json) =>
        (json['purchaseCosts'] as List<Object?>).cast<Map<String, Object?>>();

    final invalid = <String, Map<String, Object?> Function()>{
      'an unknown top-level key': () => edited((json) => json['notes'] = 'x'),
      'an unknown key in a cost rule': () =>
          edited((json) => costs(json).first['comment'] = 'x'),
      'an unknown calculation type': () => edited(
        (json) =>
            costs(json).last['calculation'] = {'type': 'guess', 'rate': '1%'},
      ),
      'a rate without a percent sign': () => edited(
        (json) => costs(json).last['calculation'] = {
          'type': 'flatRate',
          'rate': '7.5',
        },
      ),
      'a rate finer than a part per million': () => edited(
        (json) => costs(json).last['calculation'] = {
          'type': 'flatRate',
          'rate': '7.55555%',
        },
      ),
      'an impossible date': () =>
          edited((json) => json['reviewedAt'] = '2026-02-30'),
      'a malformed market id': () => edited((json) => json['id'] = 'Madeira'),
      'a wrong value type': () => edited((json) => json['version'] = '1'),
    };

    for (final MapEntry(key: name, value: json) in invalid.entries) {
      test('rejects $name', () {
        expect(
          () => MarketRulePack.fromJson(json()),
          throwsA(isA<CheckedFromJsonException>()),
        );
      });
    }

    test('rejects amounts finer than the currency when resolved', () {
      final bracket = BracketRule.fromJson({'upTo': '10.001', 'rate': '1%'});

      expect(
        () => bracket.toBracket(Currency.parse('EUR')),
        throwsFormatException,
      );
    });
  });
}
