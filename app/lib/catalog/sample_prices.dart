import 'package:common/common.dart';

import '../ui/core/formats.dart';

LocaleTag localeForCurrency(Currency currency) =>
    LocaleTag.parse(currency.code == 'SEK' ? 'sv-SE' : 'pt-PT');

String formatSampleMoney(Money money) =>
    formatMoney(money, localeForCurrency(money.currency));

String perSquareMetre(Money money) => '${formatSampleMoney(money)}/m²';

String homeLine(HomeType type, int rooms, int sizeM2) =>
    '${rooms == 1 ? 'One room' : '$rooms rooms'} · $sizeM2 m² · '
    '${type == HomeType.house ? 'house' : 'flat'}';

String againstArea(Listing listing) {
  final percent = listing.percentFromAreaMedian;
  final area = "${listing.areaName}'s price per m²";
  return percent.abs() < 2
      ? 'In line with $area'
      : '${percent.abs()} % ${percent < 0 ? 'under' : 'over'} $area';
}
