// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryPin {

 String get label; double get lat; double get lng;
/// Create a copy of StoryPin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryPinCopyWith<StoryPin> get copyWith => _$StoryPinCopyWithImpl<StoryPin>(this as StoryPin, _$identity);

  /// Serializes this StoryPin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoryPin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryPin&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoryPin;
  return Object.hash(runtimeType,_this.label,_this.lat,_this.lng);
}

@override
String toString() {
  final _this = this as StoryPin;
  return 'StoryPin(label: ${_this.label}, lat: ${_this.lat}, lng: ${_this.lng})';
}


}

/// @nodoc
abstract mixin class $StoryPinCopyWith<$Res>  {
  factory $StoryPinCopyWith(StoryPin value, $Res Function(StoryPin) _then) = _$StoryPinCopyWithImpl;
@useResult
$Res call({
 String label, double lat, double lng
});




}
/// @nodoc
class _$StoryPinCopyWithImpl<$Res>
    implements $StoryPinCopyWith<$Res> {
  _$StoryPinCopyWithImpl(this._self, this._then);

  final StoryPin _self;
  final $Res Function(StoryPin) _then;

/// Create a copy of StoryPin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? lat = null,Object? lng = null,}) {
  return _then(StoryPin(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryPin].
extension StoryPinPatterns on StoryPin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryPin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryPin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryPin value)  $default,){
final _that = this;
switch (_that) {
case _StoryPin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryPin value)?  $default,){
final _that = this;
switch (_that) {
case _StoryPin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryPin() when $default != null:
return $default(_that.label,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _StoryPin():
return $default(_that.label,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _StoryPin() when $default != null:
return $default(_that.label,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryPin implements StoryPin {
  const _StoryPin({required this.label, required this.lat, required this.lng});
  factory _StoryPin.fromJson(Map<String, dynamic> json) => _$StoryPinFromJson(json);

@override final  String label;
@override final  double lat;
@override final  double lng;

/// Create a copy of StoryPin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryPinCopyWith<_StoryPin> get copyWith => __$StoryPinCopyWithImpl<_StoryPin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryPinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryPin&&(identical(other.label, label) || other.label == label)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,lat,lng);
}

@override
String toString() {
    return 'StoryPin(label: $label, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$StoryPinCopyWith<$Res> implements $StoryPinCopyWith<$Res> {
  factory _$StoryPinCopyWith(_StoryPin value, $Res Function(_StoryPin) _then) = __$StoryPinCopyWithImpl;
@override @useResult
$Res call({
 String label, double lat, double lng
});




}
/// @nodoc
class __$StoryPinCopyWithImpl<$Res>
    implements _$StoryPinCopyWith<$Res> {
  __$StoryPinCopyWithImpl(this._self, this._then);

  final _StoryPin _self;
  final $Res Function(_StoryPin) _then;

/// Create a copy of StoryPin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? lat = null,Object? lng = null,}) {
  return _then(_StoryPin(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
