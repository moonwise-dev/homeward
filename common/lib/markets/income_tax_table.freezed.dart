// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_tax_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeTaxTable {

 String get id;@CurrencyJsonConverter() Currency get currency; int get year; String get basis; List<TaxPoint> get points; List<TaxBand> get above; Source get source;
/// Create a copy of IncomeTaxTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeTaxTableCopyWith<IncomeTaxTable> get copyWith => _$IncomeTaxTableCopyWithImpl<IncomeTaxTable>(this as IncomeTaxTable, _$identity);

  /// Serializes this IncomeTaxTable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IncomeTaxTable;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeTaxTable&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.basis, _this.basis) || other.basis == _this.basis)&&const DeepCollectionEquality().equals(other.points, _this.points)&&const DeepCollectionEquality().equals(other.above, _this.above)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IncomeTaxTable;
  return Object.hash(runtimeType,_this.id,_this.currency,_this.year,_this.basis,const DeepCollectionEquality().hash(_this.points),const DeepCollectionEquality().hash(_this.above),_this.source);
}

@override
String toString() {
  final _this = this as IncomeTaxTable;
  return 'IncomeTaxTable(id: ${_this.id}, currency: ${_this.currency}, year: ${_this.year}, basis: ${_this.basis}, points: ${_this.points}, above: ${_this.above}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $IncomeTaxTableCopyWith<$Res>  {
  factory $IncomeTaxTableCopyWith(IncomeTaxTable value, $Res Function(IncomeTaxTable) _then) = _$IncomeTaxTableCopyWithImpl;
@useResult
$Res call({
 String id,@CurrencyJsonConverter() Currency currency, int year, String basis, List<TaxPoint> points, List<TaxBand> above, Source source
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$IncomeTaxTableCopyWithImpl<$Res>
    implements $IncomeTaxTableCopyWith<$Res> {
  _$IncomeTaxTableCopyWithImpl(this._self, this._then);

  final IncomeTaxTable _self;
  final $Res Function(IncomeTaxTable) _then;

/// Create a copy of IncomeTaxTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? currency = null,Object? year = null,Object? basis = null,Object? points = null,Object? above = null,Object? source = null,}) {
  return _then(IncomeTaxTable(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,basis: null == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<TaxPoint>,above: null == above ? _self.above : above // ignore: cast_nullable_to_non_nullable
as List<TaxBand>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}
/// Create a copy of IncomeTaxTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [IncomeTaxTable].
extension IncomeTaxTablePatterns on IncomeTaxTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeTaxTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeTaxTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeTaxTable value)  $default,){
final _that = this;
switch (_that) {
case _IncomeTaxTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeTaxTable value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeTaxTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  String basis,  List<TaxPoint> points,  List<TaxBand> above,  Source source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeTaxTable() when $default != null:
return $default(_that.id,_that.currency,_that.year,_that.basis,_that.points,_that.above,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  String basis,  List<TaxPoint> points,  List<TaxBand> above,  Source source)  $default,) {final _that = this;
switch (_that) {
case _IncomeTaxTable():
return $default(_that.id,_that.currency,_that.year,_that.basis,_that.points,_that.above,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  String basis,  List<TaxPoint> points,  List<TaxBand> above,  Source source)?  $default,) {final _that = this;
switch (_that) {
case _IncomeTaxTable() when $default != null:
return $default(_that.id,_that.currency,_that.year,_that.basis,_that.points,_that.above,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeTaxTable extends IncomeTaxTable {
  const _IncomeTaxTable({required this.id, @CurrencyJsonConverter() required this.currency, required this.year, required this.basis, required  List<TaxPoint> points, required  List<TaxBand> above, required this.source}): _points = points,_above = above,super._();
  factory _IncomeTaxTable.fromJson(Map<String, dynamic> json) => _$IncomeTaxTableFromJson(json);

@override final  String id;
@override@CurrencyJsonConverter() final  Currency currency;
@override final  int year;
@override final  String basis;
 final  List<TaxPoint> _points;
@override List<TaxPoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

 final  List<TaxBand> _above;
@override List<TaxBand> get above {
  if (_above is EqualUnmodifiableListView) return _above;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_above);
}

@override final  Source source;

/// Create a copy of IncomeTaxTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeTaxTableCopyWith<_IncomeTaxTable> get copyWith => __$IncomeTaxTableCopyWithImpl<_IncomeTaxTable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeTaxTableToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeTaxTable&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.year, year) || other.year == year)&&(identical(other.basis, basis) || other.basis == basis)&&const DeepCollectionEquality().equals(other.points, _points)&&const DeepCollectionEquality().equals(other.above, _above)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,currency,year,basis,const DeepCollectionEquality().hash(_points),const DeepCollectionEquality().hash(_above),source);
}

@override
String toString() {
    return 'IncomeTaxTable(id: $id, currency: $currency, year: $year, basis: $basis, points: $points, above: $above, source: $source)';
}


}

/// @nodoc
abstract mixin class _$IncomeTaxTableCopyWith<$Res> implements $IncomeTaxTableCopyWith<$Res> {
  factory _$IncomeTaxTableCopyWith(_IncomeTaxTable value, $Res Function(_IncomeTaxTable) _then) = __$IncomeTaxTableCopyWithImpl;
@override @useResult
$Res call({
 String id,@CurrencyJsonConverter() Currency currency, int year, String basis, List<TaxPoint> points, List<TaxBand> above, Source source
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$IncomeTaxTableCopyWithImpl<$Res>
    implements _$IncomeTaxTableCopyWith<$Res> {
  __$IncomeTaxTableCopyWithImpl(this._self, this._then);

  final _IncomeTaxTable _self;
  final $Res Function(_IncomeTaxTable) _then;

/// Create a copy of IncomeTaxTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? currency = null,Object? year = null,Object? basis = null,Object? points = null,Object? above = null,Object? source = null,}) {
  return _then(_IncomeTaxTable(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,basis: null == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<TaxPoint>,above: null == above ? _self._above : above // ignore: cast_nullable_to_non_nullable
as List<TaxBand>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}

/// Create a copy of IncomeTaxTable
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
mixin _$TaxPoint {

@ExactDecimalJsonConverter() ExactDecimal get monthlyPay;@ExactDecimalJsonConverter() ExactDecimal get tax;
/// Create a copy of TaxPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxPointCopyWith<TaxPoint> get copyWith => _$TaxPointCopyWithImpl<TaxPoint>(this as TaxPoint, _$identity);

  /// Serializes this TaxPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaxPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxPoint&&(identical(other.monthlyPay, _this.monthlyPay) || other.monthlyPay == _this.monthlyPay)&&(identical(other.tax, _this.tax) || other.tax == _this.tax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaxPoint;
  return Object.hash(runtimeType,_this.monthlyPay,_this.tax);
}

@override
String toString() {
  final _this = this as TaxPoint;
  return 'TaxPoint(monthlyPay: ${_this.monthlyPay}, tax: ${_this.tax})';
}


}

/// @nodoc
abstract mixin class $TaxPointCopyWith<$Res>  {
  factory $TaxPointCopyWith(TaxPoint value, $Res Function(TaxPoint) _then) = _$TaxPointCopyWithImpl;
@useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal monthlyPay,@ExactDecimalJsonConverter() ExactDecimal tax
});




}
/// @nodoc
class _$TaxPointCopyWithImpl<$Res>
    implements $TaxPointCopyWith<$Res> {
  _$TaxPointCopyWithImpl(this._self, this._then);

  final TaxPoint _self;
  final $Res Function(TaxPoint) _then;

/// Create a copy of TaxPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthlyPay = null,Object? tax = null,}) {
  return _then(TaxPoint(
monthlyPay: null == monthlyPay ? _self.monthlyPay : monthlyPay // ignore: cast_nullable_to_non_nullable
as ExactDecimal,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxPoint].
extension TaxPointPatterns on TaxPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxPoint value)  $default,){
final _that = this;
switch (_that) {
case _TaxPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxPoint value)?  $default,){
final _that = this;
switch (_that) {
case _TaxPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal monthlyPay, @ExactDecimalJsonConverter()  ExactDecimal tax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxPoint() when $default != null:
return $default(_that.monthlyPay,_that.tax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal monthlyPay, @ExactDecimalJsonConverter()  ExactDecimal tax)  $default,) {final _that = this;
switch (_that) {
case _TaxPoint():
return $default(_that.monthlyPay,_that.tax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ExactDecimalJsonConverter()  ExactDecimal monthlyPay, @ExactDecimalJsonConverter()  ExactDecimal tax)?  $default,) {final _that = this;
switch (_that) {
case _TaxPoint() when $default != null:
return $default(_that.monthlyPay,_that.tax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxPoint implements TaxPoint {
  const _TaxPoint({@ExactDecimalJsonConverter() required this.monthlyPay, @ExactDecimalJsonConverter() required this.tax});
  factory _TaxPoint.fromJson(Map<String, dynamic> json) => _$TaxPointFromJson(json);

@override@ExactDecimalJsonConverter() final  ExactDecimal monthlyPay;
@override@ExactDecimalJsonConverter() final  ExactDecimal tax;

/// Create a copy of TaxPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxPointCopyWith<_TaxPoint> get copyWith => __$TaxPointCopyWithImpl<_TaxPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxPoint&&(identical(other.monthlyPay, monthlyPay) || other.monthlyPay == monthlyPay)&&(identical(other.tax, tax) || other.tax == tax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,monthlyPay,tax);
}

@override
String toString() {
    return 'TaxPoint(monthlyPay: $monthlyPay, tax: $tax)';
}


}

/// @nodoc
abstract mixin class _$TaxPointCopyWith<$Res> implements $TaxPointCopyWith<$Res> {
  factory _$TaxPointCopyWith(_TaxPoint value, $Res Function(_TaxPoint) _then) = __$TaxPointCopyWithImpl;
@override @useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal monthlyPay,@ExactDecimalJsonConverter() ExactDecimal tax
});




}
/// @nodoc
class __$TaxPointCopyWithImpl<$Res>
    implements _$TaxPointCopyWith<$Res> {
  __$TaxPointCopyWithImpl(this._self, this._then);

  final _TaxPoint _self;
  final $Res Function(_TaxPoint) _then;

/// Create a copy of TaxPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthlyPay = null,Object? tax = null,}) {
  return _then(_TaxPoint(
monthlyPay: null == monthlyPay ? _self.monthlyPay : monthlyPay // ignore: cast_nullable_to_non_nullable
as ExactDecimal,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}


}


/// @nodoc
mixin _$TaxBand {

@ExactDecimalJsonConverter() ExactDecimal? get upTo;@PercentJsonConverter() Rate get rate;
/// Create a copy of TaxBand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxBandCopyWith<TaxBand> get copyWith => _$TaxBandCopyWithImpl<TaxBand>(this as TaxBand, _$identity);

  /// Serializes this TaxBand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaxBand;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxBand&&(identical(other.upTo, _this.upTo) || other.upTo == _this.upTo)&&(identical(other.rate, _this.rate) || other.rate == _this.rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaxBand;
  return Object.hash(runtimeType,_this.upTo,_this.rate);
}

@override
String toString() {
  final _this = this as TaxBand;
  return 'TaxBand(upTo: ${_this.upTo}, rate: ${_this.rate})';
}


}

/// @nodoc
abstract mixin class $TaxBandCopyWith<$Res>  {
  factory $TaxBandCopyWith(TaxBand value, $Res Function(TaxBand) _then) = _$TaxBandCopyWithImpl;
@useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal? upTo,@PercentJsonConverter() Rate rate
});




}
/// @nodoc
class _$TaxBandCopyWithImpl<$Res>
    implements $TaxBandCopyWith<$Res> {
  _$TaxBandCopyWithImpl(this._self, this._then);

  final TaxBand _self;
  final $Res Function(TaxBand) _then;

/// Create a copy of TaxBand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upTo = freezed,Object? rate = null,}) {
  return _then(TaxBand(
upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxBand].
extension TaxBandPatterns on TaxBand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxBand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxBand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxBand value)  $default,){
final _that = this;
switch (_that) {
case _TaxBand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxBand value)?  $default,){
final _that = this;
switch (_that) {
case _TaxBand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxBand() when $default != null:
return $default(_that.upTo,_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate)  $default,) {final _that = this;
switch (_that) {
case _TaxBand():
return $default(_that.upTo,_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate)?  $default,) {final _that = this;
switch (_that) {
case _TaxBand() when $default != null:
return $default(_that.upTo,_that.rate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxBand implements TaxBand {
  const _TaxBand({@ExactDecimalJsonConverter() this.upTo, @PercentJsonConverter() required this.rate});
  factory _TaxBand.fromJson(Map<String, dynamic> json) => _$TaxBandFromJson(json);

@override@ExactDecimalJsonConverter() final  ExactDecimal? upTo;
@override@PercentJsonConverter() final  Rate rate;

/// Create a copy of TaxBand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxBandCopyWith<_TaxBand> get copyWith => __$TaxBandCopyWithImpl<_TaxBand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxBandToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxBand&&(identical(other.upTo, upTo) || other.upTo == upTo)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,upTo,rate);
}

@override
String toString() {
    return 'TaxBand(upTo: $upTo, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$TaxBandCopyWith<$Res> implements $TaxBandCopyWith<$Res> {
  factory _$TaxBandCopyWith(_TaxBand value, $Res Function(_TaxBand) _then) = __$TaxBandCopyWithImpl;
@override @useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal? upTo,@PercentJsonConverter() Rate rate
});




}
/// @nodoc
class __$TaxBandCopyWithImpl<$Res>
    implements _$TaxBandCopyWith<$Res> {
  __$TaxBandCopyWithImpl(this._self, this._then);

  final _TaxBand _self;
  final $Res Function(_TaxBand) _then;

/// Create a copy of TaxBand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upTo = freezed,Object? rate = null,}) {
  return _then(_TaxBand(
upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}


}

// dart format on
