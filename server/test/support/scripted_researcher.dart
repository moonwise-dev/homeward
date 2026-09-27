import 'package:homeward_server/research/researcher.dart';

final class ScriptedResearcher implements Researcher {
  ScriptedResearcher(this.readings);

  final List<Map<String, Object?>> readings;
  final questions = <String>[];

  @override
  Future<Map<String, Object?>> answer({
    required String instruction,
    required String question,
    required Map<String, Object?> schema,
  }) async {
    questions.add(question);
    return {'readings': readings};
  }
}
