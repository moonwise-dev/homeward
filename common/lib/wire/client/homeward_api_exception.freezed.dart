// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeward_api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomewardApiException {

 HomewardErrorCode get code; String get message; Duration? get retryAfter;
/// Create a copy of HomewardApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomewardApiExceptionCopyWith<HomewardApiException> get copyWith => _$HomewardApiExceptionCopyWithImpl<HomewardApiException>(this as HomewardApiException, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomewardApiException;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomewardApiException&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.retryAfter, _this.retryAfter) || other.retryAfter == _this.retryAfter));
}


@override
int get hashCode {
  final _this = this as HomewardApiException;
  return Object.hash(runtimeType,_this.code,_this.message,_this.retryAfter);
}

@override
String toString() {
  final _this = this as HomewardApiException;
  return 'HomewardApiException(code: ${_this.code}, message: ${_this.message}, retryAfter: ${_this.retryAfter})';
}


}

/// @nodoc
abstract mixin class $HomewardApiExceptionCopyWith<$Res>  {
  factory $HomewardApiExceptionCopyWith(HomewardApiException value, $Res Function(HomewardApiException) _then) = _$HomewardApiExceptionCopyWithImpl;
@useResult
$Res call({
 HomewardErrorCode code, String message, Duration? retryAfter
});




}
/// @nodoc
class _$HomewardApiExceptionCopyWithImpl<$Res>
    implements $HomewardApiExceptionCopyWith<$Res> {
  _$HomewardApiExceptionCopyWithImpl(this._self, this._then);

  final HomewardApiException _self;
  final $Res Function(HomewardApiException) _then;

/// Create a copy of HomewardApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? retryAfter = freezed,}) {
  return _then(HomewardApiException(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as HomewardErrorCode,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomewardApiException].
extension HomewardApiExceptionPatterns on HomewardApiException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomewardApiException value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomewardApiException() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomewardApiException value)  $default,){
final _that = this;
switch (_that) {
case _HomewardApiException():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomewardApiException value)?  $default,){
final _that = this;
switch (_that) {
case _HomewardApiException() when $default != null:
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
case _HomewardApiException() when $default != null:
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
case _HomewardApiException():
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
case _HomewardApiException() when $default != null:
return $default(_that.code,_that.message,_that.retryAfter);case _:
  return null;

}
}

}

/// @nodoc


class _HomewardApiException implements HomewardApiException {
  const _HomewardApiException({required this.code, required this.message, this.retryAfter});
  

@override final  HomewardErrorCode code;
@override final  String message;
@override final  Duration? retryAfter;

/// Create a copy of HomewardApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomewardApiExceptionCopyWith<_HomewardApiException> get copyWith => __$HomewardApiExceptionCopyWithImpl<_HomewardApiException>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomewardApiException&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,message,retryAfter);
}

@override
String toString() {
    return 'HomewardApiException(code: $code, message: $message, retryAfter: $retryAfter)';
}


}

/// @nodoc
abstract mixin class _$HomewardApiExceptionCopyWith<$Res> implements $HomewardApiExceptionCopyWith<$Res> {
  factory _$HomewardApiExceptionCopyWith(_HomewardApiException value, $Res Function(_HomewardApiException) _then) = __$HomewardApiExceptionCopyWithImpl;
@override @useResult
$Res call({
 HomewardErrorCode code, String message, Duration? retryAfter
});




}
/// @nodoc
class __$HomewardApiExceptionCopyWithImpl<$Res>
    implements _$HomewardApiExceptionCopyWith<$Res> {
  __$HomewardApiExceptionCopyWithImpl(this._self, this._then);

  final _HomewardApiException _self;
  final $Res Function(_HomewardApiException) _then;

/// Create a copy of HomewardApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? retryAfter = freezed,}) {
  return _then(_HomewardApiException(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as HomewardErrorCode,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
