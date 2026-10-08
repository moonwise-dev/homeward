import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/repositories/appearance_repository.dart';
import 'ui/core/messages/app_messages.dart';
import 'routing/router.dart';
import 'ui/core/messages/app_message_overlay.dart';
import 'ui/core/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  usePathUrlStrategy();
  runApp(const ProviderScope(child: HomewardApp()));
}

class HomewardApp extends ConsumerWidget {
  const HomewardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'Homeward',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ref.watch(appearanceProvider).value ?? ThemeMode.system,
    routerConfig: ref.watch(appRouterProvider),
    builder: (context, child) => AppMessageOverlay(
      message: ref.watch(appMessagesProvider),
      onDismiss: (messageId) =>
          ref.read(appMessagesProvider.notifier).clear(messageId: messageId),
      child: child ?? const SizedBox.shrink(),
    ),
  );
}
