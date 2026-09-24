import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/providers/app_session_providers.dart';
import '../data/providers/gemini_key_providers.dart';
import '../features/api_key/api_key_screen.dart';
import '../features/catalog_gallery/catalog_gallery_screen.dart';
import '../features/journey/journey_screen.dart';
import '../features/plans/plans_screen.dart';
import '../features/startup/startup_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refresh = ValueNotifier(0);
  ref
    ..onDispose(refresh.dispose)
    ..listen(appSessionProvider, (_, _) => refresh.value++)
    ..listen(geminiKeyProvider, (_, _) => refresh.value++);

  return GoRouter(
    refreshListenable: refresh,
    initialLocation: AppRoutes.startup,
    routes: [
      GoRoute(
        path: AppRoutes.startup,
        builder: (context, state) => const StartupScreen(),
      ),
      GoRoute(
        path: AppRoutes.geminiKey,
        builder: (context, state) => const ApiKeyScreen(),
      ),
      GoRoute(
        path: AppRoutes.plans,
        builder: (context, state) => const PlansScreen(),
      ),
      GoRoute(
        path: AppRoutes.gallery,
        builder: (context, state) => const CatalogGalleryScreen(),
      ),
      GoRoute(
        path: AppRoutes.plan,
        builder: (context, state) =>
            JourneyScreen(sessionId: state.pathParameters['sessionId']!),
      ),
    ],
    redirect: (context, state) => _redirect(
      state.uri.path,
      ref.read(appSessionProvider),
      ref.read(geminiKeyProvider),
    ),
  );
}

String? _redirect(
  String path,
  AsyncValue<void> session,
  AsyncValue<String?> geminiKey,
) {
  if (path == AppRoutes.gallery) {
    return null;
  }
  if (!session.hasValue || !geminiKey.hasValue) {
    return path == AppRoutes.startup ? null : AppRoutes.startup;
  }
  if (geminiKey.value == null) {
    return path == AppRoutes.geminiKey ? null : AppRoutes.geminiKey;
  }
  return path == AppRoutes.startup ? AppRoutes.plans : null;
}
