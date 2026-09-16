import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

import 'pack_fixtures.dart';

void main() {
  final portugal = MarketRulePack.fromJson(
    jsonDecode(portugalPackJson) as Map<String, Object?>,
  );
  final madeira = MarketRulePack.fromJson(
    jsonDecode(madeiraPackJson) as Map<String, Object?>,
  );
  final merged = resolvePackChain(madeira.id, {
    portugal.id: portugal,
    madeira.id: madeira,
  });

  test('a Stockholm buyer of a holiday flat gets non-resident rules', () {
    final market = resolveForBuyer(
      merged,
      BuyerProfile(
        taxResidence: CountryCode.parse('SE'),
        formerResident: false,
        use: PropertyUse.secondary,
      ),
    );

    expect(market.purchaseCosts.map((rule) => rule.id), ['imt-nonresident']);
    expect(market.lending.maxLtv.map((limit) => limit.id), ['ltv-secondary']);
    expect(market.lending.maxDsti.map((limit) => limit.id), ['dsti']);
    expect(market.pendingRules, isEmpty);
    expect(market.requiredFields, {ProfileField.formerResident});
    expect(market.currency, Currency.parse('EUR'));
  });

  test('a Portuguese resident buying a home gets resident rules', () {
    final market = resolveForBuyer(
      merged,
      BuyerProfile(
        taxResidence: CountryCode.parse('PT'),
        use: PropertyUse.primary,
      ),
    );

    expect(market.purchaseCosts.map((rule) => rule.id), [
      'imt-primary-residence',
    ]);
    expect(market.lending.maxLtv.map((limit) => limit.id), [
      'ltv-primary-residence',
    ]);
    expect(market.requiredFields, isEmpty);
  });

  test('an empty profile leaves rules pending on the facts they need', () {
    final market = resolveForBuyer(merged, const BuyerProfile());

    expect(market.purchaseCosts, isEmpty);
    expect(market.lending.maxLtv, isEmpty);
    expect(market.lending.maxDsti.map((limit) => limit.id), ['dsti']);
    expect(market.pendingRules, {
      'former-resident': {ProfileField.residency},
      'ltv-primary-residence': {ProfileField.use},
      'ltv-secondary': {ProfileField.use},
      'imt-primary-residence': {ProfileField.residency, ProfileField.use},
      'imt-nonresident': {
        ProfileField.residency,
        ProfileField.formerResident,
      },
    });
    expect(market.requiredFields, {
      ProfileField.residency,
      ProfileField.use,
      ProfileField.formerResident,
    });
  });

  test('a known residence narrows what is still pending', () {
    final market = resolveForBuyer(
      merged,
      BuyerProfile(taxResidence: CountryCode.parse('SE')),
    );

    expect(market.pendingRules.keys, [
      'ltv-primary-residence',
      'ltv-secondary',
      'imt-nonresident',
    ]);
    expect(market.pendingRules['imt-nonresident'], {
      ProfileField.formerResident,
    });
    expect(market.requiredFields, {
      ProfileField.formerResident,
      ProfileField.use,
    });
  });

  test('refuses a pack whose chain is not resolved', () {
    expect(
      () => resolveForBuyer(madeira, const BuyerProfile()),
      throwsArgumentError,
    );
  });
}
