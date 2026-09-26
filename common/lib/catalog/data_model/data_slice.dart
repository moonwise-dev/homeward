import '../catalog_component.dart';
import 'slice_field.dart';

final class DataSlice {
  const DataSlice(
    this.name,
    this.description,
    this.fields, {
    this.part = CatalogPart.story,
  });

  final String name;
  final String description;
  final List<SliceField> fields;
  final CatalogPart part;

  String get path => '/$name';

  String pathOf(String field) => '$path/$field';

  SliceField field(String name) =>
      fields.firstWhere((field) => field.name == name);
}
