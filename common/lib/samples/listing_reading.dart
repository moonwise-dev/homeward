import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_reading.freezed.dart';
part 'listing_reading.g.dart';

enum ReadVerdict { meets, fails, silent }

@freezed
abstract class HomeNeed with _$HomeNeed {
  const factory HomeNeed({
    required String id,
    required String label,
    required String meaning,
  }) = _HomeNeed;

  factory HomeNeed.fromJson(Map<String, Object?> json) =>
      _$HomeNeedFromJson(json);
}

@freezed
abstract class NeedReading with _$NeedReading {
  const factory NeedReading({
    required String needId,
    required String label,
    required ReadVerdict verdict,
    String? quote,
  }) = _NeedReading;

  factory NeedReading.fromJson(Map<String, Object?> json) =>
      _$NeedReadingFromJson(json);
}

@freezed
abstract class ListingReading with _$ListingReading {
  const factory ListingReading({
    required String homeId,
    required String homeName,
    required String description,
    required List<NeedReading> readings,
  }) = _ListingReading;

  factory ListingReading.fromJson(Map<String, Object?> json) =>
      _$ListingReadingFromJson(json);
}

String? quoteIn(String description, Object? quote) {
  if (quote is! String) {
    return null;
  }
  final wanted = quote.trim().replaceAll(RegExp(r'^["“]+|["”.,;:]+$'), '');
  if (wanted.length < 8) {
    return null;
  }
  final at = description.toLowerCase().indexOf(wanted.toLowerCase());
  return at == -1 ? null : description.substring(at, at + wanted.length);
}
