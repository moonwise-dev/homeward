import 'package:freezed_annotation/freezed_annotation.dart';

import '../profile/region.dart';
import '../profile/employment.dart';
import '../profile/property_use.dart';
import '../profile/residency.dart';
import '../profile/residency_intent.dart';
import 'year_range.dart';

part 'buyer_predicate.freezed.dart';
part 'buyer_predicate.g.dart';

@freezed
abstract class BuyerPredicate with _$BuyerPredicate {
  const factory BuyerPredicate({
    Residency? residency,
    bool? formerResident,
    ResidencyIntent? residencyIntent,
    Region? citizenship,
    Region? residencyRegion,
    PropertyUse? use,
    bool? firstTime,
    Employment? employment,
    YearRange? age,
  }) = _BuyerPredicate;

  factory BuyerPredicate.fromJson(Map<String, Object?> json) =>
      _$BuyerPredicateFromJson(json);
}
