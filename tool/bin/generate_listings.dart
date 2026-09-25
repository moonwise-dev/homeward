import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/research/open_data/nominatim.dart';
import 'package:homeward_server/research/open_data/polite_client.dart';
import 'package:homeward_tool/listings/build_listing.dart';
import 'package:homeward_tool/listings/listing_spec.dart';
import 'package:http/http.dart' as http;

const _maxMetersFromArea = 4000;

const _boxDegrees = 0.04;

Future<void> main(List<String> arguments) async {
  final root = arguments.isEmpty ? '.' : arguments.first;
  final manifest = PhotoManifest.fromJson(
    jsonDecode(File('$root/markets/photos.json').readAsStringSync())
        as Map<String, Object?>,
  );
  final client = http.Client();
  final nominatim = Nominatim(
    PoliteClient(client, userAgent: 'Homeward listings tool (se.moonwise)'),
  );
  var failed = false;
  try {
    for (final file in Directory(
      '$root/tool/listings',
    ).listSync()..sort((a, b) => a.path.compareTo(b.path))) {
      if (file is! File || !file.path.endsWith('.yaml')) {
        continue;
      }
      final spec = CitySpec.parse(file.readAsStringSync());
      final city = SampleCity.fromJson(
        jsonDecode(
          File(
            '$root/markets/areas/${spec.cityId}.json',
          ).readAsStringSync(),
        ) as Map<String, Object?>,
      );
      final listings = <Listing>[];
      for (final home in spec.listings) {
        final area = city.areaWith(home.areaId);
        if (area == null) {
          stderr.writeln('${home.id}: ${home.areaId} is not an area');
          failed = true;
          continue;
        }
        final place = await nominatim.locate(
          home.query,
          within: (
            south: area.point.lat - _boxDegrees,
            north: area.point.lat + _boxDegrees,
            west: area.point.lng - _boxDegrees * 2,
            east: area.point.lng + _boxDegrees * 2,
          ),
        );
        if (place == null) {
          stderr.writeln('${home.id}: ${home.query} was not found');
          failed = true;
          continue;
        }
        final distance = place.point.metersTo(area.point);
        if (distance > _maxMetersFromArea) {
          stderr.writeln(
            '${home.id}: ${home.query} is $distance m from ${area.name}',
          );
          failed = true;
          continue;
        }
        listings.add(
          buildListing(
            spec: home,
            city: city,
            point: place.point,
            manifest: manifest,
          ),
        );
        stdout.writeln('${home.id}: ${place.address}');
      }
      final out = File('$root/markets/listings/${spec.cityId}.json')
        ..parent.createSync(recursive: true);
      out.writeAsStringSync(
        '${const JsonEncoder.withIndent('  ').convert(ListingInventory(cityId: spec.cityId, listings: listings).toJson())}\n',
      );
    }
  } finally {
    client.close();
  }
  if (failed) {
    exitCode = 1;
  }
}
