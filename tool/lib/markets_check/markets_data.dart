import 'package:common/common.dart';

import 'finding.dart';

typedef MarketsData = ({
  Map<String, MarketRulePack> packsByFile,
  Map<String, ReferenceRate> rates,
  Map<CountryCode, LivingCosts> livingCosts,
  List<Finding> loadFindings,
});
