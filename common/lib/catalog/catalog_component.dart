import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

final class CatalogExample {
  const CatalogExample({
    required this.name,
    required this.componentsJson,
    required this.dataModel,
  });

  final String name;
  final String componentsJson;
  final Map<String, Object?> dataModel;

  List<Map<String, Object?>> get components => [
    for (final component in jsonDecode(componentsJson) as List<Object?>)
      component! as Map<String, Object?>,
  ];
}

enum CatalogFamily {
  understanding('Understanding'),
  money('Money'),
  homes('Homes'),
  placeAndTravel('Place and travel'),
  trust('Trust');

  const CatalogFamily(this.label);

  final String label;
}

abstract class CatalogComponent implements ComponentApi {
  const CatalogComponent();

  CatalogFamily get family;

  String get description;

  bool get agentVisible;

  Map<String, Schema> get properties;

  List<String> get requiredProperties;

  List<String> get boundProperties;

  List<CatalogExample> get examples;

  @override
  Schema get schema => Schema.object(
    description: description,
    properties: {
      'id': CommonSchemas.componentId,
      'component': Schema.string(constValue: name),
      'weight': Schema.number(),
      'accessibility': Schema.object(additionalProperties: true),
      ...properties,
    },
    required: ['id', 'component', ...requiredProperties],
    additionalProperties: false,
  );
}
