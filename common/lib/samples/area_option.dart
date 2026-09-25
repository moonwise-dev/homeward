import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../story/travel_mode.dart';
import 'home_type.dart';

part 'area_option.freezed.dart';
part 'area_option.g.dart';

@freezed
abstract class AreaOption with _$AreaOption {
  const factory AreaOption({
    required String id,
    required String areaId,
    required String areaName,
    required String character,
    required HomeType homeType,
    required int rooms,
    required int sizeM2,
    required Money price,
    required Money pricePerM2,
    required String priceSource,
    int? minutes,
    TravelMode? mode,
    String? anchorLabel,
  }) = _AreaOption;

  factory AreaOption.fromJson(Map<String, Object?> json) =>
      _$AreaOptionFromJson(json);
}
