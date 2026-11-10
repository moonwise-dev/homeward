import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class TellMoreField extends HookWidget {
  const TellMoreField({
    required this.draft,
    required this.isRunning,
    required this.onChanged,
    required this.onSend,
    required this.onStop,
    this.autofocus = false,
    super.key,
  });

  final bool autofocus;

  final String draft;
  final bool isRunning;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final controller = useTextEditingController(text: draft);
    useEffect(() {
      if (controller.text != draft) {
        controller.value = TextEditingValue(
          text: draft,
          selection: TextSelection.collapsed(offset: draft.length),
        );
      }
      return null;
    }, [draft]);
    final canSend = draft.trim().isNotEmpty;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: BorderRadius.circular(AppRadii.xl + 6),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md + 4,
          AppSpacing.xxs,
          AppSpacing.xs - 2,
          AppSpacing.xxs,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: TextField(
                  controller: controller,
                  autofocus: autofocus,
                  onChanged: onChanged,
                  onSubmitted: (_) => onSend(),
                  minLines: 1,
                  maxLines: 4,
                  textInputAction: TextInputAction.send,
                  style: styles.body,
                  decoration: InputDecoration(
                    hintText: 'Ask Homeward, or tell it more',
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                    hintStyle: styles.body.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: _RoundButton(
                tooltip: isRunning ? 'Stop' : 'Send',
                icon: isRunning ? Icons.stop_rounded : Icons.arrow_upward,
                fill: isRunning || canSend ? colors.brand : colors.border,
                ink: isRunning || canSend
                    ? colors.onBrand
                    : colors.textTertiary,
                onPressed: isRunning
                    ? onStop
                    : canSend
                    ? onSend
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({
    required this.tooltip,
    required this.icon,
    required this.fill,
    required this.ink,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final Color fill;
  final Color ink;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: Semantics(
      button: true,
      enabled: onPressed != null,
      label: tooltip,
      excludeSemantics: true,
      child: Material(
        color: fill,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 40,
            child: Icon(icon, size: 22, color: ink),
          ),
        ),
      ),
    ),
  );
}
