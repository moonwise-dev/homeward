import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repositories/agent_repository.dart';
import '../data/repositories/gallery_repository.dart';
import '../data/repositories/renderer_surfaces.dart';

class PlanSurfaceView extends ConsumerWidget {
  const PlanSurfaceView({
    required this.sessionId,
    required this.surfaceId,
    super.key,
  });

  final String sessionId;
  final String surfaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SurfaceView(
    surface: ref.watch(agentRepositoryProvider).surface(sessionId, surfaceId),
  );
}

class GallerySurfaceView extends ConsumerWidget {
  const GallerySurfaceView({required this.surfaceId, super.key});

  final String surfaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SurfaceView(
    surface: ref.watch(galleryRepositoryProvider).surface(surfaceId),
  );
}

class SurfaceView extends StatelessWidget {
  const SurfaceView({required this.surface, this.frame, super.key});

  final ValueListenable<RendererSurface?> surface;
  final Widget Function(RendererSurface surface, Widget child)? frame;

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<RendererSurface?>(
        valueListenable: surface,
        builder: (context, surface, _) {
          if (surface == null) {
            return const SizedBox.shrink();
          }
          final shown = A2uiSurface(key: ObjectKey(surface), surface: surface);
          return frame?.call(surface, shown) ?? shown;
        },
      );
}
