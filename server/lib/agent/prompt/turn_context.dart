Map<String, Object?> turnContext({
  required int turn,
  required List<Map<String, Object?>> screen,
  required List<Map<String, Object?>> ready,
  required Map<String, Object?> brief,
}) => {'turn': turn, 'screen': screen, 'ready': ready, 'brief': brief};
