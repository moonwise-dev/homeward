import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/providers/repository_providers.dart';

class GallerySurfaceView extends ConsumerWidget {
  const GallerySurfaceView({required this.surfaceId, super.key});

  final String surfaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Surface(
    surfaceContext: ref
        .watch(galleryRepositoryProvider)
        .surfaceContext(surfaceId),
  );
}
