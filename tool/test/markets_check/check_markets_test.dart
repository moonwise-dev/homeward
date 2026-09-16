import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/markets_check/check_markets.dart';
import 'package:homeward_tool/markets_check/finding.dart';
import 'package:homeward_tool/markets_check/load_markets.dart';
import 'package:test/test.dart';

void main() {
  final today = CalendarDate.parse('2026-09-17');
  final realMarkets = Directory('../markets');

  List<String> errorsIn(List<Finding> findings) => [
    for (final finding in findings)
      if (finding.severity == FindingSeverity.error)
        '${finding.subject}: ${finding.message}',
  ];

  test('the curated markets have no errors', () {
    final findings = checkMarkets(loadMarkets(realMarkets), today: today);

    expect(errorsIn(findings), isEmpty);
    expect(
      findings.map((finding) => finding.message),
      contains(startsWith('Review pending')),
    );
  });

  test('a rate snapshot older than 75 days is an error', () {
    final findings = checkMarkets(
      loadMarkets(realMarkets),
      today: CalendarDate.parse('2026-12-01'),
    );

    expect(errorsIn(findings), [
      'SE: variable-3m: SE.AVG_VARIABLE_3M is from 2026-07-31, older than 75 days',
    ]);
  });

  group('broken markets', () {
    late Directory root;

    setUp(() {
      root = Directory.systemTemp.createTempSync('markets_check_');
      for (final directory in ['packs', 'rates', 'living_costs']) {
        Directory('${root.path}/$directory').createSync();
      }
    });

    tearDown(() => root.deleteSync(recursive: true));

    Map<String, Object?> realSweden() =>
        jsonDecode(File('../markets/packs/SE.json').readAsStringSync())
            as Map<String, Object?>;

    void write(String path, Object? json) =>
        File('${root.path}/$path').writeAsStringSync(jsonEncode(json));

    test('reports every kind of problem with its subject', () {
      final sweden = realSweden();
      final lending = sweden['lending']! as Map<String, Object?>;
      final ltv = (lending['maxLtv']! as List<Object?>)
          .cast<Map<String, Object?>>();
      ltv.first['sourceId'] = 'no-such-source';
      ltv.add({...ltv.first, 'sourceId': 'sfs-2026-226'});
      sweden['purchaseCosts'] = [
        {
          'id': 'fee',
          'label': 'Fee',
          'base': 'fixed',
          'calculation': {'type': 'fixed', 'amount': '10.001'},
          'recurrence': 'once',
          'sourceId': 'sfs-2026-226',
        },
      ];
      write('packs/SE.json', sweden);
      write('packs/Madeira.json', {
        'id': 'PT-30',
        'parent': 'PT',
        'name': 'Madeira',
        'version': 1,
        'effectiveFrom': '2026-01-01',
        'reviewedAt': '2026-01-01',
      });
      write('packs/BAD.json', {'id': 'SE', 'name': 1});

      final findings = checkMarkets(loadMarkets(root), today: today);
      final errors = errorsIn(findings);

      expect(
        errors,
        containsAll([
          'SE: Entry id ltv-new-loan is used twice',
          'SE: Unknown source no-such-source',
          'SE: fee: Expected at most 2 decimal places (10.001)',
          'SE: variable-3m: no snapshot for SE.AVG_VARIABLE_3M',
          'SE: Left to live on needs a living cost table',
          'PT-30: Stored in Madeira.json',
          'PT-30: reviewedAt is set without reviewedBy',
          'PT-30: Review expired on 2026-06-30',
          'PT-30: No pack',
        ]),
      );
      expect(errors.where((error) => error.contains('BAD.json')), hasLength(1));
    });
  });
}
