import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  StressCurve curveFor(
    Scenario scenario,
    ResolvedMarket market,
    BuyerProfile profile,
  ) => stressCurveFor(scenario: scenario, market: market, profile: profile);

  group('Stockholm', () {
    final curve = curveFor(
      stockholmScenario,
      stockholmMarket,
      stockholmProfile,
    );

    test('runs from today to two points past the stress rate', () {
      expect(curve.todayRate, const Rate.ppm(31500));
      expect(curve.stressRate, const Rate.ppm(70000));
      expect(curve.points.first.annualRate, curve.todayRate);
      expect(curve.points.last.annualRate, const Rate.ppm(90000));
      expect(
        curve.points.map((point) => point.annualRate),
        contains(curve.stressRate),
      );
      expect(
        curve.points.map((point) => point.annualRate.partsPerMillion),
        [
          31500,
          36500,
          41500,
          46500,
          51500,
          56500,
          61500,
          66500,
          70000,
          71500,
          76500,
          81500,
          86500,
          90000,
        ],
      );
    });

    test('costs what the payment breakdown says, after the deduction', () {
      final payment = scenarioPayment(stockholmScenario, stockholmMarket);
      final assessed = assessAffordability(
        scenario: stockholmScenario,
        market: stockholmMarket,
        profile: stockholmProfile,
      ) as AssessedAffordability;

      expect(curve.afterDeduction, isTrue);
      expect(curve.points.first.cost, assessed.paymentAfterDeduction);
      expect(curve.points.first.cost < payment.total, isTrue);
    });

    test('draws the limit the left-to-live-on rule sets', () {
      expect(curve.limitKind, ConstraintKind.leftToLiveOn);
      expect(curve.limit, isNotNull);
      expect(curve.limit! > Money.zero(Currency.parse('SEK')), isTrue);
    });
  });

  group('Funchal', () {
    final curve = curveFor(funchalScenario, funchalMarket, funchalProfile);

    test('stresses a variable loan over ten years by 1.5 points', () {
      expect(curve.todayRate, const Rate.ppm(43130));
      expect(curve.stressRate, const Rate.ppm(58130));
      expect(curve.afterDeduction, isFalse);
    });

    test('draws the limit the debt-service rule sets', () {
      expect(curve.limitKind, ConstraintKind.debtServiceToIncome);
      expect(
        curve.limit,
        Money(minorUnits: 230880, currency: Currency.parse('EUR')),
      );
    });

    test('costs more at the stress rate than today', () {
      final today = curve.points.first.cost;
      final stressed = curve.points
          .firstWhere((point) => point.annualRate == curve.stressRate)
          .cost;

      expect(stressed > today, isTrue);
    });
  });
}
