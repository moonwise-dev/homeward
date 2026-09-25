import 'package:common/common.dart';
import 'package:homeward_tool/eval/simulated_buyer.dart';
import 'package:test/test.dart';

void main() {
  final buyer = SimulatedBuyer(
    const {
      'place': 'KTH',
      'mode': 'bike',
      'maxMinutes': 25,
      'homeType': 'house',
      'outdoor': 'garden',
      'adults': 2,
      'childAges': [6, 9],
      'areas': ['danderyd'],
    },
    photo: (id) => switch (id) {
      'garden' => const Photo(
        id: 'garden',
        caption: 'A house with a garden',
        credit: PhotoCredit(name: 'A', url: 'https://example.com'),
        traits: PhotoTraits(
          homeType: HomeType.house,
          outdoor: OutdoorSpace.garden,
        ),
      ),
      _ => null,
    },
  );

  ({
    String surfaceId,
    List<Map<String, Object?>> components,
    Map<String, Object?> data,
  })
  surface(
    List<Map<String, Object?>> components, [
    Map<String, Object?>? data,
  ]) => (surfaceId: 't2-clue', components: components, data: data ?? const {});

  const answer = {
    'event': {'name': 'answer', 'context': <String, Object?>{}},
  };

  test('taps the hunch option that names their place', () {
    final action = buyer
        .answer(
          surface([
            {
              'id': 'root',
              'component': 'Hunch',
              'facet': 'place',
              'options': [
                {
                  'label': 'Stockholm University',
                  'value': 'Stockholm University',
                },
                {'label': 'KTH', 'value': 'KTH Royal Institute of Technology'},
              ],
              'answer': answer,
            },
          ]),
        )!
        .action;

    expect(action.name, 'answer');
    expect(
      action.context,
      containsPair('value', 'KTH Royal Institute of Technology'),
    );
  });

  test('picks the closest number for a trip length', () {
    final action = buyer
        .answer(
          surface([
            {
              'id': 'root',
              'component': 'Hunch',
              'facet': 'maxMinutes',
              'options': [
                {'label': 'Twenty', 'value': '20'},
                {'label': 'Forty', 'value': '40'},
              ],
              'answer': answer,
            },
          ]),
        )!
        .action;

    expect(action.context, containsPair('value', '20'));
  });

  test('picks the lineup photo whose traits fit', () {
    final action = buyer
        .answer(
          surface(
            [
              {
                'id': 'root',
                'component': 'PhotoLineup',
                'photos': {'path': '/lineup/homes'},
                'pick': answer,
              },
            ],
            {
              'lineup': {
                'homes': [
                  {'id': 'flat', 'caption': 'A flat'},
                  {'id': 'garden', 'caption': 'A house with a garden'},
                ],
              },
            },
          ),
        )!
        .action;

    expect(action.context, containsPair('value', 'garden'));
  });

  test('picks the trade-off in an area they prefer', () {
    final action = buyer
        .answer(
          surface(
            [
              {
                'id': 'root',
                'component': 'TradeOff',
                'options': {'path': '/tradeoff/options'},
                'pick': answer,
              },
            ],
            {
              'tradeoff': {
                'options': [
                  {'id': 'o1', 'areaId': 'vasastan', 'homeType': 'flat'},
                  {'id': 'o2', 'areaId': 'danderyd', 'homeType': 'house'},
                ],
              },
            },
          ),
        )!
        .action;

    expect(action.context, containsPair('value', 'o2'));
  });

  test('fills in the household and taps the answer button', () {
    final answered = buyer.answer(
      surface([
        {
          'id': 'household',
          'component': 'HouseholdInput',
          'adults': {'path': '/story/adults'},
          'childAges': {'path': '/story/childAges'},
        },
        {
          'id': 'send',
          'component': 'Button',
          'action': {
            'event': {
              'name': 'answer',
              'context': {'facet': 'household', 'storyPath': '/story'},
            },
          },
        },
      ]),
    )!;

    expect(answered.action.context, containsPair('facet', 'household'));
    expect(answered.surfaceData['story'], containsPair('childAges', [6, 9]));
  });
}
