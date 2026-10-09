bool rentingIn(Object? homes) => switch (homes) {
  final Map<String, Object?> homes => homes.values.any(
    (home) => home is Map<String, Object?> && home['rent'] != null,
  ),
  _ => false,
};

Set<String> keptHomesIn(Object? homes) => {
  if (homes is Map<String, Object?>)
    for (final MapEntry(:key, :value) in homes.entries)
      if (value case {'kept': true}) key,
};
