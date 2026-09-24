final _componentName = RegExp(r'"component"\s*:\s*"(\w+)"');

Set<String> drawnComponents(Iterable<String> sources) => {
  for (final source in sources)
    for (final match in _componentName.allMatches(source)) match.group(1)!,
};
