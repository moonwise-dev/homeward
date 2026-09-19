import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/app_source_dot.dart';
import 'package:homeward/ui/app_theme.dart';

void main() {
  final sources = [
    Source(
      id: 'bportugal-ltv',
      publisher: 'Banco de Portugal',
      title: 'Macroprudential recommendation on new credit',
      url: 'https://www.bportugal.pt/en/page/macroprudential-measures',
      kind: SourceKind.regulator,
      retrievedAt: CalendarDate.parse('2026-09-16'),
    ),
  ];

  testWidgets('a dot opens the sources behind a figure', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppSourceDot(
            title: 'Where the loan-to-value cap comes from',
            sources: sources,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(
      find.text('Where the loan-to-value cap comes from'),
      findsOneWidget,
    );
    expect(
      find.text('Macroprudential recommendation on new credit'),
      findsOneWidget,
    );
    expect(
      find.text('Banco de Portugal · Regulator · read 2026-09-16'),
      findsOneWidget,
    );
  });

  testWidgets('a figure with no source shows no dot', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(
          body: AppSourceDot(title: 'Nothing to show', sources: []),
        ),
      ),
    );

    expect(find.byType(IconButton), findsNothing);
  });
}
