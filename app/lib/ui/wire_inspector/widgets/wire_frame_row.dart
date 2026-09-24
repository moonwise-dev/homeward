import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/services/wire_log.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class WireFrameRow extends StatelessWidget {
  const WireFrameRow({required this.entry, this.since, super.key});

  static final _time = DateFormat.Hms();
  static const _indented = JsonEncoder.withIndent('  ');

  final WireEntry entry;
  final Duration? since;

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (entry.direction) {
      WireDirection.sent => (Icons.north_east, AppColors.info),
      WireDirection.received => (Icons.south_west, AppColors.accent),
      WireDirection.local => (Icons.bolt_outlined, AppColors.textTertiary),
    };
    final header = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppSpacing.sm),
        Text(_time.format(entry.at), style: AppTextStyles.caption),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.label, style: AppTextStyles.body),
              Text(_subtitle, style: AppTextStyles.caption),
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceMuted,
                      borderRadius: BorderRadius.circular(AppRadii.sm),
                    ),
                    child: SelectableText(
                      _indented.convert(payload),
                      style: AppTextStyles.code,
                    ),
                  ),
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
