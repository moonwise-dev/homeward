import 'package:common/common.dart';

const _drawing = {
  OpenDecision.targetMarket,
  OpenDecision.marketCoverage,
  OpenDecision.profileFields,
  OpenDecision.scenario,
};

String? surfaceDueNote(Plan plan, ResolvedMarket? market) {
  final decision = openDecisions(plan, market).firstOrNull;
  return decision == null || !_drawing.contains(decision)
      ? null
      : 'The buyer used a control and you drew no surface, with '
            '${decision.name} still open. Draw the surface that decision '
            'calls for now, in an a2ui block, without repeating your text.';
}
