import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import 'repository_guard.dart';

part 'appearance_repository.g.dart';

class AppearanceRepository with RepositoryGuard {
  AppearanceRepository(this._storage);

  static const _name = 'theme_mode';

  final FlutterSecureStorage _storage;

  Future<ThemeMode> read() => guard(
    () async =>
        ThemeMode.values.asNameMap()[await _storage.read(key: _name)] ??
        ThemeMode.system,
  );

  Future<void> save(ThemeMode mode) =>
      guard(() => _storage.write(key: _name, value: mode.name));
}

@Riverpod(keepAlive: true)
AppearanceRepository appearanceRepository(Ref ref) =>
    AppearanceRepository(ref.watch(secureStorageProvider));

@Riverpod(keepAlive: true)
class Appearance extends _$Appearance {
  @override
  Future<ThemeMode> build() => ref.watch(appearanceRepositoryProvider).read();

  Future<void> choose(ThemeMode mode) async {
    state = AsyncData(mode);
    await ref.read(appearanceRepositoryProvider).save(mode);
  }
}
