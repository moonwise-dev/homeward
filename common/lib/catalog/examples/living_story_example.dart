import 'dart:convert';

const _stockholm = {'lat': 59.3293, 'lng': 18.0686};

final livingStoryDataModel = jsonDecode(
  jsonEncode({
    'story': {
      'reason': ['study'],
      'city': 'Stockholm',
      'mode': ['transit'],
      'maxMinutes': 30,
      'picks': {
        'schools': <String>[],
        'everyday': <String>[],
        'activities': ['parks'],
        'evenings': ['quiet'],
        'gettingAround': <String>[],
        'downsides': <String>[],
      },
      'mustHaves': <String>[],
      'pins': <String, Object?>{},
      'center': _stockholm,
      'markers': [
        {
          'id': 'city',
          'label': 'Stockholm',
          'kind': 'city',
          ..._stockholm,
        },
      ],
      'anchors': <Object?>[],
      'candidates': <Object?>[],
      'criteria': <Object?>[],
    },
  }),
) as Map<String, Object?>;
