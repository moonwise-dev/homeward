import '../profile/buyer_profile.dart';
import '../profile/citizenship.dart';
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
    final citizenship => passportIn(market, citizenship),
  },
  taxResidence: switch (predicate.residency) {
    null => profile.taxResidence,
    Residency.resident => market.countryCode,
    Residency.nonResident => abroadFrom(market),
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

CountryCode passportIn(MarketId market, Citizenship citizenship) =>
    switch (citizenship) {
      Citizenship.domestic => market.countryCode,
      Citizenship.regional => CountryCode.parse(
        europeanEconomicAreaCountryCodes.firstWhere(
          (code) => code != market.countryCode.code,
        ),
      ),
      Citizenship.foreign => abroadFrom(market),
    };
