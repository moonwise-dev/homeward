// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToolResult {

 Map<String, Object?> get modelResult; Map<String, Object?> get seeds;
/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResultCopyWith<ToolResult> get copyWith => _$ToolResultCopyWithImpl<ToolResult>(this as ToolResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ToolResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResult&&const DeepCollectionEquality().equals(other.modelResult, _this.modelResult)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds));
}


@override
int get hashCode {
  final _this = this as ToolResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.modelResult),const DeepCollectionEquality().hash(_this.seeds));
}

@override
String toString() {
  final _this = this as ToolResult;
  return 'ToolResult(modelResult: ${_this.modelResult}, seeds: ${_this.seeds})';
}


}

/// @nodoc
abstract mixin class $ToolResultCopyWith<$Res>  {
  factory $ToolResultCopyWith(ToolResult value, $Res Function(ToolResult) _then) = _$ToolResultCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> modelResult, Map<String, Object?> seeds
});




}
/// @nodoc
class _$ToolResultCopyWithImpl<$Res>
    implements $ToolResultCopyWith<$Res> {
  _$ToolResultCopyWithImpl(this._self, this._then);

  final ToolResult _self;
  final $Res Function(ToolResult) _then;

/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelResult = null,Object? seeds = null,}) {
  return _then(ToolResult(
modelResult: null == modelResult ? _self.modelResult : modelResult // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolResult].
extension ToolResultPatterns on ToolResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolResult value)  $default,){
final _that = this;
switch (_that) {
case _ToolResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolResult value)?  $default,){
final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Object?> modelResult,  Map<String, Object?> seeds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
return $default(_that.modelResult,_that.seeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Object?> modelResult,  Map<String, Object?> seeds)  $default,) {final _that = this;
switch (_that) {
case _ToolResult():
return $default(_that.modelResult,_that.seeds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Object?> modelResult,  Map<String, Object?> seeds)?  $default,) {final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
return $default(_that.modelResult,_that.seeds);case _:
  return null;

}
}

}

/// @nodoc


class _ToolResult implements ToolResult {
  const _ToolResult({required  Map<String, Object?> modelResult,  Map<String, Object?> seeds = const {}}): _modelResult = modelResult,_seeds = seeds;
  

 final  Map<String, Object?> _modelResult;
@override Map<String, Object?> get modelResult {
  if (_modelResult is EqualUnmodifiableMapView) return _modelResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_modelResult);
}

 final  Map<String, Object?> _seeds;
@override@JsonKey() Map<String, Object?> get seeds {
  if (_seeds is EqualUnmodifiableMapView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_seeds);
}


/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolResultCopyWith<_ToolResult> get copyWith => __$ToolResultCopyWithImpl<_ToolResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolResult&&const DeepCollectionEquality().equals(other.modelResult, _modelResult)&&const DeepCollectionEquality().equals(other.seeds, _seeds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_modelResult),const DeepCollectionEquality().hash(_seeds));
}

@override
String toString() {
    return 'ToolResult(modelResult: $modelResult, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class _$ToolResultCopyWith<$Res> implements $ToolResultCopyWith<$Res> {
  factory _$ToolResultCopyWith(_ToolResult value, $Res Function(_ToolResult) _then) = __$ToolResultCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Object?> modelResult, Map<String, Object?> seeds
});




}
/// @nodoc
class __$ToolResultCopyWithImpl<$Res>
    implements _$ToolResultCopyWith<$Res> {
  __$ToolResultCopyWithImpl(this._self, this._then);

  final _ToolResult _self;
  final $Res Function(_ToolResult) _then;

/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelResult = null,Object? seeds = null,}) {
  return _then(_ToolResult(
modelResult: null == modelResult ? _self._modelResult : modelResult // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
