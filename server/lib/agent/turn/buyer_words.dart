import 'package:common/common.dart';

List<String> buyerWords(Iterable<RecordedInput> inputs) => [
  for (final input in inputs)
    ...switch (input) {
      RecordedText(:final text) => [text],
      RecordedAction(:final context) => _strings(context),
    },
];

Iterable<String> _strings(Object? json) sync* {
  switch (json) {
    case final String text:
      yield text;
    case final num number:
      yield '$number';
    case final Map<String, Object?> map:
      for (final MapEntry(:key, :value) in map.entries) {
        if (key != 'label') {
          yield* _strings(value);
        }
      }
    case final List<Object?> list:
      for (final item in list) {
        yield* _strings(item);
      }
  }
}
