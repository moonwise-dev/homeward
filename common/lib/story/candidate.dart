import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import '../money/money.dart';

part 'candidate.freezed.dart';
part 'candidate.g.dart';

@freezed
abstract class Candidate with _$Candidate {
  const factory Candidate({
    required String id,
    required String label,
    required String query,
    GeoPoint? point,
    String? address,
    Money? price,
    Money? monthlyFee,
    String? listingUrl,
  }) = _Candidate;

  factory Candidate.fromJson(Map<String, Object?> json) =>
      _$CandidateFromJson(json);
}
