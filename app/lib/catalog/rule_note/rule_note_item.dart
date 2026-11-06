import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'rule_note_view.dart';

final ruleNoteItem = catalogItemFor(const RuleNote(), (_, _, props, _) {
  final rule = jsonModelOf(props.value('rule'), RuleCheck.fromJson);
  return rule == null ? const SizedBox.shrink() : RuleNoteView(rule: rule);
});
