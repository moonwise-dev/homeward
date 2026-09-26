import 'package:common/common.dart';

AgentCard homewardAgentCard(Uri publicUrl) => AgentCard(
  protocolVersion: '0.3.0',
  name: 'Homeward',
  description:
      'Home-buying and relocation advisor: turns the story of a move into a '
      'screen made for that buyer.',
  url: publicUrl.resolve('a2a').toString(),
  version: '1.0.0',
  capabilities: const AgentCapabilities(
    streaming: true,
    extensions: [
      AgentExtension(
        uri: A2uiExtension.uri,
        required: true,
        params: {
          'supportedCatalogIds': [homewardCatalogId],
          'acceptsInlineCatalogs': false,
        },
      ),
    ],
  ),
  securitySchemes: const {
    'firebase': {
      'type': 'http',
      'scheme': 'bearer',
      'bearerFormat': 'Firebase ID token',
    },
    'gemini': {
      'type': 'apiKey',
      'in': 'header',
      'name': 'X-Homeward-Gemini-Key',
    },
  },
  security: const [
    {'firebase': [], 'gemini': []},
  ],
  defaultInputModes: const ['text/plain', 'application/json'],
  defaultOutputModes: const [
    'text/plain',
    A2uiExtension.mimeType,
  ],
  skills: const [
    AgentSkill(
      id: 'relocation',
      name: 'Relocation',
      description:
          "Turns a buyer's story of their move into a screen made for them.",
      tags: ['home-buying', 'relocation'],
    ),
  ],
);
