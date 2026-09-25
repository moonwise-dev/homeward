import 'package:common/common.dart';
import 'package:homeward_server/research/open_data/polite_client.dart';
import 'package:homeward_server/research/open_data/routing.dart';
import 'package:homeward_server/tools/agent_tool.dart';
import 'package:homeward_server/tools/compare_areas_tool.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  final tool = CompareAreasTool(
    Routing(
      PoliteClient(
        MockClient((_) async => http.Response('down', 500)),
        userAgent: 'Homeward test',
      ),
    ),
  );
  const stockholm = Story(city: 'Stockholm', sampleCity: 'stockholm');

  Future<ToolResult> compare(Story story, List<Map<String, Object?>> options) =>
      tool.run({'options': options}, contextWith(plan: Plan(story: story)));

  test('prices each way to live from its area and keeps the options', () async {
    final result = await compare(stockholm, [
      {'areaId': 'danderyd', 'homeType': 'house', 'rooms': 5},
      {'areaId': 'vasastan', 'homeType': 'flat', 'rooms': 3},
    ]);
    final options = result.plan!.story.areaOptions;

    expect(options.map((option) => option.areaName), ['Danderyd', 'Vasastan']);
    expect(options.first.sizeM2, typicalSizeM2(HomeType.house, 5));
    expect(options.first.pricePerM2.minorUnits, 9220400);
    expect(options.first.price.minorUnits % 1000000, 0);
    expect(options.first.priceSource, startsWith('Svensk Mäklarstatistik'));
    expect(
      (result.seeds['tradeoff']! as Map<String, Object?>)['options'],
      hasLength(2),
    );
    expect(result.modelResult.toString(), isNot(contains('kr')));
  });

  test('refuses a home type the area has no price for', () async {
    final result = await compare(stockholm, [
      {'areaId': 'vasastan', 'homeType': 'house', 'rooms': 5},
      {'areaId': 'danderyd', 'homeType': 'house', 'rooms': 5},
    ]);

    expect(result.modelResult, contains('error'));
    expect(result.plan, isNull);
  });

  test('a city without sample areas cannot be compared', () async {
    final result = await compare(const Story(city: 'Ohrid'), [
      {'areaId': 'a', 'homeType': 'flat', 'rooms': 2},
      {'areaId': 'b', 'homeType': 'flat', 'rooms': 2},
    ]);

    expect(result.modelResult, contains('error'));
  });
}
