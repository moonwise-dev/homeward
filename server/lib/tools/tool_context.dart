import '../research/research_steps.dart';
import '../research/researcher.dart';

final class ToolContext {
  const ToolContext({
    this.steps = const SilentSteps(),
    this.slices = const {},
    this.buyerWords = const [],
    this.researcher,
  });

  final ResearchSteps steps;
  final Map<String, Object?> slices;
  final List<String> buyerWords;
  final Researcher? researcher;
}
