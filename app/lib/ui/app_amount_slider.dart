import 'package:flutter/material.dart';

import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppAmountSlider extends StatelessWidget {
  const AppAmountSlider({
    required this.label,
    required this.valueText,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.divisions,
    this.shareText,
    this.minText,
    this.maxText,
    this.enabled = true,
    super.key,
  });

  final String label;
  final String valueText;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final String? shareText;
  final String? minText;
  final String? maxText;
  final bool enabled;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final shareText = this.shareText;
    final canSlide = enabled && max > min;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(child: Text(valueText, style: AppTextStyles.figureLarge)),
            if (shareText != null) Text(shareText, style: AppTextStyles.figure),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: canSlide ? max : min + 1,
          divisions: divisions,
          semanticFormatterCallback: (_) => valueText,
          onChanged: canSlide ? onChanged : null,
        ),
        if (minText != null && maxText != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(minText!, style: AppTextStyles.caption),
              Text(maxText!, style: AppTextStyles.caption),
            ],
          ),
      ],
    );
  }
}
