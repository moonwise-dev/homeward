import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppJsonBlock extends HookWidget {
  const AppJsonBlock({
    required this.value,
    this.empty = 'Nothing yet',
    this.copyable = false,
    super.key,
  });

  static const _indented = JsonEncoder.withIndent('  ');

  final Object? value;
  final String empty;
  final bool copyable;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final copied = useState(false);
    final text = value == null ? empty : _indented.convert(value);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SelectableText(text, style: styles.code)),
          if (copyable && value != null)
            IconButton(
              tooltip: copied.value ? 'Copied' : 'Copy',
              icon: Icon(
                copied.value ? Icons.check : Icons.copy_outlined,
                size: 18,
              ),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: text));
                copied.value = true;
              },
            ),
        ],
      ),
    );
  }
}
