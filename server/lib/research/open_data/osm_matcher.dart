final class OsmMatcher {
  const OsmMatcher(this.key, this.values);

  final String key;
  final List<String> values;

  String get selector => values.length == 1
      ? '["$key"="${values.single}"]'
      : '["$key"~"^(${values.join('|')})\$"]';

  bool matches(Map<String, String> tags) => values.contains(tags[key]);
}
