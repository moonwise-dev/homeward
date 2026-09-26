// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurnRequest {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TurnRequest()';
}


}

/// @nodoc
class $TurnRequestCopyWith<$Res>  {
$TurnRequestCopyWith(TurnRequest _, $Res Function(TurnRequest) __);
}


/// Adds pattern-matching-related methods to [TurnRequest].
extension TurnRequestPatterns on TurnRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextTurnRequest value)?  text,TResult Function( ActionTurnRequest value)?  action,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextTurnRequest() when text != null:
return text(_that);case ActionTurnRequest() when action != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextTurnRequest value)  text,required TResult Function( ActionTurnRequest value)  action,}){
final _that = this;
switch (_that) {
case TextTurnRequest():
return text(_that);case ActionTurnRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextTurnRequest value)?  text,TResult? Function( ActionTurnRequest value)?  action,}){
final _that = this;
switch (_that) {
case TextTurnRequest() when text != null:
return text(_that);case ActionTurnRequest() when action != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  text,TResult Function( ClientAction action,  Map<String, Object?> surfaceData)?  action,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextTurnRequest() when text != null:
return text(_that.text);case ActionTurnRequest() when action != null:
return action(_that.action,_that.surfaceData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  text,required TResult Function( ClientAction action,  Map<String, Object?> surfaceData)  action,}) {final _that = this;
switch (_that) {
case TextTurnRequest():
return text(_that.text);case ActionTurnRequest():
return action(_that.action,_that.surfaceData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  text,TResult? Function( ClientAction action,  Map<String, Object?> surfaceData)?  action,}) {final _that = this;
switch (_that) {
case TextTurnRequest() when text != null:
return text(_that.text);case ActionTurnRequest() when action != null:
return action(_that.action,_that.surfaceData);case _:
  return null;

}
}

}

/// @nodoc


class TextTurnRequest extends TurnRequest {
  const TextTurnRequest(this.text): super._();
  

 final  String text;

/// Create a copy of TurnRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextTurnRequestCopyWith<TextTurnRequest> get copyWith => _$TextTurnRequestCopyWithImpl<TextTurnRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TextTurnRequest&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'TurnRequest.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextTurnRequestCopyWith<$Res> implements $TurnRequestCopyWith<$Res> {
  factory $TextTurnRequestCopyWith(TextTurnRequest value, $Res Function(TextTurnRequest) _then) = _$TextTurnRequestCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextTurnRequestCopyWithImpl<$Res>
    implements $TextTurnRequestCopyWith<$Res> {
  _$TextTurnRequestCopyWithImpl(this._self, this._then);

  final TextTurnRequest _self;
  final $Res Function(TextTurnRequest) _then;

/// Create a copy of TurnRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextTurnRequest(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActionTurnRequest extends TurnRequest {
  const ActionTurnRequest(this.action, {required  Map<String, Object?> surfaceData}): _surfaceData = surfaceData,super._();
  

 final  ClientAction action;
 final  Map<String, Object?> _surfaceData;
 Map<String, Object?> get surfaceData {
  if (_surfaceData is EqualUnmodifiableMapView) return _surfaceData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_surfaceData);
}


/// Create a copy of TurnRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionTurnRequestCopyWith<ActionTurnRequest> get copyWith => _$ActionTurnRequestCopyWithImpl<ActionTurnRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionTurnRequest&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.surfaceData, _surfaceData));
}


@override
int get hashCode {
    return Object.hash(runtimeType,action,const DeepCollectionEquality().hash(_surfaceData));
}

@override
String toString() {
    return 'TurnRequest.action(action: $action, surfaceData: $surfaceData)';
}


}

/// @nodoc
abstract mixin class $ActionTurnRequestCopyWith<$Res> implements $TurnRequestCopyWith<$Res> {
  factory $ActionTurnRequestCopyWith(ActionTurnRequest value, $Res Function(ActionTurnRequest) _then) = _$ActionTurnRequestCopyWithImpl;
@useResult
$Res call({
 ClientAction action, Map<String, Object?> surfaceData
});


$ClientActionCopyWith<$Res> get action;

}
/// @nodoc
class _$ActionTurnRequestCopyWithImpl<$Res>
    implements $ActionTurnRequestCopyWith<$Res> {
  _$ActionTurnRequestCopyWithImpl(this._self, this._then);

  final ActionTurnRequest _self;
  final $Res Function(ActionTurnRequest) _then;

/// Create a copy of TurnRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,Object? surfaceData = null,}) {
  return _then(ActionTurnRequest(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ClientAction,surfaceData: null == surfaceData ? _self._surfaceData : surfaceData // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of TurnRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientActionCopyWith<$Res> get action {
  
  return $ClientActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

// dart format on
