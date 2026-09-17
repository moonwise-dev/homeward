import 'package:freezed_annotation/freezed_annotation.dart';

import 'coverage.dart';
import 'market_id.dart';
import 'market_id_json_converter.dart';

part 'market_snapshot.freezed.dart';
part 'market_snapshot.g.dart';

@freezed
abstract class MarketSnapshot with _$MarketSnapshot {
  const factory MarketSnapshot({
    @MarketIdJsonConverter() required MarketId id,
    required String name,
    @Default(Coverage.curated) Coverage coverage,
  }) = _MarketSnapshot;

  const MarketSnapshot._();

  factory MarketSnapshot.fromJson(Map<String, Object?> json) =>
      _$MarketSnapshotFromJson(json);

  static MarketSnapshot? ofMarket(Map<String, Object?> json) => switch (json) {
    {'id': final String id, 'name': final String name} => MarketSnapshot(
      id: MarketId.parse(id),
      name: name,
      coverage: Coverage.values.firstWhere(
        (coverage) => coverage.name == json['coverage'],
        orElse: () => Coverage.curated,
      ),
    ),
    _ => null,
  };
}
