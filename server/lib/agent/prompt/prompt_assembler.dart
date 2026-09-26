import 'dart:convert';
import 'dart:io';

final class PromptAssembler {
  const PromptAssembler(this.instructions);

  factory PromptAssembler.load(Directory prompts, {bool deal = true}) =>
      PromptAssembler(
        [
          for (final name in instructionFiles(deal: deal))
            File('${prompts.path}/$name').readAsStringSync().trim(),
        ].join('\n\n'),
      );

  static List<String> instructionFiles({required bool deal}) => [
    'role.md',
    'flow.md',
    if (deal) ...['deal.md', 'markets.md'],
    'style.md',
    deal ? 'generated/catalog_skill.md' : 'generated/catalog_skill_story.md',
  ];

  final String instructions;

  String systemInstruction(Map<String, Object?> turnContext) =>
      '$instructions\n\n'
      '# Turn Context\n\n'
      '```json\n${const JsonEncoder.withIndent('  ').convert(turnContext)}\n```\n';
}
