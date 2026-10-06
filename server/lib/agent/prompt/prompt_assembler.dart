import 'dart:convert';
import 'dart:io';

final class PromptAssembler {
  const PromptAssembler(this.instructions, {this.closing = ''});

  factory PromptAssembler.load(Directory prompts) => PromptAssembler(
    [for (final name in instructionFiles) _read(prompts, name)].join('\n\n'),
    closing: _read(prompts, closingFile),
  );

  static const instructionFiles = [
    'role.md',
    'style.md',
    'generated/catalog_skill.md',
  ];

  static const closingFile = 'reply.md';

  final String instructions;
  final String closing;

  String systemInstruction(Map<String, Object?> turnContext) =>
      '$instructions\n\n'
      '# Turn Context\n\n'
      '```json\n${jsonEncode(turnContext)}\n```\n'
      '${closing.isEmpty ? '' : '\n$closing\n'}';

  static String _read(Directory prompts, String name) =>
      File('${prompts.path}/$name').readAsStringSync().trim();
}
