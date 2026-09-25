enum HomeType {
  flat('flat', 'flats'),
  house('house', 'houses');

  const HomeType(this.noun, this.nouns);

  final String noun;
  final String nouns;
}
