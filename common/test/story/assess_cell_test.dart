import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  const kth = Anchor(
    id: 'a1',
    label: 'KTH',
    query: 'KTH',
    mode: TravelMode.bike,
    maxMinutes: 25,
  );
  const commute = Criterion(kind: CriterionKind.commute, anchorId: 'a1');

  AssessedCell cell(Criterion criterion, Measurement measurement) => assessCell(
    candidateId: 'c1',
    criterion: criterion,
    measurement: measurement,
    anchor: kth,
  );

  test('a commute inside the limit fits, a little over comes close', () {
    final inside = cell(
      commute,
      const Measurement.route(mode: TravelMode.bike, minutes: 18, meters: 4200),
    );
    final over = cell(
      commute,
      const Measurement.route(mode: TravelMode.bike, minutes: 31, meters: 7400),
    );
    final far = cell(
      commute,
      const Measurement.route(
        mode: TravelMode.bike,
        minutes: 45,
        meters: 11000,
      ),
    );

    expect(inside.status, FitStatus.fits);
    expect(inside.text, '18 min by bike');
    expect(inside.detail, 'within your 25');
    expect(over.status, FitStatus.close);
    expect(over.detail, '6 min over your 25');
    expect(far.status, FitStatus.misses);
  });

  test('the nearest school names itself and the walk to it', () {
    final near = cell(
      const Criterion(kind: CriterionKind.schools),
      const Measurement.nearest(meters: 447, name: 'Karlbergsskolan'),
    );
    final none = cell(
      const Criterion(kind: CriterionKind.schools),
      const Measurement.none(),
    );

    expect(near.status, FitStatus.fits);
    expect(near.text, 'Karlbergsskolan · 450 m');
    expect(near.detail, 'about 8 min walk');
    expect(none.status, FitStatus.misses);
    expect(none.text, 'No schools within 2.0 km');
  });

  test('evenings count what is around, and quiet counts the opposite', () {
    final lively = cell(
      const Criterion(kind: CriterionKind.restaurants),
      const Measurement.count(count: 6),
    );
    final quiet = cell(
      const Criterion(kind: CriterionKind.quiet),
      const Measurement.count(count: 0),
    );

    expect(lively.status, FitStatus.close);
    expect(lively.detail, 'you wanted 10');
    expect(quiet.status, FitStatus.fits);
    expect(quiet.text, 'No bars and clubs within 300 m');
  });

  test('noise fits when nothing loud is near', () {
    expect(
      cell(
        const Criterion(kind: CriterionKind.noise),
        const Measurement.none(),
      ).status,
      FitStatus.fits,
    );
    expect(
      cell(
        const Criterion(kind: CriterionKind.noise),
        const Measurement.nearest(meters: 60, name: 'E4'),
      ).status,
      FitStatus.misses,
    );
  });

  test('a service that failed reads as unknown, never as a miss', () {
    expect(
      cell(commute, const Measurement.unavailable()).status,
      FitStatus.unknown,
    );
  });
}
