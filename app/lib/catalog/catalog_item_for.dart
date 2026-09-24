import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../ui/core/ui/app_status_line.dart';

CatalogItem catalogItemFor(
  CatalogComponent component,
  CatalogWidgetBuilder builder,
) => CatalogItem(
  name: component.name,
  dataSchema: component.schema,
  widgetBuilder: builder,
);

class WaitingForDetails extends StatelessWidget {
  const WaitingForDetails({super.key});

  @override
  Widget build(BuildContext context) =>
      const AppStatusLine(text: 'Waiting for your details');
}
