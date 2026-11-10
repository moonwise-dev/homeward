import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/explore/explore_parts.dart';
import '../../ui/explore/map_canvas.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';

final homeMapItem = catalogItemFor(const HomeMap(), (_, node, props, _) {
  final homes = jsonModelOf(props.value('map'), CityHomes.fromJson);
  if (homes == null) {
    return const SizedBox.shrink();
  }
  return HomeMapPreview(homes: homes);
});

class HomeMapPreview extends StatelessWidget {
  const HomeMapPreview({required this.homes, super.key});

  final CityHomes homes;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(AppRadii.lg),
    child: SizedBox(
      height: 380,
      child: Stack(
        children: [
          Positioned.fill(
            child: MapCanvas(
              homes: homes,
              pinStates: {
                for (final home in homes.homes)
                  home.listing.id: home.withinBudget == false
                      ? PinState.overBudget
                      : PinState.left,
              },
              routeAreas: {
                for (final home in homes.ranked(homes.affordable).take(2))
                  home.listing.areaId,
              },
              onTapHome: null,
              padding: const EdgeInsets.fromLTRB(40, 110, 40, 40),
            ),
          ),
          Positioned(
            top: AppSpacing.sm,
            left: AppSpacing.sm,
            child: FunnelCounter(homes: homes, narrowing: const Narrowing()),
          ),
        ],
      ),
    ),
  );
}
