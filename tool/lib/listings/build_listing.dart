import 'package:common/common.dart';

import 'listing_spec.dart';

Listing buildListing({
  required ListingSpec spec,
  required SampleCity city,
  required GeoPoint point,
  required PhotoManifest manifest,
}) {
  final area = city.areaWith(spec.areaId);
  final perM2 = area?.pricePerM2(spec.homeType);
  if (area == null || perM2 == null) {
    throw FormatException(
      '${spec.id}: ${spec.areaId} has no ${spec.homeType.noun} price',
    );
  }
  final photos = [
    for (final id in spec.photos)
      manifest.photoWith(id) ??
          (throw FormatException(
            '${spec.id}: photo $id is not in the manifest',
          )),
  ];
  if (photos.length < 3) {
    throw FormatException('${spec.id} needs at least three photos');
  }
  final currency = city.currency;
  final sek = currency.code == 'SEK';
  final step = sek ? 10000 : 5000;
  final price = (spec.sizeM2 * perM2 * spec.factor / step).round() * step;
  Money money(int amount) =>
      Money(minorUnits: amount * 100, currency: currency);
  return Listing(
    id: spec.id,
    areaId: area.id,
    areaName: area.name,
    name: spec.name,
    title: spec.title,
    blurb: spec.blurb,
    description: spec.description,
    address: spec.address,
    point: point,
    homeType: spec.homeType,
    rooms: spec.rooms,
    bedrooms: spec.bedrooms,
    sizeM2: spec.sizeM2,
    floor: spec.floor,
    yearBuilt: spec.yearBuilt,
    outdoor: spec.outdoor,
    style: spec.style,
    price: money(price),
    monthlyFee: spec.homeType == HomeType.flat
        ? money(sek ? _rounded(spec.sizeM2 * 60, 10) : _rounded(spec.sizeM2, 5))
        : null,
    pricePerM2: money((price / spec.sizeM2).round()),
    areaPricePerM2: money(perM2),
    priceSource: city.priceSourceOf(area),
    photos: spec.photos,
    photoCredit:
        'Photos: ${{for (final photo in photos) photo.credit.name}.join(', ')} '
        '/ Unsplash',
  );
}

int _rounded(num value, int step) => (value / step).round() * step;
