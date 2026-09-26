import '../research/research_steps.dart';

final class ToolContext {
  const ToolContext({
    this.steps = const SilentSteps(),
    this.slices = const {},
    this.buyerWords = const [],
  });

  final ResearchSteps steps;
  final Map<String, Object?> slices;
  final List<String> buyerWords;
}
