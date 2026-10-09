import 'package:common/common.dart';

import 'money_text.dart';

String homeFacts(Listing listing) => [
  '${listing.rooms} rooms, ${listing.bedrooms} '
      'bedroom${listing.bedrooms == 1 ? '' : 's'}',
  '${listing.sizeM2} m² ${listing.homeType.noun}',
  if (listing.floor case final floor?) 'floor $floor',
  if (listing.outdoor != OutdoorSpace.none) listing.outdoor.phrase,
  if (listing.yearBuilt case final year?) 'built $year',
].join(' · ');

String homeFigureText(PricedHome home) => switch (home.rent) {
  final rent? => '${moneyText(rent.monthly)} a month, estimated',
  null => moneyText(home.listing.price),
};

String againstArea(Listing listing) {
  final percent = listing.percentFromAreaMedian;
  final median = "${listing.areaName}'s median";
  return percent.abs() < 2
      ? 'in line with $median'
      : '${percent.abs()}% ${percent < 0 ? 'below' : 'above'} $median';
}

String reachText(HomeCost cost) => cost.withinReach
    ? 'Within the rules and your savings'
    : 'Out of reach as it stands';
