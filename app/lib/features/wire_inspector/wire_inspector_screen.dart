import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/wire_entry.dart';
import '../../data/providers/repository_providers.dart';
import '../../ui/app_colors.dart';
import '../../ui/app_sizes.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_status_line.dart';
import '../../ui/app_text_styles.dart';

class WireInspectorScreen extends ConsumerWidget {
  const WireInspectorScreen({super.key});

  static final _time = DateFormat.Hms();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final log = ref.watch(wireLogProvider);
    final entries = ref.watch(wireEntriesProvider).value ?? log.entries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wire inspector'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear',
            onPressed: log.clear,
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: AppStatusLine(
                  icon: Icons.bolt_outlined,
                  color: AppColors.accent,
                  text: switch (log.localSinceNetwork) {
                    0 => 'Nothing recomputed since the last frame',
                    1 => '1 recompute on the device since the last frame',
                    final count =>
                      '$count recomputes on the device since the last frame',
                  },
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: entries.isEmpty
                    ? const Center(
                        child: AppStatusLine(text: 'No traffic yet'),
                      )
                    : ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        itemCount: entries.length,
                        itemBuilder: (context, index) => _WireRow(
                          entry: entries[entries.length - 1 - index],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WireRow extends StatelessWidget {
  const _WireRow({required this.entry});

  final WireEntry entry;

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (entry.direction) {
      WireDirection.sent => (Icons.north_east, AppColors.info),
      WireDirection.received => (Icons.south_west, AppColors.accent),
      WireDirection.local => (Icons.bolt_outlined, AppColors.textTertiary),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: AppSpacing.sm),
          Text(
            WireInspectorScreen._time.format(entry.at),
            style: AppTextStyles.caption,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.label, style: AppTextStyles.body),
                if (entry.detail case final detail?)
                  Text(detail, style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
