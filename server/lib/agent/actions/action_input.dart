import 'dart:convert';

import 'package:common/common.dart';

String actionInput(ClientAction action, Map<String, Object?> surfaceData) => [
  'The buyer used a control on a surface instead of typing:',
  jsonEncode({
    'action': action.name,
    'surfaceId': action.surfaceId,
    'component': action.sourceComponentId,
    if (action.context.isNotEmpty) 'context': action.context,
    if (surfaceData.isNotEmpty) 'surfaceData': surfaceData,
  }),
].join('\n');
