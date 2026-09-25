import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/motion.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_photo.dart';

typedef LineupPhoto = ({String id, String caption, String? credit});

class PhotoLineupView extends HookWidget {
  const PhotoLineupView({
    required this.photos,
    required this.onPick,
    super.key,
  });

  final List<LineupPhoto> photos;
  final ValueChanged<LineupPhoto> onPick;

  @override
  Widget build(BuildContext context) {
    final picked = useState<String?>(null);
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 720 ? 4 : 2;
        final width =
            (constraints.maxWidth - AppSpacing.sm * (columns - 1)) / columns;
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final photo in photos)
              SizedBox(
                width: width,
                child: _Tile(
                  photo: photo,
                  isPicked: picked.value == photo.id,
                  isDimmed: picked.value != null && picked.value != photo.id,
                  onTap: picked.value == null
                      ? () {
                          picked.value = photo.id;
                          onPick(photo);
                        }
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.photo,
    required this.isPicked,
    required this.isDimmed,
    this.onTap,
  });

  final LineupPhoto photo;
  final bool isPicked;
  final bool isDimmed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: isDimmed ? 0.45 : 1,
    duration: AppMotion.of(context, AppMotion.surface),
    child: Semantics(
      button: true,
      selected: isPicked,
      label: photo.caption,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: AppMotion.of(context, AppMotion.surface),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadii.md + 3),
                border: Border.all(
                  color: isPicked ? AppColors.accent : const Color(0x00000000),
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadii.md),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppPhoto(id: photo.id),
                      if (isPicked)
                        const Positioned(
                          top: AppSpacing.xs,
                          right: AppSpacing.xs,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.accent,
                            child: Icon(
                              Icons.check,
                              size: 18,
                              color: AppColors.onAccent,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xxs,
                AppSpacing.xs,
                AppSpacing.xxs,
                0,
              ),
              child: Text(
                photo.caption,
                style: AppTextStyles.label.copyWith(color: AppColors.text),
              ),
            ),
            if (photo.credit case final credit?)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                child: Text(credit, style: AppTextStyles.caption),
              ),
          ],
        ),
      ),
    ),
  );
}
