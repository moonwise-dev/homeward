import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../markets/market_directory.dart';
import 'action_outcome.dart';
import 'profile_from_form.dart';

ActionOutcome applyAction({
  required ClientAction action,
  required Map<String, Object?> surfaceData,
  required Plan plan,
  required MarketDirectory markets,
}) {
  final summary = {'action': action.name, 'surfaceId': action.surfaceId};
  ActionOutcome refused(String reason) => ActionOutcome(
    plan: plan,
    summary: {...summary, 'applied': false, 'reason': reason},
  );
  final form = <String, Map<String, Object?>>{
    for (final MapEntry(:key, :value) in surfaceData.entries)
      if (value case final Map<String, Object?> slice) key: slice,
  };

  switch (SurfaceAction.named(action.name)) {
    case SurfaceAction.selectMarket:
      final id = _marketId(
        action.context['marketId'] ?? form[selectionSlice.name]?['marketId'],
      );
      if (id == null || !markets.isKnown(id)) {
        return refused('That is not a market Homeward knows');
      }
      final selected = id == plan.marketId
          ? plan
          : plan.copyWith(marketId: id, scenario: null, scenarioDraft: null);
      final facts = profileFromForm(form[profileSlice.name] ?? const {});
      return ActionOutcome(
        plan: facts.profile == const BuyerProfile()
            ? selected
            : selected.copyWith(
                profileDraft: _merge(
                  selected.profileDraft ?? selected.profile,
                  facts.profile,
                ),
              ),
        summary: {
          ...summary,
          'applied': true,
          'marketId': id.code,
          'coverage': markets.coverageOf(id).name,
        },
      );
    case SurfaceAction.commitProfile:
      final facts = profileFromForm(form[profileSlice.name] ?? const {});
      return ActionOutcome(
        plan: plan.copyWith(
          profile: _merge(plan.profile, facts.profile),
          profileDraft: null,
        ),
        summary: {...summary, 'applied': true, 'rejected': facts.rejected},
      );
    case SurfaceAction.commitScenario:
      final market = switch (plan.marketId) {
        final id? => markets.resolveFor(id, plan.profile),
        null => null,
      };
      if (market == null) {
        return refused('Select a covered market first');
      }
      final Scenario scenario;
      try {
        scenario = Scenario.fromJson(form[scenarioSlice.name] ?? const {});
      } on CheckedFromJsonException {
        return refused('The scenario is incomplete');
      }
      if (scenario.price.currency != market.currency ||
          scenario.downPayment.currency != market.currency) {
        return refused('Amounts must be in ${market.currency.code}');
      }
      final withinLimits = const WithinMaxLtvFunction().evaluate({
        scenarioSlice.name: scenario.toJson(),
        marketSlice.name: market.toJson(),
      });
      if (withinLimits != true) {
        return refused(
          'The down payment is below what the loan-to-value limit allows',
        );
      }
      return ActionOutcome(
        plan: plan.copyWith(scenario: scenario, scenarioDraft: null),
        summary: {...summary, 'applied': true},
      );
    case _:
      return ActionOutcome(
        plan: plan,
        summary: {...summary, 'context': action.context},
      );
  }
}

BuyerProfile _merge(BuyerProfile base, BuyerProfile facts) =>
    BuyerProfile.fromJson({...base.toJson(), ...facts.toJson()});

MarketId? _marketId(Object? code) {
  if (code is! String) {
    return null;
  }
  try {
    return MarketId.parse(code.trim().toUpperCase());
  } on FormatException {
    return null;
  }
}
