// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestCredentials {

 String get idToken; String? get appCheckToken;
/// Create a copy of RequestCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCredentialsCopyWith<RequestCredentials> get copyWith => _$RequestCredentialsCopyWithImpl<RequestCredentials>(this as RequestCredentials, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RequestCredentials;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCredentials&&(identical(other.idToken, _this.idToken) || other.idToken == _this.idToken)&&(identical(other.appCheckToken, _this.appCheckToken) || other.appCheckToken == _this.appCheckToken));
}


@override
int get hashCode {
  final _this = this as RequestCredentials;
  return Object.hash(runtimeType,_this.idToken,_this.appCheckToken);
}

@override
String toString() {
  final _this = this as RequestCredentials;
  return 'RequestCredentials(idToken: ${_this.idToken}, appCheckToken: ${_this.appCheckToken})';
}


}

/// @nodoc
abstract mixin class $RequestCredentialsCopyWith<$Res>  {
  factory $RequestCredentialsCopyWith(RequestCredentials value, $Res Function(RequestCredentials) _then) = _$RequestCredentialsCopyWithImpl;
@useResult
$Res call({
 String idToken, String? appCheckToken
});




}
/// @nodoc
class _$RequestCredentialsCopyWithImpl<$Res>
    implements $RequestCredentialsCopyWith<$Res> {
  _$RequestCredentialsCopyWithImpl(this._self, this._then);

  final RequestCredentials _self;
  final $Res Function(RequestCredentials) _then;

/// Create a copy of RequestCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? appCheckToken = freezed,}) {
  return _then(RequestCredentials(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,appCheckToken: freezed == appCheckToken ? _self.appCheckToken : appCheckToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCredentials].
extension RequestCredentialsPatterns on RequestCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCredentials value)  $default,){
final _that = this;
switch (_that) {
case _RequestCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCredentials() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idToken,  String? appCheckToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCredentials() when $default != null:
return $default(_that.idToken,_that.appCheckToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idToken,  String? appCheckToken)  $default,) {final _that = this;
switch (_that) {
case _RequestCredentials():
return $default(_that.idToken,_that.appCheckToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idToken,  String? appCheckToken)?  $default,) {final _that = this;
switch (_that) {
case _RequestCredentials() when $default != null:
return $default(_that.idToken,_that.appCheckToken);case _:
  return null;

}
}

}

/// @nodoc


class _RequestCredentials implements RequestCredentials {
  const _RequestCredentials({required this.idToken, this.appCheckToken});
  

@override final  String idToken;
@override final  String? appCheckToken;

/// Create a copy of RequestCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCredentialsCopyWith<_RequestCredentials> get copyWith => __$RequestCredentialsCopyWithImpl<_RequestCredentials>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCredentials&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.appCheckToken, appCheckToken) || other.appCheckToken == appCheckToken));
}


@override
int get hashCode {
    return Object.hash(runtimeType,idToken,appCheckToken);
}

@override
String toString() {
    return 'RequestCredentials(idToken: $idToken, appCheckToken: $appCheckToken)';
}


}

/// @nodoc
abstract mixin class _$RequestCredentialsCopyWith<$Res> implements $RequestCredentialsCopyWith<$Res> {
  factory _$RequestCredentialsCopyWith(_RequestCredentials value, $Res Function(_RequestCredentials) _then) = __$RequestCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String idToken, String? appCheckToken
});




}
/// @nodoc
class __$RequestCredentialsCopyWithImpl<$Res>
    implements _$RequestCredentialsCopyWith<$Res> {
  __$RequestCredentialsCopyWithImpl(this._self, this._then);

  final _RequestCredentials _self;
  final $Res Function(_RequestCredentials) _then;

/// Create a copy of RequestCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? appCheckToken = freezed,}) {
  return _then(_RequestCredentials(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,appCheckToken: freezed == appCheckToken ? _self.appCheckToken : appCheckToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
