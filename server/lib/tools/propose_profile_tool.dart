import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'slice_parameters.dart';

final class ProposeProfileTool extends AgentTool {
  const ProposeProfileTool();

  static final _moneyFields = {
    for (final field in profileSlice.fields)
      if (field.kind == FieldKind.money) field.name,
  };

  @override
  String get name => 'propose_profile';

  @override
  String get description =>
      'Propose facts the buyer stated about themselves so the form is '
      'prefilled. Pass only what the buyer actually said; the buyer commits '
      'the form. Countries are ISO 3166-1 alpha-2 codes.';

  @override
  Map<String, Object?> get parameters => sliceParameters(profileSlice);

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final plan = context.plan;
    final currency = switch (plan.marketId) {
      final id? => context.markets.resolveFor(id, plan.profile)?.currency,
      null => null,
    };
    final draft = (plan.profileDraft ?? plan.profile).toJson();
    final accepted = <String>[];
    final rejected = <Map<String, Object?>>[];
    for (final MapEntry(key: field, value: value) in arguments.entries) {
      try {
        final json = _moneyFields.contains(field)
            ? moneyFromArgument(value, currency).toJson()
            : value;
        BuyerProfile.fromJson({field: json});
        draft[field] = json;
        accepted.add(field);
      } on FormatException catch (error) {
        rejected.add({'field': field, 'reason': error.message});
      } on CheckedFromJsonException catch (error) {
        rejected.add({
          'field': field,
          'reason': '${error.innerError ?? error.message}',
        });
      }
    }
    final profile = BuyerProfile.fromJson(draft);
    return ToolResult(
      modelResult: {'accepted': accepted, 'rejected': rejected},
      seeds: {'profile': profile.toJson()},
      plan: plan.copyWith(profileDraft: profile),
    );
  }
}
