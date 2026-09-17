// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskStatus {

 TaskState get state; A2aMessage? get message; String? get timestamp;
/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStatusCopyWith<TaskStatus> get copyWith => _$TaskStatusCopyWithImpl<TaskStatus>(this as TaskStatus, _$identity);

  /// Serializes this TaskStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskStatus&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskStatus;
  return Object.hash(runtimeType,_this.state,_this.message,_this.timestamp);
}

@override
String toString() {
  final _this = this as TaskStatus;
  return 'TaskStatus(state: ${_this.state}, message: ${_this.message}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $TaskStatusCopyWith<$Res>  {
  factory $TaskStatusCopyWith(TaskStatus value, $Res Function(TaskStatus) _then) = _$TaskStatusCopyWithImpl;
@useResult
$Res call({
 TaskState state, A2aMessage? message, String? timestamp
});


$A2aMessageCopyWith<$Res>? get message;

}
/// @nodoc
class _$TaskStatusCopyWithImpl<$Res>
    implements $TaskStatusCopyWith<$Res> {
  _$TaskStatusCopyWithImpl(this._self, this._then);

  final TaskStatus _self;
  final $Res Function(TaskStatus) _then;

/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? message = freezed,Object? timestamp = freezed,}) {
  return _then(TaskStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TaskState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as A2aMessage?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$A2aMessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $A2aMessageCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskStatus].
extension TaskStatusPatterns on TaskStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskStatus value)  $default,){
final _that = this;
switch (_that) {
case _TaskStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskStatus value)?  $default,){
final _that = this;
switch (_that) {
case _TaskStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskState state,  A2aMessage? message,  String? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskStatus() when $default != null:
return $default(_that.state,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskState state,  A2aMessage? message,  String? timestamp)  $default,) {final _that = this;
switch (_that) {
case _TaskStatus():
return $default(_that.state,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskState state,  A2aMessage? message,  String? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _TaskStatus() when $default != null:
return $default(_that.state,_that.message,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskStatus implements TaskStatus {
  const _TaskStatus({required this.state, this.message, this.timestamp});
  factory _TaskStatus.fromJson(Map<String, dynamic> json) => _$TaskStatusFromJson(json);

@override final  TaskState state;
@override final  A2aMessage? message;
@override final  String? timestamp;

/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStatusCopyWith<_TaskStatus> get copyWith => __$TaskStatusCopyWithImpl<_TaskStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,state,message,timestamp);
}

@override
String toString() {
    return 'TaskStatus(state: $state, message: $message, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TaskStatusCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$TaskStatusCopyWith(_TaskStatus value, $Res Function(_TaskStatus) _then) = __$TaskStatusCopyWithImpl;
@override @useResult
$Res call({
 TaskState state, A2aMessage? message, String? timestamp
});


@override $A2aMessageCopyWith<$Res>? get message;

}
/// @nodoc
class __$TaskStatusCopyWithImpl<$Res>
    implements _$TaskStatusCopyWith<$Res> {
  __$TaskStatusCopyWithImpl(this._self, this._then);

  final _TaskStatus _self;
  final $Res Function(_TaskStatus) _then;

/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? message = freezed,Object? timestamp = freezed,}) {
  return _then(_TaskStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TaskState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as A2aMessage?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TaskStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$A2aMessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $A2aMessageCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
