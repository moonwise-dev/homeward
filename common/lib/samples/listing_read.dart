import 'package:freezed_annotation/freezed_annotation.dart';

import 'home_need.dart';

part 'listing_read.freezed.dart';
part 'listing_read.g.dart';

enum ReadVerdict { meets, fails, silent }

@freezed
abstract class ListingRead with _$ListingRead {
  const factory ListingRead({
    required String listingId,
    required HomeNeed need,
    required ReadVerdict verdict,
    String? quote,
  }) = _ListingRead;

  factory ListingRead.fromJson(Map<String, Object?> json) =>
      _$ListingReadFromJson(json);
}
