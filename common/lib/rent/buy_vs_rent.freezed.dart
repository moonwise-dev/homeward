// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_vs_rent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuyRentYear {

 int get year; Money get buying; Money get renting; Money get equity;
/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyRentYearCopyWith<BuyRentYear> get copyWith => _$BuyRentYearCopyWithImpl<BuyRentYear>(this as BuyRentYear, _$identity);

  /// Serializes this BuyRentYear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuyRentYear;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyRentYear&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.buying, _this.buying) || other.buying == _this.buying)&&(identical(other.renting, _this.renting) || other.renting == _this.renting)&&(identical(other.equity, _this.equity) || other.equity == _this.equity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuyRentYear;
  return Object.hash(runtimeType,_this.year,_this.buying,_this.renting,_this.equity);
}

@override
String toString() {
  final _this = this as BuyRentYear;
  return 'BuyRentYear(year: ${_this.year}, buying: ${_this.buying}, renting: ${_this.renting}, equity: ${_this.equity})';
}


}

/// @nodoc
abstract mixin class $BuyRentYearCopyWith<$Res>  {
  factory $BuyRentYearCopyWith(BuyRentYear value, $Res Function(BuyRentYear) _then) = _$BuyRentYearCopyWithImpl;
@useResult
$Res call({
 int year, Money buying, Money renting, Money equity
});


$MoneyCopyWith<$Res> get buying;$MoneyCopyWith<$Res> get renting;$MoneyCopyWith<$Res> get equity;

}
/// @nodoc
class _$BuyRentYearCopyWithImpl<$Res>
    implements $BuyRentYearCopyWith<$Res> {
  _$BuyRentYearCopyWithImpl(this._self, this._then);

  final BuyRentYear _self;
  final $Res Function(BuyRentYear) _then;

/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? buying = null,Object? renting = null,Object? equity = null,}) {
  return _then(BuyRentYear(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,buying: null == buying ? _self.buying : buying // ignore: cast_nullable_to_non_nullable
as Money,renting: null == renting ? _self.renting : renting // ignore: cast_nullable_to_non_nullable
as Money,equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get buying {
  
  return $MoneyCopyWith<$Res>(_self.buying, (value) {
    return _then(_self.copyWith(buying: value));
  });
}/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get renting {
  
  return $MoneyCopyWith<$Res>(_self.renting, (value) {
    return _then(_self.copyWith(renting: value));
  });
}/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get equity {
  
  return $MoneyCopyWith<$Res>(_self.equity, (value) {
    return _then(_self.copyWith(equity: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuyRentYear].
extension BuyRentYearPatterns on BuyRentYear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyRentYear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyRentYear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyRentYear value)  $default,){
final _that = this;
switch (_that) {
case _BuyRentYear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyRentYear value)?  $default,){
final _that = this;
switch (_that) {
case _BuyRentYear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  Money buying,  Money renting,  Money equity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyRentYear() when $default != null:
return $default(_that.year,_that.buying,_that.renting,_that.equity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  Money buying,  Money renting,  Money equity)  $default,) {final _that = this;
switch (_that) {
case _BuyRentYear():
return $default(_that.year,_that.buying,_that.renting,_that.equity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  Money buying,  Money renting,  Money equity)?  $default,) {final _that = this;
switch (_that) {
case _BuyRentYear() when $default != null:
return $default(_that.year,_that.buying,_that.renting,_that.equity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyRentYear implements BuyRentYear {
  const _BuyRentYear({required this.year, required this.buying, required this.renting, required this.equity});
  factory _BuyRentYear.fromJson(Map<String, dynamic> json) => _$BuyRentYearFromJson(json);

@override final  int year;
@override final  Money buying;
@override final  Money renting;
@override final  Money equity;

/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyRentYearCopyWith<_BuyRentYear> get copyWith => __$BuyRentYearCopyWithImpl<_BuyRentYear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyRentYearToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyRentYear&&(identical(other.year, year) || other.year == year)&&(identical(other.buying, buying) || other.buying == buying)&&(identical(other.renting, renting) || other.renting == renting)&&(identical(other.equity, equity) || other.equity == equity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,year,buying,renting,equity);
}

@override
String toString() {
    return 'BuyRentYear(year: $year, buying: $buying, renting: $renting, equity: $equity)';
}


}

/// @nodoc
abstract mixin class _$BuyRentYearCopyWith<$Res> implements $BuyRentYearCopyWith<$Res> {
  factory _$BuyRentYearCopyWith(_BuyRentYear value, $Res Function(_BuyRentYear) _then) = __$BuyRentYearCopyWithImpl;
@override @useResult
$Res call({
 int year, Money buying, Money renting, Money equity
});


@override $MoneyCopyWith<$Res> get buying;@override $MoneyCopyWith<$Res> get renting;@override $MoneyCopyWith<$Res> get equity;

}
/// @nodoc
class __$BuyRentYearCopyWithImpl<$Res>
    implements _$BuyRentYearCopyWith<$Res> {
  __$BuyRentYearCopyWithImpl(this._self, this._then);

  final _BuyRentYear _self;
  final $Res Function(_BuyRentYear) _then;

/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? buying = null,Object? renting = null,Object? equity = null,}) {
  return _then(_BuyRentYear(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,buying: null == buying ? _self.buying : buying // ignore: cast_nullable_to_non_nullable
as Money,renting: null == renting ? _self.renting : renting // ignore: cast_nullable_to_non_nullable
as Money,equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get buying {
  
  return $MoneyCopyWith<$Res>(_self.buying, (value) {
    return _then(_self.copyWith(buying: value));
  });
}/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get renting {
  
  return $MoneyCopyWith<$Res>(_self.renting, (value) {
    return _then(_self.copyWith(renting: value));
  });
}/// Create a copy of BuyRentYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get equity {
  
  return $MoneyCopyWith<$Res>(_self.equity, (value) {
    return _then(_self.copyWith(equity: value));
  });
}
}


/// @nodoc
mixin _$BuyVsRentSlice {

 String get marketName; bool get sample; String? get homeId; String? get homeName; Money get price; Money get downPayment; Money get loan;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate; String get loanType; Money get purchaseCosts; Money? get fee; bool get deducts; RentFigure get rent; int get years; bool get yearsAssumed; List<BuyRentYear> get points; int? get breakEvenYear;
/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyVsRentSliceCopyWith<BuyVsRentSlice> get copyWith => _$BuyVsRentSliceCopyWithImpl<BuyVsRentSlice>(this as BuyVsRentSlice, _$identity);

  /// Serializes this BuyVsRentSlice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuyVsRentSlice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyVsRentSlice&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.sample, _this.sample) || other.sample == _this.sample)&&(identical(other.homeId, _this.homeId) || other.homeId == _this.homeId)&&(identical(other.homeName, _this.homeName) || other.homeName == _this.homeName)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.loanType, _this.loanType) || other.loanType == _this.loanType)&&(identical(other.purchaseCosts, _this.purchaseCosts) || other.purchaseCosts == _this.purchaseCosts)&&(identical(other.fee, _this.fee) || other.fee == _this.fee)&&(identical(other.deducts, _this.deducts) || other.deducts == _this.deducts)&&(identical(other.rent, _this.rent) || other.rent == _this.rent)&&(identical(other.years, _this.years) || other.years == _this.years)&&(identical(other.yearsAssumed, _this.yearsAssumed) || other.yearsAssumed == _this.yearsAssumed)&&const DeepCollectionEquality().equals(other.points, _this.points)&&(identical(other.breakEvenYear, _this.breakEvenYear) || other.breakEvenYear == _this.breakEvenYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuyVsRentSlice;
  return Object.hash(runtimeType,_this.marketName,_this.sample,_this.homeId,_this.homeName,_this.price,_this.downPayment,_this.loan,_this.annualRate,_this.loanType,_this.purchaseCosts,_this.fee,_this.deducts,_this.rent,_this.years,_this.yearsAssumed,const DeepCollectionEquality().hash(_this.points),_this.breakEvenYear);
}

@override
String toString() {
  final _this = this as BuyVsRentSlice;
  return 'BuyVsRentSlice(marketName: ${_this.marketName}, sample: ${_this.sample}, homeId: ${_this.homeId}, homeName: ${_this.homeName}, price: ${_this.price}, downPayment: ${_this.downPayment}, loan: ${_this.loan}, annualRate: ${_this.annualRate}, loanType: ${_this.loanType}, purchaseCosts: ${_this.purchaseCosts}, fee: ${_this.fee}, deducts: ${_this.deducts}, rent: ${_this.rent}, years: ${_this.years}, yearsAssumed: ${_this.yearsAssumed}, points: ${_this.points}, breakEvenYear: ${_this.breakEvenYear})';
}


}

/// @nodoc
abstract mixin class $BuyVsRentSliceCopyWith<$Res>  {
  factory $BuyVsRentSliceCopyWith(BuyVsRentSlice value, $Res Function(BuyVsRentSlice) _then) = _$BuyVsRentSliceCopyWithImpl;
@useResult
$Res call({
 String marketName, bool sample, String? homeId, String? homeName, Money price, Money downPayment, Money loan,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, String loanType, Money purchaseCosts, Money? fee, bool deducts, RentFigure rent, int years, bool yearsAssumed, List<BuyRentYear> points, int? breakEvenYear
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res> get loan;$MoneyCopyWith<$Res> get purchaseCosts;$MoneyCopyWith<$Res>? get fee;$RentFigureCopyWith<$Res> get rent;

}
/// @nodoc
class _$BuyVsRentSliceCopyWithImpl<$Res>
    implements $BuyVsRentSliceCopyWith<$Res> {
  _$BuyVsRentSliceCopyWithImpl(this._self, this._then);

  final BuyVsRentSlice _self;
  final $Res Function(BuyVsRentSlice) _then;

/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketName = null,Object? sample = null,Object? homeId = freezed,Object? homeName = freezed,Object? price = null,Object? downPayment = null,Object? loan = null,Object? annualRate = null,Object? loanType = null,Object? purchaseCosts = null,Object? fee = freezed,Object? deducts = null,Object? rent = null,Object? years = null,Object? yearsAssumed = null,Object? points = null,Object? breakEvenYear = freezed,}) {
  return _then(BuyVsRentSlice(
marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as Money,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,deducts: null == deducts ? _self.deducts : deducts // ignore: cast_nullable_to_non_nullable
as bool,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as int,yearsAssumed: null == yearsAssumed ? _self.yearsAssumed : yearsAssumed // ignore: cast_nullable_to_non_nullable
as bool,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<BuyRentYear>,breakEvenYear: freezed == breakEvenYear ? _self.breakEvenYear : breakEvenYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get purchaseCosts {
  
  return $MoneyCopyWith<$Res>(_self.purchaseCosts, (value) {
    return _then(_self.copyWith(purchaseCosts: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fee {
    if (_self.fee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fee!, (value) {
    return _then(_self.copyWith(fee: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res> get rent {
  
  return $RentFigureCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuyVsRentSlice].
extension BuyVsRentSlicePatterns on BuyVsRentSlice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyVsRentSlice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyVsRentSlice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyVsRentSlice value)  $default,){
final _that = this;
switch (_that) {
case _BuyVsRentSlice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyVsRentSlice value)?  $default,){
final _that = this;
switch (_that) {
case _BuyVsRentSlice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  Money loan, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  Money purchaseCosts,  Money? fee,  bool deducts,  RentFigure rent,  int years,  bool yearsAssumed,  List<BuyRentYear> points,  int? breakEvenYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyVsRentSlice() when $default != null:
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.loan,_that.annualRate,_that.loanType,_that.purchaseCosts,_that.fee,_that.deducts,_that.rent,_that.years,_that.yearsAssumed,_that.points,_that.breakEvenYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  Money loan, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  Money purchaseCosts,  Money? fee,  bool deducts,  RentFigure rent,  int years,  bool yearsAssumed,  List<BuyRentYear> points,  int? breakEvenYear)  $default,) {final _that = this;
switch (_that) {
case _BuyVsRentSlice():
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.loan,_that.annualRate,_that.loanType,_that.purchaseCosts,_that.fee,_that.deducts,_that.rent,_that.years,_that.yearsAssumed,_that.points,_that.breakEvenYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  Money loan, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  Money purchaseCosts,  Money? fee,  bool deducts,  RentFigure rent,  int years,  bool yearsAssumed,  List<BuyRentYear> points,  int? breakEvenYear)?  $default,) {final _that = this;
switch (_that) {
case _BuyVsRentSlice() when $default != null:
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.loan,_that.annualRate,_that.loanType,_that.purchaseCosts,_that.fee,_that.deducts,_that.rent,_that.years,_that.yearsAssumed,_that.points,_that.breakEvenYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyVsRentSlice extends BuyVsRentSlice {
  const _BuyVsRentSlice({required this.marketName, this.sample = true, this.homeId, this.homeName, required this.price, required this.downPayment, required this.loan, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, required this.loanType, required this.purchaseCosts, this.fee, required this.deducts, required this.rent, required this.years, this.yearsAssumed = false, required  List<BuyRentYear> points, this.breakEvenYear}): _points = points,super._();
  factory _BuyVsRentSlice.fromJson(Map<String, dynamic> json) => _$BuyVsRentSliceFromJson(json);

@override final  String marketName;
@override@JsonKey() final  bool sample;
@override final  String? homeId;
@override final  String? homeName;
@override final  Money price;
@override final  Money downPayment;
@override final  Money loan;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override final  String loanType;
@override final  Money purchaseCosts;
@override final  Money? fee;
@override final  bool deducts;
@override final  RentFigure rent;
@override final  int years;
@override@JsonKey() final  bool yearsAssumed;
 final  List<BuyRentYear> _points;
@override List<BuyRentYear> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  int? breakEvenYear;

/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyVsRentSliceCopyWith<_BuyVsRentSlice> get copyWith => __$BuyVsRentSliceCopyWithImpl<_BuyVsRentSlice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyVsRentSliceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyVsRentSlice&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.homeName, homeName) || other.homeName == homeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.loanType, loanType) || other.loanType == loanType)&&(identical(other.purchaseCosts, purchaseCosts) || other.purchaseCosts == purchaseCosts)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.deducts, deducts) || other.deducts == deducts)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.years, years) || other.years == years)&&(identical(other.yearsAssumed, yearsAssumed) || other.yearsAssumed == yearsAssumed)&&const DeepCollectionEquality().equals(other.points, _points)&&(identical(other.breakEvenYear, breakEvenYear) || other.breakEvenYear == breakEvenYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,marketName,sample,homeId,homeName,price,downPayment,loan,annualRate,loanType,purchaseCosts,fee,deducts,rent,years,yearsAssumed,const DeepCollectionEquality().hash(_points),breakEvenYear);
}

@override
String toString() {
    return 'BuyVsRentSlice(marketName: $marketName, sample: $sample, homeId: $homeId, homeName: $homeName, price: $price, downPayment: $downPayment, loan: $loan, annualRate: $annualRate, loanType: $loanType, purchaseCosts: $purchaseCosts, fee: $fee, deducts: $deducts, rent: $rent, years: $years, yearsAssumed: $yearsAssumed, points: $points, breakEvenYear: $breakEvenYear)';
}


}

/// @nodoc
abstract mixin class _$BuyVsRentSliceCopyWith<$Res> implements $BuyVsRentSliceCopyWith<$Res> {
  factory _$BuyVsRentSliceCopyWith(_BuyVsRentSlice value, $Res Function(_BuyVsRentSlice) _then) = __$BuyVsRentSliceCopyWithImpl;
@override @useResult
$Res call({
 String marketName, bool sample, String? homeId, String? homeName, Money price, Money downPayment, Money loan,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, String loanType, Money purchaseCosts, Money? fee, bool deducts, RentFigure rent, int years, bool yearsAssumed, List<BuyRentYear> points, int? breakEvenYear
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res> get loan;@override $MoneyCopyWith<$Res> get purchaseCosts;@override $MoneyCopyWith<$Res>? get fee;@override $RentFigureCopyWith<$Res> get rent;

}
/// @nodoc
class __$BuyVsRentSliceCopyWithImpl<$Res>
    implements _$BuyVsRentSliceCopyWith<$Res> {
  __$BuyVsRentSliceCopyWithImpl(this._self, this._then);

  final _BuyVsRentSlice _self;
  final $Res Function(_BuyVsRentSlice) _then;

/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketName = null,Object? sample = null,Object? homeId = freezed,Object? homeName = freezed,Object? price = null,Object? downPayment = null,Object? loan = null,Object? annualRate = null,Object? loanType = null,Object? purchaseCosts = null,Object? fee = freezed,Object? deducts = null,Object? rent = null,Object? years = null,Object? yearsAssumed = null,Object? points = null,Object? breakEvenYear = freezed,}) {
  return _then(_BuyVsRentSlice(
marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as Money,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,deducts: null == deducts ? _self.deducts : deducts // ignore: cast_nullable_to_non_nullable
as bool,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as int,yearsAssumed: null == yearsAssumed ? _self.yearsAssumed : yearsAssumed // ignore: cast_nullable_to_non_nullable
as bool,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<BuyRentYear>,breakEvenYear: freezed == breakEvenYear ? _self.breakEvenYear : breakEvenYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get purchaseCosts {
  
  return $MoneyCopyWith<$Res>(_self.purchaseCosts, (value) {
    return _then(_self.copyWith(purchaseCosts: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fee {
    if (_self.fee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fee!, (value) {
    return _then(_self.copyWith(fee: value));
  });
}/// Create a copy of BuyVsRentSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res> get rent {
  
  return $RentFigureCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}
}

// dart format on
