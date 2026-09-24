import 'dart:async';

import 'package:common/common.dart';

import '../../research/research_steps.dart';
import 'turn_event.dart';

final class ProgressLog implements ResearchSteps {
  final _steps = <ResearchStep>[];
  StreamController<TurnEvent>? _events;

  Stream<TurnEvent> whileRunning(Future<void> Function() work) async* {
    final events = StreamController<TurnEvent>();
    _events = events;
    final running = work();
    running.whenComplete(events.close).ignore();
    yield* events.stream;
    _events = null;
    await running;
  }

  @override
  Future<T> track<T>(
    String label,
    Future<T> Function() work, {
    bool Function(T result)? measured,
  }) async {
    final index = _indexOf(label);
    try {
      final result = await work();
      _set(
        index,
        (measured?.call(result) ?? true)
            ? ResearchStepState.done
            : ResearchStepState.unavailable,
      );
      return result;
    } on Object {
      _set(index, ResearchStepState.unavailable);
      rethrow;
    }
  }

  int _indexOf(String label) {
    final index = _steps.indexWhere((step) => step.label == label);
    if (index != -1) {
      return index;
    }
    _steps.add(ResearchStep(label: label, state: ResearchStepState.running));
    _emit();
    return _steps.length - 1;
  }

  void _set(int index, ResearchStepState state) {
    if (_steps[index].state == state) {
      return;
    }
    _steps[index] = _steps[index].copyWith(state: state);
    _emit();
  }

  void _emit() => _events?.add(
    TurnEvent.progress(ResearchProgress(steps: List.unmodifiable(_steps))),
  );
}
