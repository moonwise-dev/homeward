import 'dart:convert';
import 'dart:io';

final class PromptAssembler {
  const PromptAssembler(this.instructions);

  factory PromptAssembler.load(Directory prompts) => PromptAssembler(
    [
      for (final name in instructionFiles)
        File('${prompts.path}/$name').readAsStringSync().trim(),
    ].join('\n\n'),
  );

  static const instructionFiles = [
    'role.md',
    'style.md',
    'generated/catalog_skill.md',
  ];

  final String instructions;

  String systemInstruction(Map<String, Object?> turnContext) =>
      '$instructions\n\n'
      '# Turn Context\n\n'
      '```json\n${jsonEncode(turnContext)}\n```\n';
}
