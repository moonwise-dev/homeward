import 'dart:math';

final _random = Random.secure();

String randomHex(int bytes) => List.generate(
  bytes,
  (_) => _random.nextInt(256).toRadixString(16).padLeft(2, '0'),
).join();
