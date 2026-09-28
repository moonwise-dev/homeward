import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/motion.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_photo.dart';

class PhotoCarousel extends HookWidget {
  const PhotoCarousel({
    required this.photos,
    required this.label,
    this.credit,
    this.tag,
    super.key,
  });

  final List<String> photos;
  final String label;
  final String? credit;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final controller = usePageController();
    final page = useState(0);
    void go(int index) => controller.animateToPage(
      index,
      duration: AppMotion.of(context, AppMotion.page),
      curve: AppMotion.curve,
    );
    final credit = this.credit;
    final tag = this.tag;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: photos.length,
              onPageChanged: (index) => page.value = index,
              itemBuilder: (context, index) => AppPhoto(
                id: photos[index],
                semanticLabel: '$label, photo ${index + 1} of ${photos.length}',
              ),
            ),
            if (tag != null)
              Positioned(
                top: AppSpacing.xs,
                left: AppSpacing.xs,
                child: _Chip(text: tag),
              ),
            if (photos.length > 1) ...[
              Positioned(
                left: AppSpacing.xxs,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _Arrow(
                    icon: Icons.chevron_left,
                    tooltip: 'Previous photo',
                    onPressed: page.value == 0
                        ? null
                        : () => go(page.value - 1),
                  ),
                ),
              ),
              Positioned(
                right: AppSpacing.xxs,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _Arrow(
                    icon: Icons.chevron_right,
                    tooltip: 'Next photo',
                    onPressed: page.value == photos.length - 1
                        ? null
                        : () => go(page.value + 1),
                  ),
                ),
              ),
            ],
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color(0x8C000000)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.sm,
                    AppSpacing.lg,
                    AppSpacing.sm,
                    AppSpacing.xs,
                  ),
                  child: Row(
                    children: [
                      for (var index = 0; index < photos.length; index++)
                        AnimatedContainer(
                          duration: AppMotion.of(context, AppMotion.surface),
                          margin: const EdgeInsets.only(right: AppSpacing.xxs),
                          width: index == page.value ? 16 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: index == page.value
                                ? colors.onPhoto
                                : colors.onPhoto.withValues(alpha: 0.55),
                            borderRadius: BorderRadius.circular(AppRadii.pill),
                          ),
                        ),
                      const Spacer(),
                      if (credit != null)
                        Flexible(
                          child: Text(
                            credit,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: styles.caption.copyWith(
                              color: colors.onPhoto,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs,
        ),
        child: Text(text, style: styles.caption),
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({required this.icon, required this.tooltip, this.onPressed});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return AnimatedOpacity(
      opacity: onPressed == null ? 0 : 1,
      duration: AppMotion.of(context, AppMotion.surface),
      child: IconButton.filledTonal(
        tooltip: tooltip,
        iconSize: 20,
        visualDensity: VisualDensity.compact,
        style: IconButton.styleFrom(
          backgroundColor: colors.surface.withValues(alpha: 0.85),
        ),
        icon: Icon(icon, color: colors.text),
        onPressed: onPressed,
      ),
    );
  }
}
