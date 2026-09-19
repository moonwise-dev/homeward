import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/providers/repository_providers.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/app_radii.dart';
import '../../../ui/app_spacing.dart';
import '../../../ui/app_text_styles.dart';

class SurfaceDataView extends HookConsumerWidget {
  const SurfaceDataView({
    required this.sessionId,
    required this.surfaceId,
    super.key,
  });

  static const _indented = JsonEncoder.withIndent('  ');

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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: SelectableText(
        value == null ? 'Nothing bound yet' : _indented.convert(value),
        style: AppTextStyles.code,
      ),
    );
  }
}
