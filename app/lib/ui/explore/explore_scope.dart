import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

class ExploreScope extends InheritedWidget {
  const ExploreScope({
    required this.homes,
    required this.narrowing,
    required this.onToggle,
    required super.child,
    super.key,
  });

  final CityHomes? homes;
  final Narrowing narrowing;
  final ValueChanged<MustHaveRule> onToggle;

  static ExploreScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ExploreScope>();

  @override
  bool updateShouldNotify(ExploreScope oldWidget) =>
      homes != oldWidget.homes || narrowing != oldWidget.narrowing;
}
