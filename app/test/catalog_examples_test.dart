import 'package:common/common.dart';
import 'package:homeward/catalog/gallery_surface_view.dart';
import 'package:homeward/catalog/homeward_genui_catalog.dart';
import 'package:homeward/data/providers/repository_providers.dart';
import 'package:homeward/data/repository/gallery_repository.dart';
import 'package:homeward/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  final repository = GenUiGalleryRepository(homewardGenuiCatalog());

  testWidgets('every catalog example renders', (tester) async {
    await tester.binding.setSurfaceSize(const Size(420, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final entry in repository.entries) {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [galleryRepositoryProvider.overrideWithValue(repository)],
          child: MaterialApp(
            home: Scaffold(
              backgroundColor: AppColors.background,
              body: SingleChildScrollView(
                child: GallerySurfaceView(surfaceId: entry.surfaceId),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        tester.takeException(),
        isNull,
        reason: '${entry.title}: ${entry.subtitle}',
      );
    }
  });

  test('the gallery shows every component and surface example', () {
    expect(
      repository.entries.map((entry) => entry.title),
      containsAll([
        for (final component in homewardComponents) component.name,
      ]),
    );
  });
}
