enum OutdoorSpace {
  none('no outdoor space'),
  balcony('a balcony'),
  garden('a garden');

  const OutdoorSpace(this.phrase);

  final String phrase;

  bool satisfies(OutdoorSpace wanted) => index >= wanted.index;
}
