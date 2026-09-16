// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rounding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Rounding {

 RoundingMode get mode; int get step;
/// Create a copy of Rounding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundingCopyWith<Rounding> get copyWith => _$RoundingCopyWithImpl<Rounding>(this as Rounding, _$identity);

  /// Serializes this Rounding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Rounding;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rounding&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.step, _this.step) || other.step == _this.step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Rounding;
  return Object.hash(runtimeType,_this.mode,_this.step);
}

@override
String toString() {
  final _this = this as Rounding;
  return 'Rounding(mode: ${_this.mode}, step: ${_this.step})';
}


}

/// @nodoc
abstract mixin class $RoundingCopyWith<$Res>  {
  factory $RoundingCopyWith(Rounding value, $Res Function(Rounding) _then) = _$RoundingCopyWithImpl;
@useResult
$Res call({
 RoundingMode mode, int step
});




}
/// @nodoc
class _$RoundingCopyWithImpl<$Res>
    implements $RoundingCopyWith<$Res> {
  _$RoundingCopyWithImpl(this._self, this._then);

  final Rounding _self;
  final $Res Function(Rounding) _then;

/// Create a copy of Rounding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? step = null,}) {
  return _then(Rounding(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RoundingMode,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Rounding].
extension RoundingPatterns on Rounding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rounding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rounding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rounding value)  $default,){
final _that = this;
switch (_that) {
case _Rounding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rounding value)?  $default,){
final _that = this;
switch (_that) {
case _Rounding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoundingMode mode,  int step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rounding() when $default != null:
return $default(_that.mode,_that.step);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoundingMode mode,  int step)  $default,) {final _that = this;
switch (_that) {
case _Rounding():
return $default(_that.mode,_that.step);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoundingMode mode,  int step)?  $default,) {final _that = this;
switch (_that) {
case _Rounding() when $default != null:
return $default(_that.mode,_that.step);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Rounding extends Rounding {
  const _Rounding({required this.mode, this.step = 1}): assert(step > 0, 'step must be positive'),super._();
  factory _Rounding.fromJson(Map<String, dynamic> json) => _$RoundingFromJson(json);

@override final  RoundingMode mode;
@override@JsonKey() final  int step;

/// Create a copy of Rounding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundingCopyWith<_Rounding> get copyWith => __$RoundingCopyWithImpl<_Rounding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rounding&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mode,step);
}

@override
String toString() {
    return 'Rounding(mode: $mode, step: $step)';
}


}

/// @nodoc
abstract mixin class _$RoundingCopyWith<$Res> implements $RoundingCopyWith<$Res> {
  factory _$RoundingCopyWith(_Rounding value, $Res Function(_Rounding) _then) = __$RoundingCopyWithImpl;
@override @useResult
$Res call({
 RoundingMode mode, int step
});




}
/// @nodoc
class __$RoundingCopyWithImpl<$Res>
    implements _$RoundingCopyWith<$Res> {
  __$RoundingCopyWithImpl(this._self, this._then);

  final _Rounding _self;
  final $Res Function(_Rounding) _then;

/// Create a copy of Rounding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? step = null,}) {
  return _then(_Rounding(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RoundingMode,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
