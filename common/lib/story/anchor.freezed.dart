// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anchor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Anchor {

 String get id; String get label; String get query; GeoPoint? get point; TravelMode get mode; int get maxMinutes; int get perWeek;
/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnchorCopyWith<Anchor> get copyWith => _$AnchorCopyWithImpl<Anchor>(this as Anchor, _$identity);

  /// Serializes this Anchor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Anchor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Anchor&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.point, _this.point) || other.point == _this.point)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.maxMinutes, _this.maxMinutes) || other.maxMinutes == _this.maxMinutes)&&(identical(other.perWeek, _this.perWeek) || other.perWeek == _this.perWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Anchor;
  return Object.hash(runtimeType,_this.id,_this.label,_this.query,_this.point,_this.mode,_this.maxMinutes,_this.perWeek);
}

@override
String toString() {
  final _this = this as Anchor;
  return 'Anchor(id: ${_this.id}, label: ${_this.label}, query: ${_this.query}, point: ${_this.point}, mode: ${_this.mode}, maxMinutes: ${_this.maxMinutes}, perWeek: ${_this.perWeek})';
}


}

/// @nodoc
abstract mixin class $AnchorCopyWith<$Res>  {
  factory $AnchorCopyWith(Anchor value, $Res Function(Anchor) _then) = _$AnchorCopyWithImpl;
@useResult
$Res call({
 String id, String label, String query, GeoPoint? point, TravelMode mode, int maxMinutes, int perWeek
});


$GeoPointCopyWith<$Res>? get point;

}
/// @nodoc
class _$AnchorCopyWithImpl<$Res>
    implements $AnchorCopyWith<$Res> {
  _$AnchorCopyWithImpl(this._self, this._then);

  final Anchor _self;
  final $Res Function(Anchor) _then;

/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? query = null,Object? point = freezed,Object? mode = null,Object? maxMinutes = null,Object? perWeek = null,}) {
  return _then(Anchor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,maxMinutes: null == maxMinutes ? _self.maxMinutes : maxMinutes // ignore: cast_nullable_to_non_nullable
as int,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get point {
    if (_self.point == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.point!, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}


/// Adds pattern-matching-related methods to [Anchor].
extension AnchorPatterns on Anchor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Anchor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Anchor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Anchor value)  $default,){
final _that = this;
switch (_that) {
case _Anchor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Anchor value)?  $default,){
final _that = this;
switch (_that) {
case _Anchor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String query,  GeoPoint? point,  TravelMode mode,  int maxMinutes,  int perWeek)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Anchor() when $default != null:
return $default(_that.id,_that.label,_that.query,_that.point,_that.mode,_that.maxMinutes,_that.perWeek);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String query,  GeoPoint? point,  TravelMode mode,  int maxMinutes,  int perWeek)  $default,) {final _that = this;
switch (_that) {
case _Anchor():
return $default(_that.id,_that.label,_that.query,_that.point,_that.mode,_that.maxMinutes,_that.perWeek);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String query,  GeoPoint? point,  TravelMode mode,  int maxMinutes,  int perWeek)?  $default,) {final _that = this;
switch (_that) {
case _Anchor() when $default != null:
return $default(_that.id,_that.label,_that.query,_that.point,_that.mode,_that.maxMinutes,_that.perWeek);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Anchor implements Anchor {
  const _Anchor({required this.id, required this.label, required this.query, this.point, this.mode = TravelMode.transit, this.maxMinutes = 30, this.perWeek = 5});
  factory _Anchor.fromJson(Map<String, dynamic> json) => _$AnchorFromJson(json);

@override final  String id;
@override final  String label;
@override final  String query;
@override final  GeoPoint? point;
@override@JsonKey() final  TravelMode mode;
@override@JsonKey() final  int maxMinutes;
@override@JsonKey() final  int perWeek;

/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnchorCopyWith<_Anchor> get copyWith => __$AnchorCopyWithImpl<_Anchor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnchorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Anchor&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.query, query) || other.query == query)&&(identical(other.point, point) || other.point == point)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.maxMinutes, maxMinutes) || other.maxMinutes == maxMinutes)&&(identical(other.perWeek, perWeek) || other.perWeek == perWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,query,point,mode,maxMinutes,perWeek);
}

@override
String toString() {
    return 'Anchor(id: $id, label: $label, query: $query, point: $point, mode: $mode, maxMinutes: $maxMinutes, perWeek: $perWeek)';
}


}

/// @nodoc
abstract mixin class _$AnchorCopyWith<$Res> implements $AnchorCopyWith<$Res> {
  factory _$AnchorCopyWith(_Anchor value, $Res Function(_Anchor) _then) = __$AnchorCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String query, GeoPoint? point, TravelMode mode, int maxMinutes, int perWeek
});


@override $GeoPointCopyWith<$Res>? get point;

}
/// @nodoc
class __$AnchorCopyWithImpl<$Res>
    implements _$AnchorCopyWith<$Res> {
  __$AnchorCopyWithImpl(this._self, this._then);

  final _Anchor _self;
  final $Res Function(_Anchor) _then;

/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? query = null,Object? point = freezed,Object? mode = null,Object? maxMinutes = null,Object? perWeek = null,}) {
  return _then(_Anchor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,maxMinutes: null == maxMinutes ? _self.maxMinutes : maxMinutes // ignore: cast_nullable_to_non_nullable
as int,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Anchor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get point {
    if (_self.point == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.point!, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}

// dart format on
