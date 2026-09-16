// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bracket_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BracketRule {

@ExactDecimalJsonConverter() ExactDecimal? get upTo;@PercentJsonConverter() Rate get rate;@ExactDecimalJsonConverter() ExactDecimal? get deduction;
/// Create a copy of BracketRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BracketRuleCopyWith<BracketRule> get copyWith => _$BracketRuleCopyWithImpl<BracketRule>(this as BracketRule, _$identity);

  /// Serializes this BracketRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BracketRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BracketRule&&(identical(other.upTo, _this.upTo) || other.upTo == _this.upTo)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.deduction, _this.deduction) || other.deduction == _this.deduction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BracketRule;
  return Object.hash(runtimeType,_this.upTo,_this.rate,_this.deduction);
}

@override
String toString() {
  final _this = this as BracketRule;
  return 'BracketRule(upTo: ${_this.upTo}, rate: ${_this.rate}, deduction: ${_this.deduction})';
}


}

/// @nodoc
abstract mixin class $BracketRuleCopyWith<$Res>  {
  factory $BracketRuleCopyWith(BracketRule value, $Res Function(BracketRule) _then) = _$BracketRuleCopyWithImpl;
@useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal? upTo,@PercentJsonConverter() Rate rate,@ExactDecimalJsonConverter() ExactDecimal? deduction
});




}
/// @nodoc
class _$BracketRuleCopyWithImpl<$Res>
    implements $BracketRuleCopyWith<$Res> {
  _$BracketRuleCopyWithImpl(this._self, this._then);

  final BracketRule _self;
  final $Res Function(BracketRule) _then;

/// Create a copy of BracketRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upTo = freezed,Object? rate = null,Object? deduction = freezed,}) {
  return _then(BracketRule(
upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,deduction: freezed == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [BracketRule].
extension BracketRulePatterns on BracketRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BracketRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BracketRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BracketRule value)  $default,){
final _that = this;
switch (_that) {
case _BracketRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BracketRule value)?  $default,){
final _that = this;
switch (_that) {
case _BracketRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal? deduction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BracketRule() when $default != null:
return $default(_that.upTo,_that.rate,_that.deduction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal? deduction)  $default,) {final _that = this;
switch (_that) {
case _BracketRule():
return $default(_that.upTo,_that.rate,_that.deduction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ExactDecimalJsonConverter()  ExactDecimal? upTo, @PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal? deduction)?  $default,) {final _that = this;
switch (_that) {
case _BracketRule() when $default != null:
return $default(_that.upTo,_that.rate,_that.deduction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BracketRule extends BracketRule {
  const _BracketRule({@ExactDecimalJsonConverter() this.upTo, @PercentJsonConverter() required this.rate, @ExactDecimalJsonConverter() this.deduction}): super._();
  factory _BracketRule.fromJson(Map<String, dynamic> json) => _$BracketRuleFromJson(json);

@override@ExactDecimalJsonConverter() final  ExactDecimal? upTo;
@override@PercentJsonConverter() final  Rate rate;
@override@ExactDecimalJsonConverter() final  ExactDecimal? deduction;

/// Create a copy of BracketRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BracketRuleCopyWith<_BracketRule> get copyWith => __$BracketRuleCopyWithImpl<_BracketRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BracketRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BracketRule&&(identical(other.upTo, upTo) || other.upTo == upTo)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.deduction, deduction) || other.deduction == deduction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,upTo,rate,deduction);
}

@override
String toString() {
    return 'BracketRule(upTo: $upTo, rate: $rate, deduction: $deduction)';
}


}

/// @nodoc
abstract mixin class _$BracketRuleCopyWith<$Res> implements $BracketRuleCopyWith<$Res> {
  factory _$BracketRuleCopyWith(_BracketRule value, $Res Function(_BracketRule) _then) = __$BracketRuleCopyWithImpl;
@override @useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal? upTo,@PercentJsonConverter() Rate rate,@ExactDecimalJsonConverter() ExactDecimal? deduction
});




}
/// @nodoc
class __$BracketRuleCopyWithImpl<$Res>
    implements _$BracketRuleCopyWith<$Res> {
  __$BracketRuleCopyWithImpl(this._self, this._then);

  final _BracketRule _self;
  final $Res Function(_BracketRule) _then;

/// Create a copy of BracketRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upTo = freezed,Object? rate = null,Object? deduction = freezed,}) {
  return _then(_BracketRule(
upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,deduction: freezed == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,
  ));
}


}

// dart format on
