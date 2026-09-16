extension type const Period._(String iso) {
  factory Period.parse(String text) {
    if (!_pattern.hasMatch(text)) {
      throw FormatException(
        'Expected an ISO 8601 period such as P2Y, P6M, or P3W',
        text,
      );
    }
    return Period._(text);
  }

  static final _pattern = RegExp(
    r'^P(?=\d)(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)W)?(?:(\d+)D)?$',
  );

  int get years => _part(1);

  int get months => _part(2);

  int get weeks => _part(3);

  int get days => _part(4);

  int _part(int group) =>
      int.tryParse(_pattern.firstMatch(iso)?.group(group) ?? '') ?? 0;
}
