import 'dart:io';

String firebaseWebApiKey(File firebaseOptions) {
  final source = firebaseOptions.readAsStringSync();
  final web = RegExp(
    r"web = FirebaseOptions\(\s*apiKey: '([^']+)'",
  ).firstMatch(source);
  if (web == null) {
    throw StateError('No web apiKey in ${firebaseOptions.path}');
  }
  return web.group(1)!;
}
