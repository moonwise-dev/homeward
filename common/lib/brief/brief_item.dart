import 'package:freezed_annotation/freezed_annotation.dart';

part 'brief_item.freezed.dart';
part 'brief_item.g.dart';

enum BriefKind { household, money, need, habit, want, place, open }

enum FactSource { said, deduced, confirmed, measured, quoted, estimate }

@freezed
abstract class BriefItem with _$BriefItem {
  const factory BriefItem({
    required String id,
    required BriefKind kind,
    required String text,
    required FactSource source,
    String? words,
  }) = _BriefItem;

  factory BriefItem.fromJson(Map<String, Object?> json) =>
      _$BriefItemFromJson(json);
}
