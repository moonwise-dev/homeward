import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/services/wire_log.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_json_block.dart';

class WireFrameRow extends StatelessWidget {
  const WireFrameRow({required this.entry, this.since, super.key});

  static final _time = DateFormat.Hms();

  final WireEntry entry;
  final Duration? since;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final (icon, color) = switch (entry.direction) {
      WireDirection.sent => (Icons.north_east, colors.info),
      WireDirection.received => (Icons.south_west, colors.accent),
      WireDirection.local => (Icons.bolt_outlined, colors.textTertiary),
    };
    final header = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppSpacing.sm),
        Text(_time.format(entry.at), style: styles.caption),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.label, style: styles.body),
              Text(_subtitle, style: styles.caption),
            ],
          ),
        ),
      ],
    );
    final payload = entry.payload;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: payload == null
          ? header
          : Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: header,
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(bottom: AppSpacing.sm),
                shape: const Border(),
                children: [
                  AppJsonBlock(value: payload),
                ],
              ),
            ),
    );
  }

  String get _subtitle => [
    ?entry.detail,
    ?entry.surfaceId,
    if (entry.bytes case final bytes?) byteSize(bytes),
    if (since case final since?) '+${elapsedLabel(since)}',
  ].join(' · ');
}

String byteSize(int bytes) => switch (bytes) {
  < 1000 => '$bytes B',
  < 100000 => '${(bytes / 1000).toStringAsFixed(1)} kB',
  _ => '${(bytes / 1000).round()} kB',
};

String elapsedLabel(Duration elapsed) {
  final milliseconds = elapsed.inMilliseconds;
  return milliseconds < 1000
      ? '$milliseconds ms'
      : '${(milliseconds / 1000).toStringAsFixed(1)} s';
}
