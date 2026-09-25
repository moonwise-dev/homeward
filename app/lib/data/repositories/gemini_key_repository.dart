import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../services/development_server.dart';
import 'repository_guard.dart';

part 'gemini_key_repository.g.dart';

abstract interface class GeminiKeyRepository {
  bool get canForget;

  Future<String?> read();

  Future<void> save(String key, {required bool remember});

  Future<void> remove();

  Future<bool> useNextKey();
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

  @override
  Future<bool> useNextKey() async => false;
}

class DevelopmentGeminiKeyRepository implements GeminiKeyRepository {
  DevelopmentGeminiKeyRepository(this._saved, this._server);

  final GeminiKeyRepository _saved;
  final DevelopmentServer _server;
  List<String>? _keys;
  var _current = 0;

  @override
  bool get canForget => _saved.canForget;

  @override
  Future<String?> read() async =>
      await _saved.read() ??
      (await _developmentKeys()).elementAtOrNull(_current);

  @override
  Future<void> save(String key, {required bool remember}) =>
      _saved.save(key, remember: remember);

  @override
  Future<void> remove() => _saved.remove();

  @override
  Future<bool> useNextKey() async {
    if (await _saved.read() != null ||
        _current >= (await _developmentKeys()).length - 1) {
      return false;
    }
    _current++;
    return true;
  }

  Future<List<String>> _developmentKeys() async =>
      _keys ??= await _server.geminiKeys();
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
GeminiKeyRepository geminiKeyRepository(Ref ref) {
  final saved = SecureGeminiKeyRepository(
    ref.watch(secureStorageProvider),
    canForget: kIsWeb,
  );
  return kReleaseMode
      ? saved
      : DevelopmentGeminiKeyRepository(
          saved,
          ref.watch(developmentServerProvider),
        );
}
