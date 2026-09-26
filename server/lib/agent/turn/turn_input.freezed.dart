// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurnInput {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnInput);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TurnInput()';
}


}

/// @nodoc
class $TurnInputCopyWith<$Res>  {
$TurnInputCopyWith(TurnInput _, $Res Function(TurnInput) __);
}


/// Adds pattern-matching-related methods to [TurnInput].
extension TurnInputPatterns on TurnInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextTurnInput value)?  text,TResult Function( ActionTurnInput value)?  action,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextTurnInput() when text != null:
return text(_that);case ActionTurnInput() when action != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextTurnInput value)  text,required TResult Function( ActionTurnInput value)  action,}){
final _that = this;
switch (_that) {
case TextTurnInput():
return text(_that);case ActionTurnInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextTurnInput value)?  text,TResult? Function( ActionTurnInput value)?  action,}){
final _that = this;
switch (_that) {
case TextTurnInput() when text != null:
return text(_that);case ActionTurnInput() when action != null:
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
case TextTurnInput() when text != null:
return text(_that.text);case ActionTurnInput() when action != null:
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
case TextTurnInput():
return text(_that.text);case ActionTurnInput():
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
case TextTurnInput() when text != null:
return text(_that.text);case ActionTurnInput() when action != null:
return action(_that.action,_that.surfaceData);case _:
  return null;

}
}

}

/// @nodoc


class TextTurnInput implements TurnInput {
  const TextTurnInput(this.text);
  

 final  String text;

/// Create a copy of TurnInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextTurnInputCopyWith<TextTurnInput> get copyWith => _$TextTurnInputCopyWithImpl<TextTurnInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TextTurnInput&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'TurnInput.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextTurnInputCopyWith<$Res> implements $TurnInputCopyWith<$Res> {
  factory $TextTurnInputCopyWith(TextTurnInput value, $Res Function(TextTurnInput) _then) = _$TextTurnInputCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextTurnInputCopyWithImpl<$Res>
    implements $TextTurnInputCopyWith<$Res> {
  _$TextTurnInputCopyWithImpl(this._self, this._then);

  final TextTurnInput _self;
  final $Res Function(TextTurnInput) _then;

/// Create a copy of TurnInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextTurnInput(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActionTurnInput implements TurnInput {
  const ActionTurnInput(this.action, { Map<String, Object?> surfaceData = const {}}): _surfaceData = surfaceData;
  

 final  ClientAction action;
 final  Map<String, Object?> _surfaceData;
@JsonKey() Map<String, Object?> get surfaceData {
  if (_surfaceData is EqualUnmodifiableMapView) return _surfaceData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_surfaceData);
}


/// Create a copy of TurnInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionTurnInputCopyWith<ActionTurnInput> get copyWith => _$ActionTurnInputCopyWithImpl<ActionTurnInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionTurnInput&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.surfaceData, _surfaceData));
}


@override
int get hashCode {
    return Object.hash(runtimeType,action,const DeepCollectionEquality().hash(_surfaceData));
}

@override
String toString() {
    return 'TurnInput.action(action: $action, surfaceData: $surfaceData)';
}


}

/// @nodoc
abstract mixin class $ActionTurnInputCopyWith<$Res> implements $TurnInputCopyWith<$Res> {
  factory $ActionTurnInputCopyWith(ActionTurnInput value, $Res Function(ActionTurnInput) _then) = _$ActionTurnInputCopyWithImpl;
@useResult
$Res call({
 ClientAction action, Map<String, Object?> surfaceData
});


$ClientActionCopyWith<$Res> get action;

}
/// @nodoc
class _$ActionTurnInputCopyWithImpl<$Res>
    implements $ActionTurnInputCopyWith<$Res> {
  _$ActionTurnInputCopyWithImpl(this._self, this._then);

  final ActionTurnInput _self;
  final $Res Function(ActionTurnInput) _then;

/// Create a copy of TurnInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,Object? surfaceData = null,}) {
  return _then(ActionTurnInput(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ClientAction,surfaceData: null == surfaceData ? _self._surfaceData : surfaceData // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of TurnInput
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
