import 'package:common/common.dart';

AgentCard homewardAgentCard(Uri publicUrl) => AgentCard(
  protocolVersion: '0.3.0',
  name: 'Homeward',
  description:
      'Home-buying finance agent: affordability, purchase costs, and foreign '
      'buyer obstacles for any location.',
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
      id: 'affordability',
      name: 'Affordability',
      description: 'Maximum loan and price, binding constraint, what-if.',
      tags: ['mortgage', 'affordability'],
    ),
    AgentSkill(
      id: 'purchase_costs',
      name: 'Purchase costs',
      description: 'Upfront taxes and fees for a buyer in a market.',
      tags: ['taxes', 'fees'],
    ),
    AgentSkill(
      id: 'foreign_buyer',
      name: 'Foreign buyer',
      description: 'Obstacles, restrictions, and process for non-residents.',
      tags: ['cross-border'],
    ),
    AgentSkill(
      id: 'buying_process',
      name: 'Buying process',
      description: 'Steps and documents for a purchase.',
      tags: ['process', 'documents'],
    ),
  ],
);
