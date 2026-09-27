import 'package:common/common.dart';

String homeFacts(Listing listing) => [
  '${listing.rooms} rooms, ${listing.bedrooms} '
      'bedroom${listing.bedrooms == 1 ? '' : 's'}',
  '${listing.sizeM2} m² ${listing.homeType.noun}',
  if (listing.floor case final floor?) 'floor $floor',
  if (listing.outdoor != OutdoorSpace.none) listing.outdoor.phrase,
  if (listing.yearBuilt case final year?) 'built $year',
].join(' · ');

String againstArea(Listing listing) {
  final percent = listing.percentFromAreaMedian;
  final median = "${listing.areaName}'s median";
  return percent.abs() < 2
      ? 'in line with $median'
      : '${percent.abs()}% ${percent < 0 ? 'below' : 'above'} $median';
}
