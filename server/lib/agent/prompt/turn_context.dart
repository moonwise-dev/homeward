Map<String, Object?> turnContext({
  required int turn,
  Set<String> surfacesUsed = const {},
}) => {'turn': turn, 'surfacesUsed': surfacesUsed.toList()};
