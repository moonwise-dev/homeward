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

 String get marketId; String get marketName; bool get sample; Money get price; Money? get maxPrice; Money get loan; Money get maxLoan; Money get downPayment; Money? get cashNeeded; Money? get savings;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate; int get termYears; String get loanType; String? get loanTypeId; MonthlyFigures get monthly; RuleCheck? get binding; List<RuleCheck> get checks; List<ExchangeRate> get exchangeRates; StressCurve? get stress; List<CostLine> get purchaseCosts; Money? get purchaseCostsTotal; DownPaymentWhatIf? get whatIf; List<MortgageOption> get mortgageOptions;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AffordabilitySlice&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.sample, _this.sample) || other.sample == _this.sample)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.maxPrice, _this.maxPrice) || other.maxPrice == _this.maxPrice)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.maxLoan, _this.maxLoan) || other.maxLoan == _this.maxLoan)&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.cashNeeded, _this.cashNeeded) || other.cashNeeded == _this.cashNeeded)&&(identical(other.savings, _this.savings) || other.savings == _this.savings)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.termYears, _this.termYears) || other.termYears == _this.termYears)&&(identical(other.loanType, _this.loanType) || other.loanType == _this.loanType)&&(identical(other.loanTypeId, _this.loanTypeId) || other.loanTypeId == _this.loanTypeId)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.binding, _this.binding) || other.binding == _this.binding)&&const DeepCollectionEquality().equals(other.checks, _this.checks)&&const DeepCollectionEquality().equals(other.exchangeRates, _this.exchangeRates)&&(identical(other.stress, _this.stress) || other.stress == _this.stress)&&const DeepCollectionEquality().equals(other.purchaseCosts, _this.purchaseCosts)&&(identical(other.purchaseCostsTotal, _this.purchaseCostsTotal) || other.purchaseCostsTotal == _this.purchaseCostsTotal)&&(identical(other.whatIf, _this.whatIf) || other.whatIf == _this.whatIf)&&const DeepCollectionEquality().equals(other.mortgageOptions, _this.mortgageOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AffordabilitySlice;
  return Object.hashAll([runtimeType,_this.marketId,_this.marketName,_this.sample,_this.price,_this.maxPrice,_this.loan,_this.maxLoan,_this.downPayment,_this.cashNeeded,_this.savings,_this.annualRate,_this.termYears,_this.loanType,_this.loanTypeId,_this.monthly,_this.binding,const DeepCollectionEquality().hash(_this.checks),const DeepCollectionEquality().hash(_this.exchangeRates),_this.stress,const DeepCollectionEquality().hash(_this.purchaseCosts),_this.purchaseCostsTotal,_this.whatIf,const DeepCollectionEquality().hash(_this.mortgageOptions)]);
}

@override
String toString() {
  final _this = this as AffordabilitySlice;
  return 'AffordabilitySlice(marketId: ${_this.marketId}, marketName: ${_this.marketName}, sample: ${_this.sample}, price: ${_this.price}, maxPrice: ${_this.maxPrice}, loan: ${_this.loan}, maxLoan: ${_this.maxLoan}, downPayment: ${_this.downPayment}, cashNeeded: ${_this.cashNeeded}, savings: ${_this.savings}, annualRate: ${_this.annualRate}, termYears: ${_this.termYears}, loanType: ${_this.loanType}, loanTypeId: ${_this.loanTypeId}, monthly: ${_this.monthly}, binding: ${_this.binding}, checks: ${_this.checks}, exchangeRates: ${_this.exchangeRates}, stress: ${_this.stress}, purchaseCosts: ${_this.purchaseCosts}, purchaseCostsTotal: ${_this.purchaseCostsTotal}, whatIf: ${_this.whatIf}, mortgageOptions: ${_this.mortgageOptions})';
}


}

/// @nodoc
abstract mixin class $AffordabilitySliceCopyWith<$Res>  {
  factory $AffordabilitySliceCopyWith(AffordabilitySlice value, $Res Function(AffordabilitySlice) _then) = _$AffordabilitySliceCopyWithImpl;
@useResult
$Res call({
 String marketId, String marketName, bool sample, Money price, Money? maxPrice, Money loan, Money maxLoan, Money downPayment, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, int termYears, String loanType, String? loanTypeId, MonthlyFigures monthly, RuleCheck? binding, List<RuleCheck> checks, List<ExchangeRate> exchangeRates, StressCurve? stress, List<CostLine> purchaseCosts, Money? purchaseCostsTotal, DownPaymentWhatIf? whatIf, List<MortgageOption> mortgageOptions
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get maxPrice;$MoneyCopyWith<$Res> get loan;$MoneyCopyWith<$Res> get maxLoan;$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res>? get cashNeeded;$MoneyCopyWith<$Res>? get savings;$MonthlyFiguresCopyWith<$Res> get monthly;$RuleCheckCopyWith<$Res>? get binding;$StressCurveCopyWith<$Res>? get stress;$MoneyCopyWith<$Res>? get purchaseCostsTotal;$DownPaymentWhatIfCopyWith<$Res>? get whatIf;

}
/// @nodoc
class _$AffordabilitySliceCopyWithImpl<$Res>
    implements $AffordabilitySliceCopyWith<$Res> {
  _$AffordabilitySliceCopyWithImpl(this._self, this._then);

  final AffordabilitySlice _self;
  final $Res Function(AffordabilitySlice) _then;

/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketId = null,Object? marketName = null,Object? sample = null,Object? price = null,Object? maxPrice = freezed,Object? loan = null,Object? maxLoan = null,Object? downPayment = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? termYears = null,Object? loanType = null,Object? loanTypeId = freezed,Object? monthly = null,Object? binding = freezed,Object? checks = null,Object? exchangeRates = null,Object? stress = freezed,Object? purchaseCosts = null,Object? purchaseCostsTotal = freezed,Object? whatIf = freezed,Object? mortgageOptions = null,}) {
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
as String,loanTypeId: freezed == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String?,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as RuleCheck?,checks: null == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as List<RuleCheck>,exchangeRates: null == exchangeRates ? _self.exchangeRates : exchangeRates // ignore: cast_nullable_to_non_nullable
as List<ExchangeRate>,stress: freezed == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as StressCurve?,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostLine>,purchaseCostsTotal: freezed == purchaseCostsTotal ? _self.purchaseCostsTotal : purchaseCostsTotal // ignore: cast_nullable_to_non_nullable
as Money?,whatIf: freezed == whatIf ? _self.whatIf : whatIf // ignore: cast_nullable_to_non_nullable
as DownPaymentWhatIf?,mortgageOptions: null == mortgageOptions ? _self.mortgageOptions : mortgageOptions // ignore: cast_nullable_to_non_nullable
as List<MortgageOption>,
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
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StressCurveCopyWith<$Res>? get stress {
    if (_self.stress == null) {
    return null;
  }

  return $StressCurveCopyWith<$Res>(_self.stress!, (value) {
    return _then(_self.copyWith(stress: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get purchaseCostsTotal {
    if (_self.purchaseCostsTotal == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.purchaseCostsTotal!, (value) {
    return _then(_self.copyWith(purchaseCostsTotal: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownPaymentWhatIfCopyWith<$Res>? get whatIf {
    if (_self.whatIf == null) {
    return null;
  }

  return $DownPaymentWhatIfCopyWith<$Res>(_self.whatIf!, (value) {
    return _then(_self.copyWith(whatIf: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  String? loanTypeId,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates,  StressCurve? stress,  List<CostLine> purchaseCosts,  Money? purchaseCostsTotal,  DownPaymentWhatIf? whatIf,  List<MortgageOption> mortgageOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.loanTypeId,_that.monthly,_that.binding,_that.checks,_that.exchangeRates,_that.stress,_that.purchaseCosts,_that.purchaseCostsTotal,_that.whatIf,_that.mortgageOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  String? loanTypeId,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates,  StressCurve? stress,  List<CostLine> purchaseCosts,  Money? purchaseCostsTotal,  DownPaymentWhatIf? whatIf,  List<MortgageOption> mortgageOptions)  $default,) {final _that = this;
switch (_that) {
case _AffordabilitySlice():
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.loanTypeId,_that.monthly,_that.binding,_that.checks,_that.exchangeRates,_that.stress,_that.purchaseCosts,_that.purchaseCostsTotal,_that.whatIf,_that.mortgageOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String marketId,  String marketName,  bool sample,  Money price,  Money? maxPrice,  Money loan,  Money maxLoan,  Money downPayment,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  int termYears,  String loanType,  String? loanTypeId,  MonthlyFigures monthly,  RuleCheck? binding,  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates,  StressCurve? stress,  List<CostLine> purchaseCosts,  Money? purchaseCostsTotal,  DownPaymentWhatIf? whatIf,  List<MortgageOption> mortgageOptions)?  $default,) {final _that = this;
switch (_that) {
case _AffordabilitySlice() when $default != null:
return $default(_that.marketId,_that.marketName,_that.sample,_that.price,_that.maxPrice,_that.loan,_that.maxLoan,_that.downPayment,_that.cashNeeded,_that.savings,_that.annualRate,_that.termYears,_that.loanType,_that.loanTypeId,_that.monthly,_that.binding,_that.checks,_that.exchangeRates,_that.stress,_that.purchaseCosts,_that.purchaseCostsTotal,_that.whatIf,_that.mortgageOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AffordabilitySlice implements AffordabilitySlice {
  const _AffordabilitySlice({required this.marketId, required this.marketName, this.sample = true, required this.price, this.maxPrice, required this.loan, required this.maxLoan, required this.downPayment, this.cashNeeded, this.savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, required this.termYears, required this.loanType, this.loanTypeId, required this.monthly, this.binding, required  List<RuleCheck> checks,  List<ExchangeRate> exchangeRates = const [], this.stress,  List<CostLine> purchaseCosts = const [], this.purchaseCostsTotal, this.whatIf,  List<MortgageOption> mortgageOptions = const []}): _checks = checks,_exchangeRates = exchangeRates,_purchaseCosts = purchaseCosts,_mortgageOptions = mortgageOptions;
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
@override final  String? loanTypeId;
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

@override final  StressCurve? stress;
 final  List<CostLine> _purchaseCosts;
@override@JsonKey() List<CostLine> get purchaseCosts {
  if (_purchaseCosts is EqualUnmodifiableListView) return _purchaseCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchaseCosts);
}

@override final  Money? purchaseCostsTotal;
@override final  DownPaymentWhatIf? whatIf;
 final  List<MortgageOption> _mortgageOptions;
@override@JsonKey() List<MortgageOption> get mortgageOptions {
  if (_mortgageOptions is EqualUnmodifiableListView) return _mortgageOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mortgageOptions);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AffordabilitySlice&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.price, price) || other.price == price)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.termYears, termYears) || other.termYears == termYears)&&(identical(other.loanType, loanType) || other.loanType == loanType)&&(identical(other.loanTypeId, loanTypeId) || other.loanTypeId == loanTypeId)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.binding, binding) || other.binding == binding)&&const DeepCollectionEquality().equals(other.checks, _checks)&&const DeepCollectionEquality().equals(other.exchangeRates, _exchangeRates)&&(identical(other.stress, stress) || other.stress == stress)&&const DeepCollectionEquality().equals(other.purchaseCosts, _purchaseCosts)&&(identical(other.purchaseCostsTotal, purchaseCostsTotal) || other.purchaseCostsTotal == purchaseCostsTotal)&&(identical(other.whatIf, whatIf) || other.whatIf == whatIf)&&const DeepCollectionEquality().equals(other.mortgageOptions, _mortgageOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,marketId,marketName,sample,price,maxPrice,loan,maxLoan,downPayment,cashNeeded,savings,annualRate,termYears,loanType,loanTypeId,monthly,binding,const DeepCollectionEquality().hash(_checks),const DeepCollectionEquality().hash(_exchangeRates),stress,const DeepCollectionEquality().hash(_purchaseCosts),purchaseCostsTotal,whatIf,const DeepCollectionEquality().hash(_mortgageOptions)]);
}

@override
String toString() {
    return 'AffordabilitySlice(marketId: $marketId, marketName: $marketName, sample: $sample, price: $price, maxPrice: $maxPrice, loan: $loan, maxLoan: $maxLoan, downPayment: $downPayment, cashNeeded: $cashNeeded, savings: $savings, annualRate: $annualRate, termYears: $termYears, loanType: $loanType, loanTypeId: $loanTypeId, monthly: $monthly, binding: $binding, checks: $checks, exchangeRates: $exchangeRates, stress: $stress, purchaseCosts: $purchaseCosts, purchaseCostsTotal: $purchaseCostsTotal, whatIf: $whatIf, mortgageOptions: $mortgageOptions)';
}


}

/// @nodoc
abstract mixin class _$AffordabilitySliceCopyWith<$Res> implements $AffordabilitySliceCopyWith<$Res> {
  factory _$AffordabilitySliceCopyWith(_AffordabilitySlice value, $Res Function(_AffordabilitySlice) _then) = __$AffordabilitySliceCopyWithImpl;
@override @useResult
$Res call({
 String marketId, String marketName, bool sample, Money price, Money? maxPrice, Money loan, Money maxLoan, Money downPayment, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, int termYears, String loanType, String? loanTypeId, MonthlyFigures monthly, RuleCheck? binding, List<RuleCheck> checks, List<ExchangeRate> exchangeRates, StressCurve? stress, List<CostLine> purchaseCosts, Money? purchaseCostsTotal, DownPaymentWhatIf? whatIf, List<MortgageOption> mortgageOptions
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get maxPrice;@override $MoneyCopyWith<$Res> get loan;@override $MoneyCopyWith<$Res> get maxLoan;@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res>? get cashNeeded;@override $MoneyCopyWith<$Res>? get savings;@override $MonthlyFiguresCopyWith<$Res> get monthly;@override $RuleCheckCopyWith<$Res>? get binding;@override $StressCurveCopyWith<$Res>? get stress;@override $MoneyCopyWith<$Res>? get purchaseCostsTotal;@override $DownPaymentWhatIfCopyWith<$Res>? get whatIf;

}
/// @nodoc
class __$AffordabilitySliceCopyWithImpl<$Res>
    implements _$AffordabilitySliceCopyWith<$Res> {
  __$AffordabilitySliceCopyWithImpl(this._self, this._then);

  final _AffordabilitySlice _self;
  final $Res Function(_AffordabilitySlice) _then;

/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketId = null,Object? marketName = null,Object? sample = null,Object? price = null,Object? maxPrice = freezed,Object? loan = null,Object? maxLoan = null,Object? downPayment = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? termYears = null,Object? loanType = null,Object? loanTypeId = freezed,Object? monthly = null,Object? binding = freezed,Object? checks = null,Object? exchangeRates = null,Object? stress = freezed,Object? purchaseCosts = null,Object? purchaseCostsTotal = freezed,Object? whatIf = freezed,Object? mortgageOptions = null,}) {
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
as String,loanTypeId: freezed == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String?,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as RuleCheck?,checks: null == checks ? _self._checks : checks // ignore: cast_nullable_to_non_nullable
as List<RuleCheck>,exchangeRates: null == exchangeRates ? _self._exchangeRates : exchangeRates // ignore: cast_nullable_to_non_nullable
as List<ExchangeRate>,stress: freezed == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as StressCurve?,purchaseCosts: null == purchaseCosts ? _self._purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostLine>,purchaseCostsTotal: freezed == purchaseCostsTotal ? _self.purchaseCostsTotal : purchaseCostsTotal // ignore: cast_nullable_to_non_nullable
as Money?,whatIf: freezed == whatIf ? _self.whatIf : whatIf // ignore: cast_nullable_to_non_nullable
as DownPaymentWhatIf?,mortgageOptions: null == mortgageOptions ? _self._mortgageOptions : mortgageOptions // ignore: cast_nullable_to_non_nullable
as List<MortgageOption>,
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
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StressCurveCopyWith<$Res>? get stress {
    if (_self.stress == null) {
    return null;
  }

  return $StressCurveCopyWith<$Res>(_self.stress!, (value) {
    return _then(_self.copyWith(stress: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get purchaseCostsTotal {
    if (_self.purchaseCostsTotal == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.purchaseCostsTotal!, (value) {
    return _then(_self.copyWith(purchaseCostsTotal: value));
  });
}/// Create a copy of AffordabilitySlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownPaymentWhatIfCopyWith<$Res>? get whatIf {
    if (_self.whatIf == null) {
    return null;
  }

  return $DownPaymentWhatIfCopyWith<$Res>(_self.whatIf!, (value) {
    return _then(_self.copyWith(whatIf: value));
  });
}
}


/// @nodoc
mixin _$MonthlyFigures {

 Money get interest; Money get amortization; Money get total; Money? get afterDeduction;@JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter() Rate? get amortizationRate; Money? get fee;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyFigures&&(identical(other.interest, _this.interest) || other.interest == _this.interest)&&(identical(other.amortization, _this.amortization) || other.amortization == _this.amortization)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.afterDeduction, _this.afterDeduction) || other.afterDeduction == _this.afterDeduction)&&(identical(other.amortizationRate, _this.amortizationRate) || other.amortizationRate == _this.amortizationRate)&&(identical(other.fee, _this.fee) || other.fee == _this.fee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MonthlyFigures;
  return Object.hash(runtimeType,_this.interest,_this.amortization,_this.total,_this.afterDeduction,_this.amortizationRate,_this.fee);
}

@override
String toString() {
  final _this = this as MonthlyFigures;
  return 'MonthlyFigures(interest: ${_this.interest}, amortization: ${_this.amortization}, total: ${_this.total}, afterDeduction: ${_this.afterDeduction}, amortizationRate: ${_this.amortizationRate}, fee: ${_this.fee})';
}


}

/// @nodoc
abstract mixin class $MonthlyFiguresCopyWith<$Res>  {
  factory $MonthlyFiguresCopyWith(MonthlyFigures value, $Res Function(MonthlyFigures) _then) = _$MonthlyFiguresCopyWithImpl;
@useResult
$Res call({
 Money interest, Money amortization, Money total, Money? afterDeduction,@JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter() Rate? amortizationRate, Money? fee
});


$MoneyCopyWith<$Res> get interest;$MoneyCopyWith<$Res> get amortization;$MoneyCopyWith<$Res> get total;$MoneyCopyWith<$Res>? get afterDeduction;$MoneyCopyWith<$Res>? get fee;

}
/// @nodoc
class _$MonthlyFiguresCopyWithImpl<$Res>
    implements $MonthlyFiguresCopyWith<$Res> {
  _$MonthlyFiguresCopyWithImpl(this._self, this._then);

  final MonthlyFigures _self;
  final $Res Function(MonthlyFigures) _then;

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interest = null,Object? amortization = null,Object? total = null,Object? afterDeduction = freezed,Object? amortizationRate = freezed,Object? fee = freezed,}) {
  return _then(MonthlyFigures(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: freezed == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as Money?,amortizationRate: freezed == amortizationRate ? _self.amortizationRate : amortizationRate // ignore: cast_nullable_to_non_nullable
as Rate?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of MonthlyFigures
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction, @JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter()  Rate? amortizationRate,  Money? fee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction,_that.amortizationRate,_that.fee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction, @JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter()  Rate? amortizationRate,  Money? fee)  $default,) {final _that = this;
switch (_that) {
case _MonthlyFigures():
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction,_that.amortizationRate,_that.fee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money interest,  Money amortization,  Money total,  Money? afterDeduction, @JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter()  Rate? amortizationRate,  Money? fee)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyFigures() when $default != null:
return $default(_that.interest,_that.amortization,_that.total,_that.afterDeduction,_that.amortizationRate,_that.fee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyFigures extends MonthlyFigures {
  const _MonthlyFigures({required this.interest, required this.amortization, required this.total, this.afterDeduction, @JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter() this.amortizationRate, this.fee}): super._();
  factory _MonthlyFigures.fromJson(Map<String, dynamic> json) => _$MonthlyFiguresFromJson(json);

@override final  Money interest;
@override final  Money amortization;
@override final  Money total;
@override final  Money? afterDeduction;
@override@JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter() final  Rate? amortizationRate;
@override final  Money? fee;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyFigures&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.amortization, amortization) || other.amortization == amortization)&&(identical(other.total, total) || other.total == total)&&(identical(other.afterDeduction, afterDeduction) || other.afterDeduction == afterDeduction)&&(identical(other.amortizationRate, amortizationRate) || other.amortizationRate == amortizationRate)&&(identical(other.fee, fee) || other.fee == fee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,interest,amortization,total,afterDeduction,amortizationRate,fee);
}

@override
String toString() {
    return 'MonthlyFigures(interest: $interest, amortization: $amortization, total: $total, afterDeduction: $afterDeduction, amortizationRate: $amortizationRate, fee: $fee)';
}


}

/// @nodoc
abstract mixin class _$MonthlyFiguresCopyWith<$Res> implements $MonthlyFiguresCopyWith<$Res> {
  factory _$MonthlyFiguresCopyWith(_MonthlyFigures value, $Res Function(_MonthlyFigures) _then) = __$MonthlyFiguresCopyWithImpl;
@override @useResult
$Res call({
 Money interest, Money amortization, Money total, Money? afterDeduction,@JsonKey(name: 'amortizationRatePpm')@PpmJsonConverter() Rate? amortizationRate, Money? fee
});


@override $MoneyCopyWith<$Res> get interest;@override $MoneyCopyWith<$Res> get amortization;@override $MoneyCopyWith<$Res> get total;@override $MoneyCopyWith<$Res>? get afterDeduction;@override $MoneyCopyWith<$Res>? get fee;

}
/// @nodoc
class __$MonthlyFiguresCopyWithImpl<$Res>
    implements _$MonthlyFiguresCopyWith<$Res> {
  __$MonthlyFiguresCopyWithImpl(this._self, this._then);

  final _MonthlyFigures _self;
  final $Res Function(_MonthlyFigures) _then;

/// Create a copy of MonthlyFigures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interest = null,Object? amortization = null,Object? total = null,Object? afterDeduction = freezed,Object? amortizationRate = freezed,Object? fee = freezed,}) {
  return _then(_MonthlyFigures(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: freezed == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as Money?,amortizationRate: freezed == amortizationRate ? _self.amortizationRate : amortizationRate // ignore: cast_nullable_to_non_nullable
as Rate?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of MonthlyFigures
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


/// @nodoc
mixin _$CostLine {

 String get label; String? get localTerm; Money get amount; Money? get refundable; RefundRule? get refund; Source? get source;
/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CostLineCopyWith<CostLine> get copyWith => _$CostLineCopyWithImpl<CostLine>(this as CostLine, _$identity);

  /// Serializes this CostLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CostLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CostLine&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.localTerm, _this.localTerm) || other.localTerm == _this.localTerm)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.refundable, _this.refundable) || other.refundable == _this.refundable)&&(identical(other.refund, _this.refund) || other.refund == _this.refund)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CostLine;
  return Object.hash(runtimeType,_this.label,_this.localTerm,_this.amount,_this.refundable,_this.refund,_this.source);
}

@override
String toString() {
  final _this = this as CostLine;
  return 'CostLine(label: ${_this.label}, localTerm: ${_this.localTerm}, amount: ${_this.amount}, refundable: ${_this.refundable}, refund: ${_this.refund}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $CostLineCopyWith<$Res>  {
  factory $CostLineCopyWith(CostLine value, $Res Function(CostLine) _then) = _$CostLineCopyWithImpl;
@useResult
$Res call({
 String label, String? localTerm, Money amount, Money? refundable, RefundRule? refund, Source? source
});


$MoneyCopyWith<$Res> get amount;$MoneyCopyWith<$Res>? get refundable;$RefundRuleCopyWith<$Res>? get refund;$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$CostLineCopyWithImpl<$Res>
    implements $CostLineCopyWith<$Res> {
  _$CostLineCopyWithImpl(this._self, this._then);

  final CostLine _self;
  final $Res Function(CostLine) _then;

/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? localTerm = freezed,Object? amount = null,Object? refundable = freezed,Object? refund = freezed,Object? source = freezed,}) {
  return _then(CostLine(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,refundable: freezed == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as Money?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}
/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get refundable {
    if (_self.refundable == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.refundable!, (value) {
    return _then(_self.copyWith(refundable: value));
  });
}/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundRuleCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $RefundRuleCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}/// Create a copy of CostLine
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


/// Adds pattern-matching-related methods to [CostLine].
extension CostLinePatterns on CostLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CostLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CostLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CostLine value)  $default,){
final _that = this;
switch (_that) {
case _CostLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CostLine value)?  $default,){
final _that = this;
switch (_that) {
case _CostLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  Source? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CostLine() when $default != null:
return $default(_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  Source? source)  $default,) {final _that = this;
switch (_that) {
case _CostLine():
return $default(_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  Source? source)?  $default,) {final _that = this;
switch (_that) {
case _CostLine() when $default != null:
return $default(_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CostLine implements CostLine {
  const _CostLine({required this.label, this.localTerm, required this.amount, this.refundable, this.refund, this.source});
  factory _CostLine.fromJson(Map<String, dynamic> json) => _$CostLineFromJson(json);

@override final  String label;
@override final  String? localTerm;
@override final  Money amount;
@override final  Money? refundable;
@override final  RefundRule? refund;
@override final  Source? source;

/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CostLineCopyWith<_CostLine> get copyWith => __$CostLineCopyWithImpl<_CostLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CostLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CostLine&&(identical(other.label, label) || other.label == label)&&(identical(other.localTerm, localTerm) || other.localTerm == localTerm)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.refund, refund) || other.refund == refund)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,localTerm,amount,refundable,refund,source);
}

@override
String toString() {
    return 'CostLine(label: $label, localTerm: $localTerm, amount: $amount, refundable: $refundable, refund: $refund, source: $source)';
}


}

/// @nodoc
abstract mixin class _$CostLineCopyWith<$Res> implements $CostLineCopyWith<$Res> {
  factory _$CostLineCopyWith(_CostLine value, $Res Function(_CostLine) _then) = __$CostLineCopyWithImpl;
@override @useResult
$Res call({
 String label, String? localTerm, Money amount, Money? refundable, RefundRule? refund, Source? source
});


@override $MoneyCopyWith<$Res> get amount;@override $MoneyCopyWith<$Res>? get refundable;@override $RefundRuleCopyWith<$Res>? get refund;@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$CostLineCopyWithImpl<$Res>
    implements _$CostLineCopyWith<$Res> {
  __$CostLineCopyWithImpl(this._self, this._then);

  final _CostLine _self;
  final $Res Function(_CostLine) _then;

/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? localTerm = freezed,Object? amount = null,Object? refundable = freezed,Object? refund = freezed,Object? source = freezed,}) {
  return _then(_CostLine(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,refundable: freezed == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as Money?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}

/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get refundable {
    if (_self.refundable == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.refundable!, (value) {
    return _then(_self.copyWith(refundable: value));
  });
}/// Create a copy of CostLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundRuleCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $RefundRuleCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}/// Create a copy of CostLine
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


/// @nodoc
mixin _$DownPaymentWhatIf {

 Money get step; List<WhatIfStep> get steps;
/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownPaymentWhatIfCopyWith<DownPaymentWhatIf> get copyWith => _$DownPaymentWhatIfCopyWithImpl<DownPaymentWhatIf>(this as DownPaymentWhatIf, _$identity);

  /// Serializes this DownPaymentWhatIf to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DownPaymentWhatIf;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownPaymentWhatIf&&(identical(other.step, _this.step) || other.step == _this.step)&&const DeepCollectionEquality().equals(other.steps, _this.steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DownPaymentWhatIf;
  return Object.hash(runtimeType,_this.step,const DeepCollectionEquality().hash(_this.steps));
}

@override
String toString() {
  final _this = this as DownPaymentWhatIf;
  return 'DownPaymentWhatIf(step: ${_this.step}, steps: ${_this.steps})';
}


}

/// @nodoc
abstract mixin class $DownPaymentWhatIfCopyWith<$Res>  {
  factory $DownPaymentWhatIfCopyWith(DownPaymentWhatIf value, $Res Function(DownPaymentWhatIf) _then) = _$DownPaymentWhatIfCopyWithImpl;
@useResult
$Res call({
 Money step, List<WhatIfStep> steps
});


$MoneyCopyWith<$Res> get step;

}
/// @nodoc
class _$DownPaymentWhatIfCopyWithImpl<$Res>
    implements $DownPaymentWhatIfCopyWith<$Res> {
  _$DownPaymentWhatIfCopyWithImpl(this._self, this._then);

  final DownPaymentWhatIf _self;
  final $Res Function(DownPaymentWhatIf) _then;

/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? steps = null,}) {
  return _then(DownPaymentWhatIf(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as Money,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<WhatIfStep>,
  ));
}
/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get step {
  
  return $MoneyCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [DownPaymentWhatIf].
extension DownPaymentWhatIfPatterns on DownPaymentWhatIf {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownPaymentWhatIf value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownPaymentWhatIf() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownPaymentWhatIf value)  $default,){
final _that = this;
switch (_that) {
case _DownPaymentWhatIf():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownPaymentWhatIf value)?  $default,){
final _that = this;
switch (_that) {
case _DownPaymentWhatIf() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money step,  List<WhatIfStep> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownPaymentWhatIf() when $default != null:
return $default(_that.step,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money step,  List<WhatIfStep> steps)  $default,) {final _that = this;
switch (_that) {
case _DownPaymentWhatIf():
return $default(_that.step,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money step,  List<WhatIfStep> steps)?  $default,) {final _that = this;
switch (_that) {
case _DownPaymentWhatIf() when $default != null:
return $default(_that.step,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownPaymentWhatIf implements DownPaymentWhatIf {
  const _DownPaymentWhatIf({required this.step, required  List<WhatIfStep> steps}): _steps = steps;
  factory _DownPaymentWhatIf.fromJson(Map<String, dynamic> json) => _$DownPaymentWhatIfFromJson(json);

@override final  Money step;
 final  List<WhatIfStep> _steps;
@override List<WhatIfStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownPaymentWhatIfCopyWith<_DownPaymentWhatIf> get copyWith => __$DownPaymentWhatIfCopyWithImpl<_DownPaymentWhatIf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownPaymentWhatIfToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownPaymentWhatIf&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,step,const DeepCollectionEquality().hash(_steps));
}

@override
String toString() {
    return 'DownPaymentWhatIf(step: $step, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$DownPaymentWhatIfCopyWith<$Res> implements $DownPaymentWhatIfCopyWith<$Res> {
  factory _$DownPaymentWhatIfCopyWith(_DownPaymentWhatIf value, $Res Function(_DownPaymentWhatIf) _then) = __$DownPaymentWhatIfCopyWithImpl;
@override @useResult
$Res call({
 Money step, List<WhatIfStep> steps
});


@override $MoneyCopyWith<$Res> get step;

}
/// @nodoc
class __$DownPaymentWhatIfCopyWithImpl<$Res>
    implements _$DownPaymentWhatIfCopyWith<$Res> {
  __$DownPaymentWhatIfCopyWithImpl(this._self, this._then);

  final _DownPaymentWhatIf _self;
  final $Res Function(_DownPaymentWhatIf) _then;

/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? steps = null,}) {
  return _then(_DownPaymentWhatIf(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as Money,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<WhatIfStep>,
  ));
}

/// Create a copy of DownPaymentWhatIf
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get step {
  
  return $MoneyCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// @nodoc
mixin _$WhatIfStep {

 Money get downPayment; Money get loan; MonthlyFigures get monthly; Money? get cashNeeded; bool get withinRules;
/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WhatIfStepCopyWith<WhatIfStep> get copyWith => _$WhatIfStepCopyWithImpl<WhatIfStep>(this as WhatIfStep, _$identity);

  /// Serializes this WhatIfStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WhatIfStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WhatIfStep&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.cashNeeded, _this.cashNeeded) || other.cashNeeded == _this.cashNeeded)&&(identical(other.withinRules, _this.withinRules) || other.withinRules == _this.withinRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WhatIfStep;
  return Object.hash(runtimeType,_this.downPayment,_this.loan,_this.monthly,_this.cashNeeded,_this.withinRules);
}

@override
String toString() {
  final _this = this as WhatIfStep;
  return 'WhatIfStep(downPayment: ${_this.downPayment}, loan: ${_this.loan}, monthly: ${_this.monthly}, cashNeeded: ${_this.cashNeeded}, withinRules: ${_this.withinRules})';
}


}

/// @nodoc
abstract mixin class $WhatIfStepCopyWith<$Res>  {
  factory $WhatIfStepCopyWith(WhatIfStep value, $Res Function(WhatIfStep) _then) = _$WhatIfStepCopyWithImpl;
@useResult
$Res call({
 Money downPayment, Money loan, MonthlyFigures monthly, Money? cashNeeded, bool withinRules
});


$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res> get loan;$MonthlyFiguresCopyWith<$Res> get monthly;$MoneyCopyWith<$Res>? get cashNeeded;

}
/// @nodoc
class _$WhatIfStepCopyWithImpl<$Res>
    implements $WhatIfStepCopyWith<$Res> {
  _$WhatIfStepCopyWithImpl(this._self, this._then);

  final WhatIfStep _self;
  final $Res Function(WhatIfStep) _then;

/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downPayment = null,Object? loan = null,Object? monthly = null,Object? cashNeeded = freezed,Object? withinRules = null,}) {
  return _then(WhatIfStep(
downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,withinRules: null == withinRules ? _self.withinRules : withinRules // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of WhatIfStep
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
}
}


/// Adds pattern-matching-related methods to [WhatIfStep].
extension WhatIfStepPatterns on WhatIfStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WhatIfStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WhatIfStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WhatIfStep value)  $default,){
final _that = this;
switch (_that) {
case _WhatIfStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WhatIfStep value)?  $default,){
final _that = this;
switch (_that) {
case _WhatIfStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money downPayment,  Money loan,  MonthlyFigures monthly,  Money? cashNeeded,  bool withinRules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WhatIfStep() when $default != null:
return $default(_that.downPayment,_that.loan,_that.monthly,_that.cashNeeded,_that.withinRules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money downPayment,  Money loan,  MonthlyFigures monthly,  Money? cashNeeded,  bool withinRules)  $default,) {final _that = this;
switch (_that) {
case _WhatIfStep():
return $default(_that.downPayment,_that.loan,_that.monthly,_that.cashNeeded,_that.withinRules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money downPayment,  Money loan,  MonthlyFigures monthly,  Money? cashNeeded,  bool withinRules)?  $default,) {final _that = this;
switch (_that) {
case _WhatIfStep() when $default != null:
return $default(_that.downPayment,_that.loan,_that.monthly,_that.cashNeeded,_that.withinRules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WhatIfStep implements WhatIfStep {
  const _WhatIfStep({required this.downPayment, required this.loan, required this.monthly, this.cashNeeded, required this.withinRules});
  factory _WhatIfStep.fromJson(Map<String, dynamic> json) => _$WhatIfStepFromJson(json);

@override final  Money downPayment;
@override final  Money loan;
@override final  MonthlyFigures monthly;
@override final  Money? cashNeeded;
@override final  bool withinRules;

/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WhatIfStepCopyWith<_WhatIfStep> get copyWith => __$WhatIfStepCopyWithImpl<_WhatIfStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WhatIfStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WhatIfStep&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded)&&(identical(other.withinRules, withinRules) || other.withinRules == withinRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,downPayment,loan,monthly,cashNeeded,withinRules);
}

@override
String toString() {
    return 'WhatIfStep(downPayment: $downPayment, loan: $loan, monthly: $monthly, cashNeeded: $cashNeeded, withinRules: $withinRules)';
}


}

/// @nodoc
abstract mixin class _$WhatIfStepCopyWith<$Res> implements $WhatIfStepCopyWith<$Res> {
  factory _$WhatIfStepCopyWith(_WhatIfStep value, $Res Function(_WhatIfStep) _then) = __$WhatIfStepCopyWithImpl;
@override @useResult
$Res call({
 Money downPayment, Money loan, MonthlyFigures monthly, Money? cashNeeded, bool withinRules
});


@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res> get loan;@override $MonthlyFiguresCopyWith<$Res> get monthly;@override $MoneyCopyWith<$Res>? get cashNeeded;

}
/// @nodoc
class __$WhatIfStepCopyWithImpl<$Res>
    implements _$WhatIfStepCopyWith<$Res> {
  __$WhatIfStepCopyWithImpl(this._self, this._then);

  final _WhatIfStep _self;
  final $Res Function(_WhatIfStep) _then;

/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downPayment = null,Object? loan = null,Object? monthly = null,Object? cashNeeded = freezed,Object? withinRules = null,}) {
  return _then(_WhatIfStep(
downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,withinRules: null == withinRules ? _self.withinRules : withinRules // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of WhatIfStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of WhatIfStep
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
}
}


/// @nodoc
mixin _$MortgageOption {

 String get loanTypeId; String get label; RateType get rateType; int get fixedYears;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate; MonthlyFigures get monthly; bool get withinRules; Source? get source;
/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MortgageOptionCopyWith<MortgageOption> get copyWith => _$MortgageOptionCopyWithImpl<MortgageOption>(this as MortgageOption, _$identity);

  /// Serializes this MortgageOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MortgageOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MortgageOption&&(identical(other.loanTypeId, _this.loanTypeId) || other.loanTypeId == _this.loanTypeId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.rateType, _this.rateType) || other.rateType == _this.rateType)&&(identical(other.fixedYears, _this.fixedYears) || other.fixedYears == _this.fixedYears)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.withinRules, _this.withinRules) || other.withinRules == _this.withinRules)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MortgageOption;
  return Object.hash(runtimeType,_this.loanTypeId,_this.label,_this.rateType,_this.fixedYears,_this.annualRate,_this.monthly,_this.withinRules,_this.source);
}

@override
String toString() {
  final _this = this as MortgageOption;
  return 'MortgageOption(loanTypeId: ${_this.loanTypeId}, label: ${_this.label}, rateType: ${_this.rateType}, fixedYears: ${_this.fixedYears}, annualRate: ${_this.annualRate}, monthly: ${_this.monthly}, withinRules: ${_this.withinRules}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $MortgageOptionCopyWith<$Res>  {
  factory $MortgageOptionCopyWith(MortgageOption value, $Res Function(MortgageOption) _then) = _$MortgageOptionCopyWithImpl;
@useResult
$Res call({
 String loanTypeId, String label, RateType rateType, int fixedYears,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, MonthlyFigures monthly, bool withinRules, Source? source
});


$MonthlyFiguresCopyWith<$Res> get monthly;$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$MortgageOptionCopyWithImpl<$Res>
    implements $MortgageOptionCopyWith<$Res> {
  _$MortgageOptionCopyWithImpl(this._self, this._then);

  final MortgageOption _self;
  final $Res Function(MortgageOption) _then;

/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loanTypeId = null,Object? label = null,Object? rateType = null,Object? fixedYears = null,Object? annualRate = null,Object? monthly = null,Object? withinRules = null,Object? source = freezed,}) {
  return _then(MortgageOption(
loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,withinRules: null == withinRules ? _self.withinRules : withinRules // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}
/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of MortgageOption
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


/// Adds pattern-matching-related methods to [MortgageOption].
extension MortgageOptionPatterns on MortgageOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MortgageOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MortgageOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MortgageOption value)  $default,){
final _that = this;
switch (_that) {
case _MortgageOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MortgageOption value)?  $default,){
final _that = this;
switch (_that) {
case _MortgageOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  MonthlyFigures monthly,  bool withinRules,  Source? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MortgageOption() when $default != null:
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.monthly,_that.withinRules,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  MonthlyFigures monthly,  bool withinRules,  Source? source)  $default,) {final _that = this;
switch (_that) {
case _MortgageOption():
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.monthly,_that.withinRules,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  MonthlyFigures monthly,  bool withinRules,  Source? source)?  $default,) {final _that = this;
switch (_that) {
case _MortgageOption() when $default != null:
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.monthly,_that.withinRules,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MortgageOption implements MortgageOption {
  const _MortgageOption({required this.loanTypeId, required this.label, required this.rateType, this.fixedYears = 0, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, required this.monthly, required this.withinRules, this.source});
  factory _MortgageOption.fromJson(Map<String, dynamic> json) => _$MortgageOptionFromJson(json);

@override final  String loanTypeId;
@override final  String label;
@override final  RateType rateType;
@override@JsonKey() final  int fixedYears;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override final  MonthlyFigures monthly;
@override final  bool withinRules;
@override final  Source? source;

/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MortgageOptionCopyWith<_MortgageOption> get copyWith => __$MortgageOptionCopyWithImpl<_MortgageOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MortgageOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MortgageOption&&(identical(other.loanTypeId, loanTypeId) || other.loanTypeId == loanTypeId)&&(identical(other.label, label) || other.label == label)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.fixedYears, fixedYears) || other.fixedYears == fixedYears)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.withinRules, withinRules) || other.withinRules == withinRules)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,loanTypeId,label,rateType,fixedYears,annualRate,monthly,withinRules,source);
}

@override
String toString() {
    return 'MortgageOption(loanTypeId: $loanTypeId, label: $label, rateType: $rateType, fixedYears: $fixedYears, annualRate: $annualRate, monthly: $monthly, withinRules: $withinRules, source: $source)';
}


}

/// @nodoc
abstract mixin class _$MortgageOptionCopyWith<$Res> implements $MortgageOptionCopyWith<$Res> {
  factory _$MortgageOptionCopyWith(_MortgageOption value, $Res Function(_MortgageOption) _then) = __$MortgageOptionCopyWithImpl;
@override @useResult
$Res call({
 String loanTypeId, String label, RateType rateType, int fixedYears,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, MonthlyFigures monthly, bool withinRules, Source? source
});


@override $MonthlyFiguresCopyWith<$Res> get monthly;@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$MortgageOptionCopyWithImpl<$Res>
    implements _$MortgageOptionCopyWith<$Res> {
  __$MortgageOptionCopyWithImpl(this._self, this._then);

  final _MortgageOption _self;
  final $Res Function(_MortgageOption) _then;

/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loanTypeId = null,Object? label = null,Object? rateType = null,Object? fixedYears = null,Object? annualRate = null,Object? monthly = null,Object? withinRules = null,Object? source = freezed,}) {
  return _then(_MortgageOption(
loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,withinRules: null == withinRules ? _self.withinRules : withinRules // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}

/// Create a copy of MortgageOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of MortgageOption
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
