import 'package:common/common.dart';

String profileFieldText(ProfileField field) => switch (field) {
  ProfileField.citizenship => 'your citizenship',
  ProfileField.residency => 'where you pay tax',
  ProfileField.formerResident => 'whether you lived there before',
  ProfileField.residencyIntent => 'whether you will move there',
  ProfileField.use => 'how you will use the home',
  ProfileField.firstTime => 'whether it is your first home',
  ProfileField.employment => 'your work',
  ProfileField.netMonthlyIncome => 'your income after tax',
  ProfileField.grossMonthlyIncome => 'your income before tax',
  ProfileField.incomeCurrency => 'the currency you earn in',
  ProfileField.savings => 'your savings',
  ProfileField.monthlyDebtPayments => 'your debts',
  ProfileField.age => 'your age',
  ProfileField.household => 'who lives with you',
  ProfileField.borrowers => 'who borrows',
};
