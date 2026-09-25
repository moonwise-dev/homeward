import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import 'home_type.dart';

part 'sample_area.freezed.dart';
part 'sample_area.g.dart';

@freezed
abstract class SampleArea with _$SampleArea {
  const factory SampleArea({
    required String id,
    required String name,
    required GeoPoint point,
    required String character,
    int? flatPricePerM2,
    int? housePricePerM2,
    required String sourceId,
  }) = _SampleArea;

  const SampleArea._();

  factory SampleArea.fromJson(Map<String, Object?> json) =>
      _$SampleAreaFromJson(json);

  int? pricePerM2(HomeType type) => switch (type) {
    HomeType.flat => flatPricePerM2,
    HomeType.house => housePricePerM2,
  };

  Set<HomeType> get homeTypes => {
    for (final type in HomeType.values)
      if (pricePerM2(type) != null) type,
  };
}
