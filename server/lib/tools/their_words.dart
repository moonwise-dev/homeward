bool inTheirWords(String words, List<String> buyerWords) {
  final quote = _normalized(words).replaceAll(quoteEdges, '');
  return quote.isNotEmpty &&
      buyerWords.any((said) => _normalized(said).contains(quote));
}

final quoteEdges = RegExp(r'''^[\s"'“”‘’.,;:!?]+|[\s"'“”‘’.,;:!?]+$''');

String _normalized(String text) => text
    .toLowerCase()
    .replaceAll(RegExp('[‘’]'), "'")
    .replaceAll(RegExp('[“”]'), '"')
    .replaceAll(RegExp(r'\s+'), ' ');
