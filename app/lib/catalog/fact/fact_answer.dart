import 'package:common/common.dart';

Map<String, Object?> factAnswer(BriefItem fact, bool right) => {
  'fact': fact.id,
  'answer': right ? 'right' : 'not_quite',
  'label': '${right ? 'Right' : 'Not quite'}: ${fact.text}',
};
