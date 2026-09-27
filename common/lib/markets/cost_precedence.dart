import 'cost_rule.dart';

List<CostRule> costsByPrecedence(List<CostRule> rules) {
  final winners = <String, CostRule>{};
  for (final rule in rules) {
    if (rule.group case final group?) {
      final winner = winners[group];
      if (winner == null || rule.precedence > winner.precedence) {
        winners[group] = rule;
      }
    }
  }
  return [
    for (final rule in rules)
      if (rule.group == null || winners[rule.group]!.id == rule.id) rule,
  ];
}
