import 'dart:ui';

import '../ui/app_colors.dart';

const _homeColors = [AppColors.accent, AppColors.info, AppColors.warning];

Color homeColor(String? candidateId) {
  final index = int.tryParse(candidateId?.replaceFirst('c', '') ?? '');
  return index == null || index < 1
      ? AppColors.text
      : _homeColors[(index - 1) % _homeColors.length];
}
