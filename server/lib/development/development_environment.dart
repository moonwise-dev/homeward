import 'dart:convert';

import 'dotenv.dart';

Map<String, String> developmentEnvironment(
  Map<String, String> process, {
  String? dotenv,
  String? firebaserc,
}) => {
  'HOMEWARD_APP_CHECK_ENFORCED': 'false',
  ...?_project(firebaserc),
  ...parseDotenv(dotenv ?? ''),
  ...process,
};

Map<String, String>? _project(String? firebaserc) {
  if (firebaserc == null) {
    return null;
  }
  final projects = (jsonDecode(firebaserc) as Map<String, Object?>)['projects'];
  final project = projects is Map<String, Object?> ? projects['default'] : null;
  return project is String ? {'GOOGLE_CLOUD_PROJECT': project} : null;
}
