import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/gemini_key_repository.dart';
import '../ui/api_key/widgets/api_key_screen.dart';
import '../ui/gallery/widgets/gallery_screen.dart';
import '../ui/journey/widgets/journey_screen.dart';
import '../ui/plans/widgets/plans_screen.dart';
import '../ui/startup/view_model/app_session.dart';
import '../ui/startup/widgets/startup_screen.dart';
import 'routes.dart';

part 'router.g.dart';

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
        builder: (context, state) => const GalleryScreen(),
      ),
      GoRoute(
        path: AppRoutes.galleryComponent,
        builder: (context, state) =>
            GalleryScreen(componentName: state.pathParameters['component']),
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
  if (path == AppRoutes.gallery || path.startsWith('${AppRoutes.gallery}/')) {
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
