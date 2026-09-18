import 'dart:async';

import 'package:common/common.dart';

import '../models/plan_summary.dart';
import 'repository_guard.dart';

abstract interface class PlansRepository {
  Stream<List<PlanSummary>> watchPlans();

  Future<void> refresh();

  Future<PlanSummary> create();

  void recordActivity(String id, {required String buyerText});
}

class SessionPlansRepository with RepositoryGuard implements PlansRepository {
  SessionPlansRepository(this._client, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final HomewardClient _client;
  final DateTime Function() _now;
  final _plans = <String, PlanSummary>{};
  final _changes = StreamController<void>.broadcast(sync: true);

  @override
  Stream<List<PlanSummary>> watchPlans() => Stream.multi((listener) {
    listener.add(_newestFirst());
    final subscription = _changes.stream.listen(
      (_) => listener.add(_newestFirst()),
    );
    listener.onCancel = subscription.cancel;
  });

  @override
  Future<void> refresh() => guard(() async {
    for (final listing in await _client.plans()) {
      _plans[listing.sessionId] = _merged(listing, _plans[listing.sessionId]);
    }
    _changes.add(null);
  });

  @override
  Future<PlanSummary> create() => guard(() async {
    final plan = PlanSummary(
      id: await _client.createSession(),
      lastActivityAt: _now(),
    );
    _plans[plan.id] = plan;
    _changes.add(null);
    return plan;
  });

  @override
  void recordActivity(String id, {required String buyerText}) {
    final plan = _plans[id];
    if (plan == null) {
      return;
    }
    _plans[id] = plan.copyWith(
      lastActivityAt: _now(),
      title: plan.title ?? buyerText,
    );
    _changes.add(null);
  }

  PlanSummary _merged(PlanListing listing, PlanSummary? known) => PlanSummary(
    id: listing.sessionId,
    lastActivityAt: _laterOf(listing.updatedAt, known?.lastActivityAt),
    title: known?.title ?? listing.title,
    marketName: listing.marketName ?? known?.marketName,
  );

  DateTime _laterOf(DateTime? one, DateTime? other) {
    if (one == null || (other != null && other.isAfter(one))) {
      return other ?? _now();
    }
    return one;
  }

  List<PlanSummary> _newestFirst() =>
      _plans.values.toList()
        ..sort((a, b) => b.lastActivityAt.compareTo(a.lastActivityAt));
}
