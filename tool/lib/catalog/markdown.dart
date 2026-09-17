String markdownTable(List<String> headers, List<List<String>> rows) => [
  _row(headers),
  _row([for (final _ in headers) '---']),
  for (final row in rows) _row(row),
].join('\n');

String code(String text) => '`$text`';

String codeList(Iterable<String> items) => items.map(code).join(', ');

String fenced(String language, String content) => '```$language\n$content\n```';

String _row(List<String> cells) =>
    '| ${cells.map((cell) => cell.replaceAll('|', r'\|')).join(' | ')} |';
