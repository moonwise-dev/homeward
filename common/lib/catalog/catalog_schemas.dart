import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

abstract final class CatalogSchemas {
  static Schema slice(String path, String description) => Schema.object(
    description: description,
    properties: {'path': Schema.string(constValue: path)},
    required: ['path'],
    additionalProperties: false,
  );

  static final profile = slice('/profile', 'Always { "path": "/profile" }.');

  static final market = slice('/market', 'Always { "path": "/market" }.');

  static final scenario = slice('/scenario', 'Always { "path": "/scenario" }.');

  static Schema bound(String description) => Schema.object(
    description: description,
    properties: {'path': Schema.string()},
    required: ['path'],
    additionalProperties: false,
  );

  static final label = CommonSchemas.dynamicString;

  static final action = CommonSchemas.action;

  static final checks = Schema.list(
    items: Schema.object(
      properties: {
        'condition': CommonSchemas.dynamicBoolean,
        'message': Schema.string(),
      },
      required: ['condition', 'message'],
      additionalProperties: false,
    ),
  );

  static final currencyCode = Schema.string(pattern: r'^[A-Z]{3}$');
}
