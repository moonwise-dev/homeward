import 'package:flutter/material.dart';

import '../../core/themes/dimens.dart';
import '../../core/ui/app_text_field.dart';

class TellMoreField extends StatelessWidget {
  const TellMoreField({
    required this.draft,
    required this.isRunning,
    required this.onChanged,
    required this.onSend,
    required this.onStop,
    super.key,
  });

  final String draft;
  final bool isRunning;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: AppTextField(
          label: 'Tell Homeward more',
          hintText: 'Ask a question or add to your story',
          value: draft,
          onChanged: onChanged,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.send,
          onSubmitted: (_) => onSend(),
        ),
      ),
      const SizedBox(width: AppSpacing.xs),
      isRunning
          ? IconButton.filledTonal(
              tooltip: 'Stop',
              icon: const Icon(Icons.stop),
              onPressed: onStop,
            )
          : IconButton.filled(
              tooltip: 'Send',
              icon: const Icon(Icons.arrow_upward),
              onPressed: draft.trim().isEmpty ? null : onSend,
            ),
    ],
  );
}
