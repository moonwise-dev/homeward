import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'firebase_options.dart';
import 'messages/app_message_controller.dart';
import 'navigation/app_router.dart';
import 'ui/app_message_overlay.dart';
import 'ui/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      message: ref.watch(appMessageControllerProvider),
      onDismiss: (messageId) => ref
          .read(appMessageControllerProvider.notifier)
          .clear(messageId: messageId),
      child: child ?? const SizedBox.shrink(),
    ),
  );
}
