// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wire_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WireEntry {

 DateTime get at; WireDirection get direction; String get label; String? get detail; String? get surfaceId; int? get bytes; Map<String, Object?>? get payload;
/// Create a copy of WireEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WireEntryCopyWith<WireEntry> get copyWith => _$WireEntryCopyWithImpl<WireEntry>(this as WireEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WireEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WireEntry&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.direction, _this.direction) || other.direction == _this.direction)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.detail, _this.detail) || other.detail == _this.detail)&&(identical(other.surfaceId, _this.surfaceId) || other.surfaceId == _this.surfaceId)&&(identical(other.bytes, _this.bytes) || other.bytes == _this.bytes)&&const DeepCollectionEquality().equals(other.payload, _this.payload));
}


@override
int get hashCode {
  final _this = this as WireEntry;
  return Object.hash(runtimeType,_this.at,_this.direction,_this.label,_this.detail,_this.surfaceId,_this.bytes,const DeepCollectionEquality().hash(_this.payload));
}

@override
String toString() {
  final _this = this as WireEntry;
  return 'WireEntry(at: ${_this.at}, direction: ${_this.direction}, label: ${_this.label}, detail: ${_this.detail}, surfaceId: ${_this.surfaceId}, bytes: ${_this.bytes}, payload: ${_this.payload})';
}


}

/// @nodoc
abstract mixin class $WireEntryCopyWith<$Res>  {
  factory $WireEntryCopyWith(WireEntry value, $Res Function(WireEntry) _then) = _$WireEntryCopyWithImpl;
@useResult
$Res call({
 DateTime at, WireDirection direction, String label, String? detail, String? surfaceId, int? bytes, Map<String, Object?>? payload
});




}
/// @nodoc
class _$WireEntryCopyWithImpl<$Res>
    implements $WireEntryCopyWith<$Res> {
  _$WireEntryCopyWithImpl(this._self, this._then);

  final WireEntry _self;
  final $Res Function(WireEntry) _then;

/// Create a copy of WireEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? direction = null,Object? label = null,Object? detail = freezed,Object? surfaceId = freezed,Object? bytes = freezed,Object? payload = freezed,}) {
  return _then(WireEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as WireDirection,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,surfaceId: freezed == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WireEntry].
extension WireEntryPatterns on WireEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WireEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WireEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WireEntry value)  $default,){
final _that = this;
switch (_that) {
case _WireEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WireEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WireEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime at,  WireDirection direction,  String label,  String? detail,  String? surfaceId,  int? bytes,  Map<String, Object?>? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WireEntry() when $default != null:
return $default(_that.at,_that.direction,_that.label,_that.detail,_that.surfaceId,_that.bytes,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime at,  WireDirection direction,  String label,  String? detail,  String? surfaceId,  int? bytes,  Map<String, Object?>? payload)  $default,) {final _that = this;
switch (_that) {
case _WireEntry():
return $default(_that.at,_that.direction,_that.label,_that.detail,_that.surfaceId,_that.bytes,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime at,  WireDirection direction,  String label,  String? detail,  String? surfaceId,  int? bytes,  Map<String, Object?>? payload)?  $default,) {final _that = this;
switch (_that) {
case _WireEntry() when $default != null:
return $default(_that.at,_that.direction,_that.label,_that.detail,_that.surfaceId,_that.bytes,_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _WireEntry implements WireEntry {
  const _WireEntry({required this.at, required this.direction, required this.label, this.detail, this.surfaceId, this.bytes,  Map<String, Object?>? payload}): _payload = payload;
  

@override final  DateTime at;
@override final  WireDirection direction;
@override final  String label;
@override final  String? detail;
@override final  String? surfaceId;
@override final  int? bytes;
 final  Map<String, Object?>? _payload;
@override Map<String, Object?>? get payload {
  final value = _payload;
  if (value == null) return null;
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of WireEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WireEntryCopyWith<_WireEntry> get copyWith => __$WireEntryCopyWithImpl<_WireEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WireEntry&&(identical(other.at, at) || other.at == at)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.label, label) || other.label == label)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&const DeepCollectionEquality().equals(other.payload, _payload));
}


@override
int get hashCode {
    return Object.hash(runtimeType,at,direction,label,detail,surfaceId,bytes,const DeepCollectionEquality().hash(_payload));
}

@override
String toString() {
    return 'WireEntry(at: $at, direction: $direction, label: $label, detail: $detail, surfaceId: $surfaceId, bytes: $bytes, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$WireEntryCopyWith<$Res> implements $WireEntryCopyWith<$Res> {
  factory _$WireEntryCopyWith(_WireEntry value, $Res Function(_WireEntry) _then) = __$WireEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime at, WireDirection direction, String label, String? detail, String? surfaceId, int? bytes, Map<String, Object?>? payload
});




}
/// @nodoc
class __$WireEntryCopyWithImpl<$Res>
    implements _$WireEntryCopyWith<$Res> {
  __$WireEntryCopyWithImpl(this._self, this._then);

  final _WireEntry _self;
  final $Res Function(_WireEntry) _then;

/// Create a copy of WireEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? direction = null,Object? label = null,Object? detail = freezed,Object? surfaceId = freezed,Object? bytes = freezed,Object? payload = freezed,}) {
  return _then(_WireEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as WireDirection,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,surfaceId: freezed == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,payload: freezed == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

// dart format on
