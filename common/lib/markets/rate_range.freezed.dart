// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateRange {

@PercentJsonConverter() Rate get min;@PercentJsonConverter() Rate get max;
/// Create a copy of RateRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateRangeCopyWith<RateRange> get copyWith => _$RateRangeCopyWithImpl<RateRange>(this as RateRange, _$identity);

  /// Serializes this RateRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RateRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateRange&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RateRange;
  return Object.hash(runtimeType,_this.min,_this.max);
}

@override
String toString() {
  final _this = this as RateRange;
  return 'RateRange(min: ${_this.min}, max: ${_this.max})';
}


}

/// @nodoc
abstract mixin class $RateRangeCopyWith<$Res>  {
  factory $RateRangeCopyWith(RateRange value, $Res Function(RateRange) _then) = _$RateRangeCopyWithImpl;
@useResult
$Res call({
@PercentJsonConverter() Rate min,@PercentJsonConverter() Rate max
});




}
/// @nodoc
class _$RateRangeCopyWithImpl<$Res>
    implements $RateRangeCopyWith<$Res> {
  _$RateRangeCopyWithImpl(this._self, this._then);

  final RateRange _self;
  final $Res Function(RateRange) _then;

/// Create a copy of RateRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,}) {
  return _then(RateRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as Rate,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}

}


/// Adds pattern-matching-related methods to [RateRange].
extension RateRangePatterns on RateRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateRange value)  $default,){
final _that = this;
switch (_that) {
case _RateRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateRange value)?  $default,){
final _that = this;
switch (_that) {
case _RateRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@PercentJsonConverter()  Rate min, @PercentJsonConverter()  Rate max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateRange() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@PercentJsonConverter()  Rate min, @PercentJsonConverter()  Rate max)  $default,) {final _that = this;
switch (_that) {
case _RateRange():
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@PercentJsonConverter()  Rate min, @PercentJsonConverter()  Rate max)?  $default,) {final _that = this;
switch (_that) {
case _RateRange() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateRange implements RateRange {
  const _RateRange({@PercentJsonConverter() required this.min, @PercentJsonConverter() required this.max});
  factory _RateRange.fromJson(Map<String, dynamic> json) => _$RateRangeFromJson(json);

@override@PercentJsonConverter() final  Rate min;
@override@PercentJsonConverter() final  Rate max;

/// Create a copy of RateRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateRangeCopyWith<_RateRange> get copyWith => __$RateRangeCopyWithImpl<_RateRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateRangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max);
}

@override
String toString() {
    return 'RateRange(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$RateRangeCopyWith<$Res> implements $RateRangeCopyWith<$Res> {
  factory _$RateRangeCopyWith(_RateRange value, $Res Function(_RateRange) _then) = __$RateRangeCopyWithImpl;
@override @useResult
$Res call({
@PercentJsonConverter() Rate min,@PercentJsonConverter() Rate max
});




}
/// @nodoc
class __$RateRangeCopyWithImpl<$Res>
    implements _$RateRangeCopyWith<$Res> {
  __$RateRangeCopyWithImpl(this._self, this._then);

  final _RateRange _self;
  final $Res Function(_RateRange) _then;

/// Create a copy of RateRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,}) {
  return _then(_RateRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as Rate,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}


}

// dart format on
