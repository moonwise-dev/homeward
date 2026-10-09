import 'package:common/common.dart';

import 'finding.dart';

typedef MarketsData = ({
  Map<String, MarketRulePack> packsByFile,
  Map<String, ReferenceRate> rates,
  List<ExchangeRateTable> exchangeRates,
  Map<CountryCode, LivingCosts> livingCosts,
  Map<CountryCode, IncomeTaxTable> incomeTax,
  Map<String, ListingInventory> cities,
  List<Finding> loadFindings,
});
