import 'slice_field.dart';

final class DataSlice {
  const DataSlice(
    this.name,
    this.description,
    this.fields, {
    required this.seededBy,
  });

  final String name;
  final String seededBy;
  final String description;
  final List<SliceField> fields;

  String get path => '/$name';

  String pathOf(String field) => '$path/$field';

  SliceField field(String name) =>
      fields.firstWhere((field) => field.name == name);
}
