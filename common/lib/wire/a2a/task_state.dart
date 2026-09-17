import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.kebab)
enum TaskState { submitted, working, completed, canceled }
