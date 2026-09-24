// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_key_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiKeyState {

 bool get canForget; bool get hasSavedKey; String get key; bool get remember; bool get isVerifying; String? get errorText;
/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyStateCopyWith<ApiKeyState> get copyWith => _$ApiKeyStateCopyWithImpl<ApiKeyState>(this as ApiKeyState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ApiKeyState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyState&&(identical(other.canForget, _this.canForget) || other.canForget == _this.canForget)&&(identical(other.hasSavedKey, _this.hasSavedKey) || other.hasSavedKey == _this.hasSavedKey)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.remember, _this.remember) || other.remember == _this.remember)&&(identical(other.isVerifying, _this.isVerifying) || other.isVerifying == _this.isVerifying)&&(identical(other.errorText, _this.errorText) || other.errorText == _this.errorText));
}


@override
int get hashCode {
  final _this = this as ApiKeyState;
  return Object.hash(runtimeType,_this.canForget,_this.hasSavedKey,_this.key,_this.remember,_this.isVerifying,_this.errorText);
}

@override
String toString() {
  final _this = this as ApiKeyState;
  return 'ApiKeyState(canForget: ${_this.canForget}, hasSavedKey: ${_this.hasSavedKey}, key: ${_this.key}, remember: ${_this.remember}, isVerifying: ${_this.isVerifying}, errorText: ${_this.errorText})';
}


}

/// @nodoc
abstract mixin class $ApiKeyStateCopyWith<$Res>  {
  factory $ApiKeyStateCopyWith(ApiKeyState value, $Res Function(ApiKeyState) _then) = _$ApiKeyStateCopyWithImpl;
@useResult
$Res call({
 bool canForget, bool hasSavedKey, String key, bool remember, bool isVerifying, String? errorText
});




}
/// @nodoc
class _$ApiKeyStateCopyWithImpl<$Res>
    implements $ApiKeyStateCopyWith<$Res> {
  _$ApiKeyStateCopyWithImpl(this._self, this._then);

  final ApiKeyState _self;
  final $Res Function(ApiKeyState) _then;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canForget = null,Object? hasSavedKey = null,Object? key = null,Object? remember = null,Object? isVerifying = null,Object? errorText = freezed,}) {
  return _then(ApiKeyState(
canForget: null == canForget ? _self.canForget : canForget // ignore: cast_nullable_to_non_nullable
as bool,hasSavedKey: null == hasSavedKey ? _self.hasSavedKey : hasSavedKey // ignore: cast_nullable_to_non_nullable
as bool,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,remember: null == remember ? _self.remember : remember // ignore: cast_nullable_to_non_nullable
as bool,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiKeyState].
extension ApiKeyStatePatterns on ApiKeyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiKeyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiKeyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiKeyState value)  $default,){
final _that = this;
switch (_that) {
case _ApiKeyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiKeyState value)?  $default,){
final _that = this;
switch (_that) {
case _ApiKeyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canForget,  bool hasSavedKey,  String key,  bool remember,  bool isVerifying,  String? errorText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiKeyState() when $default != null:
return $default(_that.canForget,_that.hasSavedKey,_that.key,_that.remember,_that.isVerifying,_that.errorText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canForget,  bool hasSavedKey,  String key,  bool remember,  bool isVerifying,  String? errorText)  $default,) {final _that = this;
switch (_that) {
case _ApiKeyState():
return $default(_that.canForget,_that.hasSavedKey,_that.key,_that.remember,_that.isVerifying,_that.errorText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canForget,  bool hasSavedKey,  String key,  bool remember,  bool isVerifying,  String? errorText)?  $default,) {final _that = this;
switch (_that) {
case _ApiKeyState() when $default != null:
return $default(_that.canForget,_that.hasSavedKey,_that.key,_that.remember,_that.isVerifying,_that.errorText);case _:
  return null;

}
}

}

/// @nodoc


class _ApiKeyState implements ApiKeyState {
  const _ApiKeyState({required this.canForget, required this.hasSavedKey, this.key = '', this.remember = false, this.isVerifying = false, this.errorText});
  

@override final  bool canForget;
@override final  bool hasSavedKey;
@override@JsonKey() final  String key;
@override@JsonKey() final  bool remember;
@override@JsonKey() final  bool isVerifying;
@override final  String? errorText;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiKeyStateCopyWith<_ApiKeyState> get copyWith => __$ApiKeyStateCopyWithImpl<_ApiKeyState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiKeyState&&(identical(other.canForget, canForget) || other.canForget == canForget)&&(identical(other.hasSavedKey, hasSavedKey) || other.hasSavedKey == hasSavedKey)&&(identical(other.key, key) || other.key == key)&&(identical(other.remember, remember) || other.remember == remember)&&(identical(other.isVerifying, isVerifying) || other.isVerifying == isVerifying)&&(identical(other.errorText, errorText) || other.errorText == errorText));
}


@override
int get hashCode {
    return Object.hash(runtimeType,canForget,hasSavedKey,key,remember,isVerifying,errorText);
}

@override
String toString() {
    return 'ApiKeyState(canForget: $canForget, hasSavedKey: $hasSavedKey, key: $key, remember: $remember, isVerifying: $isVerifying, errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class _$ApiKeyStateCopyWith<$Res> implements $ApiKeyStateCopyWith<$Res> {
  factory _$ApiKeyStateCopyWith(_ApiKeyState value, $Res Function(_ApiKeyState) _then) = __$ApiKeyStateCopyWithImpl;
@override @useResult
$Res call({
 bool canForget, bool hasSavedKey, String key, bool remember, bool isVerifying, String? errorText
});




}
/// @nodoc
class __$ApiKeyStateCopyWithImpl<$Res>
    implements _$ApiKeyStateCopyWith<$Res> {
  __$ApiKeyStateCopyWithImpl(this._self, this._then);

  final _ApiKeyState _self;
  final $Res Function(_ApiKeyState) _then;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canForget = null,Object? hasSavedKey = null,Object? key = null,Object? remember = null,Object? isVerifying = null,Object? errorText = freezed,}) {
  return _then(_ApiKeyState(
canForget: null == canForget ? _self.canForget : canForget // ignore: cast_nullable_to_non_nullable
as bool,hasSavedKey: null == hasSavedKey ? _self.hasSavedKey : hasSavedKey // ignore: cast_nullable_to_non_nullable
as bool,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,remember: null == remember ? _self.remember : remember // ignore: cast_nullable_to_non_nullable
as bool,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
