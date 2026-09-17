import 'package:flutter/material.dart';

import '../../ui/app_button.dart';
import '../../ui/app_button_variant.dart';
import '../../ui/app_select_field.dart';
import '../../ui/app_select_option.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_stepper.dart';
import '../../ui/app_text_styles.dart';

class HouseholdInputView extends StatelessWidget {
  const HouseholdInputView({
    required this.label,
    required this.adults,
    required this.childAges,
    required this.onAdultsChanged,
    required this.onChildAgesChanged,
    super.key,
  });

  static const maxAdults = 8;
  static const maxChildAge = 25;

  final String label;
  final int? adults;
  final List<int>? childAges;
  final ValueChanged<int> onAdultsChanged;
  final ValueChanged<List<int>> onChildAgesChanged;

  @override
  Widget build(BuildContext context) {
    final childAges = this.childAges;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xs),
        AppStepper(
          label: 'Adults',
          value: adults,
          min: 1,
          max: maxAdults,
          onChanged: onAdultsChanged,
        ),
        for (final (index, age) in (childAges ?? const <int>[]).indexed) ...[
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: AppSelectField<int>(
                  label: 'Child ${index + 1}, age',
                  options: _ageOptions,
                  value: age,
                  onChanged: (selected) =>
                      onChildAgesChanged([...?childAges]..[index] = selected),
                ),
              ),
              IconButton(
                tooltip: 'Remove child ${index + 1}',
                onPressed: () =>
                    onChildAgesChanged([...?childAges]..removeAt(index)),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (childAges == null)
              AppButton(
                label: 'No children',
                variant: AppButtonVariant.outlined,
                onPressed: () => onChildAgesChanged(const []),
              )
            else if (childAges.isEmpty)
              Text('No children at home', style: AppTextStyles.caption),
            AppButton(
              label: 'Add a child',
              icon: Icons.add,
              variant: AppButtonVariant.text,
              onPressed: () => onChildAgesChanged([...?childAges, 0]),
            ),
          ],
        ),
      ],
    );
  }
}

final _ageOptions = [
  for (var age = 0; age <= HouseholdInputView.maxChildAge; age++)
    AppSelectOption(value: age, label: age == 0 ? 'Under 1' : '$age'),
];
