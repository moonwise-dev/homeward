import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/research/open_data/nominatim.dart';
import 'package:homeward_server/research/open_data/polite_client.dart';
import 'package:homeward_server/tools/propose_story_tool.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  final tool = ProposeStoryTool(
    Nominatim(
      PoliteClient(
        MockClient(
          (request) async => http.Response(
            jsonEncode([
              {
                'lat': '41.1231',
                'lon': '20.8016',
                'display_name': 'Ohrid, North Macedonia',
                'address': {'country_code': 'mk'},
                'boundingbox': ['41.10', '41.14', '20.78', '20.82'],
              },
            ]),
            200,
            headers: {'content-type': 'application/json; charset=utf-8'},
          ),
        ),
        userAgent: 'Homeward test',
      ),
    ),
  );

  Future<Story> propose(Story story, Map<String, Object?> arguments) async =>
      (await tool.run(
        arguments,
        contextWith(plan: Plan(story: story)),
      )).plan!.story;

  test(
    'keeps the assumptions and the city point, and confirms nothing',
    () async {
      final story = await propose(const Story(), {
        'reason': 'work',
        'city': 'Ohrid',
        'mode': 'bike',
        'maxMinutes': 25,
        'criteria': ['quiet', 'water'],
      });

      expect(story.cityPoint, const GeoPoint(lat: 41.1231, lng: 20.8016));
      expect(story.mode, TravelMode.bike);
      expect(story.maxMinutes, 25);
      expect(
        story.criteria.map((criterion) => criterion.id),
        unorderedEquals(['quiet', 'water']),
      );
      expect(story.anchors, isEmpty);
      expect(story.committed, isFalse);
    },
  );

  test(
    'a commute assumption becomes the mode of an anchor named later',
    () async {
      final story = await propose(
        const Story(mode: TravelMode.bike, maxMinutes: 25),
        {
          'anchors': [
            {'label': 'Work', 'query': 'Work'},
          ],
        },
      );

      expect(story.anchors.single.mode, TravelMode.bike);
      expect(story.anchors.single.maxMinutes, 25);
    },
  );

  test('a proposal that leaves must-haves out keeps the buyer\'s', () async {
    final story = await propose(
      const Story(
        criteria: [
          Criterion(kind: CriterionKind.water, mustHave: true),
          Criterion(kind: CriterionKind.quiet),
        ],
      ),
      {
        'criteria': ['water', 'quiet', 'cafes'],
      },
    );

    expect(
      story.criteria.where((criterion) => criterion.mustHave).map((c) => c.id),
      ['water'],
    );
    expect(story.criteria, hasLength(3));
  });
}
