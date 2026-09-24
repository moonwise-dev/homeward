import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

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
              _showSourcesSheet(context, title: title, sources: sources),
        );
}

Future<void> _showSourcesSheet(
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
                    '${source.publisher} · ${_sourceKindLabel(source.kind)} · '
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

String _sourceKindLabel(SourceKind kind) => switch (kind) {
  SourceKind.law => 'Law',
  SourceKind.regulator => 'Regulator',
  SourceKind.taxAuthority => 'Tax authority',
  SourceKind.officialStatistics => 'Official statistics',
  SourceKind.lenderNorm => 'Lender norm',
  SourceKind.secondary => 'Secondary source',
};
