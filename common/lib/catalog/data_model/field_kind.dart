enum FieldKind {
  money('money object { "minorUnits": integer, "currency": ISO 4217 code }'),
  currency('ISO 4217 currency code'),
  text('string'),
  boolean('boolean'),
  integer('integer'),
  integers('list of integers'),
  choice('one of'),
  record('object read by Homeward components');

  const FieldKind(this.shape);

  final String shape;
}
