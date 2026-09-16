extension type const Rate.ppm(int partsPerMillion) {
  const Rate.bps(int basisPoints) : this.ppm(basisPoints * 100);

  static const zero = Rate.ppm(0);
  static const hundredPercent = Rate.ppm(1000000);

  double get fraction => partsPerMillion / hundredPercent.partsPerMillion;

  Rate operator +(Rate other) =>
      Rate.ppm(partsPerMillion + other.partsPerMillion);

  Rate operator -(Rate other) =>
      Rate.ppm(partsPerMillion - other.partsPerMillion);

  Rate operator -() => Rate.ppm(-partsPerMillion);

  bool operator <(Rate other) => partsPerMillion < other.partsPerMillion;

  bool operator <=(Rate other) => partsPerMillion <= other.partsPerMillion;

  bool operator >(Rate other) => partsPerMillion > other.partsPerMillion;

  bool operator >=(Rate other) => partsPerMillion >= other.partsPerMillion;

  int compareTo(Rate other) => partsPerMillion.compareTo(other.partsPerMillion);
}
