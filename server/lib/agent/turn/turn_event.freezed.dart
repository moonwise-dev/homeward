// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurnEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TurnEvent()';
}


}

/// @nodoc
class $TurnEventCopyWith<$Res>  {
$TurnEventCopyWith(TurnEvent _, $Res Function(TurnEvent) __);
}


/// Adds pattern-matching-related methods to [TurnEvent].
extension TurnEventPatterns on TurnEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TurnWorking value)?  working,TResult Function( TurnText value)?  text,TResult Function( TurnMessage value)?  message,TResult Function( TurnCompleted value)?  completed,TResult Function( TurnFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TurnWorking() when working != null:
return working(_that);case TurnText() when text != null:
return text(_that);case TurnMessage() when message != null:
return message(_that);case TurnCompleted() when completed != null:
return completed(_that);case TurnFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TurnWorking value)  working,required TResult Function( TurnText value)  text,required TResult Function( TurnMessage value)  message,required TResult Function( TurnCompleted value)  completed,required TResult Function( TurnFailed value)  failed,}){
final _that = this;
switch (_that) {
case TurnWorking():
return working(_that);case TurnText():
return text(_that);case TurnMessage():
return message(_that);case TurnCompleted():
return completed(_that);case TurnFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TurnWorking value)?  working,TResult? Function( TurnText value)?  text,TResult? Function( TurnMessage value)?  message,TResult? Function( TurnCompleted value)?  completed,TResult? Function( TurnFailed value)?  failed,}){
final _that = this;
switch (_that) {
case TurnWorking() when working != null:
return working(_that);case TurnText() when text != null:
return text(_that);case TurnMessage() when message != null:
return message(_that);case TurnCompleted() when completed != null:
return completed(_that);case TurnFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  working,TResult Function( String text)?  text,TResult Function( Map<String, Object?> message)?  message,TResult Function( String text)?  completed,TResult Function( TurnFailure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TurnWorking() when working != null:
return working();case TurnText() when text != null:
return text(_that.text);case TurnMessage() when message != null:
return message(_that.message);case TurnCompleted() when completed != null:
return completed(_that.text);case TurnFailed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  working,required TResult Function( String text)  text,required TResult Function( Map<String, Object?> message)  message,required TResult Function( String text)  completed,required TResult Function( TurnFailure failure)  failed,}) {final _that = this;
switch (_that) {
case TurnWorking():
return working();case TurnText():
return text(_that.text);case TurnMessage():
return message(_that.message);case TurnCompleted():
return completed(_that.text);case TurnFailed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  working,TResult? Function( String text)?  text,TResult? Function( Map<String, Object?> message)?  message,TResult? Function( String text)?  completed,TResult? Function( TurnFailure failure)?  failed,}) {final _that = this;
switch (_that) {
case TurnWorking() when working != null:
return working();case TurnText() when text != null:
return text(_that.text);case TurnMessage() when message != null:
return message(_that.message);case TurnCompleted() when completed != null:
return completed(_that.text);case TurnFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TurnWorking implements TurnEvent {
  const TurnWorking();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnWorking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TurnEvent.working()';
}


}




/// @nodoc


class TurnText implements TurnEvent {
  const TurnText(this.text);
  

 final  String text;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnTextCopyWith<TurnText> get copyWith => _$TurnTextCopyWithImpl<TurnText>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnText&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'TurnEvent.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TurnTextCopyWith<$Res> implements $TurnEventCopyWith<$Res> {
  factory $TurnTextCopyWith(TurnText value, $Res Function(TurnText) _then) = _$TurnTextCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TurnTextCopyWithImpl<$Res>
    implements $TurnTextCopyWith<$Res> {
  _$TurnTextCopyWithImpl(this._self, this._then);

  final TurnText _self;
  final $Res Function(TurnText) _then;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TurnText(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TurnMessage implements TurnEvent {
  const TurnMessage( Map<String, Object?> message): _message = message;
  

 final  Map<String, Object?> _message;
 Map<String, Object?> get message {
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_message);
}


/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnMessageCopyWith<TurnMessage> get copyWith => _$TurnMessageCopyWithImpl<TurnMessage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnMessage&&const DeepCollectionEquality().equals(other.message, _message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_message));
}

@override
String toString() {
    return 'TurnEvent.message(message: $message)';
}


}

/// @nodoc
abstract mixin class $TurnMessageCopyWith<$Res> implements $TurnEventCopyWith<$Res> {
  factory $TurnMessageCopyWith(TurnMessage value, $Res Function(TurnMessage) _then) = _$TurnMessageCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> message
});




}
/// @nodoc
class _$TurnMessageCopyWithImpl<$Res>
    implements $TurnMessageCopyWith<$Res> {
  _$TurnMessageCopyWithImpl(this._self, this._then);

  final TurnMessage _self;
  final $Res Function(TurnMessage) _then;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TurnMessage(
null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc


class TurnCompleted implements TurnEvent {
  const TurnCompleted(this.text);
  

 final  String text;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnCompletedCopyWith<TurnCompleted> get copyWith => _$TurnCompletedCopyWithImpl<TurnCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnCompleted&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'TurnEvent.completed(text: $text)';
}


}

/// @nodoc
abstract mixin class $TurnCompletedCopyWith<$Res> implements $TurnEventCopyWith<$Res> {
  factory $TurnCompletedCopyWith(TurnCompleted value, $Res Function(TurnCompleted) _then) = _$TurnCompletedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TurnCompletedCopyWithImpl<$Res>
    implements $TurnCompletedCopyWith<$Res> {
  _$TurnCompletedCopyWithImpl(this._self, this._then);

  final TurnCompleted _self;
  final $Res Function(TurnCompleted) _then;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TurnCompleted(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TurnFailed implements TurnEvent {
  const TurnFailed(this.failure);
  

 final  TurnFailure failure;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnFailedCopyWith<TurnFailed> get copyWith => _$TurnFailedCopyWithImpl<TurnFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'TurnEvent.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TurnFailedCopyWith<$Res> implements $TurnEventCopyWith<$Res> {
  factory $TurnFailedCopyWith(TurnFailed value, $Res Function(TurnFailed) _then) = _$TurnFailedCopyWithImpl;
@useResult
$Res call({
 TurnFailure failure
});


$TurnFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$TurnFailedCopyWithImpl<$Res>
    implements $TurnFailedCopyWith<$Res> {
  _$TurnFailedCopyWithImpl(this._self, this._then);

  final TurnFailed _self;
  final $Res Function(TurnFailed) _then;

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TurnFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as TurnFailure,
  ));
}

/// Create a copy of TurnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TurnFailureCopyWith<$Res> get failure {
  
  return $TurnFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
