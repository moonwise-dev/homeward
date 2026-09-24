// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapRoute {

 String get candidateId; String get anchorId; TravelMode get mode; int get minutes; String get label; List<List<double>> get path;
/// Create a copy of MapRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapRouteCopyWith<MapRoute> get copyWith => _$MapRouteCopyWithImpl<MapRoute>(this as MapRoute, _$identity);

  /// Serializes this MapRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapRoute;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapRoute&&(identical(other.candidateId, _this.candidateId) || other.candidateId == _this.candidateId)&&(identical(other.anchorId, _this.anchorId) || other.anchorId == _this.anchorId)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.minutes, _this.minutes) || other.minutes == _this.minutes)&&(identical(other.label, _this.label) || other.label == _this.label)&&const DeepCollectionEquality().equals(other.path, _this.path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapRoute;
  return Object.hash(runtimeType,_this.candidateId,_this.anchorId,_this.mode,_this.minutes,_this.label,const DeepCollectionEquality().hash(_this.path));
}

@override
String toString() {
  final _this = this as MapRoute;
  return 'MapRoute(candidateId: ${_this.candidateId}, anchorId: ${_this.anchorId}, mode: ${_this.mode}, minutes: ${_this.minutes}, label: ${_this.label}, path: ${_this.path})';
}


}

/// @nodoc
abstract mixin class $MapRouteCopyWith<$Res>  {
  factory $MapRouteCopyWith(MapRoute value, $Res Function(MapRoute) _then) = _$MapRouteCopyWithImpl;
@useResult
$Res call({
 String candidateId, String anchorId, TravelMode mode, int minutes, String label, List<List<double>> path
});




}
/// @nodoc
class _$MapRouteCopyWithImpl<$Res>
    implements $MapRouteCopyWith<$Res> {
  _$MapRouteCopyWithImpl(this._self, this._then);

  final MapRoute _self;
  final $Res Function(MapRoute) _then;

/// Create a copy of MapRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidateId = null,Object? anchorId = null,Object? mode = null,Object? minutes = null,Object? label = null,Object? path = null,}) {
  return _then(MapRoute(
candidateId: null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,anchorId: null == anchorId ? _self.anchorId : anchorId // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}

}


/// Adds pattern-matching-related methods to [MapRoute].
extension MapRoutePatterns on MapRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapRoute value)  $default,){
final _that = this;
switch (_that) {
case _MapRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapRoute value)?  $default,){
final _that = this;
switch (_that) {
case _MapRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String candidateId,  String anchorId,  TravelMode mode,  int minutes,  String label,  List<List<double>> path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapRoute() when $default != null:
return $default(_that.candidateId,_that.anchorId,_that.mode,_that.minutes,_that.label,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String candidateId,  String anchorId,  TravelMode mode,  int minutes,  String label,  List<List<double>> path)  $default,) {final _that = this;
switch (_that) {
case _MapRoute():
return $default(_that.candidateId,_that.anchorId,_that.mode,_that.minutes,_that.label,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String candidateId,  String anchorId,  TravelMode mode,  int minutes,  String label,  List<List<double>> path)?  $default,) {final _that = this;
switch (_that) {
case _MapRoute() when $default != null:
return $default(_that.candidateId,_that.anchorId,_that.mode,_that.minutes,_that.label,_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapRoute implements MapRoute {
  const _MapRoute({required this.candidateId, required this.anchorId, required this.mode, required this.minutes, required this.label,  List<List<double>> path = const []}): _path = path;
  factory _MapRoute.fromJson(Map<String, dynamic> json) => _$MapRouteFromJson(json);

@override final  String candidateId;
@override final  String anchorId;
@override final  TravelMode mode;
@override final  int minutes;
@override final  String label;
 final  List<List<double>> _path;
@override@JsonKey() List<List<double>> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of MapRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapRouteCopyWith<_MapRoute> get copyWith => __$MapRouteCopyWithImpl<_MapRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapRouteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapRoute&&(identical(other.candidateId, candidateId) || other.candidateId == candidateId)&&(identical(other.anchorId, anchorId) || other.anchorId == anchorId)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.path, _path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,candidateId,anchorId,mode,minutes,label,const DeepCollectionEquality().hash(_path));
}

@override
String toString() {
    return 'MapRoute(candidateId: $candidateId, anchorId: $anchorId, mode: $mode, minutes: $minutes, label: $label, path: $path)';
}


}

/// @nodoc
abstract mixin class _$MapRouteCopyWith<$Res> implements $MapRouteCopyWith<$Res> {
  factory _$MapRouteCopyWith(_MapRoute value, $Res Function(_MapRoute) _then) = __$MapRouteCopyWithImpl;
@override @useResult
$Res call({
 String candidateId, String anchorId, TravelMode mode, int minutes, String label, List<List<double>> path
});




}
/// @nodoc
class __$MapRouteCopyWithImpl<$Res>
    implements _$MapRouteCopyWith<$Res> {
  __$MapRouteCopyWithImpl(this._self, this._then);

  final _MapRoute _self;
  final $Res Function(_MapRoute) _then;

/// Create a copy of MapRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidateId = null,Object? anchorId = null,Object? mode = null,Object? minutes = null,Object? label = null,Object? path = null,}) {
  return _then(_MapRoute(
candidateId: null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,anchorId: null == anchorId ? _self.anchorId : anchorId // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}


}

// dart format on
