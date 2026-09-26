import 'package:common/common.dart';
import 'package:homeward_server/samples/listing_reader.dart';
import 'package:homeward_server/tools/agent_tool.dart';
import 'package:homeward_server/tools/read_listings_tool.dart';
import 'package:test/test.dart';

import '../support/scripted_researcher.dart';
import 'tool_fixtures.dart';

void main() {
  const needs = Story(sampleCity: 'stockholm', needs: [HomeNeed.stepFree]);

  ToolContext contextFor(Story story, {ScriptedResearcher? researcher}) =>
      ToolContext(
        markets: realMarkets,
        plan: Plan(story: story),
        researcher: researcher,
      );

  test('runs before the model only when needs are unread', () {
    final tool = ReadListingsTool(ListingReader());
    final researcher = ScriptedResearcher(const []);

    expect(
      tool.settledArguments(contextFor(needs, researcher: researcher)),
      isNotNull,
    );
    expect(tool.settledArguments(contextFor(needs)), isNull);
    expect(
      tool.settledArguments(
        contextFor(
          const Story(sampleCity: 'stockholm'),
          researcher: researcher,
        ),
      ),
      isNull,
    );
  });

  test('puts every reading on the story and counts them per need', () async {
    final tool = ReadListingsTool(ListingReader());
    final researcher = ScriptedResearcher([
      {
        'listingId': 'sto-06',
        'need': 'stepFree',
        'verdict': 'meets',
        'quote': "the flat's own door are all step-free",
      },
    ]);

    final result = await tool.run(
      const {},
      contextFor(needs, researcher: researcher),
    );
    final story = result.plan!.story;
    final homes = realMarkets.samples.listingsIn('stockholm').length;

    expect(story.readings, hasLength(homes));
    expect(result.modelResult['needs'], {
      'stepFree': {'meets': 1, 'fails': 0, 'silent': homes - 1},
    });
    expect(
      tool.settledArguments(
        contextFor(story, researcher: researcher),
      ),
      isNull,
    );
  });
}
