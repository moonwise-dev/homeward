import 'package:flutter/widgets.dart';

import '../../ui/app_status_line.dart';

class WaitingForDetails extends StatelessWidget {
  const WaitingForDetails({super.key});

  @override
  Widget build(BuildContext context) =>
      const AppStatusLine(text: 'Waiting for your details');
}
