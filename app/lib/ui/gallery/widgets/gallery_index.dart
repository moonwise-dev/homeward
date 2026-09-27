import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/gallery_component.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class GalleryIndex extends StatelessWidget {
  const GalleryIndex({
    required this.byFamily,
    required this.onOpen,
    this.selected,
    this.unknown,
    super.key,
  });

  final Map<CatalogFamily, List<GalleryComponent>> byFamily;
  final ValueChanged<String> onOpen;
  final String? selected;
  final String? unknown;

  @override
  Widget build(BuildContext context) {
    final unknown = this.unknown;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      children: [
        if (unknown != null)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              'There is no block called $unknown.',
              style: AppTextStyles.body.copyWith(color: AppColors.warning),
            ),
          ),
        for (final MapEntry(key: family, value: components) in byFamily.entries)
          if (components.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xxs,
              ),
              child: Text(family.label, style: AppTextStyles.label),
            ),
            for (final component in components)
              ListTile(
                selected: component.name == selected,
                selectedTileColor: AppColors.accentSoft,
                title: Text(component.name, style: AppTextStyles.body),
                subtitle: Text(
                  component.description,
                  style: AppTextStyles.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => onOpen(component.name),
              ),
          ],
      ],
    );
  }
}
