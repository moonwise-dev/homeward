import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/research/open_data/nominatim.dart';
import 'package:homeward_server/research/open_data/polite_client.dart';
import 'package:homeward_server/tools/propose_areas_tool.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  final tool = ProposeAreasTool(
    Nominatim(
      PoliteClient(
        MockClient(
          (request) async => http.Response(
            jsonEncode([
              {
                'lat': '38.7139',
                'lon': '-9.1334',
                'display_name': 'Lisbon, Portugal',
                'address': {'country_code': 'pt'},
                'boundingbox': ['38.69', '38.73', '-9.16', '-9.11'],
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

  const confirmed = Story(
    city: 'Lisbon',
    criteria: [Criterion(kind: CriterionKind.water, mustHave: true)],
    committed: true,
  );

  Map<String, Object?> areas(int count) => {
    'areas': [
      for (var index = 0; index < count; index++)
        {'label': 'Area $index', 'query': 'Area $index'},
    ],
  };

  test('adds areas and leaves the confirmed story as it was', () async {
    final result = await tool.run(
      areas(2),
      contextWith(plan: const Plan(story: confirmed)),
    );
    final story = result.plan!.story;

    expect(story.candidates.map((candidate) => candidate.id), ['c1', 'c2']);
    expect(
      story.candidates.every((candidate) => candidate.point != null),
      isTrue,
    );
    expect(story.committed, isTrue);
    expect(story.criteria, confirmed.criteria);
  });

  test('offers at most three areas', () async {
    final result = await tool.run(
      areas(5),
      contextWith(plan: const Plan(story: confirmed)),
    );

    expect(result.plan!.story.candidates, hasLength(3));
  });

  test('does nothing when the buyer named homes or there is no city', () async {
    final named = await tool.run(
      areas(1),
      contextWith(
        plan: Plan(
          story: confirmed.copyWith(
            candidates: const [Candidate(id: 'c1', label: 'A', query: 'A')],
          ),
        ),
      ),
    );
    final cityless = await tool.run(areas(1), contextWith());

    expect(named.plan, isNull);
    expect(cityless.plan, isNull);
  });
}
