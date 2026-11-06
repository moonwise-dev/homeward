import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';

ComponentImplementation catalogItemFor(
  CatalogComponent component,
  ComponentWidgetBuilder builder,
) => ComponentImplementation(
  name: component.name,
  schema: component.schema,
  builder: builder,
);
