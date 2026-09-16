// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lending_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LendingRules {

 List<LtvLimit> get maxLtv; List<DstiLimit> get maxDsti; List<LtiLimit> get maxLti; List<StressRule> get stress; List<YearsLimit> get maxTermYears; List<YearsLimit> get maxAgeAtMaturity; List<IncomeAdjustment> get incomeAdjustments; List<AmortizationRule> get amortization; List<LeftToLiveOnRule> get leftToLiveOn; List<InterestDeductionRule> get interestDeduction; RepaymentStyle? get repaymentStyle;
/// Create a copy of LendingRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LendingRulesCopyWith<LendingRules> get copyWith => _$LendingRulesCopyWithImpl<LendingRules>(this as LendingRules, _$identity);

  /// Serializes this LendingRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LendingRules;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LendingRules&&const DeepCollectionEquality().equals(other.maxLtv, _this.maxLtv)&&const DeepCollectionEquality().equals(other.maxDsti, _this.maxDsti)&&const DeepCollectionEquality().equals(other.maxLti, _this.maxLti)&&const DeepCollectionEquality().equals(other.stress, _this.stress)&&const DeepCollectionEquality().equals(other.maxTermYears, _this.maxTermYears)&&const DeepCollectionEquality().equals(other.maxAgeAtMaturity, _this.maxAgeAtMaturity)&&const DeepCollectionEquality().equals(other.incomeAdjustments, _this.incomeAdjustments)&&const DeepCollectionEquality().equals(other.amortization, _this.amortization)&&const DeepCollectionEquality().equals(other.leftToLiveOn, _this.leftToLiveOn)&&const DeepCollectionEquality().equals(other.interestDeduction, _this.interestDeduction)&&(identical(other.repaymentStyle, _this.repaymentStyle) || other.repaymentStyle == _this.repaymentStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LendingRules;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.maxLtv),const DeepCollectionEquality().hash(_this.maxDsti),const DeepCollectionEquality().hash(_this.maxLti),const DeepCollectionEquality().hash(_this.stress),const DeepCollectionEquality().hash(_this.maxTermYears),const DeepCollectionEquality().hash(_this.maxAgeAtMaturity),const DeepCollectionEquality().hash(_this.incomeAdjustments),const DeepCollectionEquality().hash(_this.amortization),const DeepCollectionEquality().hash(_this.leftToLiveOn),const DeepCollectionEquality().hash(_this.interestDeduction),_this.repaymentStyle);
}

@override
String toString() {
  final _this = this as LendingRules;
  return 'LendingRules(maxLtv: ${_this.maxLtv}, maxDsti: ${_this.maxDsti}, maxLti: ${_this.maxLti}, stress: ${_this.stress}, maxTermYears: ${_this.maxTermYears}, maxAgeAtMaturity: ${_this.maxAgeAtMaturity}, incomeAdjustments: ${_this.incomeAdjustments}, amortization: ${_this.amortization}, leftToLiveOn: ${_this.leftToLiveOn}, interestDeduction: ${_this.interestDeduction}, repaymentStyle: ${_this.repaymentStyle})';
}


}

/// @nodoc
abstract mixin class $LendingRulesCopyWith<$Res>  {
  factory $LendingRulesCopyWith(LendingRules value, $Res Function(LendingRules) _then) = _$LendingRulesCopyWithImpl;
@useResult
$Res call({
 List<LtvLimit> maxLtv, List<DstiLimit> maxDsti, List<LtiLimit> maxLti, List<StressRule> stress, List<YearsLimit> maxTermYears, List<YearsLimit> maxAgeAtMaturity, List<IncomeAdjustment> incomeAdjustments, List<AmortizationRule> amortization, List<LeftToLiveOnRule> leftToLiveOn, List<InterestDeductionRule> interestDeduction, RepaymentStyle? repaymentStyle
});




}
/// @nodoc
class _$LendingRulesCopyWithImpl<$Res>
    implements $LendingRulesCopyWith<$Res> {
  _$LendingRulesCopyWithImpl(this._self, this._then);

  final LendingRules _self;
  final $Res Function(LendingRules) _then;

/// Create a copy of LendingRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxLtv = null,Object? maxDsti = null,Object? maxLti = null,Object? stress = null,Object? maxTermYears = null,Object? maxAgeAtMaturity = null,Object? incomeAdjustments = null,Object? amortization = null,Object? leftToLiveOn = null,Object? interestDeduction = null,Object? repaymentStyle = freezed,}) {
  return _then(LendingRules(
maxLtv: null == maxLtv ? _self.maxLtv : maxLtv // ignore: cast_nullable_to_non_nullable
as List<LtvLimit>,maxDsti: null == maxDsti ? _self.maxDsti : maxDsti // ignore: cast_nullable_to_non_nullable
as List<DstiLimit>,maxLti: null == maxLti ? _self.maxLti : maxLti // ignore: cast_nullable_to_non_nullable
as List<LtiLimit>,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as List<StressRule>,maxTermYears: null == maxTermYears ? _self.maxTermYears : maxTermYears // ignore: cast_nullable_to_non_nullable
as List<YearsLimit>,maxAgeAtMaturity: null == maxAgeAtMaturity ? _self.maxAgeAtMaturity : maxAgeAtMaturity // ignore: cast_nullable_to_non_nullable
as List<YearsLimit>,incomeAdjustments: null == incomeAdjustments ? _self.incomeAdjustments : incomeAdjustments // ignore: cast_nullable_to_non_nullable
as List<IncomeAdjustment>,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as List<AmortizationRule>,leftToLiveOn: null == leftToLiveOn ? _self.leftToLiveOn : leftToLiveOn // ignore: cast_nullable_to_non_nullable
as List<LeftToLiveOnRule>,interestDeduction: null == interestDeduction ? _self.interestDeduction : interestDeduction // ignore: cast_nullable_to_non_nullable
as List<InterestDeductionRule>,repaymentStyle: freezed == repaymentStyle ? _self.repaymentStyle : repaymentStyle // ignore: cast_nullable_to_non_nullable
as RepaymentStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [LendingRules].
extension LendingRulesPatterns on LendingRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LendingRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LendingRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LendingRules value)  $default,){
final _that = this;
switch (_that) {
case _LendingRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LendingRules value)?  $default,){
final _that = this;
switch (_that) {
case _LendingRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LtvLimit> maxLtv,  List<DstiLimit> maxDsti,  List<LtiLimit> maxLti,  List<StressRule> stress,  List<YearsLimit> maxTermYears,  List<YearsLimit> maxAgeAtMaturity,  List<IncomeAdjustment> incomeAdjustments,  List<AmortizationRule> amortization,  List<LeftToLiveOnRule> leftToLiveOn,  List<InterestDeductionRule> interestDeduction,  RepaymentStyle? repaymentStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LendingRules() when $default != null:
return $default(_that.maxLtv,_that.maxDsti,_that.maxLti,_that.stress,_that.maxTermYears,_that.maxAgeAtMaturity,_that.incomeAdjustments,_that.amortization,_that.leftToLiveOn,_that.interestDeduction,_that.repaymentStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LtvLimit> maxLtv,  List<DstiLimit> maxDsti,  List<LtiLimit> maxLti,  List<StressRule> stress,  List<YearsLimit> maxTermYears,  List<YearsLimit> maxAgeAtMaturity,  List<IncomeAdjustment> incomeAdjustments,  List<AmortizationRule> amortization,  List<LeftToLiveOnRule> leftToLiveOn,  List<InterestDeductionRule> interestDeduction,  RepaymentStyle? repaymentStyle)  $default,) {final _that = this;
switch (_that) {
case _LendingRules():
return $default(_that.maxLtv,_that.maxDsti,_that.maxLti,_that.stress,_that.maxTermYears,_that.maxAgeAtMaturity,_that.incomeAdjustments,_that.amortization,_that.leftToLiveOn,_that.interestDeduction,_that.repaymentStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LtvLimit> maxLtv,  List<DstiLimit> maxDsti,  List<LtiLimit> maxLti,  List<StressRule> stress,  List<YearsLimit> maxTermYears,  List<YearsLimit> maxAgeAtMaturity,  List<IncomeAdjustment> incomeAdjustments,  List<AmortizationRule> amortization,  List<LeftToLiveOnRule> leftToLiveOn,  List<InterestDeductionRule> interestDeduction,  RepaymentStyle? repaymentStyle)?  $default,) {final _that = this;
switch (_that) {
case _LendingRules() when $default != null:
return $default(_that.maxLtv,_that.maxDsti,_that.maxLti,_that.stress,_that.maxTermYears,_that.maxAgeAtMaturity,_that.incomeAdjustments,_that.amortization,_that.leftToLiveOn,_that.interestDeduction,_that.repaymentStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LendingRules implements LendingRules {
  const _LendingRules({ List<LtvLimit> maxLtv = const [],  List<DstiLimit> maxDsti = const [],  List<LtiLimit> maxLti = const [],  List<StressRule> stress = const [],  List<YearsLimit> maxTermYears = const [],  List<YearsLimit> maxAgeAtMaturity = const [],  List<IncomeAdjustment> incomeAdjustments = const [],  List<AmortizationRule> amortization = const [],  List<LeftToLiveOnRule> leftToLiveOn = const [],  List<InterestDeductionRule> interestDeduction = const [], this.repaymentStyle}): _maxLtv = maxLtv,_maxDsti = maxDsti,_maxLti = maxLti,_stress = stress,_maxTermYears = maxTermYears,_maxAgeAtMaturity = maxAgeAtMaturity,_incomeAdjustments = incomeAdjustments,_amortization = amortization,_leftToLiveOn = leftToLiveOn,_interestDeduction = interestDeduction;
  factory _LendingRules.fromJson(Map<String, dynamic> json) => _$LendingRulesFromJson(json);

 final  List<LtvLimit> _maxLtv;
@override@JsonKey() List<LtvLimit> get maxLtv {
  if (_maxLtv is EqualUnmodifiableListView) return _maxLtv;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxLtv);
}

 final  List<DstiLimit> _maxDsti;
@override@JsonKey() List<DstiLimit> get maxDsti {
  if (_maxDsti is EqualUnmodifiableListView) return _maxDsti;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxDsti);
}

 final  List<LtiLimit> _maxLti;
@override@JsonKey() List<LtiLimit> get maxLti {
  if (_maxLti is EqualUnmodifiableListView) return _maxLti;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxLti);
}

 final  List<StressRule> _stress;
@override@JsonKey() List<StressRule> get stress {
  if (_stress is EqualUnmodifiableListView) return _stress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stress);
}

 final  List<YearsLimit> _maxTermYears;
@override@JsonKey() List<YearsLimit> get maxTermYears {
  if (_maxTermYears is EqualUnmodifiableListView) return _maxTermYears;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxTermYears);
}

 final  List<YearsLimit> _maxAgeAtMaturity;
@override@JsonKey() List<YearsLimit> get maxAgeAtMaturity {
  if (_maxAgeAtMaturity is EqualUnmodifiableListView) return _maxAgeAtMaturity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxAgeAtMaturity);
}

 final  List<IncomeAdjustment> _incomeAdjustments;
@override@JsonKey() List<IncomeAdjustment> get incomeAdjustments {
  if (_incomeAdjustments is EqualUnmodifiableListView) return _incomeAdjustments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomeAdjustments);
}

 final  List<AmortizationRule> _amortization;
@override@JsonKey() List<AmortizationRule> get amortization {
  if (_amortization is EqualUnmodifiableListView) return _amortization;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amortization);
}

 final  List<LeftToLiveOnRule> _leftToLiveOn;
@override@JsonKey() List<LeftToLiveOnRule> get leftToLiveOn {
  if (_leftToLiveOn is EqualUnmodifiableListView) return _leftToLiveOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leftToLiveOn);
}

 final  List<InterestDeductionRule> _interestDeduction;
@override@JsonKey() List<InterestDeductionRule> get interestDeduction {
  if (_interestDeduction is EqualUnmodifiableListView) return _interestDeduction;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestDeduction);
}

@override final  RepaymentStyle? repaymentStyle;

/// Create a copy of LendingRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LendingRulesCopyWith<_LendingRules> get copyWith => __$LendingRulesCopyWithImpl<_LendingRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LendingRulesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LendingRules&&const DeepCollectionEquality().equals(other.maxLtv, _maxLtv)&&const DeepCollectionEquality().equals(other.maxDsti, _maxDsti)&&const DeepCollectionEquality().equals(other.maxLti, _maxLti)&&const DeepCollectionEquality().equals(other.stress, _stress)&&const DeepCollectionEquality().equals(other.maxTermYears, _maxTermYears)&&const DeepCollectionEquality().equals(other.maxAgeAtMaturity, _maxAgeAtMaturity)&&const DeepCollectionEquality().equals(other.incomeAdjustments, _incomeAdjustments)&&const DeepCollectionEquality().equals(other.amortization, _amortization)&&const DeepCollectionEquality().equals(other.leftToLiveOn, _leftToLiveOn)&&const DeepCollectionEquality().equals(other.interestDeduction, _interestDeduction)&&(identical(other.repaymentStyle, repaymentStyle) || other.repaymentStyle == repaymentStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_maxLtv),const DeepCollectionEquality().hash(_maxDsti),const DeepCollectionEquality().hash(_maxLti),const DeepCollectionEquality().hash(_stress),const DeepCollectionEquality().hash(_maxTermYears),const DeepCollectionEquality().hash(_maxAgeAtMaturity),const DeepCollectionEquality().hash(_incomeAdjustments),const DeepCollectionEquality().hash(_amortization),const DeepCollectionEquality().hash(_leftToLiveOn),const DeepCollectionEquality().hash(_interestDeduction),repaymentStyle);
}

@override
String toString() {
    return 'LendingRules(maxLtv: $maxLtv, maxDsti: $maxDsti, maxLti: $maxLti, stress: $stress, maxTermYears: $maxTermYears, maxAgeAtMaturity: $maxAgeAtMaturity, incomeAdjustments: $incomeAdjustments, amortization: $amortization, leftToLiveOn: $leftToLiveOn, interestDeduction: $interestDeduction, repaymentStyle: $repaymentStyle)';
}


}

/// @nodoc
abstract mixin class _$LendingRulesCopyWith<$Res> implements $LendingRulesCopyWith<$Res> {
  factory _$LendingRulesCopyWith(_LendingRules value, $Res Function(_LendingRules) _then) = __$LendingRulesCopyWithImpl;
@override @useResult
$Res call({
 List<LtvLimit> maxLtv, List<DstiLimit> maxDsti, List<LtiLimit> maxLti, List<StressRule> stress, List<YearsLimit> maxTermYears, List<YearsLimit> maxAgeAtMaturity, List<IncomeAdjustment> incomeAdjustments, List<AmortizationRule> amortization, List<LeftToLiveOnRule> leftToLiveOn, List<InterestDeductionRule> interestDeduction, RepaymentStyle? repaymentStyle
});




}
/// @nodoc
class __$LendingRulesCopyWithImpl<$Res>
    implements _$LendingRulesCopyWith<$Res> {
  __$LendingRulesCopyWithImpl(this._self, this._then);

  final _LendingRules _self;
  final $Res Function(_LendingRules) _then;

/// Create a copy of LendingRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxLtv = null,Object? maxDsti = null,Object? maxLti = null,Object? stress = null,Object? maxTermYears = null,Object? maxAgeAtMaturity = null,Object? incomeAdjustments = null,Object? amortization = null,Object? leftToLiveOn = null,Object? interestDeduction = null,Object? repaymentStyle = freezed,}) {
  return _then(_LendingRules(
maxLtv: null == maxLtv ? _self._maxLtv : maxLtv // ignore: cast_nullable_to_non_nullable
as List<LtvLimit>,maxDsti: null == maxDsti ? _self._maxDsti : maxDsti // ignore: cast_nullable_to_non_nullable
as List<DstiLimit>,maxLti: null == maxLti ? _self._maxLti : maxLti // ignore: cast_nullable_to_non_nullable
as List<LtiLimit>,stress: null == stress ? _self._stress : stress // ignore: cast_nullable_to_non_nullable
as List<StressRule>,maxTermYears: null == maxTermYears ? _self._maxTermYears : maxTermYears // ignore: cast_nullable_to_non_nullable
as List<YearsLimit>,maxAgeAtMaturity: null == maxAgeAtMaturity ? _self._maxAgeAtMaturity : maxAgeAtMaturity // ignore: cast_nullable_to_non_nullable
as List<YearsLimit>,incomeAdjustments: null == incomeAdjustments ? _self._incomeAdjustments : incomeAdjustments // ignore: cast_nullable_to_non_nullable
as List<IncomeAdjustment>,amortization: null == amortization ? _self._amortization : amortization // ignore: cast_nullable_to_non_nullable
as List<AmortizationRule>,leftToLiveOn: null == leftToLiveOn ? _self._leftToLiveOn : leftToLiveOn // ignore: cast_nullable_to_non_nullable
as List<LeftToLiveOnRule>,interestDeduction: null == interestDeduction ? _self._interestDeduction : interestDeduction // ignore: cast_nullable_to_non_nullable
as List<InterestDeductionRule>,repaymentStyle: freezed == repaymentStyle ? _self.repaymentStyle : repaymentStyle // ignore: cast_nullable_to_non_nullable
as RepaymentStyle?,
  ));
}


}

// dart format on
