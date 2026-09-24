import 'dart:io';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';
import 'package:homeward_server/agent/validation/turn_validator.dart';
import 'package:homeward_server/agent/validation/validation_outcome.dart';
import 'package:homeward_server/markets/finding.dart';

import 'catalog_outputs.dart';
import 'example_messages.dart';

List<Finding> checkCatalog(Directory root) => [
  for (final MapEntry(key: path, value: content) in catalogOutputs().entries)
    if (!_matches(File('${root.path}/$path'), content))
      findingError(path, 'Stale; run make catalog'),
  ...checkCatalogExamples(),
  ...checkAppCatalogItems(Directory('${root.path}/app/lib/catalog')),
];

List<Finding> checkAppCatalogItems(
  Directory catalog, {
  List<CatalogComponent> components = homewardComponents,
}) {
  final implemented = {
    for (final file in [
      if (catalog.existsSync())
        ...catalog.listSync(recursive: true).whereType<File>(),
    ])
      if (file.path.endsWith('.dart'))
        for (final match in _catalogItemPattern.allMatches(
          file.readAsStringSync(),
        ))
          match.group(1)!,
  };
  final declared = {for (final component in components) component.name};
  return [
    for (final name in implemented.difference(declared))
      findingError(name, 'App catalog item without a declaration in common'),
    for (final name in declared.difference(implemented))
      findingError(name, 'Declared in common without an app catalog item'),
  ];
}

final _catalogItemPattern = RegExp(r'catalogItemFor\(\s*const\s+(\w+)\(\)');

List<Finding> checkCatalogExamples({
  List<CatalogComponent> components = homewardComponents,
  List<CatalogExample>? surfaces,
}) {
  final catalog = CatalogValidator(homewardCatalogDocument());
  final examples = [
    for (final component in components)
      for (final example in component.examples)
        (subject: '${component.name}: ${example.name}', example: example),
    for (final example in surfaces ?? surfaceExamples)
      (subject: 'Surface: ${example.name}', example: example),
  ];
  return [
    for (final (:subject, :example) in examples)
      if (_firstRejection(catalog, example) case final failure?)
        findingError(subject, failure),
  ];
}

String? _firstRejection(CatalogValidator catalog, CatalogExample example) {
  final validator = TurnValidator(
    turn: exampleTurn,
    catalog: catalog,
    shadow: MessageProcessor<ComponentApi>(
      catalogs: [Catalog(id: homewardCatalogId, components: const [])],
    ),
    seeds: example.dataModel,
  );
  for (final message in exampleMessages(example)) {
    if (validator.validate(message) case Rejected(:final failure)) {
      return '${failure.path} ${failure.message}';
    }
  }
  return null;
}

bool _matches(File file, String content) =>
    file.existsSync() && file.readAsStringSync() == content;
