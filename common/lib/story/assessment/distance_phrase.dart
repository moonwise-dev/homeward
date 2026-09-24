import 'dart:math';

String distancePhrase(int meters) => meters < 50
    ? 'under 50 m'
    : meters < 1000
    ? '${(meters / 10).round() * 10} m'
    : '${(meters / 1000).toStringAsFixed(1)} km';

int walkingMinutes(int meters) => max(1, (meters * 1.3 / 80).ceil());
