import 'package:common/common.dart';
import 'package:genui/genui.dart';

CatalogItem catalogItemFor(
  CatalogComponent component,
  CatalogWidgetBuilder builder,
) => CatalogItem(
  name: component.name,
  dataSchema: component.schema,
  widgetBuilder: builder,
);
