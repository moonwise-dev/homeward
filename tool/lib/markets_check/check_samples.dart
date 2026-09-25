import 'package:common/common.dart';
import 'package:homeward_server/markets/finding.dart';
import 'package:homeward_server/samples/sample_data.dart';

const lineupSize = 4;

Iterable<Finding> checkSamples(
  SampleData samples, {
  bool Function(String photoId)? hasPhotoFile,
}) sync* {
  final photos = samples.photos;
  for (final city in samples.cities.values) {
    final subject = 'areas/${city.id}.json';
    for (final area in city.areas) {
      if (city.sourceWith(area.sourceId) == null) {
        yield findingError(subject, '${area.id} cites unknown source');
      }
      if (area.homeTypes.isEmpty) {
        yield findingError(subject, '${area.id} has no price per square metre');
      }
    }
    for (final MapEntry(key: name, value: ids) in city.lineups.entries) {
      if (ids.length != lineupSize) {
        yield findingError(subject, 'Lineup $name needs $lineupSize photos');
      }
      for (final id in ids) {
        final photo = photos.photoWith(id);
        if (photo == null) {
          yield findingError(subject, 'Lineup $name names unknown photo $id');
        } else if (photo.traits == const PhotoTraits()) {
          yield findingError(subject, 'Lineup photo $id has no traits');
        }
      }
    }
  }
  for (final MapEntry(key: cityId, value: listings)
      in samples.listings.entries) {
    final subject = 'listings/$cityId.json';
    final city = samples.cities[cityId];
    if (city == null) {
      yield findingError(subject, 'No areas file for $cityId');
      continue;
    }
    for (final listing in listings) {
      final area = city.areaWith(listing.areaId);
      if (area == null) {
        yield findingError(subject, '${listing.id} is in unknown area');
      } else if (area.pricePerM2(listing.homeType) == null) {
        yield findingError(
          subject,
          '${listing.id} is a ${listing.homeType.noun} where ${area.name} has '
          'no price for one',
        );
      }
      if (listing.photos.length < 3) {
        yield findingError(subject, '${listing.id} needs three photos');
      }
      for (final id in listing.photos) {
        if (photos.photoWith(id) == null) {
          yield findingError(subject, '${listing.id} names unknown photo $id');
        }
      }
    }
  }
  if (hasPhotoFile != null) {
    for (final photo in photos.photos) {
      if (!hasPhotoFile(photo.id)) {
        yield findingError('photos.json', 'No image file for ${photo.id}');
      }
    }
  }
}
