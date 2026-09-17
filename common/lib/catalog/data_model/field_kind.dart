enum FieldKind {
  money('money object { "minorUnits": integer, "currency": ISO 4217 code }'),
  moneyBounds('{ "min", "max", "step" }, each a money object'),
  country('ISO 3166-1 alpha-2 country code'),
  market('ISO 3166 code of a country or subdivision, such as SE or PT-30'),
  currency('ISO 4217 currency code'),
  text('string'),
  boolean('boolean'),
  integer('integer'),
  integers('list of integers'),
  choice('one of'),
  ppm('integer parts per million; 10000 is 1%'),
  record('object read by Homeward components');

  const FieldKind(this.shape);

  final String shape;
}
