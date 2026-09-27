import '../profile/country_code.dart';

extension type const MarketId._(String code) {
  factory MarketId.parse(String code) {
    if (!RegExp(r'^[A-Z]{2}(-[A-Z0-9]{1,3})?$').hasMatch(code)) {
      throw FormatException(
        'Expected an ISO 3166-1 or ISO 3166-2 code such as PT or PT-30',
        code,
      );
    }
    return MarketId._(code);
  }

  bool get isRegion => code.contains('-');

  MarketId get country => MarketId._(code.substring(0, 2));

  CountryCode get countryCode => CountryCode.parse(code.substring(0, 2));
}
