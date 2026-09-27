import 'package:common/common.dart';

import 'money_text.dart';

String rentBasisText(RentFigure rent) => switch (rent) {
  RentFigure(stated: true) => 'The rent you gave.',
  RentFigure(:final perM2?, :final sizeM2?, :final source) =>
    'An estimate: $sizeM2 m² at ${moneyText(perM2, exact: true)} a m² a '
        'month, the median for the area${source == null ? '' : '. $source'}.',
  RentFigure() => 'An estimate from the area.',
};

String splitRuleLabel(SplitRule rule) => switch (rule) {
  SplitRule.equal => 'Equally',
  SplitRule.income => 'By income',
  SplitRule.room => 'By room size',
};
