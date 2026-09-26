import 'dart:convert';

import 'package:common/common.dart';

import 'render_catalog_reference.dart';
import 'render_catalog_skill.dart';

const catalogDocumentPath = 'common/lib/catalog/generated/catalog.json';
const catalogSkillPath = 'server/prompts/generated/catalog_skill.md';
const catalogReferencePath = 'docs/generated/catalog_reference.md';

Map<String, String> catalogOutputs() => {
  catalogDocumentPath:
      '${const JsonEncoder.withIndent('  ').convert(homewardCatalogDocument())}\n',
  catalogSkillPath: renderCatalogSkill(),
  catalogReferencePath: renderCatalogReference(),
};
