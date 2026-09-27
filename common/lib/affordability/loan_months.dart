import '../finance/amortization_tier.dart';
import '../finance/monthly_amount.dart';
import '../finance/repayment_style.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import 'affordability_slice.dart';
import 'interest_deduction.dart';
import 'loan_schedule.dart';

typedef LoanMonth = ({
  int month,
  Money interest,
  Money deduction,
  Money balance,
  Rate? amortizationRate,
});

Iterable<LoanMonth> loanMonths({
  required AffordabilitySlice home,
  required ResolvedMarket market,
}) sync* {
  final zero = Money.zero(home.price.currency);
  final deducts = home.monthly.afterDeduction != null;
  final borrowers = home.profile?.borrowers ?? 1;
  final straight = market.lending.repaymentStyle == RepaymentStyle.straight;
  final tiers = [for (final rule in market.lending.amortization) rule.tier];
  var balance = home.loan;
  for (var month = 1; ; month++) {
    final interest = monthlyAmountAtAnnualRate(
      amount: balance,
      annualRate: home.annualRate,
      rounding: Rounding.halfUp,
    );
    final rate = straight
        ? requiredAmortizationRate(
            loan: balance,
            value: home.price,
            tiers: tiers,
          )
        : null;
    final due = switch (rate) {
      final rate? => monthlyAmountAtAnnualRate(
        amount: home.loan,
        annualRate: rate,
        rounding: Rounding.halfUp,
      ),
      null when month == home.termYears * monthsPerYear => balance,
      null => home.monthly.total - interest,
    };
    balance -= due > balance ? balance : due;
    yield (
      month: month,
      interest: interest,
      deduction: deducts
          ? market.lending.interestDeduction.fold(
              zero,
              (total, rule) =>
                  total +
                  monthlyInterestDeduction(
                    monthlyInterest: interest,
                    rule: rule,
                    borrowers: borrowers,
                  ),
            )
          : zero,
      balance: balance,
      amortizationRate: rate,
    );
  }
}

LoanSchedule loanSchedule({
  required AffordabilitySlice home,
  required ResolvedMarket market,
}) {
  final zero = Money.zero(home.price.currency);
  var paid = zero;
  Rate? rate;
  int? paidOffYear;
  final steps = <AmortizationStep>[];
  final years = [
    LoanYear(
      year: 0,
      balance: home.loan,
      equity: home.price - home.loan,
      interestPaid: zero,
    ),
  ];
  for (final month in loanMonths(
    home: home,
    market: market,
  ).take(home.termYears * monthsPerYear)) {
    final year = (month.month - 1) ~/ monthsPerYear + 1;
    paid += month.interest - month.deduction;
    if (month.amortizationRate case final current?
        when rate != null && current != rate) {
      steps.add(
        AmortizationStep(
          year: year,
          annualRate: current,
          belowShare: market.lending.amortization
              .where((rule) => rule.annualRate == rate)
              .map((rule) => rule.whenLtvAbove)
              .fold<Rate?>(
                null,
                (lowest, share) =>
                    lowest == null || share < lowest ? share : lowest,
              ),
        ),
      );
    }
    rate = month.amortizationRate;
    if (paidOffYear == null && month.balance == zero) {
      paidOffYear = year;
    }
    if (month.month % monthsPerYear == 0) {
      years.add(
        LoanYear(
          year: year,
          balance: month.balance,
          equity: home.price - month.balance,
          interestPaid: paid,
        ),
      );
    }
  }
  return LoanSchedule(years: years, steps: steps, paidOffYear: paidOffYear);
}
