import 'home_type.dart';

int typicalSizeM2(HomeType type, int rooms) => switch (type) {
  HomeType.flat => 15 + 20 * rooms.clamp(1, 6),
  HomeType.house => 40 + 22 * rooms.clamp(2, 8),
};
