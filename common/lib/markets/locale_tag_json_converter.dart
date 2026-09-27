import 'package:json_annotation/json_annotation.dart';

import 'locale_tag.dart';

class LocaleTagJsonConverter implements JsonConverter<LocaleTag, String> {
  const LocaleTagJsonConverter();

  @override
  LocaleTag fromJson(String json) => LocaleTag.parse(json);

  @override
  String toJson(LocaleTag locale) => locale.tag;
}
