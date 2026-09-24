import 'package:flutter/material.dart';

import '../../core/ui/app_bullet_list.dart';

class KeyDisclosure extends StatelessWidget {
  const KeyDisclosure({super.key});

  @override
  Widget build(BuildContext context) => const AppBulletList(
    items: [
      'Your key is sent to Homeward\'s server with each message and used only '
          'to call Gemini. Homeward never stores or logs it.',
      'Gemini keeps your conversations under your key, as Google\'s terms '
          'describe.',
      'A free key allows a limited number of requests a day, about 250 '
          'Homeward turns. The limit resets at midnight Pacific time.',
      'On a free key, Google may use your conversations to improve its '
          'products, and people may review them. Google asks that you do not '
          'send sensitive or personal information. Use round figures, or a key '
          'from a Google Cloud project with billing, whose conversations Google '
          'does not use.',
    ],
  );
}
