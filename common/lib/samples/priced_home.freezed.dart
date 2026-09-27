// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'priced_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PricedHome {

 Listing get listing; HomeCost? get cost;
/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricedHomeCopyWith<PricedHome> get copyWith => _$PricedHomeCopyWithImpl<PricedHome>(this as PricedHome, _$identity);

  /// Serializes this PricedHome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PricedHome;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricedHome&&(identical(other.listing, _this.listing) || other.listing == _this.listing)&&(identical(other.cost, _this.cost) || other.cost == _this.cost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PricedHome;
  return Object.hash(runtimeType,_this.listing,_this.cost);
}

@override
String toString() {
  final _this = this as PricedHome;
  return 'PricedHome(listing: ${_this.listing}, cost: ${_this.cost})';
}


}

/// @nodoc
abstract mixin class $PricedHomeCopyWith<$Res>  {
  factory $PricedHomeCopyWith(PricedHome value, $Res Function(PricedHome) _then) = _$PricedHomeCopyWithImpl;
@useResult
$Res call({
 Listing listing, HomeCost? cost
});


$ListingCopyWith<$Res> get listing;$HomeCostCopyWith<$Res>? get cost;

}
/// @nodoc
class _$PricedHomeCopyWithImpl<$Res>
    implements $PricedHomeCopyWith<$Res> {
  _$PricedHomeCopyWithImpl(this._self, this._then);

  final PricedHome _self;
  final $Res Function(PricedHome) _then;

/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listing = null,Object? cost = freezed,}) {
  return _then(PricedHome(
listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as HomeCost?,
  ));
}
/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res> get listing {
  
  return $ListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCostCopyWith<$Res>? get cost {
    if (_self.cost == null) {
    return null;
  }

  return $HomeCostCopyWith<$Res>(_self.cost!, (value) {
    return _then(_self.copyWith(cost: value));
  });
}
}


/// Adds pattern-matching-related methods to [PricedHome].
extension PricedHomePatterns on PricedHome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricedHome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricedHome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricedHome value)  $default,){
final _that = this;
switch (_that) {
case _PricedHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricedHome value)?  $default,){
final _that = this;
switch (_that) {
case _PricedHome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Listing listing,  HomeCost? cost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricedHome() when $default != null:
return $default(_that.listing,_that.cost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Listing listing,  HomeCost? cost)  $default,) {final _that = this;
switch (_that) {
case _PricedHome():
return $default(_that.listing,_that.cost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Listing listing,  HomeCost? cost)?  $default,) {final _that = this;
switch (_that) {
case _PricedHome() when $default != null:
return $default(_that.listing,_that.cost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PricedHome implements PricedHome {
  const _PricedHome({required this.listing, this.cost});
  factory _PricedHome.fromJson(Map<String, dynamic> json) => _$PricedHomeFromJson(json);

@override final  Listing listing;
@override final  HomeCost? cost;

/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricedHomeCopyWith<_PricedHome> get copyWith => __$PricedHomeCopyWithImpl<_PricedHome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PricedHomeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricedHome&&(identical(other.listing, listing) || other.listing == listing)&&(identical(other.cost, cost) || other.cost == cost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,listing,cost);
}

@override
String toString() {
    return 'PricedHome(listing: $listing, cost: $cost)';
}


}

/// @nodoc
abstract mixin class _$PricedHomeCopyWith<$Res> implements $PricedHomeCopyWith<$Res> {
  factory _$PricedHomeCopyWith(_PricedHome value, $Res Function(_PricedHome) _then) = __$PricedHomeCopyWithImpl;
@override @useResult
$Res call({
 Listing listing, HomeCost? cost
});


@override $ListingCopyWith<$Res> get listing;@override $HomeCostCopyWith<$Res>? get cost;

}
/// @nodoc
class __$PricedHomeCopyWithImpl<$Res>
    implements _$PricedHomeCopyWith<$Res> {
  __$PricedHomeCopyWithImpl(this._self, this._then);

  final _PricedHome _self;
  final $Res Function(_PricedHome) _then;

/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listing = null,Object? cost = freezed,}) {
  return _then(_PricedHome(
listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as HomeCost?,
  ));
}

/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res> get listing {
  
  return $ListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}/// Create a copy of PricedHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCostCopyWith<$Res>? get cost {
    if (_self.cost == null) {
    return null;
  }

  return $HomeCostCopyWith<$Res>(_self.cost!, (value) {
    return _then(_self.copyWith(cost: value));
  });
}
}


/// @nodoc
mixin _$HomeCost {

 Money get downPayment; Money get loan; Money get maxLoan; Money? get cashNeeded; Money? get savings;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate; String get loanType; int get termYears; MonthlyFigures get monthly;
/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCostCopyWith<HomeCost> get copyWith => _$HomeCostCopyWithImpl<HomeCost>(this as HomeCost, _$identity);

  /// Serializes this HomeCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeCost;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCost&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.maxLoan, _this.maxLoan) || other.maxLoan == _this.maxLoan)&&(identical(other.cashNeeded, _this.cashNeeded) || other.cashNeeded == _this.cashNeeded)&&(identical(other.savings, _this.savings) || other.savings == _this.savings)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.loanType, _this.loanType) || other.loanType == _this.loanType)&&(identical(other.termYears, _this.termYears) || other.termYears == _this.termYears)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeCost;
  return Object.hash(runtimeType,_this.downPayment,_this.loan,_this.maxLoan,_this.cashNeeded,_this.savings,_this.annualRate,_this.loanType,_this.termYears,_this.monthly);
}

@override
String toString() {
  final _this = this as HomeCost;
  return 'HomeCost(downPayment: ${_this.downPayment}, loan: ${_this.loan}, maxLoan: ${_this.maxLoan}, cashNeeded: ${_this.cashNeeded}, savings: ${_this.savings}, annualRate: ${_this.annualRate}, loanType: ${_this.loanType}, termYears: ${_this.termYears}, monthly: ${_this.monthly})';
}


}

/// @nodoc
abstract mixin class $HomeCostCopyWith<$Res>  {
  factory $HomeCostCopyWith(HomeCost value, $Res Function(HomeCost) _then) = _$HomeCostCopyWithImpl;
@useResult
$Res call({
 Money downPayment, Money loan, Money maxLoan, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, String loanType, int termYears, MonthlyFigures monthly
});


$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res> get loan;$MoneyCopyWith<$Res> get maxLoan;$MoneyCopyWith<$Res>? get cashNeeded;$MoneyCopyWith<$Res>? get savings;$MonthlyFiguresCopyWith<$Res> get monthly;

}
/// @nodoc
class _$HomeCostCopyWithImpl<$Res>
    implements $HomeCostCopyWith<$Res> {
  _$HomeCostCopyWithImpl(this._self, this._then);

  final HomeCost _self;
  final $Res Function(HomeCost) _then;

/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downPayment = null,Object? loan = null,Object? maxLoan = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? loanType = null,Object? termYears = null,Object? monthly = null,}) {
  return _then(HomeCost(
downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,
  ));
}
/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of HomeCost
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
}/// Create a copy of HomeCost
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
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeCost].
extension HomeCostPatterns on HomeCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCost value)  $default,){
final _that = this;
switch (_that) {
case _HomeCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCost value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money downPayment,  Money loan,  Money maxLoan,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  int termYears,  MonthlyFigures monthly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCost() when $default != null:
return $default(_that.downPayment,_that.loan,_that.maxLoan,_that.cashNeeded,_that.savings,_that.annualRate,_that.loanType,_that.termYears,_that.monthly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money downPayment,  Money loan,  Money maxLoan,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  int termYears,  MonthlyFigures monthly)  $default,) {final _that = this;
switch (_that) {
case _HomeCost():
return $default(_that.downPayment,_that.loan,_that.maxLoan,_that.cashNeeded,_that.savings,_that.annualRate,_that.loanType,_that.termYears,_that.monthly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money downPayment,  Money loan,  Money maxLoan,  Money? cashNeeded,  Money? savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate,  String loanType,  int termYears,  MonthlyFigures monthly)?  $default,) {final _that = this;
switch (_that) {
case _HomeCost() when $default != null:
return $default(_that.downPayment,_that.loan,_that.maxLoan,_that.cashNeeded,_that.savings,_that.annualRate,_that.loanType,_that.termYears,_that.monthly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeCost extends HomeCost {
  const _HomeCost({required this.downPayment, required this.loan, required this.maxLoan, this.cashNeeded, this.savings, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, required this.loanType, required this.termYears, required this.monthly}): super._();
  factory _HomeCost.fromJson(Map<String, dynamic> json) => _$HomeCostFromJson(json);

@override final  Money downPayment;
@override final  Money loan;
@override final  Money maxLoan;
@override final  Money? cashNeeded;
@override final  Money? savings;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override final  String loanType;
@override final  int termYears;
@override final  MonthlyFigures monthly;

/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCostCopyWith<_HomeCost> get copyWith => __$HomeCostCopyWithImpl<_HomeCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeCostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCost&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.loanType, loanType) || other.loanType == loanType)&&(identical(other.termYears, termYears) || other.termYears == termYears)&&(identical(other.monthly, monthly) || other.monthly == monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,downPayment,loan,maxLoan,cashNeeded,savings,annualRate,loanType,termYears,monthly);
}

@override
String toString() {
    return 'HomeCost(downPayment: $downPayment, loan: $loan, maxLoan: $maxLoan, cashNeeded: $cashNeeded, savings: $savings, annualRate: $annualRate, loanType: $loanType, termYears: $termYears, monthly: $monthly)';
}


}

/// @nodoc
abstract mixin class _$HomeCostCopyWith<$Res> implements $HomeCostCopyWith<$Res> {
  factory _$HomeCostCopyWith(_HomeCost value, $Res Function(_HomeCost) _then) = __$HomeCostCopyWithImpl;
@override @useResult
$Res call({
 Money downPayment, Money loan, Money maxLoan, Money? cashNeeded, Money? savings,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate, String loanType, int termYears, MonthlyFigures monthly
});


@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res> get loan;@override $MoneyCopyWith<$Res> get maxLoan;@override $MoneyCopyWith<$Res>? get cashNeeded;@override $MoneyCopyWith<$Res>? get savings;@override $MonthlyFiguresCopyWith<$Res> get monthly;

}
/// @nodoc
class __$HomeCostCopyWithImpl<$Res>
    implements _$HomeCostCopyWith<$Res> {
  __$HomeCostCopyWithImpl(this._self, this._then);

  final _HomeCost _self;
  final $Res Function(_HomeCost) _then;

/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downPayment = null,Object? loan = null,Object? maxLoan = null,Object? cashNeeded = freezed,Object? savings = freezed,Object? annualRate = null,Object? loanType = null,Object? termYears = null,Object? monthly = null,}) {
  return _then(_HomeCost(
downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,cashNeeded: freezed == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,loanType: null == loanType ? _self.loanType : loanType // ignore: cast_nullable_to_non_nullable
as String,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as MonthlyFigures,
  ));
}

/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of HomeCost
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
}/// Create a copy of HomeCost
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
}/// Create a copy of HomeCost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyFiguresCopyWith<$Res> get monthly {
  
  return $MonthlyFiguresCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}
}

// dart format on
