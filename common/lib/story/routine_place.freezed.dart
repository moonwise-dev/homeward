// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutinePlace {

 String get id; String get label; int get perWeek; GeoPoint? get pin;
/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutinePlaceCopyWith<RoutinePlace> get copyWith => _$RoutinePlaceCopyWithImpl<RoutinePlace>(this as RoutinePlace, _$identity);

  /// Serializes this RoutinePlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoutinePlace;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutinePlace&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.perWeek, _this.perWeek) || other.perWeek == _this.perWeek)&&(identical(other.pin, _this.pin) || other.pin == _this.pin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoutinePlace;
  return Object.hash(runtimeType,_this.id,_this.label,_this.perWeek,_this.pin);
}

@override
String toString() {
  final _this = this as RoutinePlace;
  return 'RoutinePlace(id: ${_this.id}, label: ${_this.label}, perWeek: ${_this.perWeek}, pin: ${_this.pin})';
}


}

/// @nodoc
abstract mixin class $RoutinePlaceCopyWith<$Res>  {
  factory $RoutinePlaceCopyWith(RoutinePlace value, $Res Function(RoutinePlace) _then) = _$RoutinePlaceCopyWithImpl;
@useResult
$Res call({
 String id, String label, int perWeek, GeoPoint? pin
});


$GeoPointCopyWith<$Res>? get pin;

}
/// @nodoc
class _$RoutinePlaceCopyWithImpl<$Res>
    implements $RoutinePlaceCopyWith<$Res> {
  _$RoutinePlaceCopyWithImpl(this._self, this._then);

  final RoutinePlace _self;
  final $Res Function(RoutinePlace) _then;

/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? perWeek = null,Object? pin = freezed,}) {
  return _then(RoutinePlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as GeoPoint?,
  ));
}
/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get pin {
    if (_self.pin == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.pin!, (value) {
    return _then(_self.copyWith(pin: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoutinePlace].
extension RoutinePlacePatterns on RoutinePlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutinePlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutinePlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutinePlace value)  $default,){
final _that = this;
switch (_that) {
case _RoutinePlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutinePlace value)?  $default,){
final _that = this;
switch (_that) {
case _RoutinePlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  int perWeek,  GeoPoint? pin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutinePlace() when $default != null:
return $default(_that.id,_that.label,_that.perWeek,_that.pin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  int perWeek,  GeoPoint? pin)  $default,) {final _that = this;
switch (_that) {
case _RoutinePlace():
return $default(_that.id,_that.label,_that.perWeek,_that.pin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  int perWeek,  GeoPoint? pin)?  $default,) {final _that = this;
switch (_that) {
case _RoutinePlace() when $default != null:
return $default(_that.id,_that.label,_that.perWeek,_that.pin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoutinePlace implements RoutinePlace {
  const _RoutinePlace({required this.id, required this.label, this.perWeek = 1, this.pin});
  factory _RoutinePlace.fromJson(Map<String, dynamic> json) => _$RoutinePlaceFromJson(json);

@override final  String id;
@override final  String label;
@override@JsonKey() final  int perWeek;
@override final  GeoPoint? pin;

/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutinePlaceCopyWith<_RoutinePlace> get copyWith => __$RoutinePlaceCopyWithImpl<_RoutinePlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutinePlaceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutinePlace&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.perWeek, perWeek) || other.perWeek == perWeek)&&(identical(other.pin, pin) || other.pin == pin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,perWeek,pin);
}

@override
String toString() {
    return 'RoutinePlace(id: $id, label: $label, perWeek: $perWeek, pin: $pin)';
}


}

/// @nodoc
abstract mixin class _$RoutinePlaceCopyWith<$Res> implements $RoutinePlaceCopyWith<$Res> {
  factory _$RoutinePlaceCopyWith(_RoutinePlace value, $Res Function(_RoutinePlace) _then) = __$RoutinePlaceCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, int perWeek, GeoPoint? pin
});


@override $GeoPointCopyWith<$Res>? get pin;

}
/// @nodoc
class __$RoutinePlaceCopyWithImpl<$Res>
    implements _$RoutinePlaceCopyWith<$Res> {
  __$RoutinePlaceCopyWithImpl(this._self, this._then);

  final _RoutinePlace _self;
  final $Res Function(_RoutinePlace) _then;

/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? perWeek = null,Object? pin = freezed,}) {
  return _then(_RoutinePlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as GeoPoint?,
  ));
}

/// Create a copy of RoutinePlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get pin {
    if (_self.pin == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.pin!, (value) {
    return _then(_self.copyWith(pin: value));
  });
}
}

// dart format on
