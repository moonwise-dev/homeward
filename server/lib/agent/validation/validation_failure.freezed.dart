// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValidationFailure {

 String get surfaceId; String get path; String get message;
/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this as ValidationFailure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ValidationFailure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.surfaceId, _this.surfaceId) || other.surfaceId == _this.surfaceId)&&(identical(other.path, _this.path) || other.path == _this.path)&&(identical(other.message, _this.message) || other.message == _this.message));
}


@override
int get hashCode {
  final _this = this as ValidationFailure;
  return Object.hash(runtimeType,_this.surfaceId,_this.path,_this.message);
}

@override
String toString() {
  final _this = this as ValidationFailure;
  return 'ValidationFailure(surfaceId: ${_this.surfaceId}, path: ${_this.path}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res>  {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String surfaceId, String path, String message
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surfaceId = null,Object? path = null,Object? message = null,}) {
  return _then(ValidationFailure(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationFailure].
extension ValidationFailurePatterns on ValidationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationFailure value)  $default,){
final _that = this;
switch (_that) {
case _ValidationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationFailure value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String surfaceId,  String path,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
return $default(_that.surfaceId,_that.path,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String surfaceId,  String path,  String message)  $default,) {final _that = this;
switch (_that) {
case _ValidationFailure():
return $default(_that.surfaceId,_that.path,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String surfaceId,  String path,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ValidationFailure() when $default != null:
return $default(_that.surfaceId,_that.path,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ValidationFailure extends ValidationFailure {
  const _ValidationFailure({required this.surfaceId, required this.path, required this.message}): super._();
  

@override final  String surfaceId;
@override final  String path;
@override final  String message;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationFailureCopyWith<_ValidationFailure> get copyWith => __$ValidationFailureCopyWithImpl<_ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationFailure&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.path, path) || other.path == path)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,surfaceId,path,message);
}

@override
String toString() {
    return 'ValidationFailure(surfaceId: $surfaceId, path: $path, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationFailureCopyWith<$Res> implements $ValidationFailureCopyWith<$Res> {
  factory _$ValidationFailureCopyWith(_ValidationFailure value, $Res Function(_ValidationFailure) _then) = __$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 String surfaceId, String path, String message
});




}
/// @nodoc
class __$ValidationFailureCopyWithImpl<$Res>
    implements _$ValidationFailureCopyWith<$Res> {
  __$ValidationFailureCopyWithImpl(this._self, this._then);

  final _ValidationFailure _self;
  final $Res Function(_ValidationFailure) _then;

/// Create a copy of ValidationFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surfaceId = null,Object? path = null,Object? message = null,}) {
  return _then(_ValidationFailure(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
