import 'dart:convert';

String actionInput(Map<String, Object?> summary) => [
  'The buyer used a control on a surface instead of typing. What the server '
      'did with it:',
  jsonEncode(summary),
].join('\n');
