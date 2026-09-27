import 'package:flutter/material.dart';

import '../../../catalog/surface_views.dart';
import '../../../domain/models/gallery_component.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_json_block.dart';
import 'gallery_parameter_row.dart';

class GalleryComponentPage extends StatelessWidget {
  const GalleryComponentPage({
    required this.component,
    required this.example,
    required this.exampleIndex,
    required this.onShowExample,
    super.key,
  });

  final GalleryComponent component;
  final GalleryExample example;
  final int exampleIndex;
  final ValueChanged<int> onShowExample;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(component.name, style: AppTextStyles.title),
          Text(component.family.label, style: AppTextStyles.caption),
          const SizedBox(height: AppSpacing.xs),
          Text(component.description, style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.md),
          if (component.examples.length > 1)
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final (index, candidate) in component.examples.indexed)
                  ChoiceChip(
                    label: Text(candidate.name),
                    selected: index == exampleIndex,
                    onSelected: (_) => onShowExample(index),
                  ),
              ],
            )
          else
            Text(example.name, style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.xs),
          AppCard(
            child: GallerySurfaceView(
              key: ValueKey(example.surfaceId),
              surfaceId: example.surfaceId,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Parameters', style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.xs),
          for (final parameter in component.parameters)
            GalleryParameterRow(parameter: parameter),
          const SizedBox(height: AppSpacing.lg),
          Text('The example', style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.xs),
          Text('Components', style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.xxs),
          AppJsonBlock(value: example.components, copyable: true),
          const SizedBox(height: AppSpacing.sm),
          Theme(
            data: Theme.of(
              context,
            ).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              shape: const Border(),
              title: Text('Data model', style: AppTextStyles.label),
              subtitle: Text(
                'What the tools seed, as the example gives it',
                style: AppTextStyles.caption,
              ),
              children: [
                AppJsonBlock(value: example.dataModel, copyable: true),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
