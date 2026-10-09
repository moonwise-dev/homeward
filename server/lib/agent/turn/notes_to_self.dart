bool holdsNotesToSelf(String text) => _marks.hasMatch(text);

final _marks = RegExp(
  r'`|\{\s*"|\b(updateComponents|createSurface|surfaceId|json|schema)\b|'
  'self-correction',
  caseSensitive: false,
);
