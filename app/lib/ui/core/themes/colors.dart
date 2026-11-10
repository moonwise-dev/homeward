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
    required this.brand,
    required this.onBrand,
    required this.alert,
    required this.onAlert,
    required this.onPhoto,
    required this.accentSoft,
    required this.info,
    required this.positive,
    required this.warning,
    required this.danger,
    required this.shadow,
  });

  static const light = AppColors(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF3F4F5),
    border: Color(0xFFE8EAEC),
    borderStrong: Color(0xFFD3D6DA),
    text: Color(0xFF0B0D0E),
    textSecondary: Color(0xBA0B0D0E),
    textTertiary: Color(0x9E0B0D0E),
    accent: Color(0xFF007A3D),
    onAccent: Color(0xFFFFFFFF),
    brand: Color(0xFF00C46A),
    onBrand: Color(0xFF04140B),
    alert: Color(0xFFFF6A3D),
    onAlert: Color(0xFF1F0A03),
    onPhoto: Color(0xFFFFFFFF),
    accentSoft: Color(0x2400C46A),
    info: Color(0xFF2563EB),
    positive: Color(0xFF007A3D),
    warning: Color(0xFFC93F0B),
    danger: Color(0xFFD92D20),
    shadow: Color(0x140B0D0E),
  );

  static const dark = AppColors(
    background: Color(0xFF000000),
    surface: Color(0xFF000000),
    surfaceMuted: Color(0xFF16181A),
    border: Color(0xFF26292C),
    borderStrong: Color(0xFF3A3E42),
    text: Color(0xFFF5F6F7),
    textSecondary: Color(0xC7F5F6F7),
    textTertiary: Color(0xA3F5F6F7),
    accent: Color(0xFF1FD67A),
    onAccent: Color(0xFF04140B),
    brand: Color(0xFF1FD67A),
    onBrand: Color(0xFF04140B),
    alert: Color(0xFFFF7A45),
    onAlert: Color(0xFF1F0A03),
    onPhoto: Color(0xFFFFFFFF),
    accentSoft: Color(0x291FD67A),
    info: Color(0xFF6EA8FF),
    positive: Color(0xFF1FD67A),
    warning: Color(0xFFFF8A50),
    danger: Color(0xFFFF6B5E),
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
  final Color brand;
  final Color onBrand;
  final Color alert;
  final Color onAlert;
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
      brand: mix(brand, other.brand),
      onBrand: mix(onBrand, other.onBrand),
      alert: mix(alert, other.alert),
      onAlert: mix(onAlert, other.onAlert),
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
