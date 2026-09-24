import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../story_marks.dart';

class ComparisonTableView extends StatelessWidget {
  const ComparisonTableView({
    required this.rows,
    required this.homes,
    super.key,
  });

  static const _wideEnough = 440.0;

  final List<AssessedRow> rows;
  final List<AssessedCandidate> homes;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth >= _wideEnough && homes.length > 1;
      final groups = <String, List<AssessedRow>>{};
      for (final row in rows) {
        groups.putIfAbsent(row.group, () => []).add(row);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (wide) _header(),
          for (final MapEntry(key: group, value: grouped)
              in groups.entries) ...[
            Padding(
              padding: const EdgeInsets.only(
                top: AppSpacing.sm,
                bottom: AppSpacing.xxs,
              ),
              child: Text(group.toUpperCase(), style: AppTextStyles.caption),
            ),
            for (final row in grouped) wide ? _wideRow(row) : _narrowRow(row),
          ],
        ],
      );
    },
  );

  Widget _header() => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
    child: Row(
      children: [
        const Expanded(flex: 4, child: SizedBox.shrink()),
        for (final home in homes)
          Expanded(flex: 5, child: _HomeLabel(home: home)),
      ],
    ),
  );

  Widget _wideRow(AssessedRow row) => DecoratedBox(
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: AppColors.border)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4, child: _RowLabel(row: row)),
          for (final home in homes)
            Expanded(flex: 5, child: _Cell(cell: _cellOf(row, home))),
        ],
      ),
    ),
  );

  Widget _narrowRow(AssessedRow row) => DecoratedBox(
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: AppColors.border)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RowLabel(row: row),
          for (final home in homes)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (homes.length > 1)
                    SizedBox(width: 96, child: _HomeLabel(home: home)),
                  Expanded(child: _Cell(cell: _cellOf(row, home))),
                ],
              ),
            ),
        ],
      ),
    ),
  );

  AssessedCell? _cellOf(AssessedRow row, AssessedCandidate home) =>
      row.cells.where((cell) => cell.candidateId == home.id).firstOrNull;
}

class _HomeLabel extends StatelessWidget {
  const _HomeLabel({required this.home});

  final AssessedCandidate home;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: homeColor(home.id),
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(width: AppSpacing.xxs),
      Flexible(
        child: Text(
          home.label,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.label.copyWith(color: AppColors.text),
        ),
      ),
    ],
  );
}

class _RowLabel extends StatelessWidget {
  const _RowLabel({required this.row});

  final AssessedRow row;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: AppSpacing.xs),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          criterionIcon(criterionKindNamed(row.id)),
          size: 18,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: row.label,
              children: [
                if (row.mustHave)
                  TextSpan(
                    text: '  must\u2011have',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.accent,
                    ),
                  ),
              ],
            ),
            style: AppTextStyles.body,
          ),
        ),
      ],
    ),
  );
}

class _Cell extends StatelessWidget {
  const _Cell({required this.cell});

  final AssessedCell? cell;

  @override
  Widget build(BuildContext context) {
    final cell = this.cell;
    if (cell == null) {
      return Text('Not measured', style: AppTextStyles.caption);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppStatusTag(status: _fitAppStatus(cell.status), text: cell.text),
        if (cell.detail case final detail?)
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(detail, style: AppTextStyles.caption),
          ),
      ],
    );
  }
}

AppStatus _fitAppStatus(FitStatus status) => switch (status) {
  FitStatus.fits => AppStatus.pass,
  FitStatus.close => AppStatus.warn,
  FitStatus.misses => AppStatus.fail,
  FitStatus.unknown => AppStatus.info,
};
