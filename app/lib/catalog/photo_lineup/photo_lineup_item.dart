import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'photo_lineup_view.dart';

final photoLineupItem = catalogItemFor(const PhotoLineup(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<List<LineupPhoto>>(
    dataContext: itemContext.dataContext,
    value: data['photos'],
    parse: (value) => value is List<Object?>
        ? [
            for (final photo in value)
              if (photo case {
                'id': final String id,
                'caption': final String caption,
              })
                (id: id, caption: caption, credit: photo['credit'] as String?),
          ]
        : null,
    builder: (context, photos) => photos == null || photos.isEmpty
        ? const WaitingForDetails()
        : PhotoLineupView(
            photos: photos,
            onPick: (photo) => dispatchAction(
              itemContext,
              data['pick'],
              adding: {
                'facet': CaseFacet.photo.name,
                'value': photo.id,
                'label': photo.caption,
              },
            ),
          ),
  );
});
