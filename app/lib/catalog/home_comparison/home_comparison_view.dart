import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_photo.dart';
import '../home_text.dart';
import '../money_text.dart';

class HomeComparisonView extends HookWidget {
  const HomeComparisonView({required this.homes, this.onChoose, super.key});

  final List<PricedHome> homes;
  final ValueChanged<PricedHome>? onChoose;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final sent = useState(false);
    useEffect(() {
      sent.value = false;
      return null;
    }, homes);
    final onChoose = this.onChoose;
    final savings = homes
        .map((home) => home.cost?.savings)
        .nonNulls
        .firstOrNull;
    final deduction = homes.any(
      (home) => home.cost?.monthly.afterDeductionWithFee != null,
    );
    TableRow row(
      String label,
      String Function(PricedHome home) value, {
      bool strong = false,
      bool Function(PricedHome home)? warn,
    }) => TableRow(
      children: [
        _Cell(Text(label, style: styles.caption)),
        for (final home in homes)
          _Cell(
            Text(
              value(home),
              style: (strong ? styles.figure : styles.label).copyWith(
                fontWeight: strong ? FontWeight.w600 : null,
                color: warn?.call(home) ?? false ? colors.danger : colors.text,
              ),
            ),
          ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Side by side', style: styles.label),
        const SizedBox(height: AppSpacing.xs),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.9),
            for (var index = 1; index <= homes.length; index++)
              index: const FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          border: TableBorder(
            horizontalInside: BorderSide(color: colors.border),
          ),
          children: [
            TableRow(
              children: [
                const SizedBox.shrink(),
                for (final home in homes)
                  _Cell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadii.sm),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: AppPhoto(id: home.listing.photos.first),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          home.listing.areaName,
                          style: styles.label.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          home.listing.address,
                          style: styles.caption,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            row(
              homes.any((home) => home.rent != null) ? 'Rent' : 'Price',
              homeFigureText,
            ),
            row(
              'A month',
              (home) => _money(home.cost?.monthly.totalWithFee),
              strong: true,
            ),
            if (deduction)
              row(
                'After the interest deduction',
                (home) => _money(home.cost?.monthly.afterDeductionWithFee),
              ),
            row('Down payment', (home) => _money(home.cost?.downPayment)),
            row(
              'Cash on the day',
              (home) => _money(home.cost?.cashNeeded),
              warn: (home) => home.cost?.shortOfSavings != null,
            ),
            row(
              'Lending rules',
              (home) => switch (home.cost) {
                null => '–',
                HomeCost(:final overLimit?) =>
                  'Over by ${moneyText(overLimit)}',
                _ => 'Within',
              },
              warn: (home) => home.cost?.overLimit != null,
            ),
            row(
              'Size',
              (home) =>
                  '${home.listing.sizeM2} m², ${home.listing.rooms} rooms',
            ),
            row(
              'Floor',
              (home) => switch (home.listing.floor) {
                final floor? => 'Floor $floor',
                null => 'A ${home.listing.homeType.noun}',
              },
            ),
            row('Outdoor', (home) => _capitalized(home.listing.outdoor.phrase)),
            row(
              'Per m²',
              (home) =>
                  '${moneyText(home.listing.pricePerM2)}, '
                  '${againstArea(home.listing)}',
            ),
            row('Fee a month', (home) => _money(home.listing.monthlyFee)),
            if (onChoose != null)
              TableRow(
                children: [
                  const SizedBox.shrink(),
                  for (final home in homes)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: sent.value
                            ? null
                            : () {
                                sent.value = true;
                                onChoose(home);
                              },
                        child: const Text('Work out'),
                      ),
                    ),
                ],
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          [
            if (savings != null) 'Your savings: ${moneyText(savings)}.',
            'Sample listings, not for sale. An estimate, not advice.',
          ].join(' '),
          style: styles.caption,
        ),
      ],
    );
  }

  static String _money(Money? money) => money == null ? '–' : moneyText(money);

  static String _capitalized(String text) =>
      '${text[0].toUpperCase()}${text.substring(1)}';
}

class _Cell extends StatelessWidget {
  const _Cell(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.xxs,
      vertical: AppSpacing.xs,
    ),
    child: child,
  );
}
