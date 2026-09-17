// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurnFailure {

 String get entryId; AppError get error;
/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnFailureCopyWith<TurnFailure> get copyWith => _$TurnFailureCopyWithImpl<TurnFailure>(this as TurnFailure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TurnFailure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnFailure&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as TurnFailure;
  return Object.hash(runtimeType,_this.entryId,_this.error);
}

@override
String toString() {
  final _this = this as TurnFailure;
  return 'TurnFailure(entryId: ${_this.entryId}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $TurnFailureCopyWith<$Res>  {
  factory $TurnFailureCopyWith(TurnFailure value, $Res Function(TurnFailure) _then) = _$TurnFailureCopyWithImpl;
@useResult
$Res call({
 String entryId, AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$TurnFailureCopyWithImpl<$Res>
    implements $TurnFailureCopyWith<$Res> {
  _$TurnFailureCopyWithImpl(this._self, this._then);

  final TurnFailure _self;
  final $Res Function(TurnFailure) _then;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entryId = null,Object? error = null,}) {
  return _then(TurnFailure(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}
/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [TurnFailure].
extension TurnFailurePatterns on TurnFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurnFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurnFailure value)  $default,){
final _that = this;
switch (_that) {
case _TurnFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurnFailure value)?  $default,){
final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String entryId,  AppError error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
return $default(_that.entryId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String entryId,  AppError error)  $default,) {final _that = this;
switch (_that) {
case _TurnFailure():
return $default(_that.entryId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String entryId,  AppError error)?  $default,) {final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
return $default(_that.entryId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TurnFailure implements TurnFailure {
  const _TurnFailure({required this.entryId, required this.error});
  

@override final  String entryId;
@override final  AppError error;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnFailureCopyWith<_TurnFailure> get copyWith => __$TurnFailureCopyWithImpl<_TurnFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnFailure&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entryId,error);
}

@override
String toString() {
    return 'TurnFailure(entryId: $entryId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TurnFailureCopyWith<$Res> implements $TurnFailureCopyWith<$Res> {
  factory _$TurnFailureCopyWith(_TurnFailure value, $Res Function(_TurnFailure) _then) = __$TurnFailureCopyWithImpl;
@override @useResult
$Res call({
 String entryId, AppError error
});


@override $AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$TurnFailureCopyWithImpl<$Res>
    implements _$TurnFailureCopyWith<$Res> {
  __$TurnFailureCopyWithImpl(this._self, this._then);

  final _TurnFailure _self;
  final $Res Function(_TurnFailure) _then;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryId = null,Object? error = null,}) {
  return _then(_TurnFailure(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
