import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import 'repository_guard.dart';

part 'key_verification_repository.g.dart';

abstract interface class KeyVerificationRepository {
  Future<void> verify(String geminiKey);
}

class ServerKeyVerificationRepository
    with RepositoryGuard
    implements KeyVerificationRepository {
  ServerKeyVerificationRepository(this._client);

  final HomewardClient _client;

  @override
  Future<void> verify(String geminiKey) =>
      guard(() => _client.verifyKey(geminiKey));
}

@riverpod
KeyVerificationRepository keyVerificationRepository(Ref ref) =>
    ServerKeyVerificationRepository(ref.watch(homewardClientProvider));
