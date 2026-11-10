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
      primary: colors.brand,
      onPrimary: colors.onBrand,
      secondary: colors.accent,
      onSecondary: colors.onAccent,
      secondaryContainer: colors.surfaceMuted,
      onSecondaryContainer: colors.text,
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
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: BorderSide(color: color, width: width),
        );

    const buttonShape = WidgetStatePropertyAll<OutlinedBorder>(
      StadiumBorder(),
    );
    const buttonSize = WidgetStatePropertyAll(Size(64, AppSizes.control));
    final quietFill = WidgetStatePropertyAll(colors.surfaceMuted);
    final quietInk = WidgetStatePropertyAll(colors.text);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [colors],
      scaffoldBackgroundColor: colors.background,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: colors.text.withValues(alpha: 0.04),
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
        titleTextStyle: styles.title.copyWith(fontSize: 18),
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceMuted,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md - 2,
        ),
        hintStyle: styles.body.copyWith(color: colors.textTertiary),
        labelStyle: styles.label,
        errorStyle: styles.caption.copyWith(color: colors.danger),
        border: fieldBorder(Colors.transparent),
        enabledBorder: fieldBorder(Colors.transparent),
        focusedBorder: fieldBorder(colors.brand, 1.5),
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
          backgroundColor: quietFill,
          foregroundColor: quietInk,
          textStyle: WidgetStatePropertyAll(styles.button),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: WidgetStatePropertyAll(styles.button),
          backgroundColor: quietFill,
          foregroundColor: quietInk,
          side: const WidgetStatePropertyAll(BorderSide.none),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: buttonSize,
          textStyle: WidgetStatePropertyAll(styles.button),
          foregroundColor: WidgetStatePropertyAll(colors.accent),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colors.text),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shadowColor: colors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          side: BorderSide(color: colors.border),
        ),
        textStyle: styles.body,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.brand,
        inactiveTrackColor: colors.surfaceMuted,
        thumbColor: colors.brand,
        overlayColor: colors.accentSoft,
        trackHeight: 4,
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.brand
              : colors.surfaceMuted,
        ),
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.onBrand
              : colors.textTertiary,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.brand,
        linearTrackColor: colors.surfaceMuted,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.sm / 2),
        ),
      ),
      dividerTheme: DividerThemeData(color: colors.border, space: 1),
      cardTheme: CardThemeData(
        color: colors.surfaceMuted,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? colors.brand
                : colors.surfaceMuted,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? colors.onBrand
                : colors.text,
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: colors.surface, width: 2),
          ),
          textStyle: WidgetStatePropertyAll(styles.label),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceMuted,
        selectedColor: colors.brand,
        side: BorderSide.none,
        labelStyle: styles.label.copyWith(
          color: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? colors.onBrand
                : colors.text,
          ),
        ),
        checkmarkColor: colors.onBrand,
        showCheckmark: false,
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
