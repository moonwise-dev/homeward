import 'dart:math';

final _random = Random.secure();

String randomRequestId() => List.generate(
  8,
  (_) => _random.nextInt(256).toRadixString(16).padLeft(2, '0'),
).join();
