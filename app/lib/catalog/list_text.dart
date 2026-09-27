String listText(List<String> items) => switch (items) {
  [] => '',
  [final only] => only,
  [...final rest, final last] => '${rest.join(', ')} and $last',
};
