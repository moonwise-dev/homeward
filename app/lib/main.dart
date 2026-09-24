import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'ui/core/messages/app_messages.dart';
import 'routing/router.dart';
import 'ui/core/messages/app_message_overlay.dart';
import 'ui/core/themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  usePathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: HomewardApp()));
}

class HomewardApp extends ConsumerWidget {
  const HomewardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'Homeward',
    theme: AppTheme.light,
    routerConfig: ref.watch(appRouterProvider),
    builder: (context, child) => AppMessageOverlay(
      message: ref.watch(appMessagesProvider),
      onDismiss: (messageId) =>
          ref.read(appMessagesProvider.notifier).clear(messageId: messageId),
      child: child ?? const SizedBox.shrink(),
    ),
  );
}
