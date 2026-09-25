import 'package:common/common.dart';

import '../samples/sample_data.dart';
import 'finding.dart';

typedef MarketsData = ({
  Map<String, MarketRulePack> packsByFile,
  Map<String, ReferenceRate> rates,
  List<ExchangeRateTable> exchangeRates,
  Map<CountryCode, LivingCosts> livingCosts,
  PlaceDirectory? places,
  SampleData samples,
  List<Finding> loadFindings,
});
