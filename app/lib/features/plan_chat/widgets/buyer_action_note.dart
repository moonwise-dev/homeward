import 'package:flutter/material.dart';

import '../../../ui/app_status_line.dart';

class BuyerActionNote extends StatelessWidget {
  const BuyerActionNote({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: AppStatusLine(text: label, icon: Icons.check_circle_outline),
  );
}
