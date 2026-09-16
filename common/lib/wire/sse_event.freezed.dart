// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sse_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SseEvent {

 String? get event; String get data; String? get id;
/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SseEventCopyWith<SseEvent> get copyWith => _$SseEventCopyWithImpl<SseEvent>(this as SseEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SseEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SseEvent&&(identical(other.event, _this.event) || other.event == _this.event)&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as SseEvent;
  return Object.hash(runtimeType,_this.event,_this.data,_this.id);
}

@override
String toString() {
  final _this = this as SseEvent;
  return 'SseEvent(event: ${_this.event}, data: ${_this.data}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $SseEventCopyWith<$Res>  {
  factory $SseEventCopyWith(SseEvent value, $Res Function(SseEvent) _then) = _$SseEventCopyWithImpl;
@useResult
$Res call({
 String? event, String data, String? id
});




}
/// @nodoc
class _$SseEventCopyWithImpl<$Res>
    implements $SseEventCopyWith<$Res> {
  _$SseEventCopyWithImpl(this._self, this._then);

  final SseEvent _self;
  final $Res Function(SseEvent) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = freezed,Object? data = null,Object? id = freezed,}) {
  return _then(SseEvent(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SseEvent].
extension SseEventPatterns on SseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SseEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SseEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SseEvent value)  $default,){
final _that = this;
switch (_that) {
case _SseEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SseEvent value)?  $default,){
final _that = this;
switch (_that) {
case _SseEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? event,  String data,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SseEvent() when $default != null:
return $default(_that.event,_that.data,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? event,  String data,  String? id)  $default,) {final _that = this;
switch (_that) {
case _SseEvent():
return $default(_that.event,_that.data,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? event,  String data,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _SseEvent() when $default != null:
return $default(_that.event,_that.data,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _SseEvent implements SseEvent {
  const _SseEvent({this.event, required this.data, this.id});
  

@override final  String? event;
@override final  String data;
@override final  String? id;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventCopyWith<_SseEvent> get copyWith => __$SseEventCopyWithImpl<_SseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEvent&&(identical(other.event, event) || other.event == event)&&(identical(other.data, data) || other.data == data)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,event,data,id);
}

@override
String toString() {
    return 'SseEvent(event: $event, data: $data, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SseEventCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventCopyWith(_SseEvent value, $Res Function(_SseEvent) _then) = __$SseEventCopyWithImpl;
@override @useResult
$Res call({
 String? event, String data, String? id
});




}
/// @nodoc
class __$SseEventCopyWithImpl<$Res>
    implements _$SseEventCopyWith<$Res> {
  __$SseEventCopyWithImpl(this._self, this._then);

  final _SseEvent _self;
  final $Res Function(_SseEvent) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? data = null,Object? id = freezed,}) {
  return _then(_SseEvent(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
