import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/app_check_repository.dart';
import '../../../data/repositories/auth_repository.dart';

part 'app_session.g.dart';

@Riverpod(keepAlive: true)
Future<void> appSession(Ref ref) async {
  await ref.watch(appCheckRepositoryProvider).activate();
  await ref.watch(authRepositoryProvider).ensureSignedIn();
}
