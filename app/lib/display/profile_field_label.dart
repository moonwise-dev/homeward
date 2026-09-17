import 'package:common/common.dart';

String profileFieldLabel(ProfileField field) => switch (field) {
  ProfileField.citizenship => 'citizenship',
  ProfileField.residency => 'tax residence',
  ProfileField.formerResident => 'whether you lived there before',
  ProfileField.residencyIntent => 'whether you will move there',
  ProfileField.use => 'how you will use the home',
  ProfileField.firstTime => 'whether this is your first home',
  ProfileField.employment => 'employment',
  ProfileField.netMonthlyIncome => 'net monthly income',
  ProfileField.grossMonthlyIncome => 'gross monthly income',
  ProfileField.incomeCurrency => 'income currency',
  ProfileField.savings => 'savings',
  ProfileField.monthlyDebtPayments => 'monthly debt payments',
  ProfileField.age => 'age',
  ProfileField.household => 'household',
  ProfileField.borrowers => 'number of borrowers',
};
