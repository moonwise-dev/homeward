import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final class AppTextStyles {
  const AppTextStyles(this.colors);

  static AppTextStyles of(BuildContext context) =>
      AppTextStyles(AppColors.of(context));

  static const _tabular = [FontFeature.tabularFigures()];

  final AppColors colors;

  TextStyle get display => GoogleFonts.fraunces(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: colors.text,
  );

  TextStyle get title => GoogleFonts.fraunces(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: colors.text,
  );

  TextStyle get body => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: colors.text,
  );

  TextStyle get label => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: colors.textSecondary,
  );

  TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.35,
    color: colors.textTertiary,
  );

  TextStyle get button => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  TextStyle get code => GoogleFonts.robotoMono(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: colors.textSecondary,
  );

  TextStyle get figureLarge => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: colors.text,
    fontFeatures: _tabular,
  );

  TextStyle get figure => GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: colors.text,
    fontFeatures: _tabular,
  );
}
