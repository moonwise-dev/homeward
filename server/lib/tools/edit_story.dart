import 'package:common/common.dart';

import 'agent_tool.dart';
import 'compute_affordability.dart';
import 'household_in.dart';
import 'map_homes.dart';
import 'tool_context.dart';

final class EditStory extends AgentTool {
  const EditStory(this.affordability, this.mapHomes);

  final ComputeAffordability affordability;
  final MapHomes mapHomes;

  static const action = 'edit_story';

  @override
  String get name => action;

  @override
  String get description =>
      'Applies a fact the buyer changed on a chip, such as what they have '
      'saved or how often they go to a place, and maps the homes again. '
      'Only a tap runs it.';

  @override
  Map<String, Object?> get parameters => {'type': 'object', 'properties': {}};

  @override
  bool get tapsNeedNoReply => true;

  @override
  Map<String, Object?>? argumentsForTap(
    String action,
    Map<String, Object?> context,
  ) => action == EditStory.action
      ? {
          for (final MapEntry(:key, :value) in context.entries)
            if (key != 'label') key: value,
        }
      : null;

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final mapped = switch (context.slices[mapSlice.name]) {
      final Map<String, Object?> json => CityHomes.fromJson(json),
      _ => null,
    };
    if (mapped == null) {
      return const ToolResult(
        modelResult: {'error': 'There is no map to change yet.'},
      );
    }
    var slices = context.slices;
    var seeds = <String, Object?>{};
    final household = householdIn(slices);
    final money = _householdArguments(arguments, household);
    if (money != null && !mapped.renting) {
      final answer = affordability.run(
        money.arguments,
        _withWords(context, slices, money.words),
      );
      if (answer.modelResult['error'] != null ||
          answer.modelResult['doubts'] != null ||
          answer.seeds[affordabilityDataSlice.name] == null) {
        return ToolResult(
          modelResult: {
            'error': 'That figure could not be used.',
            'answer': answer.modelResult,
          },
        );
      }
      seeds = {...seeds, ...answer.seeds};
      slices = {...slices, ...answer.seeds};
    }
    final removed = {...?arguments['removePlace'] as List<Object?>?};
    final changed = switch (arguments['trip']) {
      final Map<String, Object?> trip => trip,
      _ => null,
    };
    final trips = [
      for (final place in mapped.places)
        if (!removed.contains(place.id))
          if (changed != null && changed['place'] == place.id)
            {
              'place': place.id,
              'perWeek': _days(changed['perWeek'] ?? place.perWeek),
              'mode': changed['mode'] ?? place.mode.name,
            }
          else
            {
              'place': place.id,
              'perWeek': _days(place.perWeek),
              'mode': place.mode.name,
              'assumed': place.assumed,
            },
    ];
    final rent = switch (arguments['maxRent']) {
      final num amount => amount,
      _ => switch (mapped.household?.maxRent) {
        final Money rent => rent.minorUnits / rent.currency.majorUnit,
        null => null,
      },
    };
    final remapped = await mapHomes.run(
      {
        'city': mapped.cityId,
        'renting': mapped.renting,
        'maxRent': ?rent == null ? null : {'amount': rent},
        'trips': trips,
      },
      _withWords(context, slices, const []),
    );
    if (remapped.modelResult['error'] != null) {
      return ToolResult(modelResult: remapped.modelResult);
    }
    return ToolResult(
      modelResult: {
        'edited': [for (final key in arguments.keys) key],
        'inBudget': remapped.modelResult['inBudget'],
      },
      seeds: {...seeds, ...remapped.seeds},
      logFields: {
        'edited': [for (final key in arguments.keys) key],
        ...remapped.logFields,
      },
    );
  }

  ({Map<String, Object?> arguments, List<String> words})? _householdArguments(
    Map<String, Object?> arguments,
    AffordabilitySlice? household,
  ) {
    final adults = arguments['adults'];
    final gross = arguments['grossMonthlyIncome'];
    final savings = arguments['savings'];
    if (adults == null && gross == null && savings == null) {
      return null;
    }
    final earners = (household?.profile?.borrowers ?? 1).clamp(1, 2);
    final incomes = gross is num
        ? [for (var index = 0; index < earners; index++) gross / earners]
        : const <num>[];
    return (
      arguments: {
        'market': ?household?.marketId,
        'adults': ?adults,
        if (incomes.isNotEmpty)
          'grossIncomes': [
            for (final income in incomes) {'amount': income.round()},
          ],
        if (savings is num)
          'savings': [
            {'amount': savings},
          ],
      },
      words: [
        for (final income in incomes) '${income.round()}',
        if (savings is num) '$savings',
      ],
    );
  }

  static int _days(Object? perWeek) => switch (perWeek) {
    final num days => days.toInt().clamp(1, MapHomes.maxPerWeek),
    _ => 1,
  };

  ToolContext _withWords(
    ToolContext context,
    Map<String, Object?> slices,
    List<String> words,
  ) => ToolContext(
    steps: context.steps,
    slices: slices,
    buyerWords: [...context.buyerWords, ...words],
    cards: context.cards,
    onPlan: context.onPlan,
    cardNotes: context.cardNotes,
    researcher: context.researcher,
  );
}
