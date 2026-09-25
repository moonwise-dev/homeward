import 'package:freezed_annotation/freezed_annotation.dart';

import '../story/criterion_kind.dart';
import 'home_style.dart';
import 'home_type.dart';
import 'outdoor_space.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class PhotoCredit with _$PhotoCredit {
  const factory PhotoCredit({required String name, required String url}) =
      _PhotoCredit;

  factory PhotoCredit.fromJson(Map<String, Object?> json) =>
      _$PhotoCreditFromJson(json);
}

@freezed
abstract class PhotoTraits with _$PhotoTraits {
  const factory PhotoTraits({
    HomeType? homeType,
    OutdoorSpace? outdoor,
    HomeStyle? style,
    @Default([]) List<CriterionKind> criteria,
    @Default([]) List<String> areaIds,
  }) = _PhotoTraits;

  factory PhotoTraits.fromJson(Map<String, Object?> json) =>
      _$PhotoTraitsFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required String id,
    required String caption,
    required PhotoCredit credit,
    @Default(PhotoTraits()) PhotoTraits traits,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}

@freezed
abstract class PhotoManifest with _$PhotoManifest {
  const factory PhotoManifest({required List<Photo> photos}) = _PhotoManifest;

  const PhotoManifest._();

  factory PhotoManifest.fromJson(Map<String, Object?> json) =>
      _$PhotoManifestFromJson(json);

  Photo? photoWith(String id) =>
      photos.where((photo) => photo.id == id).firstOrNull;
}
