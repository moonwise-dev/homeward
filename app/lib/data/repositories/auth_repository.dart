import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import 'app_check_repository.dart';
import 'repository_guard.dart';

part 'auth_repository.g.dart';

abstract interface class AuthRepository {
  Future<void> ensureSignedIn();

  Future<RequestCredentials> credentials();
}

class FirebaseAuthRepository with RepositoryGuard implements AuthRepository {
  FirebaseAuthRepository(this._auth, this._appCheck);

  final FirebaseAuth _auth;
  final AppCheckRepository _appCheck;

  @override
  Future<void> ensureSignedIn() => guard(() async {
    final restored = await _auth.authStateChanges().first;
    if (restored == null) {
      await _auth.signInAnonymously();
    }
  });

  @override
  Future<RequestCredentials> credentials() => guard(() async {
    final user = _auth.currentUser ?? (await _auth.signInAnonymously()).user!;
    final (idToken, appCheckToken) = await (
      user.getIdToken(),
      _appCheck.token(),
    ).wait;
    return RequestCredentials(
      idToken: idToken!,
      appCheckToken: appCheckToken,
    );
  });
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => FirebaseAuthRepository(
  ref.watch(firebaseAuthProvider),
  ref.watch(appCheckRepositoryProvider),
);
