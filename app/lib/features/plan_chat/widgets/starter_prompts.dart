import 'package:flutter/material.dart';

import '../../../ui/app_spacing.dart';
import '../../../ui/app_suggestion.dart';
import '../../../ui/app_text_styles.dart';

const _starterPrompts = [
  'We are a couple in Stockholm looking at a 3-room flat in Södermalm for '
      'about 4.5 million kronor',
  'I live in Stockholm and want a two-bedroom flat in Funchal, around €350k.',
  'What could we borrow for a flat in Gothenburg on our salaries?',
];

class StarterPrompts extends StatelessWidget {
  const StarterPrompts({required this.onSelected, super.key});

  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('Start with', style: AppTextStyles.label),
      const SizedBox(height: AppSpacing.xs),
      for (final prompt in _starterPrompts)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: AppSuggestion(
            text: prompt,
            onPressed: () => onSelected(prompt),
          ),
        ),
    ],
  );
}
