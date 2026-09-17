// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeward_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomewardFailure {

 HomewardErrorCode get code; String get message; Duration? get retryAfter;
/// Create a copy of HomewardFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomewardFailureCopyWith<HomewardFailure> get copyWith => _$HomewardFailureCopyWithImpl<HomewardFailure>(this as HomewardFailure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomewardFailure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomewardFailure&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.retryAfter, _this.retryAfter) || other.retryAfter == _this.retryAfter));
}


@override
int get hashCode {
  final _this = this as HomewardFailure;
  return Object.hash(runtimeType,_this.code,_this.message,_this.retryAfter);
}

@override
String toString() {
  final _this = this as HomewardFailure;
  return 'HomewardFailure(code: ${_this.code}, message: ${_this.message}, retryAfter: ${_this.retryAfter})';
}


}

/// @nodoc
abstract mixin class $HomewardFailureCopyWith<$Res>  {
  factory $HomewardFailureCopyWith(HomewardFailure value, $Res Function(HomewardFailure) _then) = _$HomewardFailureCopyWithImpl;
@useResult
$Res call({
 HomewardErrorCode code, String message, Duration? retryAfter
});




}
/// @nodoc
class _$HomewardFailureCopyWithImpl<$Res>
    implements $HomewardFailureCopyWith<$Res> {
  _$HomewardFailureCopyWithImpl(this._self, this._then);

  final HomewardFailure _self;
  final $Res Function(HomewardFailure) _then;

/// Create a copy of HomewardFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? retryAfter = freezed,}) {
  return _then(HomewardFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as HomewardErrorCode,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomewardFailure].
extension HomewardFailurePatterns on HomewardFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomewardFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomewardFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomewardFailure value)  $default,){
final _that = this;
switch (_that) {
case _HomewardFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomewardFailure value)?  $default,){
final _that = this;
switch (_that) {
case _HomewardFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomewardErrorCode code,  String message,  Duration? retryAfter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomewardFailure() when $default != null:
return $default(_that.code,_that.message,_that.retryAfter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomewardErrorCode code,  String message,  Duration? retryAfter)  $default,) {final _that = this;
switch (_that) {
case _HomewardFailure():
return $default(_that.code,_that.message,_that.retryAfter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomewardErrorCode code,  String message,  Duration? retryAfter)?  $default,) {final _that = this;
switch (_that) {
case _HomewardFailure() when $default != null:
return $default(_that.code,_that.message,_that.retryAfter);case _:
  return null;

}
}

}

/// @nodoc


class _HomewardFailure implements HomewardFailure {
  const _HomewardFailure({required this.code, required this.message, this.retryAfter});
  

@override final  HomewardErrorCode code;
@override final  String message;
@override final  Duration? retryAfter;

/// Create a copy of HomewardFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomewardFailureCopyWith<_HomewardFailure> get copyWith => __$HomewardFailureCopyWithImpl<_HomewardFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomewardFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,message,retryAfter);
}

@override
String toString() {
    return 'HomewardFailure(code: $code, message: $message, retryAfter: $retryAfter)';
}


}

/// @nodoc
abstract mixin class _$HomewardFailureCopyWith<$Res> implements $HomewardFailureCopyWith<$Res> {
  factory _$HomewardFailureCopyWith(_HomewardFailure value, $Res Function(_HomewardFailure) _then) = __$HomewardFailureCopyWithImpl;
@override @useResult
$Res call({
 HomewardErrorCode code, String message, Duration? retryAfter
});




}
/// @nodoc
class __$HomewardFailureCopyWithImpl<$Res>
    implements _$HomewardFailureCopyWith<$Res> {
  __$HomewardFailureCopyWithImpl(this._self, this._then);

  final _HomewardFailure _self;
  final $Res Function(_HomewardFailure) _then;

/// Create a copy of HomewardFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? retryAfter = freezed,}) {
  return _then(_HomewardFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as HomewardErrorCode,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
