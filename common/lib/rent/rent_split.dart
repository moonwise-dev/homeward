import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/allocate.dart';
import '../money/money.dart';
import 'rent_figure.dart';

part 'rent_split.freezed.dart';
part 'rent_split.g.dart';

enum SplitRule { equal, income, room }

@freezed
abstract class SharingPerson with _$SharingPerson {
  const factory SharingPerson({
    required String label,
    Money? income,
    int? roomM2,
  }) = _SharingPerson;

  factory SharingPerson.fromJson(Map<String, Object?> json) =>
      _$SharingPersonFromJson(json);
}

@freezed
abstract class PersonShare with _$PersonShare {
  const factory PersonShare({
    required String label,
    required Money rent,
    Money? bills,
  }) = _PersonShare;

  const PersonShare._();

  factory PersonShare.fromJson(Map<String, Object?> json) =>
      _$PersonShareFromJson(json);

  Money get total => switch (bills) {
    final bills? => rent + bills,
    null => rent,
  };
}

@freezed
abstract class RuleSplit with _$RuleSplit {
  const factory RuleSplit({
    required SplitRule rule,
    required List<PersonShare> shares,
  }) = _RuleSplit;

  factory RuleSplit.fromJson(Map<String, Object?> json) =>
      _$RuleSplitFromJson(json);
}

@freezed
abstract class RentSplitSlice with _$RentSplitSlice {
  const factory RentSplitSlice({
    required RentFigure rent,
    Money? bills,
    String? homeId,
    String? homeName,
    int? homeM2,
    required List<SharingPerson> people,
    required List<RuleSplit> splits,
    SplitRule? chosen,
  }) = _RentSplitSlice;

  const RentSplitSlice._();

  factory RentSplitSlice.fromJson(Map<String, Object?> json) =>
      _$RentSplitSliceFromJson(json);

  Money get total => switch (bills) {
    final bills? => rent.monthly + bills,
    null => rent.monthly,
  };
}

List<RuleSplit> splitRent({
  required Money rent,
  Money? bills,
  required List<SharingPerson> people,
  int? homeM2,
}) {
  final equal = [for (final _ in people) 1];
  final incomes = [
    for (final person in people)
      if (person.income case final income? when income.minorUnits > 0)
        income.minorUnits,
  ];
  final rooms = [
    for (final person in people)
      if (person.roomM2 case final room? when room > 0) room,
  ];
  final roomTotal = rooms.fold<int>(0, (sum, room) => sum + room);
  final shared = homeM2 != null && homeM2 > roomTotal ? homeM2 - roomTotal : 0;
  RuleSplit split(
    SplitRule rule,
    List<int> rentWeights,
    List<int> billWeights,
  ) {
    final rents = allocate(rent, rentWeights);
    final billParts = bills == null ? null : allocate(bills, billWeights);
    return RuleSplit(
      rule: rule,
      shares: [
        for (final (index, person) in people.indexed)
          PersonShare(
            label: person.label,
            rent: rents[index],
            bills: billParts?[index],
          ),
      ],
    );
  }

  return [
    split(SplitRule.equal, equal, equal),
    if (incomes.length == people.length)
      split(SplitRule.income, incomes, incomes),
    if (rooms.length == people.length)
      split(SplitRule.room, [
        for (final room in rooms) room * people.length + shared,
      ], equal),
  ];
}
