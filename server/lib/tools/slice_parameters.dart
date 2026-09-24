import 'package:common/common.dart';

import 'amount_arguments.dart';

Map<String, Object?> sliceParameters(
  DataSlice slice, {
  Set<String>? only,
  List<String> required = const [],
}) => {
  'type': 'object',
  'properties': {
    for (final field in slice.fields)
      if (only == null || only.contains(field.name))
        field.name: fieldParameter(field),
  },
  if (required.isNotEmpty) 'required': required,
};

Map<String, Object?> fieldParameter(SliceField field) => switch (field.kind) {
  FieldKind.money => {...amountParameter, 'description': field.description},
  FieldKind.boolean => {'type': 'boolean', 'description': field.description},
  FieldKind.integer ||
  FieldKind.ppm => {'type': 'integer', 'description': field.description},
  FieldKind.integers => {
    'type': 'array',
    'items': {'type': 'integer'},
    'description': field.description,
  },
  FieldKind.choice => {
    'type': 'string',
    'enum': field.choiceValues,
    'description': field.description,
  },
  FieldKind.criteria => {
    'type': 'array',
    'items': {
      'type': 'string',
      'enum': [for (final kind in CriterionKind.values) kind.name],
    },
    'description': field.description,
  },
  FieldKind.country ||
  FieldKind.market ||
  FieldKind.currency ||
  FieldKind.text => {
    'type': 'string',
    'description': switch (field.kind) {
      FieldKind.text => field.description,
      _ => '${field.description} ${field.kind.shape}.',
    },
  },
  FieldKind.moneyBounds ||
  FieldKind.record => {'type': 'object', 'description': field.description},
};
