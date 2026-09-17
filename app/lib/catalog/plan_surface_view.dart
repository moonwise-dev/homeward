import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/providers/repository_providers.dart';

class PlanSurfaceView extends ConsumerWidget {
  const PlanSurfaceView({
    required this.sessionId,
    required this.surfaceId,
    super.key,
  });

  final String sessionId;
  final String surfaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Surface(
    surfaceContext: ref
        .watch(agentRepositoryProvider)
        .surfaceContext(sessionId, surfaceId),
  );
}
