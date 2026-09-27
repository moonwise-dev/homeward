import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'rule_note_view.dart';

final ruleNoteItem = catalogItemFor(const RuleNote(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<RuleCheck>(
    dataContext: itemContext.dataContext,
    value: data['rule'],
    parse: (value) => jsonModelOf(value, RuleCheck.fromJson),
    builder: (context, rule) =>
        rule == null ? const SizedBox.shrink() : RuleNoteView(rule: rule),
  );
});
