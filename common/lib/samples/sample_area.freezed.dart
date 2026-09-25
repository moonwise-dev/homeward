// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SampleArea {

 String get id; String get name; GeoPoint get point; String get character; int? get flatPricePerM2; int? get housePricePerM2; String get sourceId;
/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SampleAreaCopyWith<SampleArea> get copyWith => _$SampleAreaCopyWithImpl<SampleArea>(this as SampleArea, _$identity);

  /// Serializes this SampleArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SampleArea;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleArea&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.point, _this.point) || other.point == _this.point)&&(identical(other.character, _this.character) || other.character == _this.character)&&(identical(other.flatPricePerM2, _this.flatPricePerM2) || other.flatPricePerM2 == _this.flatPricePerM2)&&(identical(other.housePricePerM2, _this.housePricePerM2) || other.housePricePerM2 == _this.housePricePerM2)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SampleArea;
  return Object.hash(runtimeType,_this.id,_this.name,_this.point,_this.character,_this.flatPricePerM2,_this.housePricePerM2,_this.sourceId);
}

@override
String toString() {
  final _this = this as SampleArea;
  return 'SampleArea(id: ${_this.id}, name: ${_this.name}, point: ${_this.point}, character: ${_this.character}, flatPricePerM2: ${_this.flatPricePerM2}, housePricePerM2: ${_this.housePricePerM2}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $SampleAreaCopyWith<$Res>  {
  factory $SampleAreaCopyWith(SampleArea value, $Res Function(SampleArea) _then) = _$SampleAreaCopyWithImpl;
@useResult
$Res call({
 String id, String name, GeoPoint point, String character, int? flatPricePerM2, int? housePricePerM2, String sourceId
});


$GeoPointCopyWith<$Res> get point;

}
/// @nodoc
class _$SampleAreaCopyWithImpl<$Res>
    implements $SampleAreaCopyWith<$Res> {
  _$SampleAreaCopyWithImpl(this._self, this._then);

  final SampleArea _self;
  final $Res Function(SampleArea) _then;

/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? point = null,Object? character = null,Object? flatPricePerM2 = freezed,Object? housePricePerM2 = freezed,Object? sourceId = null,}) {
  return _then(SampleArea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,flatPricePerM2: freezed == flatPricePerM2 ? _self.flatPricePerM2 : flatPricePerM2 // ignore: cast_nullable_to_non_nullable
as int?,housePricePerM2: freezed == housePricePerM2 ? _self.housePricePerM2 : housePricePerM2 // ignore: cast_nullable_to_non_nullable
as int?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}


/// Adds pattern-matching-related methods to [SampleArea].
extension SampleAreaPatterns on SampleArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SampleArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SampleArea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SampleArea value)  $default,){
final _that = this;
switch (_that) {
case _SampleArea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SampleArea value)?  $default,){
final _that = this;
switch (_that) {
case _SampleArea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  GeoPoint point,  String character,  int? flatPricePerM2,  int? housePricePerM2,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SampleArea() when $default != null:
return $default(_that.id,_that.name,_that.point,_that.character,_that.flatPricePerM2,_that.housePricePerM2,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  GeoPoint point,  String character,  int? flatPricePerM2,  int? housePricePerM2,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _SampleArea():
return $default(_that.id,_that.name,_that.point,_that.character,_that.flatPricePerM2,_that.housePricePerM2,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  GeoPoint point,  String character,  int? flatPricePerM2,  int? housePricePerM2,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _SampleArea() when $default != null:
return $default(_that.id,_that.name,_that.point,_that.character,_that.flatPricePerM2,_that.housePricePerM2,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SampleArea extends SampleArea {
  const _SampleArea({required this.id, required this.name, required this.point, required this.character, this.flatPricePerM2, this.housePricePerM2, required this.sourceId}): super._();
  factory _SampleArea.fromJson(Map<String, dynamic> json) => _$SampleAreaFromJson(json);

@override final  String id;
@override final  String name;
@override final  GeoPoint point;
@override final  String character;
@override final  int? flatPricePerM2;
@override final  int? housePricePerM2;
@override final  String sourceId;

/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SampleAreaCopyWith<_SampleArea> get copyWith => __$SampleAreaCopyWithImpl<_SampleArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SampleAreaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SampleArea&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.point, point) || other.point == point)&&(identical(other.character, character) || other.character == character)&&(identical(other.flatPricePerM2, flatPricePerM2) || other.flatPricePerM2 == flatPricePerM2)&&(identical(other.housePricePerM2, housePricePerM2) || other.housePricePerM2 == housePricePerM2)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,point,character,flatPricePerM2,housePricePerM2,sourceId);
}

@override
String toString() {
    return 'SampleArea(id: $id, name: $name, point: $point, character: $character, flatPricePerM2: $flatPricePerM2, housePricePerM2: $housePricePerM2, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$SampleAreaCopyWith<$Res> implements $SampleAreaCopyWith<$Res> {
  factory _$SampleAreaCopyWith(_SampleArea value, $Res Function(_SampleArea) _then) = __$SampleAreaCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, GeoPoint point, String character, int? flatPricePerM2, int? housePricePerM2, String sourceId
});


@override $GeoPointCopyWith<$Res> get point;

}
/// @nodoc
class __$SampleAreaCopyWithImpl<$Res>
    implements _$SampleAreaCopyWith<$Res> {
  __$SampleAreaCopyWithImpl(this._self, this._then);

  final _SampleArea _self;
  final $Res Function(_SampleArea) _then;

/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? point = null,Object? character = null,Object? flatPricePerM2 = freezed,Object? housePricePerM2 = freezed,Object? sourceId = null,}) {
  return _then(_SampleArea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,flatPricePerM2: freezed == flatPricePerM2 ? _self.flatPricePerM2 : flatPricePerM2 // ignore: cast_nullable_to_non_nullable
as int?,housePricePerM2: freezed == housePricePerM2 ? _self.housePricePerM2 : housePricePerM2 // ignore: cast_nullable_to_non_nullable
as int?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SampleArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}

// dart format on
