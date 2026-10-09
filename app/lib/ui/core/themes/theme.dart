import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';
import 'text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => _themeOf(AppColors.light, Brightness.light);

  static ThemeData get dark => _themeOf(AppColors.dark, Brightness.dark);

  static ThemeData _themeOf(AppColors colors, Brightness brightness) {
    final styles = AppTextStyles(colors);
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.accent,
      onPrimary: colors.onAccent,
      secondary: colors.accent,
      onSecondary: colors.onAccent,
      surface: colors.surface,
      onSurface: colors.text,
      onSurfaceVariant: colors.textSecondary,
      surfaceContainerHighest: colors.surfaceMuted,
      surfaceTint: Colors.transparent,
      error: colors.danger,
      onError: colors.onAccent,
      outline: colors.border,
      outlineVariant: colors.border,
    );

    OutlineInputBorder fieldBorder(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.sm),
          borderSide: BorderSide(color: color, width: width),
        );

    const buttonShape = WidgetStatePropertyAll<OutlinedBorder>(
      StadiumBorder(),
    );
    const buttonSize = WidgetStatePropertyAll(Size(64, AppSizes.control));

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [colors],
      scaffoldBackgroundColor: colors.background,
      textTheme: TextTheme(
        displayLarge: styles.display,
        displayMedium: styles.display,
        displaySmall: styles.display,
        headlineLarge: styles.display,
        headlineMedium: styles.title,
        headlineSmall: styles.title,
        titleLarge: styles.title,
        titleMedium: styles.body.copyWith(fontWeight: FontWeight.w600),
        titleSmall: styles.label,
        bodyLarge: styles.body,
        bodyMedium: styles.body,
        bodySmall: styles.caption,
        labelLarge: styles.button,
        labelMedium: styles.label,
        labelSmall: styles.caption,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: colors.text,
        titleTextStyle: styles.title,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        hintStyle: styles.body.copyWith(color: colors.textTertiary),
        labelStyle: styles.label,
        errorStyle: styles.caption.copyWith(color: colors.danger),
        border: fieldBorder(colors.border),
        enabledBorder: fieldBorder(colors.border),
        focusedBorder: fieldBorder(colors.accent, 1.5),
        errorBorder: fieldBorder(colors.danger),
        focusedErrorBorder: fieldBorder(colors.danger, 1.5),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: WidgetStatePropertyAll(styles.button),
          elevation: const WidgetStatePropertyAll(0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          shape: buttonShape,
          elevation: const WidgetStatePropertyAll(0),
          side: WidgetStatePropertyAll(
            BorderSide(color: colors.borderStrong),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: WidgetStatePropertyAll(styles.button),
          side: WidgetStatePropertyAll(
            BorderSide(color: colors.borderStrong),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          textStyle: WidgetStatePropertyAll(styles.button),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.sm / 2),
        ),
      ),
      dividerTheme: DividerThemeData(color: colors.border, space: 1),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surface,
        selectedColor: colors.accentSoft,
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: states.contains(WidgetState.selected)
                ? colors.accent
                : colors.border,
          ),
        ),
        labelStyle: styles.label.copyWith(color: colors.text),
        checkmarkColor: colors.accent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.pill),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs,
        ),
      ),
    );
  }
}
