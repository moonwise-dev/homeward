import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'app_status_line.dart';

class AppStatusTag extends StatelessWidget {
  const AppStatusTag({
    required this.status,
    required this.text,
    this.trailing,
    super.key,
  });

  final AppStatus status;
  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (status) {
      AppStatus.pass => (AppColors.positive, Icons.check_circle_outline),
      AppStatus.warn => (AppColors.warning, Icons.warning_amber_outlined),
      AppStatus.fail => (AppColors.danger, Icons.cancel_outlined),
      AppStatus.info => (AppColors.info, Icons.info_outline),
    };
    return AppStatusLine(
      text: text,
      icon: icon,
      color: color,
      trailing: trailing,
    );
  }
}

enum AppStatus { pass, warn, fail, info }
