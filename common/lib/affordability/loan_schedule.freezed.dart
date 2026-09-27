// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanYear {

 int get year; Money get balance; Money get equity; Money get interestPaid;
/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanYearCopyWith<LoanYear> get copyWith => _$LoanYearCopyWithImpl<LoanYear>(this as LoanYear, _$identity);

  /// Serializes this LoanYear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoanYear;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanYear&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.equity, _this.equity) || other.equity == _this.equity)&&(identical(other.interestPaid, _this.interestPaid) || other.interestPaid == _this.interestPaid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoanYear;
  return Object.hash(runtimeType,_this.year,_this.balance,_this.equity,_this.interestPaid);
}

@override
String toString() {
  final _this = this as LoanYear;
  return 'LoanYear(year: ${_this.year}, balance: ${_this.balance}, equity: ${_this.equity}, interestPaid: ${_this.interestPaid})';
}


}

/// @nodoc
abstract mixin class $LoanYearCopyWith<$Res>  {
  factory $LoanYearCopyWith(LoanYear value, $Res Function(LoanYear) _then) = _$LoanYearCopyWithImpl;
@useResult
$Res call({
 int year, Money balance, Money equity, Money interestPaid
});


$MoneyCopyWith<$Res> get balance;$MoneyCopyWith<$Res> get equity;$MoneyCopyWith<$Res> get interestPaid;

}
/// @nodoc
class _$LoanYearCopyWithImpl<$Res>
    implements $LoanYearCopyWith<$Res> {
  _$LoanYearCopyWithImpl(this._self, this._then);

  final LoanYear _self;
  final $Res Function(LoanYear) _then;

/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? balance = null,Object? equity = null,Object? interestPaid = null,}) {
  return _then(LoanYear(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Money,equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as Money,interestPaid: null == interestPaid ? _self.interestPaid : interestPaid // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get balance {
  
  return $MoneyCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get equity {
  
  return $MoneyCopyWith<$Res>(_self.equity, (value) {
    return _then(_self.copyWith(equity: value));
  });
}/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interestPaid {
  
  return $MoneyCopyWith<$Res>(_self.interestPaid, (value) {
    return _then(_self.copyWith(interestPaid: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoanYear].
extension LoanYearPatterns on LoanYear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoanYear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoanYear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoanYear value)  $default,){
final _that = this;
switch (_that) {
case _LoanYear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoanYear value)?  $default,){
final _that = this;
switch (_that) {
case _LoanYear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  Money balance,  Money equity,  Money interestPaid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoanYear() when $default != null:
return $default(_that.year,_that.balance,_that.equity,_that.interestPaid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  Money balance,  Money equity,  Money interestPaid)  $default,) {final _that = this;
switch (_that) {
case _LoanYear():
return $default(_that.year,_that.balance,_that.equity,_that.interestPaid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  Money balance,  Money equity,  Money interestPaid)?  $default,) {final _that = this;
switch (_that) {
case _LoanYear() when $default != null:
return $default(_that.year,_that.balance,_that.equity,_that.interestPaid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoanYear implements LoanYear {
  const _LoanYear({required this.year, required this.balance, required this.equity, required this.interestPaid});
  factory _LoanYear.fromJson(Map<String, dynamic> json) => _$LoanYearFromJson(json);

@override final  int year;
@override final  Money balance;
@override final  Money equity;
@override final  Money interestPaid;

/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoanYearCopyWith<_LoanYear> get copyWith => __$LoanYearCopyWithImpl<_LoanYear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoanYearToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoanYear&&(identical(other.year, year) || other.year == year)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.equity, equity) || other.equity == equity)&&(identical(other.interestPaid, interestPaid) || other.interestPaid == interestPaid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,year,balance,equity,interestPaid);
}

@override
String toString() {
    return 'LoanYear(year: $year, balance: $balance, equity: $equity, interestPaid: $interestPaid)';
}


}

/// @nodoc
abstract mixin class _$LoanYearCopyWith<$Res> implements $LoanYearCopyWith<$Res> {
  factory _$LoanYearCopyWith(_LoanYear value, $Res Function(_LoanYear) _then) = __$LoanYearCopyWithImpl;
@override @useResult
$Res call({
 int year, Money balance, Money equity, Money interestPaid
});


@override $MoneyCopyWith<$Res> get balance;@override $MoneyCopyWith<$Res> get equity;@override $MoneyCopyWith<$Res> get interestPaid;

}
/// @nodoc
class __$LoanYearCopyWithImpl<$Res>
    implements _$LoanYearCopyWith<$Res> {
  __$LoanYearCopyWithImpl(this._self, this._then);

  final _LoanYear _self;
  final $Res Function(_LoanYear) _then;

/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? balance = null,Object? equity = null,Object? interestPaid = null,}) {
  return _then(_LoanYear(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Money,equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as Money,interestPaid: null == interestPaid ? _self.interestPaid : interestPaid // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get balance {
  
  return $MoneyCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get equity {
  
  return $MoneyCopyWith<$Res>(_self.equity, (value) {
    return _then(_self.copyWith(equity: value));
  });
}/// Create a copy of LoanYear
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interestPaid {
  
  return $MoneyCopyWith<$Res>(_self.interestPaid, (value) {
    return _then(_self.copyWith(interestPaid: value));
  });
}
}


/// @nodoc
mixin _$AmortizationStep {

 int get year;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate;@JsonKey(name: 'belowSharePpm')@PpmJsonConverter() Rate? get belowShare;
/// Create a copy of AmortizationStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmortizationStepCopyWith<AmortizationStep> get copyWith => _$AmortizationStepCopyWithImpl<AmortizationStep>(this as AmortizationStep, _$identity);

  /// Serializes this AmortizationStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AmortizationStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmortizationStep&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.belowShare, _this.belowShare) || other.belowShare == _this.belowShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AmortizationStep;
  return Object.hash(runtimeType,_this.year,_this.annualRate,_this.belowShare);
}

@override
String toString() {
  final _this = this as AmortizationStep;
  return 'AmortizationStep(year: ${_this.year}, annualRate: ${_this.annualRate}, belowShare: ${_this.belowShare})';
}


}

/// @nodoc
abstract mixin class $AmortizationStepCopyWith<$Res>  {
  factory $AmortizationStepCopyWith(AmortizationStep value, $Res Function(AmortizationStep) _then) = _$AmortizationStepCopyWithImpl;
@useResult
$Res call({
 int year,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate,@JsonKey(name: 'belowSharePpm')@PpmJsonConverter() Rate? belowShare
});




}
/// @nodoc
class _$AmortizationStepCopyWithImpl<$Res>
    implements $AmortizationStepCopyWith<$Res> {
  _$AmortizationStepCopyWithImpl(this._self, this._then);

  final AmortizationStep _self;
  final $Res Function(AmortizationStep) _then;

/// Create a copy of AmortizationStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? annualRate = null,Object? belowShare = freezed,}) {
  return _then(AmortizationStep(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,belowShare: freezed == belowShare ? _self.belowShare : belowShare // ignore: cast_nullable_to_non_nullable
as Rate?,
  ));
}

}


/// Adds pattern-matching-related methods to [AmortizationStep].
extension AmortizationStepPatterns on AmortizationStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmortizationStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmortizationStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmortizationStep value)  $default,){
final _that = this;
switch (_that) {
case _AmortizationStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmortizationStep value)?  $default,){
final _that = this;
switch (_that) {
case _AmortizationStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @JsonKey(name: 'belowSharePpm')@PpmJsonConverter()  Rate? belowShare)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmortizationStep() when $default != null:
return $default(_that.year,_that.annualRate,_that.belowShare);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @JsonKey(name: 'belowSharePpm')@PpmJsonConverter()  Rate? belowShare)  $default,) {final _that = this;
switch (_that) {
case _AmortizationStep():
return $default(_that.year,_that.annualRate,_that.belowShare);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @JsonKey(name: 'belowSharePpm')@PpmJsonConverter()  Rate? belowShare)?  $default,) {final _that = this;
switch (_that) {
case _AmortizationStep() when $default != null:
return $default(_that.year,_that.annualRate,_that.belowShare);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmortizationStep implements AmortizationStep {
  const _AmortizationStep({required this.year, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, @JsonKey(name: 'belowSharePpm')@PpmJsonConverter() this.belowShare});
  factory _AmortizationStep.fromJson(Map<String, dynamic> json) => _$AmortizationStepFromJson(json);

@override final  int year;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override@JsonKey(name: 'belowSharePpm')@PpmJsonConverter() final  Rate? belowShare;

/// Create a copy of AmortizationStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmortizationStepCopyWith<_AmortizationStep> get copyWith => __$AmortizationStepCopyWithImpl<_AmortizationStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmortizationStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmortizationStep&&(identical(other.year, year) || other.year == year)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.belowShare, belowShare) || other.belowShare == belowShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,year,annualRate,belowShare);
}

@override
String toString() {
    return 'AmortizationStep(year: $year, annualRate: $annualRate, belowShare: $belowShare)';
}


}

/// @nodoc
abstract mixin class _$AmortizationStepCopyWith<$Res> implements $AmortizationStepCopyWith<$Res> {
  factory _$AmortizationStepCopyWith(_AmortizationStep value, $Res Function(_AmortizationStep) _then) = __$AmortizationStepCopyWithImpl;
@override @useResult
$Res call({
 int year,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate,@JsonKey(name: 'belowSharePpm')@PpmJsonConverter() Rate? belowShare
});




}
/// @nodoc
class __$AmortizationStepCopyWithImpl<$Res>
    implements _$AmortizationStepCopyWith<$Res> {
  __$AmortizationStepCopyWithImpl(this._self, this._then);

  final _AmortizationStep _self;
  final $Res Function(_AmortizationStep) _then;

/// Create a copy of AmortizationStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? annualRate = null,Object? belowShare = freezed,}) {
  return _then(_AmortizationStep(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,belowShare: freezed == belowShare ? _self.belowShare : belowShare // ignore: cast_nullable_to_non_nullable
as Rate?,
  ));
}


}


/// @nodoc
mixin _$LoanSchedule {

 List<LoanYear> get years; List<AmortizationStep> get steps; int? get paidOffYear;
/// Create a copy of LoanSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanScheduleCopyWith<LoanSchedule> get copyWith => _$LoanScheduleCopyWithImpl<LoanSchedule>(this as LoanSchedule, _$identity);

  /// Serializes this LoanSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoanSchedule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanSchedule&&const DeepCollectionEquality().equals(other.years, _this.years)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&(identical(other.paidOffYear, _this.paidOffYear) || other.paidOffYear == _this.paidOffYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoanSchedule;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.years),const DeepCollectionEquality().hash(_this.steps),_this.paidOffYear);
}

@override
String toString() {
  final _this = this as LoanSchedule;
  return 'LoanSchedule(years: ${_this.years}, steps: ${_this.steps}, paidOffYear: ${_this.paidOffYear})';
}


}

/// @nodoc
abstract mixin class $LoanScheduleCopyWith<$Res>  {
  factory $LoanScheduleCopyWith(LoanSchedule value, $Res Function(LoanSchedule) _then) = _$LoanScheduleCopyWithImpl;
@useResult
$Res call({
 List<LoanYear> years, List<AmortizationStep> steps, int? paidOffYear
});




}
/// @nodoc
class _$LoanScheduleCopyWithImpl<$Res>
    implements $LoanScheduleCopyWith<$Res> {
  _$LoanScheduleCopyWithImpl(this._self, this._then);

  final LoanSchedule _self;
  final $Res Function(LoanSchedule) _then;

/// Create a copy of LoanSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? years = null,Object? steps = null,Object? paidOffYear = freezed,}) {
  return _then(LoanSchedule(
years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as List<LoanYear>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<AmortizationStep>,paidOffYear: freezed == paidOffYear ? _self.paidOffYear : paidOffYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoanSchedule].
extension LoanSchedulePatterns on LoanSchedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoanSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoanSchedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoanSchedule value)  $default,){
final _that = this;
switch (_that) {
case _LoanSchedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoanSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _LoanSchedule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LoanYear> years,  List<AmortizationStep> steps,  int? paidOffYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoanSchedule() when $default != null:
return $default(_that.years,_that.steps,_that.paidOffYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LoanYear> years,  List<AmortizationStep> steps,  int? paidOffYear)  $default,) {final _that = this;
switch (_that) {
case _LoanSchedule():
return $default(_that.years,_that.steps,_that.paidOffYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LoanYear> years,  List<AmortizationStep> steps,  int? paidOffYear)?  $default,) {final _that = this;
switch (_that) {
case _LoanSchedule() when $default != null:
return $default(_that.years,_that.steps,_that.paidOffYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoanSchedule extends LoanSchedule {
  const _LoanSchedule({required  List<LoanYear> years,  List<AmortizationStep> steps = const [], this.paidOffYear}): _years = years,_steps = steps,super._();
  factory _LoanSchedule.fromJson(Map<String, dynamic> json) => _$LoanScheduleFromJson(json);

 final  List<LoanYear> _years;
@override List<LoanYear> get years {
  if (_years is EqualUnmodifiableListView) return _years;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_years);
}

 final  List<AmortizationStep> _steps;
@override@JsonKey() List<AmortizationStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  int? paidOffYear;

/// Create a copy of LoanSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoanScheduleCopyWith<_LoanSchedule> get copyWith => __$LoanScheduleCopyWithImpl<_LoanSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoanScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoanSchedule&&const DeepCollectionEquality().equals(other.years, _years)&&const DeepCollectionEquality().equals(other.steps, _steps)&&(identical(other.paidOffYear, paidOffYear) || other.paidOffYear == paidOffYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_years),const DeepCollectionEquality().hash(_steps),paidOffYear);
}

@override
String toString() {
    return 'LoanSchedule(years: $years, steps: $steps, paidOffYear: $paidOffYear)';
}


}

/// @nodoc
abstract mixin class _$LoanScheduleCopyWith<$Res> implements $LoanScheduleCopyWith<$Res> {
  factory _$LoanScheduleCopyWith(_LoanSchedule value, $Res Function(_LoanSchedule) _then) = __$LoanScheduleCopyWithImpl;
@override @useResult
$Res call({
 List<LoanYear> years, List<AmortizationStep> steps, int? paidOffYear
});




}
/// @nodoc
class __$LoanScheduleCopyWithImpl<$Res>
    implements _$LoanScheduleCopyWith<$Res> {
  __$LoanScheduleCopyWithImpl(this._self, this._then);

  final _LoanSchedule _self;
  final $Res Function(_LoanSchedule) _then;

/// Create a copy of LoanSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? years = null,Object? steps = null,Object? paidOffYear = freezed,}) {
  return _then(_LoanSchedule(
years: null == years ? _self._years : years // ignore: cast_nullable_to_non_nullable
as List<LoanYear>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<AmortizationStep>,paidOffYear: freezed == paidOffYear ? _self.paidOffYear : paidOffYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
