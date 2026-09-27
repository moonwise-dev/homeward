import '../profile/buyer_profile.dart';
import '../profile/region.dart';
import '../profile/country_code.dart';
import '../profile/residency.dart';
import 'buyer_predicate.dart';
import 'european_economic_area.dart';
import 'market_id.dart';

BuyerProfile profileMeeting(
  BuyerPredicate predicate, {
  required BuyerProfile profile,
  required MarketId market,
}) => profile.copyWith(
  citizenship: switch (predicate.citizenship) {
    null => profile.citizenship,
    final region => countryIn(market, region),
  },
  taxResidence: switch ((predicate.residency, predicate.residencyRegion)) {
    (null, null) => profile.taxResidence,
    (_, final region?) => countryIn(market, region),
    (Residency.resident, _) => market.countryCode,
    (Residency.nonResident, _) => abroadFrom(market),
  },
  formerResident: predicate.formerResident ?? profile.formerResident,
  residencyIntent: predicate.residencyIntent ?? profile.residencyIntent,
  use: predicate.use ?? profile.use,
  firstTime: predicate.firstTime ?? profile.firstTime,
  employment: predicate.employment ?? profile.employment,
  age: predicate.age?.min ?? predicate.age?.max ?? profile.age,
);

CountryCode abroadFrom(MarketId market) =>
    CountryCode.parse(market.countryCode.code == 'US' ? 'JP' : 'US');

CountryCode countryIn(MarketId market, Region region) => switch (region) {
  Region.domestic => market.countryCode,
  Region.regional => CountryCode.parse(
    europeanEconomicAreaCountryCodes.firstWhere(
      (code) => code != market.countryCode.code,
    ),
  ),
  Region.foreign => abroadFrom(market),
};
