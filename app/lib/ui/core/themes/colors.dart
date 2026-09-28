import 'package:flutter/material.dart';

final class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.border,
    required this.borderStrong,
    required this.text,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.onAccent,
    required this.onPhoto,
    required this.accentSoft,
    required this.info,
    required this.positive,
    required this.warning,
    required this.danger,
    required this.shadow,
  });

  static const light = AppColors(
    background: Color(0xFFF6F4EF),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFEFECE5),
    border: Color(0xFFDDD8CD),
    borderStrong: Color(0xFFC5BFB1),
    text: Color(0xFF17212B),
    textSecondary: Color(0xC417212B),
    textTertiary: Color(0xA017212B),
    accent: Color(0xFF1D5C4D),
    onAccent: Color(0xFFFFFFFF),
    onPhoto: Color(0xFFFFFFFF),
    accentSoft: Color(0x1A1D5C4D),
    info: Color(0xFF2B5C8A),
    positive: Color(0xFF2E7D5B),
    warning: Color(0xFFA86B12),
    danger: Color(0xFFB3261E),
    shadow: Color(0x1F17212B),
  );

  static const dark = AppColors(
    background: Color(0xFF141311),
    surface: Color(0xFF1D1B18),
    surfaceMuted: Color(0xFF262420),
    border: Color(0xFF36332D),
    borderStrong: Color(0xFF4A463E),
    text: Color(0xFFEEEAE2),
    textSecondary: Color(0xC7EEEAE2),
    textTertiary: Color(0x9EEEEAE2),
    accent: Color(0xFF6DBFA3),
    onAccent: Color(0xFF0E1F1A),
    onPhoto: Color(0xFFFFFFFF),
    accentSoft: Color(0x246DBFA3),
    info: Color(0xFF7FAEDB),
    positive: Color(0xFF6CC49A),
    warning: Color(0xFFE0A94A),
    danger: Color(0xFFF2877E),
    shadow: Color(0x66000000),
  );

  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>()!;

  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color border;
  final Color borderStrong;
  final Color text;
  final Color textSecondary;
  final Color textTertiary;
  final Color accent;
  final Color onAccent;
  final Color onPhoto;
  final Color accentSoft;
  final Color info;
  final Color positive;
  final Color warning;
  final Color danger;
  final Color shadow;

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) {
      return this;
    }
    Color mix(Color from, Color to) => Color.lerp(from, to, t)!;
    return AppColors(
      background: mix(background, other.background),
      surface: mix(surface, other.surface),
      surfaceMuted: mix(surfaceMuted, other.surfaceMuted),
      border: mix(border, other.border),
      borderStrong: mix(borderStrong, other.borderStrong),
      text: mix(text, other.text),
      textSecondary: mix(textSecondary, other.textSecondary),
      textTertiary: mix(textTertiary, other.textTertiary),
      accent: mix(accent, other.accent),
      onAccent: mix(onAccent, other.onAccent),
      onPhoto: mix(onPhoto, other.onPhoto),
      accentSoft: mix(accentSoft, other.accentSoft),
      info: mix(info, other.info),
      positive: mix(positive, other.positive),
      warning: mix(warning, other.warning),
      danger: mix(danger, other.danger),
      shadow: mix(shadow, other.shadow),
    );
  }
}
