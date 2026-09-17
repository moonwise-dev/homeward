import 'field_kind.dart';

final class SliceField {
  const SliceField(
    this.name,
    this.kind,
    this.description, {
    this.choices = const [],
  });

  final String name;
  final FieldKind kind;
  final String description;
  final List<Enum> choices;

  List<String> get choiceValues => [for (final choice in choices) choice.name];

  String get shape => switch (kind) {
    FieldKind.choice => '${kind.shape} ${choiceValues.join(', ')}',
    _ => kind.shape,
  };
}
