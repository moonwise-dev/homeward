import 'dart:convert';

import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/data/models/plan_summary.dart';
import 'package:homeward/data/repository/plans_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final today = DateTime.utc(2026, 9, 18, 10);
  late List<PlanListing> listed;

  setUp(() => listed = []);

  SessionPlansRepository repositoryFor() => SessionPlansRepository(
    HomewardClient(
      httpClient: MockClient((request) async {
        final body = request.method == 'GET'
            ? {
                'sessions': [
                  for (final listing in listed) listing.toJson(),
                ],
              }
            : {'sessionId': 's-new'};
        return http.Response(
          jsonEncode({'ok': true, 'data': body}),
          request.method == 'GET' ? 200 : 201,
          headers: {'content-type': 'application/json'},
        );
      }),
      server: Uri.parse('https://homeward.example.run.app'),
      credentials: () async =>
          const RequestCredentials(idToken: 'id-token', appCheckToken: 'check'),
    ),
    now: () => today,
  );

  test('lists the plans the server kept, newest first', () async {
    listed = [
      PlanListing(
        sessionId: 's-1',
        turnCount: 2,
        title: 'A flat in Funchal',
        marketId: 'PT-30',
        marketName: 'Madeira, Portugal',
        updatedAt: today.subtract(const Duration(days: 1)),
      ),
      PlanListing(
        sessionId: 's-2',
        turnCount: 1,
        title: 'Somewhere in Stockholm',
        marketId: 'SE',
        marketName: 'Sweden',
        updatedAt: today.subtract(const Duration(hours: 1)),
      ),
    ];
    final plans = repositoryFor();

    await plans.refresh();

    expect(
      await plans.watchPlans().first,
      [
        isA<PlanSummary>()
            .having((plan) => plan.id, 'id', 's-2')
            .having((plan) => plan.title, 'title', 'Somewhere in Stockholm')
            .having((plan) => plan.marketName, 'marketName', 'Sweden'),
        isA<PlanSummary>()
            .having((plan) => plan.id, 'id', 's-1')
            .having(
              (plan) => plan.marketName,
              'marketName',
              'Madeira, Portugal',
            ),
      ],
    );
  });

  test('tells a listener as soon as the server answers', () async {
    listed = [const PlanListing(sessionId: 's-1', turnCount: 1)];
    final plans = repositoryFor();
    final seen = <List<PlanSummary>>[];
    final subscription = plans.watchPlans().listen(seen.add);

    await plans.refresh();
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(seen.map((plans) => plans.length), [0, 1]);
  });

  test(
    'keeps a plan started here that the server has yet to hear of',
    () async {
      final plans = repositoryFor();
      final started = await plans.create();
      plans.recordActivity(started.id, buyerText: 'I am buying in Lisbon');

      await plans.refresh();

      expect(await plans.watchPlans().first, [
        isA<PlanSummary>()
            .having((plan) => plan.id, 'id', 's-new')
            .having((plan) => plan.title, 'title', 'I am buying in Lisbon'),
      ]);
    },
  );

  test('takes the title of a plan it did not start', () async {
    final plans = repositoryFor();
    final started = await plans.create();
    listed = [
      PlanListing(
        sessionId: started.id,
        turnCount: 1,
        title: 'An older question',
        updatedAt: today.add(const Duration(minutes: 5)),
      ),
    ];

    await plans.refresh();

    expect(
      (await plans.watchPlans().first).single,
      isA<PlanSummary>()
          .having((plan) => plan.title, 'title', 'An older question')
          .having(
            (plan) => plan.lastActivityAt,
            'lastActivityAt',
            today.add(const Duration(minutes: 5)),
          ),
    );
  });
}
