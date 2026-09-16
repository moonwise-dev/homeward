import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_code.dart';
import 'country_code_json_converter.dart';
import 'employment.dart';
import 'property_use.dart';
import 'residency_intent.dart';

part 'buyer_profile.freezed.dart';
part 'buyer_profile.g.dart';

@freezed
abstract class BuyerProfile with _$BuyerProfile {
  const factory BuyerProfile({
    @CountryCodeJsonConverter() CountryCode? citizenship,
    @CountryCodeJsonConverter() CountryCode? taxResidence,
    bool? formerResident,
    ResidencyIntent? residencyIntent,
    PropertyUse? use,
    bool? firstTime,
    Employment? employment,
    int? age,
  }) = _BuyerProfile;

  factory BuyerProfile.fromJson(Map<String, Object?> json) =>
      _$BuyerProfileFromJson(json);
}
