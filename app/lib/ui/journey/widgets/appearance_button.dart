import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/appearance_repository.dart';

class AppearanceButton extends ConsumerWidget {
  const AppearanceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosen = ref.watch(appearanceProvider).value ?? ThemeMode.system;
    return PopupMenuButton<ThemeMode>(
      tooltip: 'Appearance',
      icon: const Icon(Icons.contrast),
      onSelected: ref.read(appearanceProvider.notifier).choose,
      itemBuilder: (context) => [
        for (final mode in ThemeMode.values)
          CheckedPopupMenuItem(
            value: mode,
            checked: mode == chosen,
            child: Text(switch (mode) {
              ThemeMode.system => 'Match the device',
              ThemeMode.light => 'Light',
              ThemeMode.dark => 'Dark',
            }),
          ),
      ],
    );
  }
}
