import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';
import 'pack_fixtures.dart';

void main() {
  final portugal = MarketRulePack.fromJson(
    jsonDecode(portugalPackJson) as Map<String, Object?>,
  );
  final madeira = MarketRulePack.fromJson(
    jsonDecode(madeiraPackJson) as Map<String, Object?>,
  );
  final packs = {portugal.id: portugal, madeira.id: madeira};

  group('overlayPack', () {
    final merged = overlayPack(portugal, madeira);

    test('keeps the region identity and inherits the currency', () {
      expect(merged.id, madeira.id);
      expect(merged.name, 'Madeira');
      expect(merged.parent, isNull);
      expect(merged.currency, Currency.parse('EUR'));
    });

    test('replaces parent rules by id in place and inherits the rest', () {
      expect(merged.purchaseCosts.map((rule) => rule.id), [
        'imt-primary-residence',
        'imt-nonresident',
      ]);
      final calculation =
          merged.purchaseCosts.first.calculation as BracketsCalculation;
      expect(
        deductionCharge(
          base: eur(35000000),
          brackets: [
            for (final bracket in calculation.brackets)
              bracket.toBracket(merged.currency!),
          ],
          rounding: Rounding.halfUp,
        ),
        eur(1142752),
      );
      expect(merged.lending, portugal.lending);
      expect(merged.sources, portugal.sources);
    });

    test('takes the newest effective date and the oldest review', () {
      expect(merged.effectiveFrom, CalendarDate.parse('2026-08-01'));
      expect(merged.reviewedAt, CalendarDate.parse('2026-09-10'));
    });

    test('removes parent rules the region lists', () {
      final withoutSecondary = overlayPack(
        portugal,
        madeira.copyWith(removedRuleIds: ['ltv-secondary']),
      );

      expect(withoutSecondary.lending.maxLtv.map((limit) => limit.id), [
        'ltv-primary-residence',
      ]);
    });

    test('rejects removing a rule the parent does not have', () {
      expect(
        () => overlayPack(
          portugal,
          madeira.copyWith(removedRuleIds: ['no-such-rule']),
        ),
        throwsArgumentError,
      );
    });
  });

  group('resolvePackChain', () {
    test('overlays a region on its country', () {
      expect(
        resolvePackChain(madeira.id, packs),
        overlayPack(portugal, madeira),
      );
      expect(resolvePackChain(portugal.id, packs), portugal);
    });

    test('rejects a missing parent, a cycle, and a root without currency', () {
      expect(
        () => resolvePackChain(madeira.id, {madeira.id: madeira}),
        throwsArgumentError,
      );
      expect(
        () => resolvePackChain(portugal.id, {
          portugal.id: portugal.copyWith(parent: madeira.id),
          madeira.id: madeira,
        }),
        throwsArgumentError,
      );
      expect(
        () => resolvePackChain(portugal.id, {
          portugal.id: portugal.copyWith(currency: null),
        }),
        throwsArgumentError,
      );
    });
  });
}
