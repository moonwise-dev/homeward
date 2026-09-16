// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InteractionInput {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionInput);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InteractionInput()';
}


}

/// @nodoc
class $InteractionInputCopyWith<$Res>  {
$InteractionInputCopyWith(InteractionInput _, $Res Function(InteractionInput) __);
}


/// Adds pattern-matching-related methods to [InteractionInput].
extension InteractionInputPatterns on InteractionInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextInput value)?  text,TResult Function( FunctionResultsInput value)?  functionResults,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextInput() when text != null:
return text(_that);case FunctionResultsInput() when functionResults != null:
return functionResults(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextInput value)  text,required TResult Function( FunctionResultsInput value)  functionResults,}){
final _that = this;
switch (_that) {
case TextInput():
return text(_that);case FunctionResultsInput():
return functionResults(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextInput value)?  text,TResult? Function( FunctionResultsInput value)?  functionResults,}){
final _that = this;
switch (_that) {
case TextInput() when text != null:
return text(_that);case FunctionResultsInput() when functionResults != null:
return functionResults(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  text,TResult Function( List<FunctionResult> results)?  functionResults,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextInput() when text != null:
return text(_that.text);case FunctionResultsInput() when functionResults != null:
return functionResults(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  text,required TResult Function( List<FunctionResult> results)  functionResults,}) {final _that = this;
switch (_that) {
case TextInput():
return text(_that.text);case FunctionResultsInput():
return functionResults(_that.results);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  text,TResult? Function( List<FunctionResult> results)?  functionResults,}) {final _that = this;
switch (_that) {
case TextInput() when text != null:
return text(_that.text);case FunctionResultsInput() when functionResults != null:
return functionResults(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class TextInput extends InteractionInput {
  const TextInput(this.text): super._();
  

 final  String text;

/// Create a copy of InteractionInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextInputCopyWith<TextInput> get copyWith => _$TextInputCopyWithImpl<TextInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TextInput&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'InteractionInput.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextInputCopyWith<$Res> implements $InteractionInputCopyWith<$Res> {
  factory $TextInputCopyWith(TextInput value, $Res Function(TextInput) _then) = _$TextInputCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextInputCopyWithImpl<$Res>
    implements $TextInputCopyWith<$Res> {
  _$TextInputCopyWithImpl(this._self, this._then);

  final TextInput _self;
  final $Res Function(TextInput) _then;

/// Create a copy of InteractionInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextInput(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FunctionResultsInput extends InteractionInput {
  const FunctionResultsInput( List<FunctionResult> results): _results = results,super._();
  

 final  List<FunctionResult> _results;
 List<FunctionResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of InteractionInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionResultsInputCopyWith<FunctionResultsInput> get copyWith => _$FunctionResultsInputCopyWithImpl<FunctionResultsInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionResultsInput&&const DeepCollectionEquality().equals(other.results, _results));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'InteractionInput.functionResults(results: $results)';
}


}

/// @nodoc
abstract mixin class $FunctionResultsInputCopyWith<$Res> implements $InteractionInputCopyWith<$Res> {
  factory $FunctionResultsInputCopyWith(FunctionResultsInput value, $Res Function(FunctionResultsInput) _then) = _$FunctionResultsInputCopyWithImpl;
@useResult
$Res call({
 List<FunctionResult> results
});




}
/// @nodoc
class _$FunctionResultsInputCopyWithImpl<$Res>
    implements $FunctionResultsInputCopyWith<$Res> {
  _$FunctionResultsInputCopyWithImpl(this._self, this._then);

  final FunctionResultsInput _self;
  final $Res Function(FunctionResultsInput) _then;

/// Create a copy of InteractionInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(FunctionResultsInput(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<FunctionResult>,
  ));
}


}

/// @nodoc
mixin _$FunctionResult {

 String get callId; String get name; Object? get result;
/// Create a copy of FunctionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionResultCopyWith<FunctionResult> get copyWith => _$FunctionResultCopyWithImpl<FunctionResult>(this as FunctionResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FunctionResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionResult&&(identical(other.callId, _this.callId) || other.callId == _this.callId)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.result, _this.result));
}


@override
int get hashCode {
  final _this = this as FunctionResult;
  return Object.hash(runtimeType,_this.callId,_this.name,const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as FunctionResult;
  return 'FunctionResult(callId: ${_this.callId}, name: ${_this.name}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $FunctionResultCopyWith<$Res>  {
  factory $FunctionResultCopyWith(FunctionResult value, $Res Function(FunctionResult) _then) = _$FunctionResultCopyWithImpl;
@useResult
$Res call({
 String callId, String name, Object? result
});




}
/// @nodoc
class _$FunctionResultCopyWithImpl<$Res>
    implements $FunctionResultCopyWith<$Res> {
  _$FunctionResultCopyWithImpl(this._self, this._then);

  final FunctionResult _self;
  final $Res Function(FunctionResult) _then;

/// Create a copy of FunctionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? callId = null,Object? name = null,Object? result = freezed,}) {
  return _then(FunctionResult(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result ,
  ));
}

}


/// Adds pattern-matching-related methods to [FunctionResult].
extension FunctionResultPatterns on FunctionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FunctionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FunctionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FunctionResult value)  $default,){
final _that = this;
switch (_that) {
case _FunctionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FunctionResult value)?  $default,){
final _that = this;
switch (_that) {
case _FunctionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String callId,  String name,  Object? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FunctionResult() when $default != null:
return $default(_that.callId,_that.name,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String callId,  String name,  Object? result)  $default,) {final _that = this;
switch (_that) {
case _FunctionResult():
return $default(_that.callId,_that.name,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String callId,  String name,  Object? result)?  $default,) {final _that = this;
switch (_that) {
case _FunctionResult() when $default != null:
return $default(_that.callId,_that.name,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _FunctionResult extends FunctionResult {
  const _FunctionResult({required this.callId, required this.name, required this.result}): super._();
  

@override final  String callId;
@override final  String name;
@override final  Object? result;

/// Create a copy of FunctionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FunctionResultCopyWith<_FunctionResult> get copyWith => __$FunctionResultCopyWithImpl<_FunctionResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FunctionResult&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.result, result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,callId,name,const DeepCollectionEquality().hash(result));
}

@override
String toString() {
    return 'FunctionResult(callId: $callId, name: $name, result: $result)';
}


}

/// @nodoc
abstract mixin class _$FunctionResultCopyWith<$Res> implements $FunctionResultCopyWith<$Res> {
  factory _$FunctionResultCopyWith(_FunctionResult value, $Res Function(_FunctionResult) _then) = __$FunctionResultCopyWithImpl;
@override @useResult
$Res call({
 String callId, String name, Object? result
});




}
/// @nodoc
class __$FunctionResultCopyWithImpl<$Res>
    implements _$FunctionResultCopyWith<$Res> {
  __$FunctionResultCopyWithImpl(this._self, this._then);

  final _FunctionResult _self;
  final $Res Function(_FunctionResult) _then;

/// Create a copy of FunctionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? callId = null,Object? name = null,Object? result = freezed,}) {
  return _then(_FunctionResult(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result ,
  ));
}


}

// dart format on
