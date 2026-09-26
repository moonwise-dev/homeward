// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapPin {

 double get lat; double get lng; String get label;
/// Create a copy of MapPin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPinCopyWith<MapPin> get copyWith => _$MapPinCopyWithImpl<MapPin>(this as MapPin, _$identity);

  /// Serializes this MapPin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapPin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPin&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapPin;
  return Object.hash(runtimeType,_this.lat,_this.lng,_this.label);
}

@override
String toString() {
  final _this = this as MapPin;
  return 'MapPin(lat: ${_this.lat}, lng: ${_this.lng}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $MapPinCopyWith<$Res>  {
  factory $MapPinCopyWith(MapPin value, $Res Function(MapPin) _then) = _$MapPinCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, String label
});




}
/// @nodoc
class _$MapPinCopyWithImpl<$Res>
    implements $MapPinCopyWith<$Res> {
  _$MapPinCopyWithImpl(this._self, this._then);

  final MapPin _self;
  final $Res Function(MapPin) _then;

/// Create a copy of MapPin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? label = null,}) {
  return _then(MapPin(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MapPin].
extension MapPinPatterns on MapPin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPin value)  $default,){
final _that = this;
switch (_that) {
case _MapPin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPin value)?  $default,){
final _that = this;
switch (_that) {
case _MapPin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPin() when $default != null:
return $default(_that.lat,_that.lng,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  String label)  $default,) {final _that = this;
switch (_that) {
case _MapPin():
return $default(_that.lat,_that.lng,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  String label)?  $default,) {final _that = this;
switch (_that) {
case _MapPin() when $default != null:
return $default(_that.lat,_that.lng,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapPin implements MapPin {
  const _MapPin({required this.lat, required this.lng, required this.label});
  factory _MapPin.fromJson(Map<String, dynamic> json) => _$MapPinFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  String label;

/// Create a copy of MapPin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPinCopyWith<_MapPin> get copyWith => __$MapPinCopyWithImpl<_MapPin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapPinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPin&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lat,lng,label);
}

@override
String toString() {
    return 'MapPin(lat: $lat, lng: $lng, label: $label)';
}


}

/// @nodoc
abstract mixin class _$MapPinCopyWith<$Res> implements $MapPinCopyWith<$Res> {
  factory _$MapPinCopyWith(_MapPin value, $Res Function(_MapPin) _then) = __$MapPinCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, String label
});




}
/// @nodoc
class __$MapPinCopyWithImpl<$Res>
    implements _$MapPinCopyWith<$Res> {
  __$MapPinCopyWithImpl(this._self, this._then);

  final _MapPin _self;
  final $Res Function(_MapPin) _then;

/// Create a copy of MapPin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? label = null,}) {
  return _then(_MapPin(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
