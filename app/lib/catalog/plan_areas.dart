import 'package:common/common.dart';
import 'package:flutter/material.dart';

enum PlanArea {
  overview(
    label: 'Overview',
    icon: Icons.space_dashboard_outlined,
    selectedIcon: Icons.space_dashboard,
    empty:
        'What Homeward understood about your household, and the city you '
        'are moving to.',
  ),
  money(
    label: 'Money',
    icon: Icons.account_balance_wallet_outlined,
    selectedIcon: Icons.account_balance_wallet,
    empty:
        'What you can borrow, what a home costs each month and on the day, '
        'and how it holds up when rates rise.',
  ),
  homes(
    label: 'Homes',
    icon: Icons.home_work_outlined,
    selectedIcon: Icons.home_work,
    empty:
        'Homes within your reach, the ones you keep, and what the listings '
        'say.',
  ),
  places(
    label: 'Places',
    icon: Icons.map_outlined,
    selectedIcon: Icons.map,
    empty: 'The places in your week, and how long it takes to get to them.',
  );

  const PlanArea({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.empty,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String empty;

  static PlanArea of(String componentType) => switch (componentType) {
    'MarketSnapshotCard' => overview,
    'RuleNote' => money,
    _ => switch (_families[componentType]) {
      CatalogFamily.money => money,
      CatalogFamily.homes => homes,
      CatalogFamily.placeAndTravel => places,
      _ => overview,
    },
  };

  static final _families = {
    for (final component in homewardComponents)
      component.name: component.family,
  };
}

class PlanAreaScope extends InheritedWidget {
  const PlanAreaScope({required this.area, required super.child, super.key});

  final PlanArea area;

  static PlanArea? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlanAreaScope>()?.area;

  @override
  bool updateShouldNotify(PlanAreaScope oldWidget) => area != oldWidget.area;
}
