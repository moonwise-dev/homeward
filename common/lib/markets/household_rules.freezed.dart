// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeftToLiveOnRule {

 String get id; BuyerPredicate? get appliesTo;@PercentJsonConverter() Rate get stressRate; RateRange? get typicalRange;@ExactDecimalJsonConverter() ExactDecimal get runningCostsMonthly;@ExactDecimalJsonConverter() ExactDecimal get transportMonthlyPerAdult; String get sourceId;
/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeftToLiveOnRuleCopyWith<LeftToLiveOnRule> get copyWith => _$LeftToLiveOnRuleCopyWithImpl<LeftToLiveOnRule>(this as LeftToLiveOnRule, _$identity);

  /// Serializes this LeftToLiveOnRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeftToLiveOnRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeftToLiveOnRule&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.stressRate, _this.stressRate) || other.stressRate == _this.stressRate)&&(identical(other.typicalRange, _this.typicalRange) || other.typicalRange == _this.typicalRange)&&(identical(other.runningCostsMonthly, _this.runningCostsMonthly) || other.runningCostsMonthly == _this.runningCostsMonthly)&&(identical(other.transportMonthlyPerAdult, _this.transportMonthlyPerAdult) || other.transportMonthlyPerAdult == _this.transportMonthlyPerAdult)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeftToLiveOnRule;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.stressRate,_this.typicalRange,_this.runningCostsMonthly,_this.transportMonthlyPerAdult,_this.sourceId);
}

@override
String toString() {
  final _this = this as LeftToLiveOnRule;
  return 'LeftToLiveOnRule(id: ${_this.id}, appliesTo: ${_this.appliesTo}, stressRate: ${_this.stressRate}, typicalRange: ${_this.typicalRange}, runningCostsMonthly: ${_this.runningCostsMonthly}, transportMonthlyPerAdult: ${_this.transportMonthlyPerAdult}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $LeftToLiveOnRuleCopyWith<$Res>  {
  factory $LeftToLiveOnRuleCopyWith(LeftToLiveOnRule value, $Res Function(LeftToLiveOnRule) _then) = _$LeftToLiveOnRuleCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate stressRate, RateRange? typicalRange,@ExactDecimalJsonConverter() ExactDecimal runningCostsMonthly,@ExactDecimalJsonConverter() ExactDecimal transportMonthlyPerAdult, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;$RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class _$LeftToLiveOnRuleCopyWithImpl<$Res>
    implements $LeftToLiveOnRuleCopyWith<$Res> {
  _$LeftToLiveOnRuleCopyWithImpl(this._self, this._then);

  final LeftToLiveOnRule _self;
  final $Res Function(LeftToLiveOnRule) _then;

/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? stressRate = null,Object? typicalRange = freezed,Object? runningCostsMonthly = null,Object? transportMonthlyPerAdult = null,Object? sourceId = null,}) {
  return _then(LeftToLiveOnRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,stressRate: null == stressRate ? _self.stressRate : stressRate // ignore: cast_nullable_to_non_nullable
as Rate,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,runningCostsMonthly: null == runningCostsMonthly ? _self.runningCostsMonthly : runningCostsMonthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,transportMonthlyPerAdult: null == transportMonthlyPerAdult ? _self.transportMonthlyPerAdult : transportMonthlyPerAdult // ignore: cast_nullable_to_non_nullable
as ExactDecimal,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [LeftToLiveOnRule].
extension LeftToLiveOnRulePatterns on LeftToLiveOnRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeftToLiveOnRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeftToLiveOnRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeftToLiveOnRule value)  $default,){
final _that = this;
switch (_that) {
case _LeftToLiveOnRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeftToLiveOnRule value)?  $default,){
final _that = this;
switch (_that) {
case _LeftToLiveOnRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate stressRate,  RateRange? typicalRange, @ExactDecimalJsonConverter()  ExactDecimal runningCostsMonthly, @ExactDecimalJsonConverter()  ExactDecimal transportMonthlyPerAdult,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeftToLiveOnRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.stressRate,_that.typicalRange,_that.runningCostsMonthly,_that.transportMonthlyPerAdult,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate stressRate,  RateRange? typicalRange, @ExactDecimalJsonConverter()  ExactDecimal runningCostsMonthly, @ExactDecimalJsonConverter()  ExactDecimal transportMonthlyPerAdult,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _LeftToLiveOnRule():
return $default(_that.id,_that.appliesTo,_that.stressRate,_that.typicalRange,_that.runningCostsMonthly,_that.transportMonthlyPerAdult,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate stressRate,  RateRange? typicalRange, @ExactDecimalJsonConverter()  ExactDecimal runningCostsMonthly, @ExactDecimalJsonConverter()  ExactDecimal transportMonthlyPerAdult,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _LeftToLiveOnRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.stressRate,_that.typicalRange,_that.runningCostsMonthly,_that.transportMonthlyPerAdult,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeftToLiveOnRule implements LeftToLiveOnRule {
  const _LeftToLiveOnRule({required this.id, this.appliesTo, @PercentJsonConverter() required this.stressRate, this.typicalRange, @ExactDecimalJsonConverter() required this.runningCostsMonthly, @ExactDecimalJsonConverter() required this.transportMonthlyPerAdult, required this.sourceId});
  factory _LeftToLiveOnRule.fromJson(Map<String, dynamic> json) => _$LeftToLiveOnRuleFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override@PercentJsonConverter() final  Rate stressRate;
@override final  RateRange? typicalRange;
@override@ExactDecimalJsonConverter() final  ExactDecimal runningCostsMonthly;
@override@ExactDecimalJsonConverter() final  ExactDecimal transportMonthlyPerAdult;
@override final  String sourceId;

/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeftToLiveOnRuleCopyWith<_LeftToLiveOnRule> get copyWith => __$LeftToLiveOnRuleCopyWithImpl<_LeftToLiveOnRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeftToLiveOnRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeftToLiveOnRule&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.stressRate, stressRate) || other.stressRate == stressRate)&&(identical(other.typicalRange, typicalRange) || other.typicalRange == typicalRange)&&(identical(other.runningCostsMonthly, runningCostsMonthly) || other.runningCostsMonthly == runningCostsMonthly)&&(identical(other.transportMonthlyPerAdult, transportMonthlyPerAdult) || other.transportMonthlyPerAdult == transportMonthlyPerAdult)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,stressRate,typicalRange,runningCostsMonthly,transportMonthlyPerAdult,sourceId);
}

@override
String toString() {
    return 'LeftToLiveOnRule(id: $id, appliesTo: $appliesTo, stressRate: $stressRate, typicalRange: $typicalRange, runningCostsMonthly: $runningCostsMonthly, transportMonthlyPerAdult: $transportMonthlyPerAdult, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$LeftToLiveOnRuleCopyWith<$Res> implements $LeftToLiveOnRuleCopyWith<$Res> {
  factory _$LeftToLiveOnRuleCopyWith(_LeftToLiveOnRule value, $Res Function(_LeftToLiveOnRule) _then) = __$LeftToLiveOnRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate stressRate, RateRange? typicalRange,@ExactDecimalJsonConverter() ExactDecimal runningCostsMonthly,@ExactDecimalJsonConverter() ExactDecimal transportMonthlyPerAdult, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;@override $RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class __$LeftToLiveOnRuleCopyWithImpl<$Res>
    implements _$LeftToLiveOnRuleCopyWith<$Res> {
  __$LeftToLiveOnRuleCopyWithImpl(this._self, this._then);

  final _LeftToLiveOnRule _self;
  final $Res Function(_LeftToLiveOnRule) _then;

/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? stressRate = null,Object? typicalRange = freezed,Object? runningCostsMonthly = null,Object? transportMonthlyPerAdult = null,Object? sourceId = null,}) {
  return _then(_LeftToLiveOnRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,stressRate: null == stressRate ? _self.stressRate : stressRate // ignore: cast_nullable_to_non_nullable
as Rate,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,runningCostsMonthly: null == runningCostsMonthly ? _self.runningCostsMonthly : runningCostsMonthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,transportMonthlyPerAdult: null == transportMonthlyPerAdult ? _self.transportMonthlyPerAdult : transportMonthlyPerAdult // ignore: cast_nullable_to_non_nullable
as ExactDecimal,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LeftToLiveOnRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// @nodoc
mixin _$InterestDeductionRule {

 String get id; BuyerPredicate? get appliesTo; List<BracketRule> get yearlyBrackets; bool get perBorrower; String get sourceId;
/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterestDeductionRuleCopyWith<InterestDeductionRule> get copyWith => _$InterestDeductionRuleCopyWithImpl<InterestDeductionRule>(this as InterestDeductionRule, _$identity);

  /// Serializes this InterestDeductionRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InterestDeductionRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterestDeductionRule&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&const DeepCollectionEquality().equals(other.yearlyBrackets, _this.yearlyBrackets)&&(identical(other.perBorrower, _this.perBorrower) || other.perBorrower == _this.perBorrower)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InterestDeductionRule;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,const DeepCollectionEquality().hash(_this.yearlyBrackets),_this.perBorrower,_this.sourceId);
}

@override
String toString() {
  final _this = this as InterestDeductionRule;
  return 'InterestDeductionRule(id: ${_this.id}, appliesTo: ${_this.appliesTo}, yearlyBrackets: ${_this.yearlyBrackets}, perBorrower: ${_this.perBorrower}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $InterestDeductionRuleCopyWith<$Res>  {
  factory $InterestDeductionRuleCopyWith(InterestDeductionRule value, $Res Function(InterestDeductionRule) _then) = _$InterestDeductionRuleCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo, List<BracketRule> yearlyBrackets, bool perBorrower, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$InterestDeductionRuleCopyWithImpl<$Res>
    implements $InterestDeductionRuleCopyWith<$Res> {
  _$InterestDeductionRuleCopyWithImpl(this._self, this._then);

  final InterestDeductionRule _self;
  final $Res Function(InterestDeductionRule) _then;

/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? yearlyBrackets = null,Object? perBorrower = null,Object? sourceId = null,}) {
  return _then(InterestDeductionRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,yearlyBrackets: null == yearlyBrackets ? _self.yearlyBrackets : yearlyBrackets // ignore: cast_nullable_to_non_nullable
as List<BracketRule>,perBorrower: null == perBorrower ? _self.perBorrower : perBorrower // ignore: cast_nullable_to_non_nullable
as bool,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [InterestDeductionRule].
extension InterestDeductionRulePatterns on InterestDeductionRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterestDeductionRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterestDeductionRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterestDeductionRule value)  $default,){
final _that = this;
switch (_that) {
case _InterestDeductionRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterestDeductionRule value)?  $default,){
final _that = this;
switch (_that) {
case _InterestDeductionRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  List<BracketRule> yearlyBrackets,  bool perBorrower,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterestDeductionRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.yearlyBrackets,_that.perBorrower,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  List<BracketRule> yearlyBrackets,  bool perBorrower,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _InterestDeductionRule():
return $default(_that.id,_that.appliesTo,_that.yearlyBrackets,_that.perBorrower,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo,  List<BracketRule> yearlyBrackets,  bool perBorrower,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _InterestDeductionRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.yearlyBrackets,_that.perBorrower,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterestDeductionRule implements InterestDeductionRule {
  const _InterestDeductionRule({required this.id, this.appliesTo, required  List<BracketRule> yearlyBrackets, required this.perBorrower, required this.sourceId}): _yearlyBrackets = yearlyBrackets;
  factory _InterestDeductionRule.fromJson(Map<String, dynamic> json) => _$InterestDeductionRuleFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
 final  List<BracketRule> _yearlyBrackets;
@override List<BracketRule> get yearlyBrackets {
  if (_yearlyBrackets is EqualUnmodifiableListView) return _yearlyBrackets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_yearlyBrackets);
}

@override final  bool perBorrower;
@override final  String sourceId;

/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterestDeductionRuleCopyWith<_InterestDeductionRule> get copyWith => __$InterestDeductionRuleCopyWithImpl<_InterestDeductionRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterestDeductionRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterestDeductionRule&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&const DeepCollectionEquality().equals(other.yearlyBrackets, _yearlyBrackets)&&(identical(other.perBorrower, perBorrower) || other.perBorrower == perBorrower)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,const DeepCollectionEquality().hash(_yearlyBrackets),perBorrower,sourceId);
}

@override
String toString() {
    return 'InterestDeductionRule(id: $id, appliesTo: $appliesTo, yearlyBrackets: $yearlyBrackets, perBorrower: $perBorrower, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$InterestDeductionRuleCopyWith<$Res> implements $InterestDeductionRuleCopyWith<$Res> {
  factory _$InterestDeductionRuleCopyWith(_InterestDeductionRule value, $Res Function(_InterestDeductionRule) _then) = __$InterestDeductionRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo, List<BracketRule> yearlyBrackets, bool perBorrower, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$InterestDeductionRuleCopyWithImpl<$Res>
    implements _$InterestDeductionRuleCopyWith<$Res> {
  __$InterestDeductionRuleCopyWithImpl(this._self, this._then);

  final _InterestDeductionRule _self;
  final $Res Function(_InterestDeductionRule) _then;

/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? yearlyBrackets = null,Object? perBorrower = null,Object? sourceId = null,}) {
  return _then(_InterestDeductionRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,yearlyBrackets: null == yearlyBrackets ? _self._yearlyBrackets : yearlyBrackets // ignore: cast_nullable_to_non_nullable
as List<BracketRule>,perBorrower: null == perBorrower ? _self.perBorrower : perBorrower // ignore: cast_nullable_to_non_nullable
as bool,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of InterestDeductionRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}

// dart format on
