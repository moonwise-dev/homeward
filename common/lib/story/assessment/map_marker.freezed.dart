// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapMarker {

 String get id; String get label; MapMarkerKind get kind; double get lat; double get lng; String? get category; String? get candidateId;
/// Create a copy of MapMarker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapMarkerCopyWith<MapMarker> get copyWith => _$MapMarkerCopyWithImpl<MapMarker>(this as MapMarker, _$identity);

  /// Serializes this MapMarker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapMarker;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapMarker&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.candidateId, _this.candidateId) || other.candidateId == _this.candidateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapMarker;
  return Object.hash(runtimeType,_this.id,_this.label,_this.kind,_this.lat,_this.lng,_this.category,_this.candidateId);
}

@override
String toString() {
  final _this = this as MapMarker;
  return 'MapMarker(id: ${_this.id}, label: ${_this.label}, kind: ${_this.kind}, lat: ${_this.lat}, lng: ${_this.lng}, category: ${_this.category}, candidateId: ${_this.candidateId})';
}


}

/// @nodoc
abstract mixin class $MapMarkerCopyWith<$Res>  {
  factory $MapMarkerCopyWith(MapMarker value, $Res Function(MapMarker) _then) = _$MapMarkerCopyWithImpl;
@useResult
$Res call({
 String id, String label, MapMarkerKind kind, double lat, double lng, String? category, String? candidateId
});




}
/// @nodoc
class _$MapMarkerCopyWithImpl<$Res>
    implements $MapMarkerCopyWith<$Res> {
  _$MapMarkerCopyWithImpl(this._self, this._then);

  final MapMarker _self;
  final $Res Function(MapMarker) _then;

/// Create a copy of MapMarker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? kind = null,Object? lat = null,Object? lng = null,Object? category = freezed,Object? candidateId = freezed,}) {
  return _then(MapMarker(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MapMarkerKind,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,candidateId: freezed == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapMarker].
extension MapMarkerPatterns on MapMarker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapMarker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapMarker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapMarker value)  $default,){
final _that = this;
switch (_that) {
case _MapMarker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapMarker value)?  $default,){
final _that = this;
switch (_that) {
case _MapMarker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  MapMarkerKind kind,  double lat,  double lng,  String? category,  String? candidateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapMarker() when $default != null:
return $default(_that.id,_that.label,_that.kind,_that.lat,_that.lng,_that.category,_that.candidateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  MapMarkerKind kind,  double lat,  double lng,  String? category,  String? candidateId)  $default,) {final _that = this;
switch (_that) {
case _MapMarker():
return $default(_that.id,_that.label,_that.kind,_that.lat,_that.lng,_that.category,_that.candidateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  MapMarkerKind kind,  double lat,  double lng,  String? category,  String? candidateId)?  $default,) {final _that = this;
switch (_that) {
case _MapMarker() when $default != null:
return $default(_that.id,_that.label,_that.kind,_that.lat,_that.lng,_that.category,_that.candidateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapMarker implements MapMarker {
  const _MapMarker({required this.id, required this.label, required this.kind, required this.lat, required this.lng, this.category, this.candidateId});
  factory _MapMarker.fromJson(Map<String, dynamic> json) => _$MapMarkerFromJson(json);

@override final  String id;
@override final  String label;
@override final  MapMarkerKind kind;
@override final  double lat;
@override final  double lng;
@override final  String? category;
@override final  String? candidateId;

/// Create a copy of MapMarker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapMarkerCopyWith<_MapMarker> get copyWith => __$MapMarkerCopyWithImpl<_MapMarker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapMarkerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapMarker&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.category, category) || other.category == category)&&(identical(other.candidateId, candidateId) || other.candidateId == candidateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,kind,lat,lng,category,candidateId);
}

@override
String toString() {
    return 'MapMarker(id: $id, label: $label, kind: $kind, lat: $lat, lng: $lng, category: $category, candidateId: $candidateId)';
}


}

/// @nodoc
abstract mixin class _$MapMarkerCopyWith<$Res> implements $MapMarkerCopyWith<$Res> {
  factory _$MapMarkerCopyWith(_MapMarker value, $Res Function(_MapMarker) _then) = __$MapMarkerCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, MapMarkerKind kind, double lat, double lng, String? category, String? candidateId
});




}
/// @nodoc
class __$MapMarkerCopyWithImpl<$Res>
    implements _$MapMarkerCopyWith<$Res> {
  __$MapMarkerCopyWithImpl(this._self, this._then);

  final _MapMarker _self;
  final $Res Function(_MapMarker) _then;

/// Create a copy of MapMarker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? kind = null,Object? lat = null,Object? lng = null,Object? category = freezed,Object? candidateId = freezed,}) {
  return _then(_MapMarker(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MapMarkerKind,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,candidateId: freezed == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
