import 'dotenv.dart';

Map<String, String> developmentEnvironment(
  Map<String, String> process, {
  String? dotenv,
}) => {...parseDotenv(dotenv ?? ''), ...process};
