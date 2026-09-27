import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/catalog/homeward_catalog.dart';
import 'package:homeward/catalog/surface_views.dart';
import 'package:homeward/data/repositories/gallery_repository.dart';
import 'package:homeward/ui/core/themes/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  final repository = GenUiGalleryRepository(homewardGenuiCatalog());

  testWidgets('every catalog example renders', (tester) async {
    await tester.binding.setSurfaceSize(const Size(420, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final component in repository.components) {
      for (final example in component.examples) {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              galleryRepositoryProvider.overrideWithValue(repository),
            ],
            child: MaterialApp(
              home: Scaffold(
                backgroundColor: AppColors.background,
                body: SingleChildScrollView(
                  child: GallerySurfaceView(surfaceId: example.surfaceId),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          tester.takeException(),
          isNull,
          reason: '${component.name}: ${example.name}',
        );
      }
    }
  });

  test('the gallery shows every component example', () {
    expect(
      [
        for (final component in repository.components)
          if (component.examples.isNotEmpty) component.name,
      ],
      [for (final component in homewardComponents) component.name],
    );
  });
}
