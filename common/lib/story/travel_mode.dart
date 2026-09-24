enum TravelMode {
  walk('on foot'),
  bike('by bike'),
  car('by car'),
  transit('by transit');

  const TravelMode(this.phrase);

  final String phrase;
}
