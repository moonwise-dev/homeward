enum TravelMode {
  walk('on foot', 'walking'),
  bike('by bike', 'bicycling'),
  car('by car', 'driving'),
  transit('by transit', 'transit');

  const TravelMode(this.phrase, this.mapsName);

  final String phrase;
  final String mapsName;
}
