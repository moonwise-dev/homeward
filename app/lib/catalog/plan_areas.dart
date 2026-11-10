import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlanSectionFilter extends InheritedWidget {
  const PlanSectionFilter({
    required this.shown,
    required this.owned,
    required this.takesTheRest,
    required super.child,
    this.showsWaiting = false,
    this.waitingTypes,
    super.key,
  });

  final Set<String> shown;
  final Set<String> owned;
  final bool takesTheRest;
  final bool showsWaiting;
  final Set<String>? waitingTypes;

  bool waits(String type) => waitingTypes?.contains(type) ?? true;

  bool shows(String sectionId) =>
      shown.contains(sectionId) || (takesTheRest && !owned.contains(sectionId));

  static PlanSectionFilter? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlanSectionFilter>();

  @override
  bool updateShouldNotify(PlanSectionFilter oldWidget) =>
      !setEquals(shown, oldWidget.shown) ||
      !setEquals(owned, oldWidget.owned) ||
      takesTheRest != oldWidget.takesTheRest ||
      showsWaiting != oldWidget.showsWaiting;
}
