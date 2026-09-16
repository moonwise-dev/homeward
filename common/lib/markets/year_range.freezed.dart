// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'year_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YearRange {

 int? get min; int? get max;
/// Create a copy of YearRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YearRangeCopyWith<YearRange> get copyWith => _$YearRangeCopyWithImpl<YearRange>(this as YearRange, _$identity);

  /// Serializes this YearRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as YearRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearRange&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as YearRange;
  return Object.hash(runtimeType,_this.min,_this.max);
}

@override
String toString() {
  final _this = this as YearRange;
  return 'YearRange(min: ${_this.min}, max: ${_this.max})';
}


}

/// @nodoc
abstract mixin class $YearRangeCopyWith<$Res>  {
  factory $YearRangeCopyWith(YearRange value, $Res Function(YearRange) _then) = _$YearRangeCopyWithImpl;
@useResult
$Res call({
 int? min, int? max
});




}
/// @nodoc
class _$YearRangeCopyWithImpl<$Res>
    implements $YearRangeCopyWith<$Res> {
  _$YearRangeCopyWithImpl(this._self, this._then);

  final YearRange _self;
  final $Res Function(YearRange) _then;

/// Create a copy of YearRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = freezed,Object? max = freezed,}) {
  return _then(YearRange(
min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [YearRange].
extension YearRangePatterns on YearRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YearRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YearRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YearRange value)  $default,){
final _that = this;
switch (_that) {
case _YearRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YearRange value)?  $default,){
final _that = this;
switch (_that) {
case _YearRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? min,  int? max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YearRange() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? min,  int? max)  $default,) {final _that = this;
switch (_that) {
case _YearRange():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? min,  int? max)?  $default,) {final _that = this;
switch (_that) {
case _YearRange() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YearRange implements YearRange {
  const _YearRange({this.min, this.max});
  factory _YearRange.fromJson(Map<String, dynamic> json) => _$YearRangeFromJson(json);

@override final  int? min;
@override final  int? max;

/// Create a copy of YearRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YearRangeCopyWith<_YearRange> get copyWith => __$YearRangeCopyWithImpl<_YearRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YearRangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _YearRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max);
}

@override
String toString() {
    return 'YearRange(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$YearRangeCopyWith<$Res> implements $YearRangeCopyWith<$Res> {
  factory _$YearRangeCopyWith(_YearRange value, $Res Function(_YearRange) _then) = __$YearRangeCopyWithImpl;
@override @useResult
$Res call({
 int? min, int? max
});




}
/// @nodoc
class __$YearRangeCopyWithImpl<$Res>
    implements _$YearRangeCopyWith<$Res> {
  __$YearRangeCopyWithImpl(this._self, this._then);

  final _YearRange _self;
  final $Res Function(_YearRange) _then;

/// Create a copy of YearRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = freezed,Object? max = freezed,}) {
  return _then(_YearRange(
min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
