import 'package:common/common.dart';
import 'package:homeward_server/research/step_labels.dart';
import 'package:test/test.dart';

void main() {
  const odengatan = Candidate(id: 'c1', label: 'Odengatan', query: 'Odengatan');
  const solna = Candidate(id: 'c2', label: 'Solna', query: 'Solna');
  const vasastan = Candidate(id: 'c3', label: 'Vasastan', query: 'Vasastan');

  test('a nearby step names what it looks for and where', () {
    expect(
      nearbyLabel([CriterionKind.schools], [odengatan]),
      'Looking for schools near Odengatan',
    );
    expect(
      nearbyLabel(
        [CriterionKind.schools, CriterionKind.parks],
        [odengatan, solna],
      ),
      'Looking for schools and parks near Odengatan and Solna',
    );
  });

  test('a long list is cut short and shared nouns are said once', () {
    expect(
      nearbyLabel(
        [
          CriterionKind.schools,
          CriterionKind.parks,
          CriterionKind.nightlife,
          CriterionKind.quiet,
          CriterionKind.gym,
        ],
        [odengatan, solna, vasastan],
      ),
      'Looking for schools, parks, and 2 more near Odengatan, Solna, and '
      'Vasastan',
    );
  });

  test('a route step names the anchor and the way there', () {
    expect(
      routeLabel(
        const Anchor(
          id: 'a1',
          label: 'KTH',
          query: 'KTH',
          mode: TravelMode.bike,
        ),
      ),
      'Timing the trip to KTH by bike',
    );
    expect(locatingLabel('KTH'), 'Finding KTH on the map');
  });
}
