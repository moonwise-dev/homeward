import 'package:common/common.dart';
import 'package:json_schema_builder/json_schema_builder.dart';
import 'package:test/test.dart';

void main() {
  const cashNeeded = CashNeededFunction();
  const monthlyPayment = MonthlyPaymentFunction();
  const withinMaxLtv = WithinMaxLtvFunction();

  Map<String, Object?> args({Map<String, Object?>? scenario}) => {
    'scenario': scenario ?? stockholmDataModel['scenario'],
    'market': stockholmDataModel['market'],
  };

  Map<String, Object?> scenarioWithDownPayment(int kronor) => {
    ...stockholmDataModel['scenario']! as Map<String, Object?>,
    'downPayment': {'minorUnits': kronor * 100, 'currency': 'SEK'},
  };

  test('functions are declared with their argument schemas', () {
    expect(homewardFunctions.map((function) => function.name), [
      'cashNeeded',
      'monthlyPayment',
      'withinMaxLtv',
    ]);
    for (final function in homewardFunctions) {
      expect(
        function.argumentSchema.validateSync({
          'scenario': {'path': '/scenario'},
          'market': {'path': '/market'},
        }),
        isEmpty,
      );
    }
  });

  group('monthlyPayment', () {
    test('matches the Stockholm worked example', () {
      expect(monthlyPayment.evaluate(args()), {
        'minorUnits': 1738125,
        'currency': 'SEK',
      });
    });

    test('is null until the scenario is complete', () {
      expect(
        monthlyPayment.evaluate(args(scenario: {'termYears': 50})),
        isNull,
      );
      expect(monthlyPayment.evaluate(const {}), isNull);
      expect(
        monthlyPayment.evaluate(
          args(
            scenario: {
              ...stockholmDataModel['scenario']! as Map<String, Object?>,
              'loanTypeId': 'fixed-5y',
            },
          ),
        ),
        isNull,
      );
    });
  });

  group('cashNeeded', () {
    test('adds every Funchal charge to the down payment', () {
      expect(
        cashNeeded.evaluate({
          'scenario': funchalDataModel['scenario'],
          'market': funchalDataModel['market'],
        }),
        {'minorUnits': 13552000, 'currency': 'EUR'},
      );
    });

    test('is null until the facts that pick the charges are answered', () {
      expect(cashNeeded.evaluate(const {}), isNull);
      expect(
        cashNeeded.evaluate({
          'scenario': funchalDataModel['scenario'],
          'market': funchalMarket
              .copyWith(
                pendingRules: const {
                  'imt-nonresident': PendingRule(
                    section: RuleSection.purchaseCosts,
                    missing: {ProfileField.formerResident},
                  ),
                },
              )
              .toJson(),
        }),
        isNull,
      );
    });
  });

  group('withinMaxLtv', () {
    test('allows exactly the 90% cap and nothing above it', () {
      expect(withinMaxLtv.evaluate(args()), isTrue);
      expect(
        withinMaxLtv.evaluate(args(scenario: scenarioWithDownPayment(449999))),
        isFalse,
      );
    });

    test('is false while the scenario is incomplete or a rule is pending', () {
      expect(withinMaxLtv.evaluate(const {}), isFalse);
      final pending = stockholmMarket.copyWith(
        pendingRules: const {
          'ltv-primary-residence': PendingRule(
            section: RuleSection.lending,
            missing: {ProfileField.use},
          ),
        },
      );
      expect(
        withinMaxLtv.evaluate({
          'scenario': stockholmDataModel['scenario'],
          'market': pending.toJson(),
        }),
        isFalse,
      );
    });
  });
}
