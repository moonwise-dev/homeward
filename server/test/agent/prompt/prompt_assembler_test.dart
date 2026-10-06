import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:test/test.dart';

import '../../support/test_markets.dart';
import '../../support/test_research.dart';

void main() {
  final prompts = Directory('prompts');
  final assembler = PromptAssembler.load(prompts);
  final handWritten = {
    for (final name in [
      ...PromptAssembler.instructionFiles,
      PromptAssembler.closingFile,
    ])
      if (!name.startsWith('generated/'))
        name: File('${prompts.path}/$name').readAsStringSync(),
  };

  test('joins the instructions in order around the turn context', () {
    final instruction = assembler.systemInstruction({'turn': 3});
    final headings = [
      '# Role',
      '# Style',
      '# Drawing The Interface',
      '# Turn Context',
      '# Before You Reply',
    ].map(instruction.indexOf).toList();

    expect(headings, everyElement(isNonNegative));
    expect(headings, orderedEquals([...headings]..sort()));
    expect(
      instruction,
      contains(
        '# Turn Context\n\n```json\n${jsonEncode({'turn': 3})}\n```\n'
        '\n# Before You Reply',
      ),
    );
  });

  test('hand-written prompts state no rule values', () {
    final value = RegExp(r'\d\s*%|\d[\d,.]*\s*(SEK|EUR|kr|€)');
    for (final MapEntry(key: name, value: text) in handWritten.entries) {
      expect(value.hasMatch(text), isFalse, reason: name);
    }
  });

  test('hand-written prompts name only tools and components that exist', () {
    final tools = {
      for (final tool in homewardTools(testMarkets, testResearch)) tool.name,
    };
    final components = {
      ...agentVisibleBasicComponents,
      for (final component in homewardComponents) component.name,
    };

    for (final MapEntry(key: name, value: text) in handWritten.entries) {
      for (final match in RegExp('`([a-z]+_[a-z_]+)`').allMatches(text)) {
        expect(tools, contains(match[1]), reason: name);
      }
      for (final match in RegExp('`([A-Z][a-z]+[A-Za-z]*)`').allMatches(text)) {
        expect(components, contains(match[1]), reason: name);
      }
    }
  });
}
