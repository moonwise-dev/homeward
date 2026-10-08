import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/agent_repository.dart';

part 'new_plan.g.dart';

@riverpod
Future<String> newPlan(Ref ref) => ref.watch(agentRepositoryProvider).create();
