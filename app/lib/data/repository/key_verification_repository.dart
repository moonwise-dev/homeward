import 'package:common/common.dart';

import 'repository_guard.dart';

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
