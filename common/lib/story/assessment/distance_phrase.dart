import 'dart:math';

const _unitSpace = '\u00a0';

String distancePhrase(int meters) => meters < 50
    ? 'under 50${_unitSpace}m'
    : meters < 1000
    ? '${(meters / 10).round() * 10}${_unitSpace}m'
    : '${(meters / 1000).toStringAsFixed(1)}${_unitSpace}km';

int walkingMinutes(int meters) => max(1, (meters * 1.3 / 80).ceil());
