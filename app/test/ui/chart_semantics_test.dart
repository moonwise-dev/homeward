import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/app_line_chart.dart';

void main() {
  testWidgets('a chart says in words what it draws', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppLineChart(
            points: [
              ChartPoint(x: 0.03, y: 1200),
              ChartPoint(x: 0.07, y: 1800),
            ],
            summary: 'Monthly cost from 1,200 € at 3.00% to 1,800 € at 7.00%',
          ),
        ),
      ),
    );

    expect(
      find.bySemanticsLabel(
        'Monthly cost from 1,200 € at 3.00% to 1,800 € at 7.00%',
      ),
      findsOneWidget,
    );
    handle.dispose();
  });
}
