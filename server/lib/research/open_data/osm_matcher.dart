final class OsmMatcher {
  const OsmMatcher(
    this.key,
    this.values, {
    this.elements = 'nwr',
    this.lines = false,
  });

  final String key;
  final List<String> values;
  final String elements;
  final bool lines;

  String get selector => values.length == 1
      ? '["$key"="${values.single}"]'
      : '["$key"~"^(${values.join('|')})\$"]';

  bool matches(Map<String, String> tags) => values.contains(tags[key]);
}
