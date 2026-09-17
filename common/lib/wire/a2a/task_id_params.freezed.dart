// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_id_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskIdParams {

 String get id; int? get historyLength; Map<String, Object?>? get metadata;
/// Create a copy of TaskIdParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskIdParamsCopyWith<TaskIdParams> get copyWith => _$TaskIdParamsCopyWithImpl<TaskIdParams>(this as TaskIdParams, _$identity);

  /// Serializes this TaskIdParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskIdParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskIdParams&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.historyLength, _this.historyLength) || other.historyLength == _this.historyLength)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskIdParams;
  return Object.hash(runtimeType,_this.id,_this.historyLength,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as TaskIdParams;
  return 'TaskIdParams(id: ${_this.id}, historyLength: ${_this.historyLength}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $TaskIdParamsCopyWith<$Res>  {
  factory $TaskIdParamsCopyWith(TaskIdParams value, $Res Function(TaskIdParams) _then) = _$TaskIdParamsCopyWithImpl;
@useResult
$Res call({
 String id, int? historyLength, Map<String, Object?>? metadata
});




}
/// @nodoc
class _$TaskIdParamsCopyWithImpl<$Res>
    implements $TaskIdParamsCopyWith<$Res> {
  _$TaskIdParamsCopyWithImpl(this._self, this._then);

  final TaskIdParams _self;
  final $Res Function(TaskIdParams) _then;

/// Create a copy of TaskIdParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? historyLength = freezed,Object? metadata = freezed,}) {
  return _then(TaskIdParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,historyLength: freezed == historyLength ? _self.historyLength : historyLength // ignore: cast_nullable_to_non_nullable
as int?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskIdParams].
extension TaskIdParamsPatterns on TaskIdParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskIdParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskIdParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskIdParams value)  $default,){
final _that = this;
switch (_that) {
case _TaskIdParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskIdParams value)?  $default,){
final _that = this;
switch (_that) {
case _TaskIdParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? historyLength,  Map<String, Object?>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskIdParams() when $default != null:
return $default(_that.id,_that.historyLength,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? historyLength,  Map<String, Object?>? metadata)  $default,) {final _that = this;
switch (_that) {
case _TaskIdParams():
return $default(_that.id,_that.historyLength,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? historyLength,  Map<String, Object?>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _TaskIdParams() when $default != null:
return $default(_that.id,_that.historyLength,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskIdParams implements TaskIdParams {
  const _TaskIdParams({required this.id, this.historyLength,  Map<String, Object?>? metadata}): _metadata = metadata;
  factory _TaskIdParams.fromJson(Map<String, dynamic> json) => _$TaskIdParamsFromJson(json);

@override final  String id;
@override final  int? historyLength;
 final  Map<String, Object?>? _metadata;
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of TaskIdParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskIdParamsCopyWith<_TaskIdParams> get copyWith => __$TaskIdParamsCopyWithImpl<_TaskIdParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskIdParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskIdParams&&(identical(other.id, id) || other.id == id)&&(identical(other.historyLength, historyLength) || other.historyLength == historyLength)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,historyLength,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'TaskIdParams(id: $id, historyLength: $historyLength, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$TaskIdParamsCopyWith<$Res> implements $TaskIdParamsCopyWith<$Res> {
  factory _$TaskIdParamsCopyWith(_TaskIdParams value, $Res Function(_TaskIdParams) _then) = __$TaskIdParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, int? historyLength, Map<String, Object?>? metadata
});




}
/// @nodoc
class __$TaskIdParamsCopyWithImpl<$Res>
    implements _$TaskIdParamsCopyWith<$Res> {
  __$TaskIdParamsCopyWithImpl(this._self, this._then);

  final _TaskIdParams _self;
  final $Res Function(_TaskIdParams) _then;

/// Create a copy of TaskIdParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? historyLength = freezed,Object? metadata = freezed,}) {
  return _then(_TaskIdParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,historyLength: freezed == historyLength ? _self.historyLength : historyLength // ignore: cast_nullable_to_non_nullable
as int?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

// dart format on
