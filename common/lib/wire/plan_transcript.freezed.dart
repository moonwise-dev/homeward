// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_transcript.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
RecordedInput _$RecordedInputFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'text':
          return RecordedText.fromJson(
            json
          );
                case 'action':
          return RecordedAction.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'RecordedInput',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$RecordedInput {



  /// Serializes this RecordedInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordedInput);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RecordedInput()';
}


}

/// @nodoc
class $RecordedInputCopyWith<$Res>  {
$RecordedInputCopyWith(RecordedInput _, $Res Function(RecordedInput) __);
}


/// Adds pattern-matching-related methods to [RecordedInput].
extension RecordedInputPatterns on RecordedInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RecordedText value)?  text,TResult Function( RecordedAction value)?  action,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RecordedText() when text != null:
return text(_that);case RecordedAction() when action != null:
return action(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RecordedText value)  text,required TResult Function( RecordedAction value)  action,}){
final _that = this;
switch (_that) {
case RecordedText():
return text(_that);case RecordedAction():
return action(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RecordedText value)?  text,TResult? Function( RecordedAction value)?  action,}){
final _that = this;
switch (_that) {
case RecordedText() when text != null:
return text(_that);case RecordedAction() when action != null:
return action(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  text,TResult Function( String name,  String surfaceId,  String sourceComponentId,  Map<String, Object?> context)?  action,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RecordedText() when text != null:
return text(_that.text);case RecordedAction() when action != null:
return action(_that.name,_that.surfaceId,_that.sourceComponentId,_that.context);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  text,required TResult Function( String name,  String surfaceId,  String sourceComponentId,  Map<String, Object?> context)  action,}) {final _that = this;
switch (_that) {
case RecordedText():
return text(_that.text);case RecordedAction():
return action(_that.name,_that.surfaceId,_that.sourceComponentId,_that.context);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  text,TResult? Function( String name,  String surfaceId,  String sourceComponentId,  Map<String, Object?> context)?  action,}) {final _that = this;
switch (_that) {
case RecordedText() when text != null:
return text(_that.text);case RecordedAction() when action != null:
return action(_that.name,_that.surfaceId,_that.sourceComponentId,_that.context);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RecordedText implements RecordedInput {
  const RecordedText(this.text, { String? $type}): $type = $type ?? 'text';
  factory RecordedText.fromJson(Map<String, dynamic> json) => _$RecordedTextFromJson(json);

 final  String text;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RecordedInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordedTextCopyWith<RecordedText> get copyWith => _$RecordedTextCopyWithImpl<RecordedText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecordedTextToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordedText&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'RecordedInput.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $RecordedTextCopyWith<$Res> implements $RecordedInputCopyWith<$Res> {
  factory $RecordedTextCopyWith(RecordedText value, $Res Function(RecordedText) _then) = _$RecordedTextCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$RecordedTextCopyWithImpl<$Res>
    implements $RecordedTextCopyWith<$Res> {
  _$RecordedTextCopyWithImpl(this._self, this._then);

  final RecordedText _self;
  final $Res Function(RecordedText) _then;

/// Create a copy of RecordedInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(RecordedText(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RecordedAction implements RecordedInput {
  const RecordedAction({required this.name, required this.surfaceId, required this.sourceComponentId,  Map<String, Object?> context = const {},  String? $type}): _context = context,$type = $type ?? 'action';
  factory RecordedAction.fromJson(Map<String, dynamic> json) => _$RecordedActionFromJson(json);

 final  String name;
 final  String surfaceId;
 final  String sourceComponentId;
 final  Map<String, Object?> _context;
@JsonKey() Map<String, Object?> get context {
  if (_context is EqualUnmodifiableMapView) return _context;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_context);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RecordedInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordedActionCopyWith<RecordedAction> get copyWith => _$RecordedActionCopyWithImpl<RecordedAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecordedActionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordedAction&&(identical(other.name, name) || other.name == name)&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.sourceComponentId, sourceComponentId) || other.sourceComponentId == sourceComponentId)&&const DeepCollectionEquality().equals(other.context, _context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,surfaceId,sourceComponentId,const DeepCollectionEquality().hash(_context));
}

@override
String toString() {
    return 'RecordedInput.action(name: $name, surfaceId: $surfaceId, sourceComponentId: $sourceComponentId, context: $context)';
}


}

/// @nodoc
abstract mixin class $RecordedActionCopyWith<$Res> implements $RecordedInputCopyWith<$Res> {
  factory $RecordedActionCopyWith(RecordedAction value, $Res Function(RecordedAction) _then) = _$RecordedActionCopyWithImpl;
@useResult
$Res call({
 String name, String surfaceId, String sourceComponentId, Map<String, Object?> context
});




}
/// @nodoc
class _$RecordedActionCopyWithImpl<$Res>
    implements $RecordedActionCopyWith<$Res> {
  _$RecordedActionCopyWithImpl(this._self, this._then);

  final RecordedAction _self;
  final $Res Function(RecordedAction) _then;

/// Create a copy of RecordedInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? surfaceId = null,Object? sourceComponentId = null,Object? context = null,}) {
  return _then(RecordedAction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,sourceComponentId: null == sourceComponentId ? _self.sourceComponentId : sourceComponentId // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self._context : context // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$TurnRecord {

 int get index; RecordedInput get input; String get outputText; List<Map<String, Object?>> get messages; TurnStatus get status; String? get errorCode;
/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnRecordCopyWith<TurnRecord> get copyWith => _$TurnRecordCopyWithImpl<TurnRecord>(this as TurnRecord, _$identity);

  /// Serializes this TurnRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TurnRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnRecord&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.input, _this.input) || other.input == _this.input)&&(identical(other.outputText, _this.outputText) || other.outputText == _this.outputText)&&const DeepCollectionEquality().equals(other.messages, _this.messages)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.errorCode, _this.errorCode) || other.errorCode == _this.errorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TurnRecord;
  return Object.hash(runtimeType,_this.index,_this.input,_this.outputText,const DeepCollectionEquality().hash(_this.messages),_this.status,_this.errorCode);
}

@override
String toString() {
  final _this = this as TurnRecord;
  return 'TurnRecord(index: ${_this.index}, input: ${_this.input}, outputText: ${_this.outputText}, messages: ${_this.messages}, status: ${_this.status}, errorCode: ${_this.errorCode})';
}


}

/// @nodoc
abstract mixin class $TurnRecordCopyWith<$Res>  {
  factory $TurnRecordCopyWith(TurnRecord value, $Res Function(TurnRecord) _then) = _$TurnRecordCopyWithImpl;
@useResult
$Res call({
 int index, RecordedInput input, String outputText, List<Map<String, Object?>> messages, TurnStatus status, String? errorCode
});


$RecordedInputCopyWith<$Res> get input;

}
/// @nodoc
class _$TurnRecordCopyWithImpl<$Res>
    implements $TurnRecordCopyWith<$Res> {
  _$TurnRecordCopyWithImpl(this._self, this._then);

  final TurnRecord _self;
  final $Res Function(TurnRecord) _then;

/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? input = null,Object? outputText = null,Object? messages = null,Object? status = null,Object? errorCode = freezed,}) {
  return _then(TurnRecord(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as RecordedInput,outputText: null == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TurnStatus,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecordedInputCopyWith<$Res> get input {
  
  return $RecordedInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// Adds pattern-matching-related methods to [TurnRecord].
extension TurnRecordPatterns on TurnRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurnRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurnRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurnRecord value)  $default,){
final _that = this;
switch (_that) {
case _TurnRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurnRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TurnRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  RecordedInput input,  String outputText,  List<Map<String, Object?>> messages,  TurnStatus status,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurnRecord() when $default != null:
return $default(_that.index,_that.input,_that.outputText,_that.messages,_that.status,_that.errorCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  RecordedInput input,  String outputText,  List<Map<String, Object?>> messages,  TurnStatus status,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _TurnRecord():
return $default(_that.index,_that.input,_that.outputText,_that.messages,_that.status,_that.errorCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  RecordedInput input,  String outputText,  List<Map<String, Object?>> messages,  TurnStatus status,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _TurnRecord() when $default != null:
return $default(_that.index,_that.input,_that.outputText,_that.messages,_that.status,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TurnRecord implements TurnRecord {
  const _TurnRecord({required this.index, required this.input, this.outputText = '',  List<Map<String, Object?>> messages = const [], required this.status, this.errorCode}): _messages = messages;
  factory _TurnRecord.fromJson(Map<String, dynamic> json) => _$TurnRecordFromJson(json);

@override final  int index;
@override final  RecordedInput input;
@override@JsonKey() final  String outputText;
 final  List<Map<String, Object?>> _messages;
@override@JsonKey() List<Map<String, Object?>> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  TurnStatus status;
@override final  String? errorCode;

/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnRecordCopyWith<_TurnRecord> get copyWith => __$TurnRecordCopyWithImpl<_TurnRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TurnRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnRecord&&(identical(other.index, index) || other.index == index)&&(identical(other.input, input) || other.input == input)&&(identical(other.outputText, outputText) || other.outputText == outputText)&&const DeepCollectionEquality().equals(other.messages, _messages)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,index,input,outputText,const DeepCollectionEquality().hash(_messages),status,errorCode);
}

@override
String toString() {
    return 'TurnRecord(index: $index, input: $input, outputText: $outputText, messages: $messages, status: $status, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$TurnRecordCopyWith<$Res> implements $TurnRecordCopyWith<$Res> {
  factory _$TurnRecordCopyWith(_TurnRecord value, $Res Function(_TurnRecord) _then) = __$TurnRecordCopyWithImpl;
@override @useResult
$Res call({
 int index, RecordedInput input, String outputText, List<Map<String, Object?>> messages, TurnStatus status, String? errorCode
});


@override $RecordedInputCopyWith<$Res> get input;

}
/// @nodoc
class __$TurnRecordCopyWithImpl<$Res>
    implements _$TurnRecordCopyWith<$Res> {
  __$TurnRecordCopyWithImpl(this._self, this._then);

  final _TurnRecord _self;
  final $Res Function(_TurnRecord) _then;

/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? input = null,Object? outputText = null,Object? messages = null,Object? status = null,Object? errorCode = freezed,}) {
  return _then(_TurnRecord(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as RecordedInput,outputText: null == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TurnStatus,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TurnRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecordedInputCopyWith<$Res> get input {
  
  return $RecordedInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// @nodoc
mixin _$PlanListing {

 String get sessionId; int get turnCount; String? get title; String? get marketId; String? get marketName; DateTime? get updatedAt;
/// Create a copy of PlanListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanListingCopyWith<PlanListing> get copyWith => _$PlanListingCopyWithImpl<PlanListing>(this as PlanListing, _$identity);

  /// Serializes this PlanListing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanListing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanListing&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.turnCount, _this.turnCount) || other.turnCount == _this.turnCount)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanListing;
  return Object.hash(runtimeType,_this.sessionId,_this.turnCount,_this.title,_this.marketId,_this.marketName,_this.updatedAt);
}

@override
String toString() {
  final _this = this as PlanListing;
  return 'PlanListing(sessionId: ${_this.sessionId}, turnCount: ${_this.turnCount}, title: ${_this.title}, marketId: ${_this.marketId}, marketName: ${_this.marketName}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $PlanListingCopyWith<$Res>  {
  factory $PlanListingCopyWith(PlanListing value, $Res Function(PlanListing) _then) = _$PlanListingCopyWithImpl;
@useResult
$Res call({
 String sessionId, int turnCount, String? title, String? marketId, String? marketName, DateTime? updatedAt
});




}
/// @nodoc
class _$PlanListingCopyWithImpl<$Res>
    implements $PlanListingCopyWith<$Res> {
  _$PlanListingCopyWithImpl(this._self, this._then);

  final PlanListing _self;
  final $Res Function(PlanListing) _then;

/// Create a copy of PlanListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? turnCount = null,Object? title = freezed,Object? marketId = freezed,Object? marketName = freezed,Object? updatedAt = freezed,}) {
  return _then(PlanListing(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String?,marketName: freezed == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanListing].
extension PlanListingPatterns on PlanListing {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanListing() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanListing value)  $default,){
final _that = this;
switch (_that) {
case _PlanListing():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanListing value)?  $default,){
final _that = this;
switch (_that) {
case _PlanListing() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  int turnCount,  String? title,  String? marketId,  String? marketName,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanListing() when $default != null:
return $default(_that.sessionId,_that.turnCount,_that.title,_that.marketId,_that.marketName,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  int turnCount,  String? title,  String? marketId,  String? marketName,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PlanListing():
return $default(_that.sessionId,_that.turnCount,_that.title,_that.marketId,_that.marketName,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  int turnCount,  String? title,  String? marketId,  String? marketName,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PlanListing() when $default != null:
return $default(_that.sessionId,_that.turnCount,_that.title,_that.marketId,_that.marketName,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanListing implements PlanListing {
  const _PlanListing({required this.sessionId, this.turnCount = 0, this.title, this.marketId, this.marketName, this.updatedAt});
  factory _PlanListing.fromJson(Map<String, dynamic> json) => _$PlanListingFromJson(json);

@override final  String sessionId;
@override@JsonKey() final  int turnCount;
@override final  String? title;
@override final  String? marketId;
@override final  String? marketName;
@override final  DateTime? updatedAt;

/// Create a copy of PlanListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanListingCopyWith<_PlanListing> get copyWith => __$PlanListingCopyWithImpl<_PlanListing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanListingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanListing&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.turnCount, turnCount) || other.turnCount == turnCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,turnCount,title,marketId,marketName,updatedAt);
}

@override
String toString() {
    return 'PlanListing(sessionId: $sessionId, turnCount: $turnCount, title: $title, marketId: $marketId, marketName: $marketName, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PlanListingCopyWith<$Res> implements $PlanListingCopyWith<$Res> {
  factory _$PlanListingCopyWith(_PlanListing value, $Res Function(_PlanListing) _then) = __$PlanListingCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, int turnCount, String? title, String? marketId, String? marketName, DateTime? updatedAt
});




}
/// @nodoc
class __$PlanListingCopyWithImpl<$Res>
    implements _$PlanListingCopyWith<$Res> {
  __$PlanListingCopyWithImpl(this._self, this._then);

  final _PlanListing _self;
  final $Res Function(_PlanListing) _then;

/// Create a copy of PlanListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? turnCount = null,Object? title = freezed,Object? marketId = freezed,Object? marketName = freezed,Object? updatedAt = freezed,}) {
  return _then(_PlanListing(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String?,marketName: freezed == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PlanTranscript {

 String get sessionId; List<TurnRecord> get turns; List<Map<String, Object?>> get board;
/// Create a copy of PlanTranscript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanTranscriptCopyWith<PlanTranscript> get copyWith => _$PlanTranscriptCopyWithImpl<PlanTranscript>(this as PlanTranscript, _$identity);

  /// Serializes this PlanTranscript to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanTranscript;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanTranscript&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&const DeepCollectionEquality().equals(other.turns, _this.turns)&&const DeepCollectionEquality().equals(other.board, _this.board));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanTranscript;
  return Object.hash(runtimeType,_this.sessionId,const DeepCollectionEquality().hash(_this.turns),const DeepCollectionEquality().hash(_this.board));
}

@override
String toString() {
  final _this = this as PlanTranscript;
  return 'PlanTranscript(sessionId: ${_this.sessionId}, turns: ${_this.turns}, board: ${_this.board})';
}


}

/// @nodoc
abstract mixin class $PlanTranscriptCopyWith<$Res>  {
  factory $PlanTranscriptCopyWith(PlanTranscript value, $Res Function(PlanTranscript) _then) = _$PlanTranscriptCopyWithImpl;
@useResult
$Res call({
 String sessionId, List<TurnRecord> turns, List<Map<String, Object?>> board
});




}
/// @nodoc
class _$PlanTranscriptCopyWithImpl<$Res>
    implements $PlanTranscriptCopyWith<$Res> {
  _$PlanTranscriptCopyWithImpl(this._self, this._then);

  final PlanTranscript _self;
  final $Res Function(PlanTranscript) _then;

/// Create a copy of PlanTranscript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? turns = null,Object? board = null,}) {
  return _then(PlanTranscript(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,turns: null == turns ? _self.turns : turns // ignore: cast_nullable_to_non_nullable
as List<TurnRecord>,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanTranscript].
extension PlanTranscriptPatterns on PlanTranscript {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanTranscript value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanTranscript() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanTranscript value)  $default,){
final _that = this;
switch (_that) {
case _PlanTranscript():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanTranscript value)?  $default,){
final _that = this;
switch (_that) {
case _PlanTranscript() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  List<TurnRecord> turns,  List<Map<String, Object?>> board)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanTranscript() when $default != null:
return $default(_that.sessionId,_that.turns,_that.board);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  List<TurnRecord> turns,  List<Map<String, Object?>> board)  $default,) {final _that = this;
switch (_that) {
case _PlanTranscript():
return $default(_that.sessionId,_that.turns,_that.board);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  List<TurnRecord> turns,  List<Map<String, Object?>> board)?  $default,) {final _that = this;
switch (_that) {
case _PlanTranscript() when $default != null:
return $default(_that.sessionId,_that.turns,_that.board);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanTranscript implements PlanTranscript {
  const _PlanTranscript({required this.sessionId,  List<TurnRecord> turns = const [],  List<Map<String, Object?>> board = const []}): _turns = turns,_board = board;
  factory _PlanTranscript.fromJson(Map<String, dynamic> json) => _$PlanTranscriptFromJson(json);

@override final  String sessionId;
 final  List<TurnRecord> _turns;
@override@JsonKey() List<TurnRecord> get turns {
  if (_turns is EqualUnmodifiableListView) return _turns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turns);
}

 final  List<Map<String, Object?>> _board;
@override@JsonKey() List<Map<String, Object?>> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}


/// Create a copy of PlanTranscript
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanTranscriptCopyWith<_PlanTranscript> get copyWith => __$PlanTranscriptCopyWithImpl<_PlanTranscript>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanTranscriptToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanTranscript&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&const DeepCollectionEquality().equals(other.turns, _turns)&&const DeepCollectionEquality().equals(other.board, _board));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,const DeepCollectionEquality().hash(_turns),const DeepCollectionEquality().hash(_board));
}

@override
String toString() {
    return 'PlanTranscript(sessionId: $sessionId, turns: $turns, board: $board)';
}


}

/// @nodoc
abstract mixin class _$PlanTranscriptCopyWith<$Res> implements $PlanTranscriptCopyWith<$Res> {
  factory _$PlanTranscriptCopyWith(_PlanTranscript value, $Res Function(_PlanTranscript) _then) = __$PlanTranscriptCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, List<TurnRecord> turns, List<Map<String, Object?>> board
});




}
/// @nodoc
class __$PlanTranscriptCopyWithImpl<$Res>
    implements _$PlanTranscriptCopyWith<$Res> {
  __$PlanTranscriptCopyWithImpl(this._self, this._then);

  final _PlanTranscript _self;
  final $Res Function(_PlanTranscript) _then;

/// Create a copy of PlanTranscript
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? turns = null,Object? board = null,}) {
  return _then(_PlanTranscript(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,turns: null == turns ? _self._turns : turns // ignore: cast_nullable_to_non_nullable
as List<TurnRecord>,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,
  ));
}


}

// dart format on
