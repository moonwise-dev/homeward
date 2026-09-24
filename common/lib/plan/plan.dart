import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/market_id.dart';
import '../markets/market_id_json_converter.dart';
import '../profile/buyer_profile.dart';
import '../story/story.dart';
import 'scenario.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    @MarketIdJsonConverter() MarketId? marketId,
    @Default(BuyerProfile()) BuyerProfile profile,
    BuyerProfile? profileDraft,
    Scenario? scenario,
    Scenario? scenarioDraft,
    @Default(Story()) Story story,
  }) = _Plan;

  factory Plan.fromJson(Map<String, Object?> json) => _$PlanFromJson(json);
}
