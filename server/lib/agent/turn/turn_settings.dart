import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_settings.freezed.dart';

@freezed
abstract class TurnSettings with _$TurnSettings {
  const factory TurnSettings({
    @Default(2) int maxCorrections,
    @Default(3) int maxToolRounds,
    @Default('low') String thinkingLevel,
    @Default(true) bool deal,
  }) = _TurnSettings;
}
