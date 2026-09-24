import 'package:flutter/material.dart';

import '../../../ui/app_text_styles.dart';

class StepPager extends StatelessWidget {
  const StepPager({
    required this.page,
    required this.count,
    required this.onChanged,
    super.key,
  });

  final int page;
  final int count;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        tooltip: 'Earlier step',
        icon: const Icon(Icons.chevron_left),
        onPressed: page > 0 ? () => onChanged(page - 1) : null,
      ),
      Text('Step ${page + 1} of $count', style: AppTextStyles.label),
      IconButton(
        tooltip: 'Later step',
        icon: const Icon(Icons.chevron_right),
        onPressed: page < count - 1 ? () => onChanged(page + 1) : null,
      ),
    ],
  );
}
