// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExchangeRate {

@CurrencyJsonConverter() Currency get from;@CurrencyJsonConverter() Currency get to;@ExactDecimalJsonConverter() ExactDecimal get rate;@CalendarDateJsonConverter() CalendarDate get asOf; Source get source;
/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRateCopyWith<ExchangeRate> get copyWith => _$ExchangeRateCopyWithImpl<ExchangeRate>(this as ExchangeRate, _$identity);

  /// Serializes this ExchangeRate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExchangeRate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRate&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.asOf, _this.asOf) || other.asOf == _this.asOf)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExchangeRate;
  return Object.hash(runtimeType,_this.from,_this.to,_this.rate,_this.asOf,_this.source);
}

@override
String toString() {
  final _this = this as ExchangeRate;
  return 'ExchangeRate(from: ${_this.from}, to: ${_this.to}, rate: ${_this.rate}, asOf: ${_this.asOf}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $ExchangeRateCopyWith<$Res>  {
  factory $ExchangeRateCopyWith(ExchangeRate value, $Res Function(ExchangeRate) _then) = _$ExchangeRateCopyWithImpl;
@useResult
$Res call({
@CurrencyJsonConverter() Currency from,@CurrencyJsonConverter() Currency to,@ExactDecimalJsonConverter() ExactDecimal rate,@CalendarDateJsonConverter() CalendarDate asOf, Source source
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$ExchangeRateCopyWithImpl<$Res>
    implements $ExchangeRateCopyWith<$Res> {
  _$ExchangeRateCopyWithImpl(this._self, this._then);

  final ExchangeRate _self;
  final $Res Function(ExchangeRate) _then;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? rate = null,Object? asOf = null,Object? source = null,}) {
  return _then(ExchangeRate(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Currency,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Currency,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as ExactDecimal,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}
/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExchangeRate].
extension ExchangeRatePatterns on ExchangeRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRate value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRate value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CurrencyJsonConverter()  Currency from, @CurrencyJsonConverter()  Currency to, @ExactDecimalJsonConverter()  ExactDecimal rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
return $default(_that.from,_that.to,_that.rate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CurrencyJsonConverter()  Currency from, @CurrencyJsonConverter()  Currency to, @ExactDecimalJsonConverter()  ExactDecimal rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRate():
return $default(_that.from,_that.to,_that.rate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CurrencyJsonConverter()  Currency from, @CurrencyJsonConverter()  Currency to, @ExactDecimalJsonConverter()  ExactDecimal rate, @CalendarDateJsonConverter()  CalendarDate asOf,  Source source)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
return $default(_that.from,_that.to,_that.rate,_that.asOf,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeRate extends ExchangeRate {
  const _ExchangeRate({@CurrencyJsonConverter() required this.from, @CurrencyJsonConverter() required this.to, @ExactDecimalJsonConverter() required this.rate, @CalendarDateJsonConverter() required this.asOf, required this.source}): super._();
  factory _ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

@override@CurrencyJsonConverter() final  Currency from;
@override@CurrencyJsonConverter() final  Currency to;
@override@ExactDecimalJsonConverter() final  ExactDecimal rate;
@override@CalendarDateJsonConverter() final  CalendarDate asOf;
@override final  Source source;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRateCopyWith<_ExchangeRate> get copyWith => __$ExchangeRateCopyWithImpl<_ExchangeRate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeRateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRate&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,from,to,rate,asOf,source);
}

@override
String toString() {
    return 'ExchangeRate(from: $from, to: $to, rate: $rate, asOf: $asOf, source: $source)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRateCopyWith<$Res> implements $ExchangeRateCopyWith<$Res> {
  factory _$ExchangeRateCopyWith(_ExchangeRate value, $Res Function(_ExchangeRate) _then) = __$ExchangeRateCopyWithImpl;
@override @useResult
$Res call({
@CurrencyJsonConverter() Currency from,@CurrencyJsonConverter() Currency to,@ExactDecimalJsonConverter() ExactDecimal rate,@CalendarDateJsonConverter() CalendarDate asOf, Source source
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$ExchangeRateCopyWithImpl<$Res>
    implements _$ExchangeRateCopyWith<$Res> {
  __$ExchangeRateCopyWithImpl(this._self, this._then);

  final _ExchangeRate _self;
  final $Res Function(_ExchangeRate) _then;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? rate = null,Object? asOf = null,Object? source = null,}) {
  return _then(_ExchangeRate(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Currency,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Currency,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as ExactDecimal,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc
mixin _$ExchangeRateTable {

@CurrencyJsonConverter() Currency get base;@CalendarDateJsonConverter() CalendarDate get asOf; Map<String, String> get rates; Source get source;
/// Create a copy of ExchangeRateTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRateTableCopyWith<ExchangeRateTable> get copyWith => _$ExchangeRateTableCopyWithImpl<ExchangeRateTable>(this as ExchangeRateTable, _$identity);

  /// Serializes this ExchangeRateTable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExchangeRateTable;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRateTable&&(identical(other.base, _this.base) || other.base == _this.base)&&(identical(other.asOf, _this.asOf) || other.asOf == _this.asOf)&&const DeepCollectionEquality().equals(other.rates, _this.rates)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExchangeRateTable;
  return Object.hash(runtimeType,_this.base,_this.asOf,const DeepCollectionEquality().hash(_this.rates),_this.source);
}

@override
String toString() {
  final _this = this as ExchangeRateTable;
  return 'ExchangeRateTable(base: ${_this.base}, asOf: ${_this.asOf}, rates: ${_this.rates}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $ExchangeRateTableCopyWith<$Res>  {
  factory $ExchangeRateTableCopyWith(ExchangeRateTable value, $Res Function(ExchangeRateTable) _then) = _$ExchangeRateTableCopyWithImpl;
@useResult
$Res call({
@CurrencyJsonConverter() Currency base,@CalendarDateJsonConverter() CalendarDate asOf, Map<String, String> rates, Source source
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$ExchangeRateTableCopyWithImpl<$Res>
    implements $ExchangeRateTableCopyWith<$Res> {
  _$ExchangeRateTableCopyWithImpl(this._self, this._then);

  final ExchangeRateTable _self;
  final $Res Function(ExchangeRateTable) _then;

/// Create a copy of ExchangeRateTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? asOf = null,Object? rates = null,Object? source = null,}) {
  return _then(ExchangeRateTable(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as Currency,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, String>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}
/// Create a copy of ExchangeRateTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExchangeRateTable].
extension ExchangeRateTablePatterns on ExchangeRateTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRateTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRateTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRateTable value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRateTable value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CurrencyJsonConverter()  Currency base, @CalendarDateJsonConverter()  CalendarDate asOf,  Map<String, String> rates,  Source source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRateTable() when $default != null:
return $default(_that.base,_that.asOf,_that.rates,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CurrencyJsonConverter()  Currency base, @CalendarDateJsonConverter()  CalendarDate asOf,  Map<String, String> rates,  Source source)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateTable():
return $default(_that.base,_that.asOf,_that.rates,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CurrencyJsonConverter()  Currency base, @CalendarDateJsonConverter()  CalendarDate asOf,  Map<String, String> rates,  Source source)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateTable() when $default != null:
return $default(_that.base,_that.asOf,_that.rates,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeRateTable extends ExchangeRateTable {
  const _ExchangeRateTable({@CurrencyJsonConverter() required this.base, @CalendarDateJsonConverter() required this.asOf, required  Map<String, String> rates, required this.source}): _rates = rates,super._();
  factory _ExchangeRateTable.fromJson(Map<String, dynamic> json) => _$ExchangeRateTableFromJson(json);

@override@CurrencyJsonConverter() final  Currency base;
@override@CalendarDateJsonConverter() final  CalendarDate asOf;
 final  Map<String, String> _rates;
@override Map<String, String> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}

@override final  Source source;

/// Create a copy of ExchangeRateTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRateTableCopyWith<_ExchangeRateTable> get copyWith => __$ExchangeRateTableCopyWithImpl<_ExchangeRateTable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeRateTableToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRateTable&&(identical(other.base, base) || other.base == base)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&const DeepCollectionEquality().equals(other.rates, _rates)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,base,asOf,const DeepCollectionEquality().hash(_rates),source);
}

@override
String toString() {
    return 'ExchangeRateTable(base: $base, asOf: $asOf, rates: $rates, source: $source)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRateTableCopyWith<$Res> implements $ExchangeRateTableCopyWith<$Res> {
  factory _$ExchangeRateTableCopyWith(_ExchangeRateTable value, $Res Function(_ExchangeRateTable) _then) = __$ExchangeRateTableCopyWithImpl;
@override @useResult
$Res call({
@CurrencyJsonConverter() Currency base,@CalendarDateJsonConverter() CalendarDate asOf, Map<String, String> rates, Source source
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$ExchangeRateTableCopyWithImpl<$Res>
    implements _$ExchangeRateTableCopyWith<$Res> {
  __$ExchangeRateTableCopyWithImpl(this._self, this._then);

  final _ExchangeRateTable _self;
  final $Res Function(_ExchangeRateTable) _then;

/// Create a copy of ExchangeRateTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? asOf = null,Object? rates = null,Object? source = null,}) {
  return _then(_ExchangeRateTable(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as Currency,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, String>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}

/// Create a copy of ExchangeRateTable
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
