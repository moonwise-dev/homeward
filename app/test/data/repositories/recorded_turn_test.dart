import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/catalog/homeward_catalog.dart';
import 'package:homeward/catalog/surface_views.dart';
import 'package:homeward/data/repositories/renderer_surfaces.dart';
import 'package:homeward/ui/core/themes/theme.dart';

void main() {
  testWidgets('the renderer draws a turn the server streamed', (tester) async {
    final surfaces = RendererSurfaces(homewardRendererCatalog());
    for (final line in File(
      'test/fixtures/recorded_turn.sse',
    ).readAsLinesSync()) {
      if (line.startsWith('data: ')) {
        _a2uiMessages(jsonDecode(line.substring(6))).forEach(surfaces.apply);
      }
    }

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: SurfaceView(surface: surfaces.watch(planSurfaceId)),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Anything else?'), findsOneWidget);
    expect(find.text('That is it'), findsOneWidget);
  });
}

Iterable<Map<String, Object?>> _a2uiMessages(Object? event) sync* {
  if (event case {
    'result': {'status': {'message': {'parts': final List<Object?> parts}}},
  }) {
    for (final part in parts) {
      if (part case {
        'metadata': {'mimeType': A2uiExtension.mimeType},
        'data': final Map<String, Object?> message,
      }) {
        yield message;
      }
    }
  }
}
