import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_listing.freezed.dart';

@freezed
abstract class SessionListing with _$SessionListing {
  const factory SessionListing({
    required String id,
    @Default(0) int turnCount,
    String? title,
    String? marketId,
    DateTime? updatedAt,
  }) = _SessionListing;
}
