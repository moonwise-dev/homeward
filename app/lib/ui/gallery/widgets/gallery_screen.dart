import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../view_model/gallery_view_model.dart';
import 'gallery_component_page.dart';
import 'gallery_index.dart';

class GalleryScreen extends ConsumerWidget {
  const GalleryScreen({this.componentName, super.key});

  final String? componentName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    void toPlan() => context.go(AppRoutes.resuming(ref.read(openPlanProvider)));
    final provider = galleryViewModelProvider(componentName);
    final state = ref.watch(provider);
    final selected = state.selected;
    final example = state.example;
    final index = GalleryIndex(
      byFamily: state.byFamily,
      selected: selected?.name,
      unknown: state.unknown,
      onOpen: (name) => context.go(AppRoutes.galleryOf(name)),
    );
    final page = selected == null || example == null
        ? null
        : GalleryComponentPage(
            component: selected,
            example: example,
            exampleIndex: state.exampleIndex,
            onShowExample: ref.read(provider.notifier).showExample,
          );
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppSizes.twoPane) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Catalog gallery'),
              leading: BackButton(onPressed: toPlan),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: AppSizes.sidePane, child: index),
                const VerticalDivider(width: 1),
                Expanded(
                  child:
                      page ??
                      Center(
                        child: Text(
                          'Pick a block to see it with its parameters.',
                          style: styles.caption,
                        ),
                      ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Catalog gallery'),
            leading: BackButton(
              onPressed: page == null
                  ? toPlan
                  : () => context.go(AppRoutes.gallery),
            ),
            actions: [
              if (page != null)
                IconButton(
                  tooltip: 'Back to your plan',
                  icon: const Icon(Icons.home_outlined),
                  onPressed: toPlan,
                ),
            ],
          ),
          body: page ?? index,
        );
      },
    );
  }
}
