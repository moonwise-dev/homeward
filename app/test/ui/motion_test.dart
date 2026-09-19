import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/app_animated_figure.dart';
import 'package:homeward/ui/app_surface_entry.dart';

void main() {
  final locale = LocaleTag.parse('en-GB');
  final currency = Currency.parse('EUR');

  Widget frame(Widget child, {bool stillness = false}) => MediaQuery(
    data: MediaQueryData(disableAnimations: stillness),
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Center(child: child),
    ),
  );

  String shown(WidgetTester tester) =>
      tester.widget<Text>(find.byType(Text)).data!;

  testWidgets('a figure travels to its new value', (tester) async {
    await tester.pumpWidget(
      frame(
        AppAnimatedFigure(
          amount: Money(minorUnits: 100000, currency: currency),
          locale: locale,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(shown(tester), contains('1,000'));

    await tester.pumpWidget(
      frame(
        AppAnimatedFigure(
          amount: Money(minorUnits: 900000, currency: currency),
          locale: locale,
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 90));
    final midway = shown(tester);
    await tester.pumpAndSettle();

    expect(midway, isNot(contains('1,000')));
    expect(midway, isNot(contains('9,000')));
    expect(shown(tester), contains('9,000'));
  });

  testWidgets('it lands at once when the device asks for stillness', (
    tester,
  ) async {
    await tester.pumpWidget(
      frame(
        AppAnimatedFigure(
          amount: Money(minorUnits: 100000, currency: currency),
          locale: locale,
        ),
        stillness: true,
      ),
    );
    await tester.pump();
    await tester.pumpWidget(
      frame(
        AppAnimatedFigure(
          amount: Money(minorUnits: 900000, currency: currency),
          locale: locale,
        ),
        stillness: true,
      ),
    );
    await tester.pump();

    expect(shown(tester), contains('9,000'));
  });

  testWidgets('a surface rises as it arrives', (tester) async {
    await tester.pumpWidget(
      frame(const AppSurfaceEntry(child: Text('A market'))),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 60));
    final opacity = tester.widget<Opacity>(find.byType(Opacity)).opacity;
    final offset = tester
        .widget<Transform>(find.byType(Transform))
        .transform
        .getTranslation();
    await tester.pumpAndSettle();

    expect(opacity, greaterThan(0));
    expect(opacity, lessThan(1));
    expect(offset.y, greaterThan(0));
    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 1);
  });

  testWidgets('a surface arrives in place when animations are off', (
    tester,
  ) async {
    await tester.pumpWidget(
      frame(const AppSurfaceEntry(child: Text('A market')), stillness: true),
    );
    await tester.pump();

    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 1);
  });
}
