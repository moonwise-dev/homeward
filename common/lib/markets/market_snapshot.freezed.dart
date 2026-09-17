// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketSnapshot {

@MarketIdJsonConverter() MarketId get id; String get name; Coverage get coverage;
/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketSnapshotCopyWith<MarketSnapshot> get copyWith => _$MarketSnapshotCopyWithImpl<MarketSnapshot>(this as MarketSnapshot, _$identity);

  /// Serializes this MarketSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketSnapshot&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.coverage, _this.coverage) || other.coverage == _this.coverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketSnapshot;
  return Object.hash(runtimeType,_this.id,_this.name,_this.coverage);
}

@override
String toString() {
  final _this = this as MarketSnapshot;
  return 'MarketSnapshot(id: ${_this.id}, name: ${_this.name}, coverage: ${_this.coverage})';
}


}

/// @nodoc
abstract mixin class $MarketSnapshotCopyWith<$Res>  {
  factory $MarketSnapshotCopyWith(MarketSnapshot value, $Res Function(MarketSnapshot) _then) = _$MarketSnapshotCopyWithImpl;
@useResult
$Res call({
@MarketIdJsonConverter() MarketId id, String name, Coverage coverage
});




}
/// @nodoc
class _$MarketSnapshotCopyWithImpl<$Res>
    implements $MarketSnapshotCopyWith<$Res> {
  _$MarketSnapshotCopyWithImpl(this._self, this._then);

  final MarketSnapshot _self;
  final $Res Function(MarketSnapshot) _then;

/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverage = null,}) {
  return _then(MarketSnapshot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverage: null == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as Coverage,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketSnapshot].
extension MarketSnapshotPatterns on MarketSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _MarketSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
return $default(_that.id,_that.name,_that.coverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage)  $default,) {final _that = this;
switch (_that) {
case _MarketSnapshot():
return $default(_that.id,_that.name,_that.coverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage)?  $default,) {final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
return $default(_that.id,_that.name,_that.coverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketSnapshot extends MarketSnapshot {
  const _MarketSnapshot({@MarketIdJsonConverter() required this.id, required this.name, this.coverage = Coverage.curated}): super._();
  factory _MarketSnapshot.fromJson(Map<String, dynamic> json) => _$MarketSnapshotFromJson(json);

@override@MarketIdJsonConverter() final  MarketId id;
@override final  String name;
@override@JsonKey() final  Coverage coverage;

/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketSnapshotCopyWith<_MarketSnapshot> get copyWith => __$MarketSnapshotCopyWithImpl<_MarketSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverage, coverage) || other.coverage == coverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,coverage);
}

@override
String toString() {
    return 'MarketSnapshot(id: $id, name: $name, coverage: $coverage)';
}


}

/// @nodoc
abstract mixin class _$MarketSnapshotCopyWith<$Res> implements $MarketSnapshotCopyWith<$Res> {
  factory _$MarketSnapshotCopyWith(_MarketSnapshot value, $Res Function(_MarketSnapshot) _then) = __$MarketSnapshotCopyWithImpl;
@override @useResult
$Res call({
@MarketIdJsonConverter() MarketId id, String name, Coverage coverage
});




}
/// @nodoc
class __$MarketSnapshotCopyWithImpl<$Res>
    implements _$MarketSnapshotCopyWith<$Res> {
  __$MarketSnapshotCopyWithImpl(this._self, this._then);

  final _MarketSnapshot _self;
  final $Res Function(_MarketSnapshot) _then;

/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverage = null,}) {
  return _then(_MarketSnapshot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverage: null == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as Coverage,
  ));
}


}

// dart format on
