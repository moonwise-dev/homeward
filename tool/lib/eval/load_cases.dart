import 'dart:io';

import 'package:common/common.dart';
import 'package:yaml/yaml.dart';

import 'eval_case.dart';

List<EvalCase> loadCases(Directory directory, {List<String> only = const []}) {
  final files =
      directory
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.yaml'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));
  return [
    for (final file in files)
      if (evalCase(file) case final loaded
          when only.isEmpty || only.contains(loaded.id))
        loaded,
  ];
}

EvalCase evalCase(File file) {
  final document = _map(plain(loadYaml(file.readAsStringSync())));
  return EvalCase(
    id: document['id']! as String,
    persona: document['persona'] as String?,
    buyer: _map(document['buyer'] ?? const <String, Object?>{}),
    turns: [
      for (final turn in document['turns']! as List<Object?>) _turn(_map(turn)),
    ],
  );
}

Object? plain(Object? node) => switch (node) {
  final YamlMap map => {
    for (final MapEntry(:key, :value) in map.entries)
      key.toString(): plain(value),
  },
  final YamlList list => [for (final item in list) plain(item)],
  final YamlScalar scalar => scalar.value,
  _ => node,
};

EvalTurn _turn(Map<String, Object?> turn) => EvalTurn(
  input: switch (turn) {
    {'text': final String text} => EvalText(
      text,
      reason: switch (turn['reason']) {
        final String name => StoryReason.values.byName(name),
        _ => null,
      },
    ),
    {'answer': 'until_summary'} => const EvalAnswers(),
    {'action': final String action} => EvalAction(
      action,
      overrides: _map(turn['data'] ?? const <String, Object?>{}),
      tapped: _map(turn['tapped'] ?? const <String, Object?>{}),
    ),
    _ => throw FormatException(
      'A turn needs text, an action, or answer: until_summary: $turn',
    ),
  },
  expect: _expectations(_map(turn['expect'] ?? const <String, Object?>{})),
);

EvalExpectations _expectations(Map<String, Object?> expect) => EvalExpectations(
  toolsCalled: _strings(expect['tools_called']),
  toolsAllowed: _strings(expect['tools_allowed']),
  market: expect['market'] as String?,
  coverage: expect['coverage'] as String?,
  componentsInclude: _strings(expect['components_include']),
  componentsExclude: _strings(expect['components_exclude']),
  profileFieldsAsked: expect.containsKey('profile_fields_asked')
      ? _strings(expect['profile_fields_asked'])
      : null,
  bindingConstraint: expect['binding_constraint'] as String?,
  maxModelRounds: (expect['max_model_rounds'] as int?) ?? 4,
);

List<String> _strings(Object? value) => [
  for (final item in (value as List<Object?>?) ?? const []) item! as String,
];

Map<String, Object?> _map(Object? value) => switch (value) {
  final Map<String, Object?> map => map,
  final Map<Object?, Object?> map => {
    for (final MapEntry(:key, :value) in map.entries)
      key.toString(): plain(value),
  },
  _ => throw FormatException('Expected a mapping, found $value'),
};
