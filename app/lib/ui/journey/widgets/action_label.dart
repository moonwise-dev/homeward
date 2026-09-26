String actionLabel(String actionName) {
  final words = actionName.split('_').where((word) => word.isNotEmpty);
  final sentence = words.join(' ');
  return sentence.isEmpty
      ? 'Used a control'
      : '${sentence[0].toUpperCase()}${sentence.substring(1)}';
}
