// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'down_payment_bounds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownPaymentBounds {

 Money get min; Money get max; Money get step;
/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownPaymentBoundsCopyWith<DownPaymentBounds> get copyWith => _$DownPaymentBoundsCopyWithImpl<DownPaymentBounds>(this as DownPaymentBounds, _$identity);

  /// Serializes this DownPaymentBounds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DownPaymentBounds;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownPaymentBounds&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max)&&(identical(other.step, _this.step) || other.step == _this.step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DownPaymentBounds;
  return Object.hash(runtimeType,_this.min,_this.max,_this.step);
}

@override
String toString() {
  final _this = this as DownPaymentBounds;
  return 'DownPaymentBounds(min: ${_this.min}, max: ${_this.max}, step: ${_this.step})';
}


}

/// @nodoc
abstract mixin class $DownPaymentBoundsCopyWith<$Res>  {
  factory $DownPaymentBoundsCopyWith(DownPaymentBounds value, $Res Function(DownPaymentBounds) _then) = _$DownPaymentBoundsCopyWithImpl;
@useResult
$Res call({
 Money min, Money max, Money step
});


$MoneyCopyWith<$Res> get min;$MoneyCopyWith<$Res> get max;$MoneyCopyWith<$Res> get step;

}
/// @nodoc
class _$DownPaymentBoundsCopyWithImpl<$Res>
    implements $DownPaymentBoundsCopyWith<$Res> {
  _$DownPaymentBoundsCopyWithImpl(this._self, this._then);

  final DownPaymentBounds _self;
  final $Res Function(DownPaymentBounds) _then;

/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,Object? step = null,}) {
  return _then(DownPaymentBounds(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as Money,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as Money,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get min {
  
  return $MoneyCopyWith<$Res>(_self.min, (value) {
    return _then(_self.copyWith(min: value));
  });
}/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get max {
  
  return $MoneyCopyWith<$Res>(_self.max, (value) {
    return _then(_self.copyWith(max: value));
  });
}/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get step {
  
  return $MoneyCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [DownPaymentBounds].
extension DownPaymentBoundsPatterns on DownPaymentBounds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownPaymentBounds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownPaymentBounds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownPaymentBounds value)  $default,){
final _that = this;
switch (_that) {
case _DownPaymentBounds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownPaymentBounds value)?  $default,){
final _that = this;
switch (_that) {
case _DownPaymentBounds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money min,  Money max,  Money step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownPaymentBounds() when $default != null:
return $default(_that.min,_that.max,_that.step);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money min,  Money max,  Money step)  $default,) {final _that = this;
switch (_that) {
case _DownPaymentBounds():
return $default(_that.min,_that.max,_that.step);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money min,  Money max,  Money step)?  $default,) {final _that = this;
switch (_that) {
case _DownPaymentBounds() when $default != null:
return $default(_that.min,_that.max,_that.step);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownPaymentBounds implements DownPaymentBounds {
  const _DownPaymentBounds({required this.min, required this.max, required this.step});
  factory _DownPaymentBounds.fromJson(Map<String, dynamic> json) => _$DownPaymentBoundsFromJson(json);

@override final  Money min;
@override final  Money max;
@override final  Money step;

/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownPaymentBoundsCopyWith<_DownPaymentBounds> get copyWith => __$DownPaymentBoundsCopyWithImpl<_DownPaymentBounds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownPaymentBoundsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownPaymentBounds&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.step, step) || other.step == step));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max,step);
}

@override
String toString() {
    return 'DownPaymentBounds(min: $min, max: $max, step: $step)';
}


}

/// @nodoc
abstract mixin class _$DownPaymentBoundsCopyWith<$Res> implements $DownPaymentBoundsCopyWith<$Res> {
  factory _$DownPaymentBoundsCopyWith(_DownPaymentBounds value, $Res Function(_DownPaymentBounds) _then) = __$DownPaymentBoundsCopyWithImpl;
@override @useResult
$Res call({
 Money min, Money max, Money step
});


@override $MoneyCopyWith<$Res> get min;@override $MoneyCopyWith<$Res> get max;@override $MoneyCopyWith<$Res> get step;

}
/// @nodoc
class __$DownPaymentBoundsCopyWithImpl<$Res>
    implements _$DownPaymentBoundsCopyWith<$Res> {
  __$DownPaymentBoundsCopyWithImpl(this._self, this._then);

  final _DownPaymentBounds _self;
  final $Res Function(_DownPaymentBounds) _then;

/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,Object? step = null,}) {
  return _then(_DownPaymentBounds(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as Money,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as Money,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get min {
  
  return $MoneyCopyWith<$Res>(_self.min, (value) {
    return _then(_self.copyWith(min: value));
  });
}/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get max {
  
  return $MoneyCopyWith<$Res>(_self.max, (value) {
    return _then(_self.copyWith(max: value));
  });
}/// Create a copy of DownPaymentBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get step {
  
  return $MoneyCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

// dart format on
