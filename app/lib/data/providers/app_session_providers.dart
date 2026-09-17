import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'repository_providers.dart';

part 'app_session_providers.g.dart';

@Riverpod(keepAlive: true)
Future<void> appSession(Ref ref) async {
  await ref.watch(appCheckRepositoryProvider).activate();
  await ref.watch(authRepositoryProvider).ensureSignedIn();
}
