import 'package:common/common.dart';
import 'package:yaml/yaml.dart';

final class ListingSpec {
  const ListingSpec({
    required this.id,
    required this.areaId,
    required this.name,
    required this.address,
    required this.title,
    required this.blurb,
    required this.homeType,
    required this.rooms,
    required this.bedrooms,
    required this.sizeM2,
    required this.outdoor,
    required this.style,
    required this.factor,
    required this.photos,
    this.town,
    this.floor,
    this.yearBuilt,
  });

  factory ListingSpec.fromYaml(YamlMap yaml) => ListingSpec(
    id: yaml['id'] as String,
    areaId: yaml['area'] as String,
    name: yaml['name'] as String,
    address: yaml['address'] as String,
    town: yaml['town'] as String?,
    title: yaml['title'] as String,
    blurb: yaml['blurb'] as String,
    homeType: HomeType.values.byName(yaml['type'] as String),
    rooms: yaml['rooms'] as int,
    bedrooms: yaml['bedrooms'] as int,
    sizeM2: yaml['size'] as int,
    floor: yaml['floor'] as int?,
    yearBuilt: yaml['year'] as int?,
    outdoor: OutdoorSpace.values.byName(yaml['outdoor'] as String),
    style: HomeStyle.values.byName(yaml['style'] as String),
    factor: (yaml['factor'] as num).toDouble(),
    photos: [for (final photo in yaml['photos'] as YamlList) photo as String],
  );

  final String id;
  final String areaId;
  final String name;
  final String address;
  final String? town;
  final String title;
  final String blurb;
  final HomeType homeType;
  final int rooms;
  final int bedrooms;
  final int sizeM2;
  final int? floor;
  final int? yearBuilt;
  final OutdoorSpace outdoor;
  final HomeStyle style;
  final double factor;
  final List<String> photos;

  String get query => [address, ?town].join(', ');
}

final class CitySpec {
  const CitySpec({required this.cityId, required this.listings});

  factory CitySpec.parse(String text) {
    final yaml = loadYaml(text) as YamlMap;
    return CitySpec(
      cityId: yaml['city'] as String,
      listings: [
        for (final listing in yaml['listings'] as YamlList)
          ListingSpec.fromYaml(listing as YamlMap),
      ],
    );
  }

  final String cityId;
  final List<ListingSpec> listings;
}
