import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../catalog/gallery_surface_view.dart';
import '../../ui/app_card.dart';
import '../../ui/app_sizes.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_text_styles.dart';
import 'catalog_gallery_controller.dart';

class CatalogGalleryScreen extends ConsumerWidget {
  const CatalogGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(catalogGalleryControllerProvider).entries;
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog gallery')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: entries.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.lg),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Column(
                key: ValueKey(entry.surfaceId),
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(entry.title, style: AppTextStyles.title),
                  Text(entry.subtitle, style: AppTextStyles.caption),
                  const SizedBox(height: AppSpacing.xs),
                  AppCard(
                    child: GallerySurfaceView(surfaceId: entry.surfaceId),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
