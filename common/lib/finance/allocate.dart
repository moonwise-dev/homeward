import '../money/money.dart';

List<Money> allocate(Money total, List<int> weights) {
  final sum = weights.fold<int>(0, (sum, weight) => sum + weight);
  if (weights.isEmpty || sum <= 0 || weights.any((weight) => weight < 0)) {
    throw ArgumentError.value(weights, 'weights', 'Must be positive');
  }
  final parts = [
    for (final weight in weights) total.minorUnits * weight ~/ sum,
  ];
  final remainders =
      [
        for (final (index, weight) in weights.indexed)
          (index: index, remainder: total.minorUnits * weight % sum),
      ]..sort(
        (a, b) => switch (b.remainder.compareTo(a.remainder)) {
          0 => a.index.compareTo(b.index),
          final order => order,
        },
      );
  final left = total.minorUnits - parts.fold<int>(0, (sum, part) => sum + part);
  for (final (:index, remainder: _) in remainders.take(left)) {
    parts[index] += 1;
  }
  return [for (final part in parts) total.copyWith(minorUnits: part)];
}
