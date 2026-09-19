import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../display/source_kind_label.dart';
import 'app_colors.dart';
import 'app_radii.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

Future<void> showAppSourcesSheet(
  BuildContext context, {
  required String title,
  required List<Source> sources,
}) => showModalBottomSheet<void>(
  context: context,
  backgroundColor: AppColors.background,
  showDragHandle: true,
  builder: (context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.sm),
          for (final source in sources) _SourceRow(source: source),
        ],
      ),
    ),
  ),
);

class _SourceRow extends StatelessWidget {
  const _SourceRow({required this.source});

  final Source source;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
    child: InkWell(
      borderRadius: BorderRadius.circular(AppRadii.sm),
      onTap: () => launchUrl(Uri.parse(source.url)),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(source.title, style: AppTextStyles.body),
                  Text(
                    '${source.publisher} · ${sourceKindLabel(source.kind)} · '
                    'read ${source.retrievedAt.isoDate}',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            const Icon(
              Icons.open_in_new,
              size: 16,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    ),
  );
}
