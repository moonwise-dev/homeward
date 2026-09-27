import 'package:common/common.dart';
import 'package:homeward_server/research/listing_reader.dart';
import 'package:test/test.dart';

import '../support/scripted_researcher.dart';
import '../support/test_markets.dart';

void main() {
  final villa = testMarkets.home('sto-09')!.listing;
  final walkUp = testMarkets.home('sto-02')!.listing;
  const stepFree = HomeNeed(
    id: 'step-free',
    label: 'No steps for Mum',
    meaning: 'the home can be reached from the street without steps',
  );
  const pets = HomeNeed(
    id: 'dog',
    label: 'Room for the dog',
    meaning: 'dogs are allowed in the home and the building',
  );

  test('keeps a quote only when it appears word for word', () async {
    final researcher = ScriptedResearcher([
      {
        'listingId': 'sto-09',
        'need': 'step-free',
        'verdict': 'meets',
        'quote': 'A ramp runs up beside the front steps.',
      },
      {
        'listingId': 'sto-02',
        'need': 'step-free',
        'verdict': 'meets',
        'quote': 'The building has a ramp and a lift.',
      },
    ]);

    final readings = await ListingReader().read(
      [villa, walkUp],
      [stepFree],
      researcher,
    );

    final ramp = readings['sto-09']!.single;
    expect(ramp.verdict, ReadVerdict.meets);
    expect(ramp.quote, 'A ramp runs up beside the front steps');
    expect(villa.description, contains(ramp.quote));
    expect(readings['sto-02']!.single.verdict, ReadVerdict.silent);
    expect(readings['sto-02']!.single.quote, isNull);
  });

  test('a need left unanswered is silent', () async {
    final readings = await ListingReader().read(
      [villa],
      [pets],
      ScriptedResearcher(const []),
    );

    expect(readings['sto-09']!.single.verdict, ReadVerdict.silent);
  });

  test('reads each listing and need once', () async {
    final reader = ListingReader();
    final researcher = ScriptedResearcher(const []);

    await reader.read([villa, walkUp], [stepFree], researcher);
    await reader.read([villa, walkUp], [stepFree], researcher);
    await reader.read([villa], [stepFree, pets], researcher);

    expect(researcher.questions, hasLength(2));
    expect(researcher.questions.last, contains('[sto-09]'));
    expect(researcher.questions.last, isNot(contains('[sto-02]')));
  });
}
