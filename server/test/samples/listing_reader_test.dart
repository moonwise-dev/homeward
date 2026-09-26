import 'package:common/common.dart';
import 'package:homeward_server/samples/listing_reader.dart';
import 'package:test/test.dart';

import '../support/scripted_researcher.dart';
import '../tools/tool_fixtures.dart';

void main() {
  final stockholm = realMarkets.samples.listingsIn('stockholm');
  final villa = stockholm.firstWhere((listing) => listing.id == 'sto-09');
  final walkUp = stockholm.firstWhere((listing) => listing.id == 'sto-02');

  test('keeps a quote only when it appears word for word', () async {
    final researcher = ScriptedResearcher([
      {
        'listingId': 'sto-09',
        'need': 'stepFree',
        'verdict': 'meets',
        'quote': 'A ramp runs up beside the front steps.',
      },
      {
        'listingId': 'sto-02',
        'need': 'stepFree',
        'verdict': 'meets',
        'quote': 'The building has a ramp and a lift.',
      },
    ]);

    final readings = await ListingReader().read(
      [villa, walkUp],
      [HomeNeed.stepFree],
      researcher,
    );

    expect(readings.first.verdict, ReadVerdict.meets);
    expect(readings.first.quote, 'A ramp runs up beside the front steps');
    expect(villa.description, contains(readings.first.quote));
    expect(readings.last.verdict, ReadVerdict.silent);
    expect(readings.last.quote, isNull);
  });

  test('a need left unanswered is silent', () async {
    final readings = await ListingReader().read(
      [villa],
      [HomeNeed.lift],
      ScriptedResearcher(const []),
    );

    expect(readings.single.verdict, ReadVerdict.silent);
  });

  test('reads each listing and need once', () async {
    final reader = ListingReader();
    final researcher = ScriptedResearcher(const []);

    await reader.read([villa, walkUp], [HomeNeed.stepFree], researcher);
    await reader.read([villa, walkUp], [HomeNeed.stepFree], researcher);
    await reader.read([villa], [HomeNeed.stepFree, HomeNeed.pets], researcher);

    expect(researcher.questions, hasLength(2));
    expect(researcher.questions.last, contains('[sto-09]'));
    expect(researcher.questions.last, isNot(contains('[sto-02]')));
  });
}
