// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CostRule {

 String get id; String? get group; String get label; String? get localTerm; BuyerPredicate? get appliesTo; int get precedence; CostBase get base; CostCalculation get calculation; Recurrence get recurrence; Rounding get rounding; RefundRule? get refund; String get sourceId;
/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CostRuleCopyWith<CostRule> get copyWith => _$CostRuleCopyWithImpl<CostRule>(this as CostRule, _$identity);

  /// Serializes this CostRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CostRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CostRule&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.group, _this.group) || other.group == _this.group)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.localTerm, _this.localTerm) || other.localTerm == _this.localTerm)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.precedence, _this.precedence) || other.precedence == _this.precedence)&&(identical(other.base, _this.base) || other.base == _this.base)&&(identical(other.calculation, _this.calculation) || other.calculation == _this.calculation)&&(identical(other.recurrence, _this.recurrence) || other.recurrence == _this.recurrence)&&(identical(other.rounding, _this.rounding) || other.rounding == _this.rounding)&&(identical(other.refund, _this.refund) || other.refund == _this.refund)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CostRule;
  return Object.hash(runtimeType,_this.id,_this.group,_this.label,_this.localTerm,_this.appliesTo,_this.precedence,_this.base,_this.calculation,_this.recurrence,_this.rounding,_this.refund,_this.sourceId);
}

@override
String toString() {
  final _this = this as CostRule;
  return 'CostRule(id: ${_this.id}, group: ${_this.group}, label: ${_this.label}, localTerm: ${_this.localTerm}, appliesTo: ${_this.appliesTo}, precedence: ${_this.precedence}, base: ${_this.base}, calculation: ${_this.calculation}, recurrence: ${_this.recurrence}, rounding: ${_this.rounding}, refund: ${_this.refund}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $CostRuleCopyWith<$Res>  {
  factory $CostRuleCopyWith(CostRule value, $Res Function(CostRule) _then) = _$CostRuleCopyWithImpl;
@useResult
$Res call({
 String id, String? group, String label, String? localTerm, BuyerPredicate? appliesTo, int precedence, CostBase base, CostCalculation calculation, Recurrence recurrence, Rounding rounding, RefundRule? refund, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;$CostCalculationCopyWith<$Res> get calculation;$RoundingCopyWith<$Res> get rounding;$RefundRuleCopyWith<$Res>? get refund;

}
/// @nodoc
class _$CostRuleCopyWithImpl<$Res>
    implements $CostRuleCopyWith<$Res> {
  _$CostRuleCopyWithImpl(this._self, this._then);

  final CostRule _self;
  final $Res Function(CostRule) _then;

/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? group = freezed,Object? label = null,Object? localTerm = freezed,Object? appliesTo = freezed,Object? precedence = null,Object? base = null,Object? calculation = null,Object? recurrence = null,Object? rounding = null,Object? refund = freezed,Object? sourceId = null,}) {
  return _then(CostRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,precedence: null == precedence ? _self.precedence : precedence // ignore: cast_nullable_to_non_nullable
as int,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as CostBase,calculation: null == calculation ? _self.calculation : calculation // ignore: cast_nullable_to_non_nullable
as CostCalculation,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as Recurrence,rounding: null == rounding ? _self.rounding : rounding // ignore: cast_nullable_to_non_nullable
as Rounding,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CostRule
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
}/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CostCalculationCopyWith<$Res> get calculation {
  
  return $CostCalculationCopyWith<$Res>(_self.calculation, (value) {
    return _then(_self.copyWith(calculation: value));
  });
}/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundingCopyWith<$Res> get rounding {
  
  return $RoundingCopyWith<$Res>(_self.rounding, (value) {
    return _then(_self.copyWith(rounding: value));
  });
}/// Create a copy of CostRule
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
}
}


/// Adds pattern-matching-related methods to [CostRule].
extension CostRulePatterns on CostRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CostRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CostRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CostRule value)  $default,){
final _that = this;
switch (_that) {
case _CostRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CostRule value)?  $default,){
final _that = this;
switch (_that) {
case _CostRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? group,  String label,  String? localTerm,  BuyerPredicate? appliesTo,  int precedence,  CostBase base,  CostCalculation calculation,  Recurrence recurrence,  Rounding rounding,  RefundRule? refund,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CostRule() when $default != null:
return $default(_that.id,_that.group,_that.label,_that.localTerm,_that.appliesTo,_that.precedence,_that.base,_that.calculation,_that.recurrence,_that.rounding,_that.refund,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? group,  String label,  String? localTerm,  BuyerPredicate? appliesTo,  int precedence,  CostBase base,  CostCalculation calculation,  Recurrence recurrence,  Rounding rounding,  RefundRule? refund,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _CostRule():
return $default(_that.id,_that.group,_that.label,_that.localTerm,_that.appliesTo,_that.precedence,_that.base,_that.calculation,_that.recurrence,_that.rounding,_that.refund,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? group,  String label,  String? localTerm,  BuyerPredicate? appliesTo,  int precedence,  CostBase base,  CostCalculation calculation,  Recurrence recurrence,  Rounding rounding,  RefundRule? refund,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _CostRule() when $default != null:
return $default(_that.id,_that.group,_that.label,_that.localTerm,_that.appliesTo,_that.precedence,_that.base,_that.calculation,_that.recurrence,_that.rounding,_that.refund,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CostRule implements CostRule {
  const _CostRule({required this.id, this.group, required this.label, this.localTerm, this.appliesTo, this.precedence = 0, required this.base, required this.calculation, required this.recurrence, this.rounding = Rounding.halfUp, this.refund, required this.sourceId});
  factory _CostRule.fromJson(Map<String, dynamic> json) => _$CostRuleFromJson(json);

@override final  String id;
@override final  String? group;
@override final  String label;
@override final  String? localTerm;
@override final  BuyerPredicate? appliesTo;
@override@JsonKey() final  int precedence;
@override final  CostBase base;
@override final  CostCalculation calculation;
@override final  Recurrence recurrence;
@override@JsonKey() final  Rounding rounding;
@override final  RefundRule? refund;
@override final  String sourceId;

/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CostRuleCopyWith<_CostRule> get copyWith => __$CostRuleCopyWithImpl<_CostRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CostRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CostRule&&(identical(other.id, id) || other.id == id)&&(identical(other.group, group) || other.group == group)&&(identical(other.label, label) || other.label == label)&&(identical(other.localTerm, localTerm) || other.localTerm == localTerm)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.precedence, precedence) || other.precedence == precedence)&&(identical(other.base, base) || other.base == base)&&(identical(other.calculation, calculation) || other.calculation == calculation)&&(identical(other.recurrence, recurrence) || other.recurrence == recurrence)&&(identical(other.rounding, rounding) || other.rounding == rounding)&&(identical(other.refund, refund) || other.refund == refund)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,group,label,localTerm,appliesTo,precedence,base,calculation,recurrence,rounding,refund,sourceId);
}

@override
String toString() {
    return 'CostRule(id: $id, group: $group, label: $label, localTerm: $localTerm, appliesTo: $appliesTo, precedence: $precedence, base: $base, calculation: $calculation, recurrence: $recurrence, rounding: $rounding, refund: $refund, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$CostRuleCopyWith<$Res> implements $CostRuleCopyWith<$Res> {
  factory _$CostRuleCopyWith(_CostRule value, $Res Function(_CostRule) _then) = __$CostRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, String? group, String label, String? localTerm, BuyerPredicate? appliesTo, int precedence, CostBase base, CostCalculation calculation, Recurrence recurrence, Rounding rounding, RefundRule? refund, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;@override $CostCalculationCopyWith<$Res> get calculation;@override $RoundingCopyWith<$Res> get rounding;@override $RefundRuleCopyWith<$Res>? get refund;

}
/// @nodoc
class __$CostRuleCopyWithImpl<$Res>
    implements _$CostRuleCopyWith<$Res> {
  __$CostRuleCopyWithImpl(this._self, this._then);

  final _CostRule _self;
  final $Res Function(_CostRule) _then;

/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? group = freezed,Object? label = null,Object? localTerm = freezed,Object? appliesTo = freezed,Object? precedence = null,Object? base = null,Object? calculation = null,Object? recurrence = null,Object? rounding = null,Object? refund = freezed,Object? sourceId = null,}) {
  return _then(_CostRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,precedence: null == precedence ? _self.precedence : precedence // ignore: cast_nullable_to_non_nullable
as int,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as CostBase,calculation: null == calculation ? _self.calculation : calculation // ignore: cast_nullable_to_non_nullable
as CostCalculation,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as Recurrence,rounding: null == rounding ? _self.rounding : rounding // ignore: cast_nullable_to_non_nullable
as Rounding,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CostRule
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
}/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CostCalculationCopyWith<$Res> get calculation {
  
  return $CostCalculationCopyWith<$Res>(_self.calculation, (value) {
    return _then(_self.copyWith(calculation: value));
  });
}/// Create a copy of CostRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundingCopyWith<$Res> get rounding {
  
  return $RoundingCopyWith<$Res>(_self.rounding, (value) {
    return _then(_self.copyWith(rounding: value));
  });
}/// Create a copy of CostRule
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
}
}

// dart format on
