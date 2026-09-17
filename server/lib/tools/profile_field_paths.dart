import 'package:common/common.dart';

List<String> profileFieldPaths(ProfileField field) => [
  for (final key in field.profileKeys) profileSlice.pathOf(key),
];
