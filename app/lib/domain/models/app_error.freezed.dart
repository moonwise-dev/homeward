// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppError {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppError()';
}


}

/// @nodoc
class $AppErrorCopyWith<$Res>  {
$AppErrorCopyWith(AppError _, $Res Function(AppError) __);
}


/// Adds pattern-matching-related methods to [AppError].
extension AppErrorPatterns on AppError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerAppError value)?  server,TResult Function( NetworkFailureAppError value)?  networkFailure,TResult Function( UnknownAppError value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerAppError() when server != null:
return server(_that);case NetworkFailureAppError() when networkFailure != null:
return networkFailure(_that);case UnknownAppError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerAppError value)  server,required TResult Function( NetworkFailureAppError value)  networkFailure,required TResult Function( UnknownAppError value)  unknown,}){
final _that = this;
switch (_that) {
case ServerAppError():
return server(_that);case NetworkFailureAppError():
return networkFailure(_that);case UnknownAppError():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerAppError value)?  server,TResult? Function( NetworkFailureAppError value)?  networkFailure,TResult? Function( UnknownAppError value)?  unknown,}){
final _that = this;
switch (_that) {
case ServerAppError() when server != null:
return server(_that);case NetworkFailureAppError() when networkFailure != null:
return networkFailure(_that);case UnknownAppError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( HomewardErrorCode code,  String message,  Duration? retryAfter)?  server,TResult Function()?  networkFailure,TResult Function( Object cause)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerAppError() when server != null:
return server(_that.code,_that.message,_that.retryAfter);case NetworkFailureAppError() when networkFailure != null:
return networkFailure();case UnknownAppError() when unknown != null:
return unknown(_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( HomewardErrorCode code,  String message,  Duration? retryAfter)  server,required TResult Function()  networkFailure,required TResult Function( Object cause)  unknown,}) {final _that = this;
switch (_that) {
case ServerAppError():
return server(_that.code,_that.message,_that.retryAfter);case NetworkFailureAppError():
return networkFailure();case UnknownAppError():
return unknown(_that.cause);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( HomewardErrorCode code,  String message,  Duration? retryAfter)?  server,TResult? Function()?  networkFailure,TResult? Function( Object cause)?  unknown,}) {final _that = this;
switch (_that) {
case ServerAppError() when server != null:
return server(_that.code,_that.message,_that.retryAfter);case NetworkFailureAppError() when networkFailure != null:
return networkFailure();case UnknownAppError() when unknown != null:
return unknown(_that.cause);case _:
  return null;

}
}

}

/// @nodoc


class ServerAppError extends AppError {
  const ServerAppError({required this.code, required this.message, this.retryAfter}): super._();
  

 final  HomewardErrorCode code;
 final  String message;
 final  Duration? retryAfter;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerAppErrorCopyWith<ServerAppError> get copyWith => _$ServerAppErrorCopyWithImpl<ServerAppError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerAppError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,message,retryAfter);
}

@override
String toString() {
    return 'AppError.server(code: $code, message: $message, retryAfter: $retryAfter)';
}


}

/// @nodoc
abstract mixin class $ServerAppErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $ServerAppErrorCopyWith(ServerAppError value, $Res Function(ServerAppError) _then) = _$ServerAppErrorCopyWithImpl;
@useResult
$Res call({
 HomewardErrorCode code, String message, Duration? retryAfter
});




}
/// @nodoc
class _$ServerAppErrorCopyWithImpl<$Res>
    implements $ServerAppErrorCopyWith<$Res> {
  _$ServerAppErrorCopyWithImpl(this._self, this._then);

  final ServerAppError _self;
  final $Res Function(ServerAppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? retryAfter = freezed,}) {
  return _then(ServerAppError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as HomewardErrorCode,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,retryAfter: freezed == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

/// @nodoc


class NetworkFailureAppError extends AppError {
  const NetworkFailureAppError(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailureAppError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppError.networkFailure()';
}


}




/// @nodoc


class UnknownAppError extends AppError {
  const UnknownAppError(this.cause): super._();
  

 final  Object cause;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownAppErrorCopyWith<UnknownAppError> get copyWith => _$UnknownAppErrorCopyWithImpl<UnknownAppError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownAppError&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(cause));
}

@override
String toString() {
    return 'AppError.unknown(cause: $cause)';
}


}

/// @nodoc
abstract mixin class $UnknownAppErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $UnknownAppErrorCopyWith(UnknownAppError value, $Res Function(UnknownAppError) _then) = _$UnknownAppErrorCopyWithImpl;
@useResult
$Res call({
 Object cause
});




}
/// @nodoc
class _$UnknownAppErrorCopyWithImpl<$Res>
    implements $UnknownAppErrorCopyWith<$Res> {
  _$UnknownAppErrorCopyWithImpl(this._self, this._then);

  final UnknownAppError _self;
  final $Res Function(UnknownAppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cause = null,}) {
  return _then(UnknownAppError(
null == cause ? _self.cause : cause ,
  ));
}


}

// dart format on
