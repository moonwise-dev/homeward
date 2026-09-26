import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_pin.freezed.dart';
part 'map_pin.g.dart';

@freezed
abstract class MapPin with _$MapPin {
  const factory MapPin({
    required double lat,
    required double lng,
    required String label,
  }) = _MapPin;

  factory MapPin.fromJson(Map<String, Object?> json) => _$MapPinFromJson(json);
}
