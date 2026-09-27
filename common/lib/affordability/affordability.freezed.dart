// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affordability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Affordability {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Affordability);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Affordability()';
}


}

/// @nodoc
class $AffordabilityCopyWith<$Res>  {
$AffordabilityCopyWith(Affordability _, $Res Function(Affordability) __);
}


/// Adds pattern-matching-related methods to [Affordability].
extension AffordabilityPatterns on Affordability {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IncompleteAffordability value)?  incomplete,TResult Function( AssessedAffordability value)?  assessed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IncompleteAffordability() when incomplete != null:
return incomplete(_that);case AssessedAffordability() when assessed != null:
return assessed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IncompleteAffordability value)  incomplete,required TResult Function( AssessedAffordability value)  assessed,}){
final _that = this;
switch (_that) {
case IncompleteAffordability():
return incomplete(_that);case AssessedAffordability():
return assessed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IncompleteAffordability value)?  incomplete,TResult? Function( AssessedAffordability value)?  assessed,}){
final _that = this;
switch (_that) {
case IncompleteAffordability() when incomplete != null:
return incomplete(_that);case AssessedAffordability() when assessed != null:
return assessed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Set<ProfileField> missing,  Set<Currency> unconvertedCurrencies)?  incomplete,TResult Function( Money loan,  Rate annualRate,  MonthlyPayment payment,  Money? paymentAfterDeduction,  List<ConstraintCheck> checks,  ConstraintCheck? binding,  Money maxLoan,  DownPaymentBounds downPaymentBounds)?  assessed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IncompleteAffordability() when incomplete != null:
return incomplete(_that.missing,_that.unconvertedCurrencies);case AssessedAffordability() when assessed != null:
return assessed(_that.loan,_that.annualRate,_that.payment,_that.paymentAfterDeduction,_that.checks,_that.binding,_that.maxLoan,_that.downPaymentBounds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Set<ProfileField> missing,  Set<Currency> unconvertedCurrencies)  incomplete,required TResult Function( Money loan,  Rate annualRate,  MonthlyPayment payment,  Money? paymentAfterDeduction,  List<ConstraintCheck> checks,  ConstraintCheck? binding,  Money maxLoan,  DownPaymentBounds downPaymentBounds)  assessed,}) {final _that = this;
switch (_that) {
case IncompleteAffordability():
return incomplete(_that.missing,_that.unconvertedCurrencies);case AssessedAffordability():
return assessed(_that.loan,_that.annualRate,_that.payment,_that.paymentAfterDeduction,_that.checks,_that.binding,_that.maxLoan,_that.downPaymentBounds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Set<ProfileField> missing,  Set<Currency> unconvertedCurrencies)?  incomplete,TResult? Function( Money loan,  Rate annualRate,  MonthlyPayment payment,  Money? paymentAfterDeduction,  List<ConstraintCheck> checks,  ConstraintCheck? binding,  Money maxLoan,  DownPaymentBounds downPaymentBounds)?  assessed,}) {final _that = this;
switch (_that) {
case IncompleteAffordability() when incomplete != null:
return incomplete(_that.missing,_that.unconvertedCurrencies);case AssessedAffordability() when assessed != null:
return assessed(_that.loan,_that.annualRate,_that.payment,_that.paymentAfterDeduction,_that.checks,_that.binding,_that.maxLoan,_that.downPaymentBounds);case _:
  return null;

}
}

}

/// @nodoc


class IncompleteAffordability implements Affordability {
  const IncompleteAffordability({required  Set<ProfileField> missing, required  Set<Currency> unconvertedCurrencies}): _missing = missing,_unconvertedCurrencies = unconvertedCurrencies;
  

 final  Set<ProfileField> _missing;
 Set<ProfileField> get missing {
  if (_missing is EqualUnmodifiableSetView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missing);
}

 final  Set<Currency> _unconvertedCurrencies;
 Set<Currency> get unconvertedCurrencies {
  if (_unconvertedCurrencies is EqualUnmodifiableSetView) return _unconvertedCurrencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unconvertedCurrencies);
}


/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncompleteAffordabilityCopyWith<IncompleteAffordability> get copyWith => _$IncompleteAffordabilityCopyWithImpl<IncompleteAffordability>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IncompleteAffordability&&const DeepCollectionEquality().equals(other.missing, _missing)&&const DeepCollectionEquality().equals(other.unconvertedCurrencies, _unconvertedCurrencies));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_missing),const DeepCollectionEquality().hash(_unconvertedCurrencies));
}

@override
String toString() {
    return 'Affordability.incomplete(missing: $missing, unconvertedCurrencies: $unconvertedCurrencies)';
}


}

/// @nodoc
abstract mixin class $IncompleteAffordabilityCopyWith<$Res> implements $AffordabilityCopyWith<$Res> {
  factory $IncompleteAffordabilityCopyWith(IncompleteAffordability value, $Res Function(IncompleteAffordability) _then) = _$IncompleteAffordabilityCopyWithImpl;
@useResult
$Res call({
 Set<ProfileField> missing, Set<Currency> unconvertedCurrencies
});




}
/// @nodoc
class _$IncompleteAffordabilityCopyWithImpl<$Res>
    implements $IncompleteAffordabilityCopyWith<$Res> {
  _$IncompleteAffordabilityCopyWithImpl(this._self, this._then);

  final IncompleteAffordability _self;
  final $Res Function(IncompleteAffordability) _then;

/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? missing = null,Object? unconvertedCurrencies = null,}) {
  return _then(IncompleteAffordability(
missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,unconvertedCurrencies: null == unconvertedCurrencies ? _self._unconvertedCurrencies : unconvertedCurrencies // ignore: cast_nullable_to_non_nullable
as Set<Currency>,
  ));
}


}

/// @nodoc


class AssessedAffordability implements Affordability {
  const AssessedAffordability({required this.loan, required this.annualRate, required this.payment, this.paymentAfterDeduction, required  List<ConstraintCheck> checks, this.binding, required this.maxLoan, required this.downPaymentBounds}): _checks = checks;
  

 final  Money loan;
 final  Rate annualRate;
 final  MonthlyPayment payment;
 final  Money? paymentAfterDeduction;
 final  List<ConstraintCheck> _checks;
 List<ConstraintCheck> get checks {
  if (_checks is EqualUnmodifiableListView) return _checks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checks);
}

 final  ConstraintCheck? binding;
 final  Money maxLoan;
 final  DownPaymentBounds downPaymentBounds;

/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessedAffordabilityCopyWith<AssessedAffordability> get copyWith => _$AssessedAffordabilityCopyWithImpl<AssessedAffordability>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessedAffordability&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.paymentAfterDeduction, paymentAfterDeduction) || other.paymentAfterDeduction == paymentAfterDeduction)&&const DeepCollectionEquality().equals(other.checks, _checks)&&(identical(other.binding, binding) || other.binding == binding)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.downPaymentBounds, downPaymentBounds) || other.downPaymentBounds == downPaymentBounds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,loan,annualRate,payment,paymentAfterDeduction,const DeepCollectionEquality().hash(_checks),binding,maxLoan,downPaymentBounds);
}

@override
String toString() {
    return 'Affordability.assessed(loan: $loan, annualRate: $annualRate, payment: $payment, paymentAfterDeduction: $paymentAfterDeduction, checks: $checks, binding: $binding, maxLoan: $maxLoan, downPaymentBounds: $downPaymentBounds)';
}


}

/// @nodoc
abstract mixin class $AssessedAffordabilityCopyWith<$Res> implements $AffordabilityCopyWith<$Res> {
  factory $AssessedAffordabilityCopyWith(AssessedAffordability value, $Res Function(AssessedAffordability) _then) = _$AssessedAffordabilityCopyWithImpl;
@useResult
$Res call({
 Money loan, Rate annualRate, MonthlyPayment payment, Money? paymentAfterDeduction, List<ConstraintCheck> checks, ConstraintCheck? binding, Money maxLoan, DownPaymentBounds downPaymentBounds
});


$MoneyCopyWith<$Res> get loan;$MonthlyPaymentCopyWith<$Res> get payment;$MoneyCopyWith<$Res>? get paymentAfterDeduction;$ConstraintCheckCopyWith<$Res>? get binding;$MoneyCopyWith<$Res> get maxLoan;$DownPaymentBoundsCopyWith<$Res> get downPaymentBounds;

}
/// @nodoc
class _$AssessedAffordabilityCopyWithImpl<$Res>
    implements $AssessedAffordabilityCopyWith<$Res> {
  _$AssessedAffordabilityCopyWithImpl(this._self, this._then);

  final AssessedAffordability _self;
  final $Res Function(AssessedAffordability) _then;

/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? loan = null,Object? annualRate = null,Object? payment = null,Object? paymentAfterDeduction = freezed,Object? checks = null,Object? binding = freezed,Object? maxLoan = null,Object? downPaymentBounds = null,}) {
  return _then(AssessedAffordability(
loan: null == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Money,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as MonthlyPayment,paymentAfterDeduction: freezed == paymentAfterDeduction ? _self.paymentAfterDeduction : paymentAfterDeduction // ignore: cast_nullable_to_non_nullable
as Money?,checks: null == checks ? _self._checks : checks // ignore: cast_nullable_to_non_nullable
as List<ConstraintCheck>,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as ConstraintCheck?,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,downPaymentBounds: null == downPaymentBounds ? _self.downPaymentBounds : downPaymentBounds // ignore: cast_nullable_to_non_nullable
as DownPaymentBounds,
  ));
}

/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get loan {
  
  return $MoneyCopyWith<$Res>(_self.loan, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthlyPaymentCopyWith<$Res> get payment {
  
  return $MonthlyPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get paymentAfterDeduction {
    if (_self.paymentAfterDeduction == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.paymentAfterDeduction!, (value) {
    return _then(_self.copyWith(paymentAfterDeduction: value));
  });
}/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstraintCheckCopyWith<$Res>? get binding {
    if (_self.binding == null) {
    return null;
  }

  return $ConstraintCheckCopyWith<$Res>(_self.binding!, (value) {
    return _then(_self.copyWith(binding: value));
  });
}/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of Affordability
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownPaymentBoundsCopyWith<$Res> get downPaymentBounds {
  
  return $DownPaymentBoundsCopyWith<$Res>(_self.downPaymentBounds, (value) {
    return _then(_self.copyWith(downPaymentBounds: value));
  });
}
}

// dart format on
