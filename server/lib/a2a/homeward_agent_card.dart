import 'package:common/common.dart';

AgentCard homewardAgentCard(Uri publicUrl) => AgentCard(
  protocolVersion: '0.3.0',
  name: 'Homeward',
  description:
      'Home-finance agent: works out what a home costs one household and '
      'whether they can carry it, and builds the screen made for that '
      'household.',
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
      id: 'home-finance',
      name: 'Home finance',
      description:
          'Works out what a household can borrow, what a home costs them '
          'each month, and how it holds up, and builds a screen made for them.',
      tags: ['home-finance', 'mortgage', 'rent'],
    ),
  ],
);
