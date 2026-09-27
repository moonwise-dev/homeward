import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../samples/listing.dart';

part 'rent_figure.freezed.dart';
part 'rent_figure.g.dart';

@freezed
abstract class RentFigure with _$RentFigure {
  const factory RentFigure({
    required Money monthly,
    required bool stated,
    Money? perM2,
    int? sizeM2,
    String? source,
  }) = _RentFigure;

  factory RentFigure.fromJson(Map<String, Object?> json) =>
      _$RentFigureFromJson(json);

  factory RentFigure.stated(Money monthly) =>
      RentFigure(monthly: monthly, stated: true);

  factory RentFigure.like(Listing listing) => RentFigure(
    monthly: listing.rentLikeThis,
    stated: false,
    perM2: listing.areaRentPerM2,
    sizeM2: listing.sizeM2,
    source: listing.rentSource,
  );
}
