import 'package:freezed_annotation/freezed_annotation.dart';

import '../time/period.dart';
import '../time/period_json_converter.dart';
import 'buyer_predicate.dart';
import 'identified.dart';
import 'obstacle_severity.dart';

part 'obstacle.freezed.dart';
part 'obstacle.g.dart';

@freezed
abstract class Obstacle with _$Obstacle implements ConditionalRule, Sourced {
  const factory Obstacle({
    required String id,
    BuyerPredicate? appliesTo,
    required String title,
    required ObstacleSeverity severity,
    required String mitigation,
    @PeriodJsonConverter() Period? typicalDuration,
    required String sourceId,
  }) = _Obstacle;

  factory Obstacle.fromJson(Map<String, Object?> json) =>
      _$ObstacleFromJson(json);
}
