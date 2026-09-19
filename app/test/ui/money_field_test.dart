import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/ui/app_money_field.dart';

void main() {
  Widget host(
    LocaleTag locale,
    ValueChanged<int?> onChanged, {
    int? majorUnits,
  }) => MaterialApp(
    home: Scaffold(
      body: AppMoneyField(
        label: 'Household net income',
        majorUnits: majorUnits,
        unitLabel: 'kr a month',
        locale: locale,
        onChanged: onChanged,
      ),
    ),
  );

  testWidgets('digits group as the buyer types them', (tester) async {
    int? saved;
    await tester.pumpWidget(host(LocaleTag.parse('sv-SE'), (v) => saved = v));

    await tester.enterText(find.byType(TextField), '62000');
    await tester.pump();

    expect(saved, 62000);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      '62 000',
    );
  });

  testWidgets('a market that groups differently is followed', (tester) async {
    await tester.pumpWidget(host(LocaleTag.parse('en-US'), (_) {}));

    await tester.enterText(find.byType(TextField), '900000');
    await tester.pump();

    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      '900,000',
    );
  });

  testWidgets('an emptied field reads as no amount', (tester) async {
    int? saved = 1;
    await tester.pumpWidget(
      host(LocaleTag.parse('sv-SE'), (v) => saved = v, majorUnits: 62000),
    );

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();

    expect(saved, isNull);
  });
}
