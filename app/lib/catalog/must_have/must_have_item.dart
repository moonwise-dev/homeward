import 'package:common/common.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'must_have_view.dart';

final mustHaveItem = catalogItemFor(const MustHave(), (_, node, props, _) {
  final kind =
      MustHaveKind.fromWire(props.string('kind')) ?? MustHaveKind.bedrooms;
  final atLeast = switch (props.value('atLeast')) {
    final num value => value.toInt(),
    _ => null,
  };
  return MustHaveView(
    rule: MustHaveRule(kind, atLeast: kind.takesNumber ? atLeast : null),
    label: props.string('label') ?? kind.meaning,
    fallback: jsonModelOf(
      node.context?.surface.dataModel.get('/map'),
      CityHomes.fromJson,
    ),
  );
});
