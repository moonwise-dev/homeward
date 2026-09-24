import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/core/themes/theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('every slot a surface can reach draws in a Homeward face', () {
    final theme = AppTheme.light.textTheme;
    final slots = <String, TextStyle?>{
      'displayLarge': theme.displayLarge,
      'displayMedium': theme.displayMedium,
      'displaySmall': theme.displaySmall,
      'headlineLarge': theme.headlineLarge,
      'headlineMedium': theme.headlineMedium,
      'headlineSmall': theme.headlineSmall,
      'titleLarge': theme.titleLarge,
      'titleMedium': theme.titleMedium,
      'titleSmall': theme.titleSmall,
      'bodyLarge': theme.bodyLarge,
      'bodyMedium': theme.bodyMedium,
      'bodySmall': theme.bodySmall,
      'labelLarge': theme.labelLarge,
      'labelMedium': theme.labelMedium,
      'labelSmall': theme.labelSmall,
    };
    for (final MapEntry(:key, :value) in slots.entries) {
      expect(value?.fontFamily, isNotNull, reason: key);
    }
  });
}
