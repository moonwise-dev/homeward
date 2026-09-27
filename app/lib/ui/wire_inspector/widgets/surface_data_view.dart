import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/agent_repository.dart';
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
    final data = useMemoized(
      () => agent
          .surfaceContext(sessionId, surfaceId)
          .dataModel
          .subscribe<Object>(DataPath.root),
      [sessionId, surfaceId],
    );
    useEffect(() => data.dispose, [data]);
    final value = useValueListenable(data);
    return AppJsonBlock(value: value, empty: 'Nothing bound yet');
  }
}
