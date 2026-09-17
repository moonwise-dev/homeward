import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

import 'form_value.dart';

typedef FormProfile = ({
  BuyerProfile profile,
  List<Map<String, Object?>> rejected,
});

FormProfile profileFromForm(Map<String, Object?> form) {
  final accepted = <String, Object?>{};
  final rejected = <Map<String, Object?>>[];
  for (final field in profileSlice.fields) {
    final value = formValue(field, form[field.name]);
    if (value == null) {
      continue;
    }
    try {
      BuyerProfile.fromJson({field.name: value});
      accepted[field.name] = value;
    } on CheckedFromJsonException catch (error) {
      rejected.add({
        'field': field.name,
        'reason': '${error.innerError ?? error.message}',
      });
    } on FormatException catch (error) {
      rejected.add({'field': field.name, 'reason': error.message});
    }
  }
  return (profile: BuyerProfile.fromJson(accepted), rejected: rejected);
}
