// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affordability_slice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AffordabilitySlice {

 String get marketId; String get marketName; bool get sample; Money get price; Money? get maxPrice; Money get loan; Money get maxLoan; Money get downPayment; Money? get cashNeeded; Money? get savings;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate; int get termYears; String get loanType; MonthlyFigures get monthly; RuleCheck? get binding; List<RuleCheck> get checks; List<ExchangeRate> get exchangeRates;
/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AffordabilitySliceCopyWith<AffordabilitySlice> get copyWith => _$AffordabilitySliceCopyWithImpl<AffordabilitySlice>(this as AffordabilitySlice, _$identity);

  /// Serializes this AffordabilitySlice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AffordabilitySlice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AffordabilitySlice&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.sample, _this.sample) || other.sample == _this.sample)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.maxPrice, _this.maxPrice) || other.maxPrice == _this.maxPrice)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.maxLoan, _this.maxLoan) || other.maxLoan == _this.maxLoan)&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.cashNeeded, _this.cashNeeded) || other.cashNeeded == _this.cashNeeded)&&(identical(other.savings, _this.savings) || other.savings == _this.savings)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.termYears, _this.termYears) || other.termYears == _this.termYears)&&(identical(other.loanType, _this.loanType) || other.loanType == _this.loanType)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.binding, _this.binding) || other.binding == _this.binding)&&const DeepCollectionEquality().equals(other.checks, _this.checks)&&const DeepCollectionEquality().equals(other.exchangeRates, _this.exchangeRates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AffordabilitySlice;
  return Object.hash(runtimeType,_this.marketId,_this.marketName,_this.sample,_this.price,_this.maxPrice,_this.loan,_this.maxLoan,_this.downPayment,_this.cashNeeded,_this.savings,_this.annualRate,_this.termYears,_this.loanType,_this.monthly,_this.binding,const DeepCollectionEquality().hash(_this.checks),const DeepCollectionEquality().hash(_this.exchangeRates));
}

@override
String toString() {
  final _this = this as AffordabilitySlice;
  return 'AffordabilitySlice(marketId: ${_this.marketId}, marketName: ${_this.marketName}, sample: ${_this.sample}, price: ${_this.price}, maxPrice: ${_this.maxPrice}, loan: ${_this.loan}, maxLoan: ${_this.maxLoan}, downPayment: ${_this.downPayment}, cashNeeded: ${_this.cashNeeded}, savings: ${_this.savings}, annualRate: ${_this.annualRate}, termYears: ${_this.termYears}, loanType: ${_this.loanType}, monthly: ${_this.monthly}, binding: ${_this.binding}, checks: ${_this.checks}, exchangeRates: ${_this.exchangeRates})';
}


}

/// @nodoc
abstract mixin class $AffordabilitySliceCopyWith<$Res>  {
  factory $AffordabilitySliceCopyWith(AffordabilitySlice value, $Res Function(AffordabilitySlice) _then) = _$AffordabilitySliceCopyWithImpl;
@useResult
$Res call({
 String marketId, String marketName, bool sample, Money price, Money? maxPrice, Money loan, Money maxLoan, Money downPayment, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, int termYears, String loanType, MonthlyFigures monthly, RuleCheck? binding, List<RuleCheck> checks, List<ExchangeRate> exchangeRates
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get maxPrice;$MoneyCopyWith<$Res> get loan;$MoneyCopyWith<$Res> get maxLoan;$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res>? get cashNeeded;$MoneyCopyWith<$Res>? get savings;$MonthlyFiguresCopyWith<$Res> get monthly;$RuleCheckCopyWith<$Res>? get binding;

}
/// @nodoc
class _$AffordabilitySliceCopyWithImpl<$Res>
    implements $AffordabilitySliceCopyWith<$Res> {
  _$AffordabilitySliceCopyWithImpl(this._self, this._then);

  final AffordabilitySlice _self;
  final $Res Function(AffordabilitySlice) _then;

/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketId = null,Object? marketName = null,Object? sample = null,Object? price = null,Object? maxPrice = freezed,Object? loan = null,Object? maxLoan = null,Object? downPayment = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? termYears = null,Object? loanType = null,Object? monthly = null,Object? binding = freezed,Object? checks = null,Object? exchangeRates = null,}) {
  return _then(AffordabilitySlice(
marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money?,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as RuleCheck?,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as List<RuleCheck>,exchangeRates: null == exchangeRates ? _self.exchangeRates : exchangeRates // ignore: cast_nullable_to_non_nullable
as List<ExchangeRate>,
  ));
}
/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get maxPrice {
    if (_self.maxPrice == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.maxPrice!, (value) {
    return _then(_self.copyWith(maxPrice: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get cashNeeded {
    if (_self.cashNeeded == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.cashNeeded!, (value) {
    return _then(_self.copyWith(cashNeeded: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RuleCheckCopyWith<$Res>? get binding {
    if (_self.binding == null) {
    return null;
  }

  return $RuleCheckCopyWith<$Res>(_self.binding!, (value) {
    return _then(_self.copyWith(binding: value));
  });
}
}


/// Adds pattern-matching-related methods to [AffordabilitySlice].
extension AffordabilitySlicePatterns on AffordabilitySlice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AffordabilitySlice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AffordabilitySlice value)  $default,){
final _that = this;
switch (_that) {
case _AffordabilitySlice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AffordabilitySlice value)?  $default,){
final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.monthly,_that.binding,_that.checks,_that.exchangeRates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates)  $default,) {final _that = this;
switch (_that) {
case _AffordabilitySlice():
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.monthly,_that.binding,_that.checks,_that.exchangeRates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates)?  $default,) {final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.monthly,_that.binding,_that.checks,_that.exchangeRates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AffordabilitySlice implements AffordabilitySlice {
  const _AffordabilitySlice({required this.marketId, required this.marketName, this.sample = true, required this.price, this.maxPrice, required this.loan, required this.maxLoan, required this.downPayment, this.cashNeeded, this.savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, required this.termYears, required this.loanType, required this.monthly, this.binding, required  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates = const []}): _checks = checks,_exchangeRates = exchangeRates;
  factory _AffordabilitySlice.fromJson(Map<String, dynamic> json) => _$AffordabilitySliceFromJson(json);

@override final  String marketId;
@override final  String marketName;
@override@JsonKey() final  bool sample;
@override final  Money price;
@override final  Money? maxPrice;
@override final  Money loan;
@override final  Money maxLoan;
@override final  Money downPayment;
@override final  Money? cashNeeded;
@override final  Money? savings;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override final  int termYears;
@override final  String loanType;
@override final  MonthlyFigures monthly;
@override final  RuleCheck? binding;
 final  List<RuleCheck> _checks;
@override List<RuleCheck> get checks {
  if (_checks is EqualUnmodifiableListView) return _checks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checks);
}

 final  List<ExchangeRate> _exchangeRates;
@override@JsonKey() List<ExchangeRate> get exchangeRates {
  if (_exchangeRates is EqualUnmodifiableListView) return _exchangeRates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exchangeRates);
}


/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AffordabilitySliceCopyWith<_AffordabilitySlice> get copyWith => __$AffordabilitySliceCopyWithImpl<_AffordabilitySlice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AffordabilitySliceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AffordabilitySlice&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.price, price) || other.price == price)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.termYears, termYears) || other.termYears == termYears)&&(identical(other.loanType, loanType) || other.loanType == loanType)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.binding, binding) || other.binding == binding)&&const DeepCollectionEquality().equals(other.checks, _checks)&&const DeepCollectionEquality().equals(other.exchangeRates, _exchangeRates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,marketId,marketName,sample,price,maxPrice,loan,maxLoan,downPayment,cashNeeded,savings,annualRate,termYears,loanType,monthly,binding,const DeepCollectionEquality().hash(_checks),const DeepCollectionEquality().hash(_exchangeRates));
}

@override
String toString() {
    return 'AffordabilitySlice(marketId: $marketId, marketName: $marketName, sample: $sample, price: $price, maxPrice: $maxPrice, loan: $loan, maxLoan: $maxLoan, downPayment: $downPayment, cashNeeded: $cashNeeded, savings: $savings, annualRate: $annualRate, termYears: $termYears, loanType: $loanType, monthly: $monthly, binding: $binding, checks: $checks, exchangeRates: $exchangeRates)';
}


}

/// @nodoc
abstract mixin class _$AffordabilitySliceCopyWith<$Res> implements $AffordabilitySliceCopyWith<$Res> {
  factory _$AffordabilitySliceCopyWith(_AffordabilitySlice value, $Res Function(_AffordabilitySlice) _then) = __$AffordabilitySliceCopyWithImpl;
@override @useResult
$Res call({
 String marketId, String marketName, bool sample, Money price, Money? maxPrice, Money loan, Money maxLoan, Money downPayment, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, int termYears, String loanType, MonthlyFigures monthly, RuleCheck? binding, List<RuleCheck> checks, List<ExchangeRate> exchangeRates
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get maxPrice;@override $MoneyCopyWith<$Res> get loan;@override $MoneyCopyWith<$Res> get maxLoan;@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res>? get cashNeeded;@override $MoneyCopyWith<$Res>? get savings;@override $MonthlyFiguresCopyWith<$Res> get monthly;@override $RuleCheckCopyWith<$Res>? get binding;

}
/// @nodoc
class __$AffordabilitySliceCopyWithImpl<$Res>
    implements _$AffordabilitySliceCopyWith<$Res> {
  __$AffordabilitySliceCopyWithImpl(this._self, this._then);

  final _AffordabilitySlice _self;
  final $Res Function(_AffordabilitySlice) _then;

/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketId = null,Object? marketName = null,Object? sample = null,Object? price = null,Object? maxPrice = freezed,Object? loan = null,Object? maxLoan = null,Object? downPayment = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? termYears = null,Object? loanType = null,Object? monthly = null,Object? binding = freezed,Object? checks = null,Object? exchangeRates = null,}) {
  return _then(_AffordabilitySlice(
marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money?,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as RuleCheck?,checks: null == checks ? _self._checks : checks // ignore: cast_nullable_to_non_nullable
as List<RuleCheck>,exchangeRates: null == exchangeRates ? _self._exchangeRates : exchangeRates // ignore: cast_nullable_to_non_nullable
as List<ExchangeRate>,
  ));
}

/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get maxPrice {
    if (_self.maxPrice == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.maxPrice!, (value) {
    return _then(_self.copyWith(maxPrice: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get cashNeeded {
    if (_self.cashNeeded == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.cashNeeded!, (value) {
    return _then(_self.copyWith(cashNeeded: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RuleCheckCopyWith<$Res>? get binding {
    if (_self.binding == null) {
    return null;
  }

  return $RuleCheckCopyWith<$Res>(_self.binding!, (value) {
    return _then(_self.copyWith(binding: value));
  });
}
}


/// @nodoc
mixin _$MonthlyFigures {

 Money get interest; Money get amortization; Money get total; Money? get afterDeduction;
/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<MonthlyFigures> get copyWith => _$MonthlyFiguresCopyWithImpl<MonthlyFigures>(this as MonthlyFigures, _$identity);

  /// Serializes this MonthlyFigures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MonthlyFigures;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyFigures&&(identical(other.interest, _this.interest) || other.interest == _this.interest)&&(identical(other.amortization, _this.amortization) || other.amortization == _this.amortization)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.afterDeduction, _this.afterDeduction) || other.afterDeduction == _this.afterDeduction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MonthlyFigures;
  return Object.hash(runtimeType,_this.interest,_this.amortization,_this.total,_this.afterDeduction);
}

@override
String toString() {
  final _this = this as MonthlyFigures;
  return 'MonthlyFigures(interest: ${_this.interest}, amortization: ${_this.amortization}, total: ${_this.total}, afterDeduction: ${_this.afterDeduction})';
}


}

/// @nodoc
abstract mixin class $MonthlyFiguresCopyWith<$Res>  {
  factory $MonthlyFiguresCopyWith(MonthlyFigures value, $Res Function(MonthlyFigures) _then) = _$MonthlyFiguresCopyWithImpl;
@useResult
$Res call({
 Money interest, Money amortization, Money total, Money? afterDeduction
});


$MoneyCopyWith<$Res> get interest;$MoneyCopyWith<$Res> get amortization;$MoneyCopyWith<$Res> get total;$MoneyCopyWith<$Res>? get afterDeduction;

}
/// @nodoc
class _$MonthlyFiguresCopyWithImpl<$Res>
    implements $MonthlyFiguresCopyWith<$Res> {
  _$MonthlyFiguresCopyWithImpl(this._self, this._then);

  final MonthlyFigures _self;
  final $Res Function(MonthlyFigures) _then;

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interest = null,Object? amortization = null,Object? total = null,Object? afterDeduction = freezed,}) {
  return _then(MonthlyFigures(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: freezed == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}
/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interest {
  
  return $MoneyCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amortization {
  
  return $MoneyCopyWith<$Res>(_self.amortization, (value) {
    return _then(_self.copyWith(amortization: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get afterDeduction {
    if (_self.afterDeduction == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.afterDeduction!, (value) {
    return _then(_self.copyWith(afterDeduction: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyFigures].
extension MonthlyFiguresPatterns on MonthlyFigures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyFigures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyFigures value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyFigures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyFigures value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction)  $default,) {final _that = this;
switch (_that) {
case _MonthlyFigures():
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyFigures implements MonthlyFigures {
  const _MonthlyFigures({required this.interest, required this.amortization, required this.total, this.afterDeduction});
  factory _MonthlyFigures.fromJson(Map<String, dynamic> json) => _$MonthlyFiguresFromJson(json);

@override final  Money interest;
@override final  Money amortization;
@override final  Money total;
@override final  Money? afterDeduction;

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyFiguresCopyWith<_MonthlyFigures> get copyWith => __$MonthlyFiguresCopyWithImpl<_MonthlyFigures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyFiguresToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyFigures&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.amortization, amortization) || other.amortization == amortization)&&(identical(other.total, total) || other.total == total)&&(identical(other.afterDeduction, afterDeduction) || other.afterDeduction == afterDeduction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,interest,amortization,total,afterDeduction);
}

@override
String toString() {
    return 'MonthlyFigures(interest: $interest, amortization: $amortization, total: $total, afterDeduction: $afterDeduction)';
}


}

/// @nodoc
abstract mixin class _$MonthlyFiguresCopyWith<$Res> implements $MonthlyFiguresCopyWith<$Res> {
  factory _$MonthlyFiguresCopyWith(_MonthlyFigures value, $Res Function(_MonthlyFigures) _then) = __$MonthlyFiguresCopyWithImpl;
@override @useResult
$Res call({
 Money interest, Money amortization, Money total, Money? afterDeduction
});


@override $MoneyCopyWith<$Res> get interest;@override $MoneyCopyWith<$Res> get amortization;@override $MoneyCopyWith<$Res> get total;@override $MoneyCopyWith<$Res>? get afterDeduction;

}
/// @nodoc
class __$MonthlyFiguresCopyWithImpl<$Res>
    implements _$MonthlyFiguresCopyWith<$Res> {
  __$MonthlyFiguresCopyWithImpl(this._self, this._then);

  final _MonthlyFigures _self;
  final $Res Function(_MonthlyFigures) _then;

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interest = null,Object? amortization = null,Object? total = null,Object? afterDeduction = freezed,}) {
  return _then(_MonthlyFigures(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: freezed == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interest {
  
  return $MoneyCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amortization {
  
  return $MoneyCopyWith<$Res>(_self.amortization, (value) {
    return _then(_self.copyWith(amortization: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get afterDeduction {
    if (_self.afterDeduction == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.afterDeduction!, (value) {
    return _then(_self.copyWith(afterDeduction: value));
  });
}
}


/// @nodoc
mixin _$RuleCheck {

 ConstraintKind get kind; String get ruleId; Money get maxLoan; bool get allows; String get marketName; Source? get source;
/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleCheckCopyWith<RuleCheck> get copyWith => _$RuleCheckCopyWithImpl<RuleCheck>(this as RuleCheck, _$identity);

  /// Serializes this RuleCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RuleCheck;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleCheck&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.ruleId, _this.ruleId) || other.ruleId == _this.ruleId)&&(identical(other.maxLoan, _this.maxLoan) || other.maxLoan == _this.maxLoan)&&(identical(other.allows, _this.allows) || other.allows == _this.allows)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RuleCheck;
  return Object.hash(runtimeType,_this.kind,_this.ruleId,_this.maxLoan,_this.allows,_this.marketName,_this.source);
}

@override
String toString() {
  final _this = this as RuleCheck;
  return 'RuleCheck(kind: ${_this.kind}, ruleId: ${_this.ruleId}, maxLoan: ${_this.maxLoan}, allows: ${_this.allows}, marketName: ${_this.marketName}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $RuleCheckCopyWith<$Res>  {
  factory $RuleCheckCopyWith(RuleCheck value, $Res Function(RuleCheck) _then) = _$RuleCheckCopyWithImpl;
@useResult
$Res call({
 ConstraintKind kind, String ruleId, Money maxLoan, bool allows, String marketName, Source? source
});


$MoneyCopyWith<$Res> get maxLoan;$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$RuleCheckCopyWithImpl<$Res>
    implements $RuleCheckCopyWith<$Res> {
  _$RuleCheckCopyWithImpl(this._self, this._then);

  final RuleCheck _self;
  final $Res Function(RuleCheck) _then;

/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? ruleId = null,Object? maxLoan = null,Object? allows = null,Object? marketName = null,Object? source = freezed,}) {
  return _then(RuleCheck(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,allows: null == allows ? _self.allows : allows // ignore: cast_nullable_to_non_nullable
as bool,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}
/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [RuleCheck].
extension RuleCheckPatterns on RuleCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleCheck value)  $default,){
final _that = this;
switch (_that) {
case _RuleCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleCheck value)?  $default,){
final _that = this;
switch (_that) {
case _RuleCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  Money maxLoan,  bool allows,  String marketName,  Source? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleCheck() when $default != null:
return $default(_that.kind,_that.ruleId,_that.maxLoan,_that.allows,_that.marketName,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  Money maxLoan,  bool allows,  String marketName,  Source? source)  $default,) {final _that = this;
switch (_that) {
case _RuleCheck():
return $default(_that.kind,_that.ruleId,_that.maxLoan,_that.allows,_that.marketName,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConstraintKind kind,  String ruleId,  Money maxLoan,  bool allows,  String marketName,  Source? source)?  $default,) {final _that = this;
switch (_that) {
case _RuleCheck() when $default != null:
return $default(_that.kind,_that.ruleId,_that.maxLoan,_that.allows,_that.marketName,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleCheck implements RuleCheck {
  const _RuleCheck({required this.kind, required this.ruleId, required this.maxLoan, required this.allows, required this.marketName, this.source});
  factory _RuleCheck.fromJson(Map<String, dynamic> json) => _$RuleCheckFromJson(json);

@override final  ConstraintKind kind;
@override final  String ruleId;
@override final  Money maxLoan;
@override final  bool allows;
@override final  String marketName;
@override final  Source? source;

/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleCheckCopyWith<_RuleCheck> get copyWith => __$RuleCheckCopyWithImpl<_RuleCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleCheckToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleCheck&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.allows, allows) || other.allows == allows)&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,ruleId,maxLoan,allows,marketName,source);
}

@override
String toString() {
    return 'RuleCheck(kind: $kind, ruleId: $ruleId, maxLoan: $maxLoan, allows: $allows, marketName: $marketName, source: $source)';
}


}

/// @nodoc
abstract mixin class _$RuleCheckCopyWith<$Res> implements $RuleCheckCopyWith<$Res> {
  factory _$RuleCheckCopyWith(_RuleCheck value, $Res Function(_RuleCheck) _then) = __$RuleCheckCopyWithImpl;
@override @useResult
$Res call({
 ConstraintKind kind, String ruleId, Money maxLoan, bool allows, String marketName, Source? source
});


@override $MoneyCopyWith<$Res> get maxLoan;@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$RuleCheckCopyWithImpl<$Res>
    implements _$RuleCheckCopyWith<$Res> {
  __$RuleCheckCopyWithImpl(this._self, this._then);

  final _RuleCheck _self;
  final $Res Function(_RuleCheck) _then;

/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? ruleId = null,Object? maxLoan = null,Object? allows = null,Object? marketName = null,Object? source = freezed,}) {
  return _then(_RuleCheck(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,allows: null == allows ? _self.allows : allows // ignore: cast_nullable_to_non_nullable
as bool,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}

/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of RuleCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
