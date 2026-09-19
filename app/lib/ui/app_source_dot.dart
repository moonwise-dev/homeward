import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sources_sheet.dart';

class AppSourceDot extends StatelessWidget {
  const AppSourceDot({required this.title, required this.sources, super.key});

  final String title;
  final List<Source> sources;

  @override
  Widget build(BuildContext context) => sources.isEmpty
      ? const SizedBox.shrink()
      : IconButton(
          icon: const Icon(Icons.info_outline, size: 16),
          color: AppColors.textTertiary,
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          tooltip: 'Where this comes from',
          onPressed: () =>
              showAppSourcesSheet(context, title: title, sources: sources),
        );
}
