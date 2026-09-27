import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_photo.dart';
import '../home_text.dart';
import '../money_text.dart';

typedef SwipeVerdict = ({List<String> kept, List<String> passed});

class HomeSwipeView extends HookWidget {
  const HomeSwipeView({required this.homes, this.onDone, super.key});

  final List<PricedHome> homes;
  final ValueChanged<SwipeVerdict>? onDone;

  static const _leave = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final kept = useState(<String>[]);
    final drag = useState(0.0);
    final dragging = useState(false);
    useEffect(() {
      index.value = 0;
      kept.value = [];
      return null;
    }, homes);
    final done = index.value >= homes.length;

    void decide(bool keep) {
      if (done) {
        return;
      }
      final home = homes[index.value].listing;
      dragging.value = false;
      drag.value = keep ? 600 : -600;
      Future<void>.delayed(_leave, () {
        final nextKept = [...kept.value, if (keep) home.id];
        kept.value = nextKept;
        drag.value = 0;
        index.value++;
        if (index.value == homes.length) {
          onDone?.call((
            kept: nextKept,
            passed: [
              for (final other in homes)
                if (!nextKept.contains(other.listing.id)) other.listing.id,
            ],
          ));
        }
      });
    }

    if (done) {
      return _Summary(kept: kept.value.length, of: homes.length);
    }
    final home = homes[index.value];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Keep the ones that feel like yours',
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${index.value + 1} of ${homes.length}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return GestureDetector(
              onHorizontalDragStart: (_) => dragging.value = true,
              onHorizontalDragUpdate: (details) =>
                  drag.value += details.delta.dx,
              onHorizontalDragEnd: (details) {
                if (drag.value.abs() > width / 4) {
                  decide(drag.value > 0);
                } else {
                  dragging.value = false;
                  drag.value = 0;
                }
              },
              child: AnimatedSlide(
                key: ValueKey(home.listing.id),
                offset: Offset(drag.value / width, 0),
                duration: dragging.value ? Duration.zero : _leave,
                child: AnimatedRotation(
                  turns: drag.value / width * 0.04,
                  duration: dragging.value ? Duration.zero : _leave,
                  child: _SwipeCard(home: home, lean: drag.value),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Pass',
                icon: Icons.close,
                variant: AppButtonVariant.outlined,
                onPressed: () => decide(false),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppButton(
                label: 'Keep',
                icon: Icons.favorite_border,
                onPressed: () => decide(true),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Sample listings, not for sale. An estimate, not advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}

class _SwipeCard extends StatelessWidget {
  const _SwipeCard({required this.home, required this.lean});

  final PricedHome home;
  final double lean;

  @override
  Widget build(BuildContext context) {
    final listing = home.listing;
    final cost = home.cost;
    final hint = min(lean.abs() / 120, 1.0);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: Color.lerp(
            AppColors.border,
            lean > 0 ? AppColors.positive : AppColors.danger,
            hint,
          )!,
          width: 1 + hint,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadii.md),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (listing.photos.isNotEmpty)
                    AppPhoto(
                      id: listing.photos.first,
                      semanticLabel: listing.title,
                    ),
                  const Positioned(
                    left: AppSpacing.sm,
                    top: AppSpacing.sm,
                    child: _Tag(text: 'Sample listing'),
                  ),
                  if (hint > 0.2)
                    Positioned(
                      right: lean > 0 ? null : AppSpacing.sm,
                      left: lean > 0 ? AppSpacing.sm : null,
                      bottom: AppSpacing.sm,
                      child: Opacity(
                        opacity: hint,
                        child: _Tag(
                          text: lean > 0 ? 'Keep' : 'Pass',
                          color: lean > 0
                              ? AppColors.positive
                              : AppColors.danger,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${listing.areaName} · ${listing.address}',
                  style: AppTextStyles.label,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(listing.title, style: AppTextStyles.title),
                const SizedBox(height: AppSpacing.xxs),
                Text(moneyText(listing.price), style: AppTextStyles.figure),
                Text(homeFacts(listing), style: AppTextStyles.label),
                if (cost != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${moneyText(cost.monthly.totalWithFee)} a month for you',
                    style: AppTextStyles.figure.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    reachText(cost),
                    style: AppTextStyles.caption.copyWith(
                      color: cost.withinReach
                          ? AppColors.positive
                          : AppColors.danger,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: color ?? AppColors.surface.withValues(alpha: 0.9),
      borderRadius: BorderRadius.circular(AppRadii.pill),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      child: Text(
        text,
        style: AppTextStyles.label.copyWith(
          color: color == null ? AppColors.textSecondary : AppColors.onAccent,
        ),
      ),
    ),
  );
}

class _Summary extends StatelessWidget {
  const _Summary({required this.kept, required this.of});

  final int kept;
  final int of;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Icon(Icons.check_circle_outline, color: AppColors.positive),
      const SizedBox(width: AppSpacing.xs),
      Text(
        kept == 0 ? 'You passed on all $of' : 'You kept $kept of $of',
        style: AppTextStyles.label,
      ),
    ],
  );
}
