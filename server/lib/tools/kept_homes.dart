Set<String> keptHomesIn(Object? homes) => {
  if (homes is Map<String, Object?>)
    for (final MapEntry(:key, :value) in homes.entries)
      if (value case {'kept': true}) key,
};
