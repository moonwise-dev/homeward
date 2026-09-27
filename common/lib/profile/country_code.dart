extension type const CountryCode._(String code) {
  factory CountryCode.parse(String code) {
    if (!RegExp(r'^[A-Z]{2}$').hasMatch(code)) {
      throw FormatException(
        'Expected an ISO 3166-1 alpha-2 country code such as SE',
        code,
      );
    }
    return CountryCode._(code);
  }
}
