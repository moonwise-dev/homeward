import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import 'repository_guard.dart';

part 'gemini_key_repository.g.dart';

abstract interface class GeminiKeyRepository {
  bool get canForget;

  Future<String?> read();

  Future<void> save(String key, {required bool remember});

  Future<void> remove();
}

class SecureGeminiKeyRepository
    with RepositoryGuard
    implements GeminiKeyRepository {
  SecureGeminiKeyRepository(this._storage, {required this.canForget});

  static const _name = 'gemini_api_key';
  static const _tab = WebOptions(useSessionStorage: true);
  static const _device = WebOptions();

  final FlutterSecureStorage _storage;

  @override
  final bool canForget;

  @override
  Future<String?> read() => guard(
    () async =>
        await _storage.read(key: _name, webOptions: _tab) ??
        await _storage.read(key: _name, webOptions: _device),
  );

  @override
  Future<void> save(String key, {required bool remember}) => guard(() async {
    await remove();
    await _storage.write(
      key: _name,
      value: key,
      webOptions: remember || !canForget ? _device : _tab,
    );
  });

  @override
  Future<void> remove() => guard(() async {
    await _storage.delete(key: _name, webOptions: _tab);
    await _storage.delete(key: _name, webOptions: _device);
  });
}

@Riverpod(keepAlive: true)
class GeminiKey extends _$GeminiKey {
  @override
  Future<String?> build() => ref.watch(geminiKeyRepositoryProvider).read();

  Future<void> save(String key, {required bool remember}) async {
    await ref.read(geminiKeyRepositoryProvider).save(key, remember: remember);
    state = AsyncData(key);
  }

  Future<void> remove() async {
    await ref.read(geminiKeyRepositoryProvider).remove();
    state = const AsyncData(null);
  }
}

@Riverpod(keepAlive: true)
GeminiKeyRepository geminiKeyRepository(Ref ref) => SecureGeminiKeyRepository(
  ref.watch(secureStorageProvider),
  canForget: kIsWeb,
);
