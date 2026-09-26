abstract final class InlineSurfaces {
  static const maxPerTurn = 1;

  static RegExp idPattern(int turn) =>
      RegExp('^t$turn-[a-z0-9]+(-[a-z0-9]+)*\$');

  static String id(int turn, String slug) => 't$turn-$slug';
}
