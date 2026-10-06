import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_settings.freezed.dart';

@freezed
abstract class TurnSettings with _$TurnSettings {
  const factory TurnSettings({
    @Default(2) int maxCorrections,
    @Default(3) int maxToolRounds,
    @Default(2) int maxCatalogRounds,
    @Default(1) int maxFinishingRounds,
    @Default('low') String thinkingLevel,
  }) = _TurnSettings;
}
