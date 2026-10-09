import '../research/research_steps.dart';
import '../research/researcher.dart';

final class ToolContext {
  const ToolContext({
    this.steps = const SilentSteps(),
    this.slices = const {},
    this.buyerWords = const [],
    this.cards = const {},
    this.onPlan = const [],
    this.cardNotes = const {},
    this.researcher,
  });

  final ResearchSteps steps;
  final Map<String, Object?> slices;
  final List<String> buyerWords;
  final Set<String> cards;
  final List<String> onPlan;
  final Map<String, String> cardNotes;
  final Researcher? researcher;
}
