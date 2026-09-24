import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/research/research.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  final prompts = Directory('prompts');
  final assembler = PromptAssembler.load(prompts);
  final handWritten = {
    for (final name in PromptAssembler.instructionFiles)
      if (!name.startsWith('generated/'))
        name: File('${prompts.path}/$name').readAsStringSync(),
  };

  test('joins the instructions in order and ends with the turn context', () {
    final instruction = assembler.systemInstruction({'turn': 3});
    final headings = [
      '# Role',
      '# Flow',
      '# Markets',
      '# Style',
      '# Drawing The Interface',
      '# Turn Context',
    ].map(instruction.indexOf).toList();

    expect(headings, everyElement(isNonNegative));
    expect(headings, orderedEquals([...headings]..sort()));
    expect(
      instruction,
      endsWith(
        '# Turn Context\n\n```json\n${const JsonEncoder.withIndent('  ').convert({'turn': 3})}\n```\n',
      ),
    );
  });

  test('hand-written prompts state no rule values', () {
    final value = RegExp(r'\d\s*%|\d[\d,.]*\s*(SEK|EUR|kr|€)');
    for (final MapEntry(key: name, value: text) in handWritten.entries) {
      expect(value.hasMatch(text), isFalse, reason: name);
    }
  });

  test('hand-written prompts name only tools, actions, components, and '
      'decisions that exist', () {
    final research = Research.open(
      MockClient((_) async => http.Response('[]', 200)),
      userAgent: 'Homeward test',
    );
    final tools = {for (final tool in allTools(research)) tool.name};
    final functions = {for (final function in homewardFunctions) function.name};
    final components = {
      ...agentVisibleBasicComponents,
      for (final component in homewardComponents) component.name,
    };
    final flow = handWritten['flow.md']!;

    for (final MapEntry(key: name, value: text) in handWritten.entries) {
      for (final match in RegExp('`([a-z]+_[a-z_]+)`').allMatches(text)) {
        expect(
          {...tools, ...SurfaceAction.wireNames},
          contains(match[1]),
          reason: name,
        );
      }
      for (final match in RegExp('`([A-Z][a-z]+[A-Za-z]*)`').allMatches(text)) {
        expect(components, contains(match[1]), reason: name);
      }
      for (final match in RegExp('`(within[A-Za-z]+)`').allMatches(text)) {
        expect(functions, contains(match[1]), reason: name);
      }
    }
    for (final decision in OpenDecision.values) {
      expect(flow, contains('| `${decision.name}` |'));
    }
  });
}
