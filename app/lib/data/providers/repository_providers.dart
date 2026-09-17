import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../catalog/homeward_genui_catalog.dart';
import '../repository/agent_repository.dart';
import '../repository/app_check_repository.dart';
import '../repository/auth_repository.dart';
import '../repository/gallery_repository.dart';
import '../repository/gemini_key_repository.dart';
import '../repository/key_verification_repository.dart';
import '../repository/plans_repository.dart';
import 'dependency_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AppCheckRepository appCheckRepository(Ref ref) => FirebaseAppCheckRepository(
  ref.watch(firebaseAppCheckProvider),
  recaptchaSiteKey: kRecaptchaSiteKey,
  debugToken: kAppCheckDebugToken.isEmpty ? null : kAppCheckDebugToken,
);

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => FirebaseAuthRepository(
  ref.watch(firebaseAuthProvider),
  ref.watch(appCheckRepositoryProvider),
);

@Riverpod(keepAlive: true)
HomewardClient homewardClient(Ref ref) => HomewardClient(
  httpClient: ref.watch(httpClientProvider),
  server: Uri.parse(kServerUrl),
  credentials: ref.watch(authRepositoryProvider).credentials,
);

@Riverpod(keepAlive: true)
GeminiKeyRepository geminiKeyRepository(Ref ref) => SecureGeminiKeyRepository(
  ref.watch(secureStorageProvider),
  canForget: kIsWeb,
);

@riverpod
KeyVerificationRepository keyVerificationRepository(Ref ref) =>
    ServerKeyVerificationRepository(ref.watch(homewardClientProvider));

@Riverpod(keepAlive: true)
PlansRepository plansRepository(Ref ref) =>
    SessionPlansRepository(ref.watch(homewardClientProvider));

@Riverpod(keepAlive: true)
AgentRepository agentRepository(Ref ref) => GenUiAgentRepository(
  ref.watch(homewardClientProvider),
  ref.watch(geminiKeyRepositoryProvider),
  homewardGenuiCatalog(),
);

@Riverpod(keepAlive: true)
GalleryRepository galleryRepository(Ref ref) =>
    GenUiGalleryRepository(homewardGenuiCatalog());
