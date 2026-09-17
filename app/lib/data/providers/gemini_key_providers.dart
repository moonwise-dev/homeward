import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'repository_providers.dart';

part 'gemini_key_providers.g.dart';

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
