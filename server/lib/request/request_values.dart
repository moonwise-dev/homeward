import 'package:shelf/shelf.dart';

extension HomewardRequestValues on Request {
  static const _geminiKey = 'homeward.geminiKey';

  String? get geminiKey => context[_geminiKey] as String?;

  Request withGeminiKey(String key) => change(context: {_geminiKey: key});
}
