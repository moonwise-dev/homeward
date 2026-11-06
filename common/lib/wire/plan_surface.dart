const planSurfaceId = 'plan';

const planMoreId = 'more';

String componentIdOf(String key) {
  final id = key.replaceAll(_notInIdentifier, '_');
  return id.startsWith(_leadingDigit) ? 'c_$id' : id;
}

final _notInIdentifier = RegExp('[^A-Za-z0-9_]');

final _leadingDigit = RegExp('^[0-9]');
