import 'package:shelf/shelf.dart';

extension HomewardRequestValues on Request {
  static const _callerUid = 'homeward.callerUid';
  static const _geminiKey = 'homeward.geminiKey';

  String? get callerUid => context[_callerUid] as String?;

  String? get geminiKey => context[_geminiKey] as String?;

  Request withCallerUid(String uid) => change(context: {_callerUid: uid});

  Request withGeminiKey(String key) => change(context: {_geminiKey: key});
}
