import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/agent_repository.dart';
import '../../../data/repositories/renderer_surfaces.dart';
import '../../core/ui/app_json_block.dart';

class SurfaceDataView extends HookConsumerWidget {
  const SurfaceDataView({
    required this.sessionId,
    required this.surfaceId,
    super.key,
  });

  final String sessionId;
  final String surfaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agent = ref.watch(agentRepositoryProvider);
    final surface = useValueListenable<RendererSurface?>(
      useMemoized(
        () => agent.surface(sessionId, surfaceId),
        [sessionId, surfaceId],
      ),
    );
    final value = useState<Object?>(null);
    useEffect(
      () => surface?.dataModel
          .watch<Object?>('/')
          .subscribe((data) => value.value = data),
      [surface],
    );
    return AppJsonBlock(value: value.value, empty: 'Nothing bound yet');
  }
}
