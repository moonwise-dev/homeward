import 'package:flutter/material.dart';

abstract final class AppMapTint {
  static final light = _softened(saturation: 0.35, lift: 12);

  static final dark = _turnedOver(contrast: 0.6, lift: 18);

  static ColorFilter of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;
}

const _luminance = [0.2126, 0.7152, 0.0722];
const _waterDarkest = [-1.0, 0.5, 1.5];
const _alphaKept = <double>[0, 0, 0, 1, 0];

ColorFilter _softened({required double saturation, required double lift}) {
  final grey = 1 - saturation;
  return ColorFilter.matrix([
    for (var channel = 0; channel < 3; channel++) ...[
      for (var source = 0; source < 3; source++)
        grey * _luminance[source] + (source == channel ? saturation : 0),
      0,
      lift,
    ],
    ..._alphaKept,
  ]);
}

ColorFilter _turnedOver({required double contrast, required double lift}) =>
    ColorFilter.matrix([
      for (var channel = 0; channel < 3; channel++) ...[
        for (final weight in _waterDarkest) -weight * contrast,
        0,
        255 * contrast + lift,
      ],
      ..._alphaKept,
    ]);
