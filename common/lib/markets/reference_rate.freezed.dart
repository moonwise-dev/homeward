// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferenceRate {

 String get id;@PercentJsonConverter() Rate get rate;@CalendarDateJsonConverter() CalendarDate get asOf; Source get source;
/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceRateCopyWith<ReferenceRate> get copyWith => _$ReferenceRateCopyWithImpl<ReferenceRate>(this as ReferenceRate, _$identity);

  /// Serializes this ReferenceRate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReferenceRate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceRate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.asOf, _this.asOf) || other.asOf == _this.asOf)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReferenceRate;
  return Object.hash(runtimeType,_this.id,_this.rate,_this.asOf,_this.source);
}

@override
String toString() {
  final _this = this as ReferenceRate;
  return 'ReferenceRate(id: ${_this.id}, rate: ${_this.rate}, asOf: ${_this.asOf}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $ReferenceRateCopyWith<$Res>  {
  factory $ReferenceRateCopyWith(ReferenceRate value, $Res Function(ReferenceRate) _then) = _$ReferenceRateCopyWithImpl;
@useResult
$Res call({
 String id,@PercentJsonConverter() Rate rate,@CalendarDateJsonConverter() CalendarDate asOf, Source source
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$ReferenceRateCopyWithImpl<$Res>
    implements $ReferenceRateCopyWith<$Res> {
  _$ReferenceRateCopyWithImpl(this._self, this._then);

  final ReferenceRate _self;
  final $Res Function(ReferenceRate) _then;

/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rate = null,Object? asOf = null,Object? source = null,}) {
  return _then(ReferenceRate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}
/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferenceRate].
extension ReferenceRatePatterns on ReferenceRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceRate value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceRate value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @PercentJsonConverter()  Rate rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceRate() when $default != null:
return $default(_that.id,_that.rate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @PercentJsonConverter()  Rate rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)  $default,) {final _that = this;
switch (_that) {
case _ReferenceRate():
return $default(_that.id,_that.rate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @PercentJsonConverter()  Rate rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceRate() when $default != null:
return $default(_that.id,_that.rate,_that.asOf,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceRate implements ReferenceRate {
  const _ReferenceRate({required this.id, @PercentJsonConverter() required this.rate, @CalendarDateJsonConverter() required this.asOf, required this.source});
  factory _ReferenceRate.fromJson(Map<String, dynamic> json) => _$ReferenceRateFromJson(json);

@override final  String id;
@override@PercentJsonConverter() final  Rate rate;
@override@CalendarDateJsonConverter() final  CalendarDate asOf;
@override final  Source source;

/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceRateCopyWith<_ReferenceRate> get copyWith => __$ReferenceRateCopyWithImpl<_ReferenceRate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceRateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceRate&&(identical(other.id, id) || other.id == id)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,rate,asOf,source);
}

@override
String toString() {
    return 'ReferenceRate(id: $id, rate: $rate, asOf: $asOf, source: $source)';
}


}

/// @nodoc
abstract mixin class _$ReferenceRateCopyWith<$Res> implements $ReferenceRateCopyWith<$Res> {
  factory _$ReferenceRateCopyWith(_ReferenceRate value, $Res Function(_ReferenceRate) _then) = __$ReferenceRateCopyWithImpl;
@override @useResult
$Res call({
 String id,@PercentJsonConverter() Rate rate,@CalendarDateJsonConverter() CalendarDate asOf, Source source
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$ReferenceRateCopyWithImpl<$Res>
    implements _$ReferenceRateCopyWith<$Res> {
  __$ReferenceRateCopyWithImpl(this._self, this._then);

  final _ReferenceRate _self;
  final $Res Function(_ReferenceRate) _then;

/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rate = null,Object? asOf = null,Object? source = null,}) {
  return _then(_ReferenceRate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}

/// Create a copy of ReferenceRate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
