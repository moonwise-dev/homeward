import 'package:flutter/widgets.dart';

abstract final class AppMotion {
  static const figure = Duration(milliseconds: 180);
  static const surface = Duration(milliseconds: 200);
  static const page = Duration(milliseconds: 320);
  static const rise = 8.0;
  static const curve = Curves.easeOut;

  static Duration of(BuildContext context, Duration duration) =>
      MediaQuery.disableAnimationsOf(context) ? Duration.zero : duration;
}
