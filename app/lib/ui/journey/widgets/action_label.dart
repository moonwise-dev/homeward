import '../../../domain/models/plan_conversation.dart';

String? promptText(TranscriptEntry? prompt) => switch (prompt) {
  BuyerEntry(:final text) => text.trim(),
  BuyerActionEntry(:final label?) => label,
  BuyerActionEntry(:final actionName) => actionLabel(actionName),
  _ => null,
};

String actionLabel(String actionName) {
  final words = actionName.split('_').where((word) => word.isNotEmpty);
  final sentence = words.join(' ');
  return sentence.isEmpty
      ? 'Used a control'
      : '${sentence[0].toUpperCase()}${sentence.substring(1)}';
}
