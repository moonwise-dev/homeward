import 'package:freezed_annotation/freezed_annotation.dart';

import '../profile/profile_field.dart';
import 'buyer_predicate.dart';

part 'profile_field_requirement.freezed.dart';
part 'profile_field_requirement.g.dart';

@freezed
abstract class ProfileFieldRequirement with _$ProfileFieldRequirement {
  const factory ProfileFieldRequirement({
    required String id,
    required ProfileField field,
    BuyerPredicate? appliesTo,
    required String reason,
  }) = _ProfileFieldRequirement;

  factory ProfileFieldRequirement.fromJson(Map<String, Object?> json) =>
      _$ProfileFieldRequirementFromJson(json);
}
