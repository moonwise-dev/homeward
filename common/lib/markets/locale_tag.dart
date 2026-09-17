import '../geo/generated/country_names.dart';

extension type const LocaleTag._(String tag) {
  factory LocaleTag.parse(String tag) {
    final match = RegExp(r'^[a-z]{2,3}-([A-Z]{2})$').firstMatch(tag);
    if (match == null || !countryNames.containsKey(match.group(1))) {
      throw FormatException(
        'Expected a BCP 47 language and region tag such as sv-SE',
        tag,
      );
    }
    return LocaleTag._(tag);
  }
}
