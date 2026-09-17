import 'package:common/common.dart';

import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'slice_parameters.dart';

final class ProposeScenarioTool extends ModelTool {
  const ProposeScenarioTool();

  static const defaultTermYears = 30;

  @override
  String get name => 'propose_scenario';

  @override
  String get description =>
      'Propose the home price and any down payment, term, loan type, or '
      'association fee the buyer stated. Anything not stated is filled from '
      'the market: the smallest down payment the loan-to-value limit allows, '
      'the default loan type and spread, and the longest allowed term.';

  @override
  Map<String, Object?> get parameters => sliceParameters(
    scenarioSlice,
    only: const {
      'price',
      'downPayment',
      'termYears',
      'loanTypeId',
      'associationFee',
    },
    required: const ['price'],
  );

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final plan = context.plan;
    final market = switch (plan.marketId) {
      final id? => context.markets.resolveFor(id, plan.profile),
      null => null,
    };
    if (market == null) {
      return const ToolResult(
        modelResult: {'error': 'Select a covered market first'},
      );
    }
    final Money price;
    try {
      price = moneyFromArgument(arguments['price'], market.currency);
    } on FormatException catch (error) {
      return ToolResult(
        modelResult: {
          'rejected': [
            {'field': 'price', 'reason': error.message},
          ],
        },
      );
    }
    if (price.currency != market.currency || price.isZero) {
      return ToolResult(
        modelResult: {
          'rejected': [
            {
              'field': 'price',
              'reason': 'Enter a price in ${market.currency.code}',
            },
          ],
        },
      );
    }
    final defaulted = <String>[];
    final rejected = <Map<String, Object?>>[];

    T valueOr<T>(String field, T Function() parse, T Function() fallback) {
      if (!arguments.containsKey(field)) {
        defaulted.add(field);
        return fallback();
      }
      try {
        return parse();
      } on FormatException catch (error) {
        rejected.add({'field': field, 'reason': error.message});
        defaulted.add(field);
        return fallback();
      }
    }

    final loanType = valueOr(
      'loanTypeId',
      () => market.loanTypes.firstWhere(
        (type) => type.id == arguments['loanTypeId'],
        orElse: () => throw FormatException(
          'Loan types here: ${market.loanTypes.map((type) => type.id).join(', ')}',
        ),
      ),
      () => market.loanTypes.first,
    );
    final minimumDownPayment =
        price - loanToValueLimit(price: price, lending: market.lending);
    final downPayment = valueOr(
      'downPayment',
      () {
        final amount = moneyFromArgument(
          arguments['downPayment'],
          market.currency,
        );
        if (amount.currency != price.currency || amount > price) {
          throw const FormatException(
            'The down payment cannot exceed the price',
          );
        }
        return amount;
      },
      () => minimumDownPayment,
    );
    final termYears = valueOr(
      'termYears',
      () => switch (arguments['termYears']) {
        final int years when years > 0 => years,
        _ => throw const FormatException('Term is a positive number of years'),
      },
      () => market.lending.maxTermYears
          .map((limit) => limit.years)
          .fold(
            defaultTermYears,
            (shortest, years) => years < shortest ? years : shortest,
          ),
    );
    final associationFee = arguments.containsKey('associationFee')
        ? valueOr(
            'associationFee',
            () =>
                moneyFromArgument(arguments['associationFee'], market.currency),
            () => null,
          )
        : null;
    final scenario = Scenario(
      price: price,
      downPayment: downPayment,
      termYears: termYears,
      loanTypeId: loanType.id,
      rateSpread: loanType.defaultSpread,
      associationFee: associationFee,
    );
    return ToolResult(
      modelResult: {
        'accepted': [
          for (final field in arguments.keys)
            if (!rejected.any((entry) => entry['field'] == field)) field,
        ],
        'defaulted': defaulted,
        'rejected': rejected,
      },
      seeds: {'scenario': scenario.toJson()},
      plan: plan.copyWith(scenarioDraft: scenario),
    );
  }
}
