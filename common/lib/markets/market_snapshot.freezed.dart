// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketRate {

 String get loanTypeId; String get label; RateType get rateType; int get fixedYears;@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate get annualRate;@CalendarDateJsonConverter() CalendarDate? get asOf; Source? get source;
/// Create a copy of MarketRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketRateCopyWith<MarketRate> get copyWith => _$MarketRateCopyWithImpl<MarketRate>(this as MarketRate, _$identity);

  /// Serializes this MarketRate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketRate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketRate&&(identical(other.loanTypeId, _this.loanTypeId) || other.loanTypeId == _this.loanTypeId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.rateType, _this.rateType) || other.rateType == _this.rateType)&&(identical(other.fixedYears, _this.fixedYears) || other.fixedYears == _this.fixedYears)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.asOf, _this.asOf) || other.asOf == _this.asOf)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketRate;
  return Object.hash(runtimeType,_this.loanTypeId,_this.label,_this.rateType,_this.fixedYears,_this.annualRate,_this.asOf,_this.source);
}

@override
String toString() {
  final _this = this as MarketRate;
  return 'MarketRate(loanTypeId: ${_this.loanTypeId}, label: ${_this.label}, rateType: ${_this.rateType}, fixedYears: ${_this.fixedYears}, annualRate: ${_this.annualRate}, asOf: ${_this.asOf}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $MarketRateCopyWith<$Res>  {
  factory $MarketRateCopyWith(MarketRate value, $Res Function(MarketRate) _then) = _$MarketRateCopyWithImpl;
@useResult
$Res call({
 String loanTypeId, String label, RateType rateType, int fixedYears,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate,@CalendarDateJsonConverter() CalendarDate? asOf, Source? source
});


$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$MarketRateCopyWithImpl<$Res>
    implements $MarketRateCopyWith<$Res> {
  _$MarketRateCopyWithImpl(this._self, this._then);

  final MarketRate _self;
  final $Res Function(MarketRate) _then;

/// Create a copy of MarketRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loanTypeId = null,Object? label = null,Object? rateType = null,Object? fixedYears = null,Object? annualRate = null,Object? asOf = freezed,Object? source = freezed,}) {
  return _then(MarketRate(
loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}
/// Create a copy of MarketRate
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


/// Adds pattern-matching-related methods to [MarketRate].
extension MarketRatePatterns on MarketRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketRate value)  $default,){
final _that = this;
switch (_that) {
case _MarketRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketRate value)?  $default,){
final _that = this;
switch (_that) {
case _MarketRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @CalendarDateJsonConverter()  CalendarDate? asOf,  Source? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketRate() when $default != null:
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @CalendarDateJsonConverter()  CalendarDate? asOf,  Source? source)  $default,) {final _that = this;
switch (_that) {
case _MarketRate():
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.asOf,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String loanTypeId,  String label,  RateType rateType,  int fixedYears, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter()  Rate annualRate, @CalendarDateJsonConverter()  CalendarDate? asOf,  Source? source)?  $default,) {final _that = this;
switch (_that) {
case _MarketRate() when $default != null:
return $default(_that.loanTypeId,_that.label,_that.rateType,_that.fixedYears,_that.annualRate,_that.asOf,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketRate implements MarketRate {
  const _MarketRate({required this.loanTypeId, required this.label, required this.rateType, this.fixedYears = 0, @JsonKey(name: 'annualRatePpm')@PpmJsonConverter() required this.annualRate, @CalendarDateJsonConverter() this.asOf, this.source});
  factory _MarketRate.fromJson(Map<String, dynamic> json) => _$MarketRateFromJson(json);

@override final  String loanTypeId;
@override final  String label;
@override final  RateType rateType;
@override@JsonKey() final  int fixedYears;
@override@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() final  Rate annualRate;
@override@CalendarDateJsonConverter() final  CalendarDate? asOf;
@override final  Source? source;

/// Create a copy of MarketRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketRateCopyWith<_MarketRate> get copyWith => __$MarketRateCopyWithImpl<_MarketRate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketRateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketRate&&(identical(other.loanTypeId, loanTypeId) || other.loanTypeId == loanTypeId)&&(identical(other.label, label) || other.label == label)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.fixedYears, fixedYears) || other.fixedYears == fixedYears)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,loanTypeId,label,rateType,fixedYears,annualRate,asOf,source);
}

@override
String toString() {
    return 'MarketRate(loanTypeId: $loanTypeId, label: $label, rateType: $rateType, fixedYears: $fixedYears, annualRate: $annualRate, asOf: $asOf, source: $source)';
}


}

/// @nodoc
abstract mixin class _$MarketRateCopyWith<$Res> implements $MarketRateCopyWith<$Res> {
  factory _$MarketRateCopyWith(_MarketRate value, $Res Function(_MarketRate) _then) = __$MarketRateCopyWithImpl;
@override @useResult
$Res call({
 String loanTypeId, String label, RateType rateType, int fixedYears,@JsonKey(name: 'annualRatePpm')@PpmJsonConverter() Rate annualRate,@CalendarDateJsonConverter() CalendarDate? asOf, Source? source
});


@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$MarketRateCopyWithImpl<$Res>
    implements _$MarketRateCopyWith<$Res> {
  __$MarketRateCopyWithImpl(this._self, this._then);

  final _MarketRate _self;
  final $Res Function(_MarketRate) _then;

/// Create a copy of MarketRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loanTypeId = null,Object? label = null,Object? rateType = null,Object? fixedYears = null,Object? annualRate = null,Object? asOf = freezed,Object? source = freezed,}) {
  return _then(_MarketRate(
loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as CalendarDate?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}

/// Create a copy of MarketRate
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
mixin _$MarketRule {

 MarketRuleKind get kind;@JsonKey(name: 'ratePpm')@PpmJsonConverter() Rate? get rate;@ExactDecimalJsonConverter() ExactDecimal? get multiple; IncomeBasis? get incomeBasis;@JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter() Rate? get whenLtvAbove; Money? get upTo;@JsonKey(name: 'rateAbovePpm')@PpmJsonConverter() Rate? get rateAbove; bool get perBorrower; Source? get source;
/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketRuleCopyWith<MarketRule> get copyWith => _$MarketRuleCopyWithImpl<MarketRule>(this as MarketRule, _$identity);

  /// Serializes this MarketRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketRule&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.multiple, _this.multiple) || other.multiple == _this.multiple)&&(identical(other.incomeBasis, _this.incomeBasis) || other.incomeBasis == _this.incomeBasis)&&(identical(other.whenLtvAbove, _this.whenLtvAbove) || other.whenLtvAbove == _this.whenLtvAbove)&&(identical(other.upTo, _this.upTo) || other.upTo == _this.upTo)&&(identical(other.rateAbove, _this.rateAbove) || other.rateAbove == _this.rateAbove)&&(identical(other.perBorrower, _this.perBorrower) || other.perBorrower == _this.perBorrower)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketRule;
  return Object.hash(runtimeType,_this.kind,_this.rate,_this.multiple,_this.incomeBasis,_this.whenLtvAbove,_this.upTo,_this.rateAbove,_this.perBorrower,_this.source);
}

@override
String toString() {
  final _this = this as MarketRule;
  return 'MarketRule(kind: ${_this.kind}, rate: ${_this.rate}, multiple: ${_this.multiple}, incomeBasis: ${_this.incomeBasis}, whenLtvAbove: ${_this.whenLtvAbove}, upTo: ${_this.upTo}, rateAbove: ${_this.rateAbove}, perBorrower: ${_this.perBorrower}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $MarketRuleCopyWith<$Res>  {
  factory $MarketRuleCopyWith(MarketRule value, $Res Function(MarketRule) _then) = _$MarketRuleCopyWithImpl;
@useResult
$Res call({
 MarketRuleKind kind,@JsonKey(name: 'ratePpm')@PpmJsonConverter() Rate? rate,@ExactDecimalJsonConverter() ExactDecimal? multiple, IncomeBasis? incomeBasis,@JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter() Rate? whenLtvAbove, Money? upTo,@JsonKey(name: 'rateAbovePpm')@PpmJsonConverter() Rate? rateAbove, bool perBorrower, Source? source
});


$MoneyCopyWith<$Res>? get upTo;$SourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$MarketRuleCopyWithImpl<$Res>
    implements $MarketRuleCopyWith<$Res> {
  _$MarketRuleCopyWithImpl(this._self, this._then);

  final MarketRule _self;
  final $Res Function(MarketRule) _then;

/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? rate = freezed,Object? multiple = freezed,Object? incomeBasis = freezed,Object? whenLtvAbove = freezed,Object? upTo = freezed,Object? rateAbove = freezed,Object? perBorrower = null,Object? source = freezed,}) {
  return _then(MarketRule(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MarketRuleKind,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate?,multiple: freezed == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,incomeBasis: freezed == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis?,whenLtvAbove: freezed == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate?,upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as Money?,rateAbove: freezed == rateAbove ? _self.rateAbove : rateAbove // ignore: cast_nullable_to_non_nullable
as Rate?,perBorrower: null == perBorrower ? _self.perBorrower : perBorrower // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}
/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get upTo {
    if (_self.upTo == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.upTo!, (value) {
    return _then(_self.copyWith(upTo: value));
  });
}/// Create a copy of MarketRule
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


/// Adds pattern-matching-related methods to [MarketRule].
extension MarketRulePatterns on MarketRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketRule value)  $default,){
final _that = this;
switch (_that) {
case _MarketRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketRule value)?  $default,){
final _that = this;
switch (_that) {
case _MarketRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MarketRuleKind kind, @JsonKey(name: 'ratePpm')@PpmJsonConverter()  Rate? rate, @ExactDecimalJsonConverter()  ExactDecimal? multiple,  IncomeBasis? incomeBasis, @JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter()  Rate? whenLtvAbove,  Money? upTo, @JsonKey(name: 'rateAbovePpm')@PpmJsonConverter()  Rate? rateAbove,  bool perBorrower,  Source? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketRule() when $default != null:
return $default(_that.kind,_that.rate,_that.multiple,_that.incomeBasis,_that.whenLtvAbove,_that.upTo,_that.rateAbove,_that.perBorrower,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MarketRuleKind kind, @JsonKey(name: 'ratePpm')@PpmJsonConverter()  Rate? rate, @ExactDecimalJsonConverter()  ExactDecimal? multiple,  IncomeBasis? incomeBasis, @JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter()  Rate? whenLtvAbove,  Money? upTo, @JsonKey(name: 'rateAbovePpm')@PpmJsonConverter()  Rate? rateAbove,  bool perBorrower,  Source? source)  $default,) {final _that = this;
switch (_that) {
case _MarketRule():
return $default(_that.kind,_that.rate,_that.multiple,_that.incomeBasis,_that.whenLtvAbove,_that.upTo,_that.rateAbove,_that.perBorrower,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MarketRuleKind kind, @JsonKey(name: 'ratePpm')@PpmJsonConverter()  Rate? rate, @ExactDecimalJsonConverter()  ExactDecimal? multiple,  IncomeBasis? incomeBasis, @JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter()  Rate? whenLtvAbove,  Money? upTo, @JsonKey(name: 'rateAbovePpm')@PpmJsonConverter()  Rate? rateAbove,  bool perBorrower,  Source? source)?  $default,) {final _that = this;
switch (_that) {
case _MarketRule() when $default != null:
return $default(_that.kind,_that.rate,_that.multiple,_that.incomeBasis,_that.whenLtvAbove,_that.upTo,_that.rateAbove,_that.perBorrower,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketRule implements MarketRule {
  const _MarketRule({required this.kind, @JsonKey(name: 'ratePpm')@PpmJsonConverter() this.rate, @ExactDecimalJsonConverter() this.multiple, this.incomeBasis, @JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter() this.whenLtvAbove, this.upTo, @JsonKey(name: 'rateAbovePpm')@PpmJsonConverter() this.rateAbove, this.perBorrower = false, this.source});
  factory _MarketRule.fromJson(Map<String, dynamic> json) => _$MarketRuleFromJson(json);

@override final  MarketRuleKind kind;
@override@JsonKey(name: 'ratePpm')@PpmJsonConverter() final  Rate? rate;
@override@ExactDecimalJsonConverter() final  ExactDecimal? multiple;
@override final  IncomeBasis? incomeBasis;
@override@JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter() final  Rate? whenLtvAbove;
@override final  Money? upTo;
@override@JsonKey(name: 'rateAbovePpm')@PpmJsonConverter() final  Rate? rateAbove;
@override@JsonKey() final  bool perBorrower;
@override final  Source? source;

/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketRuleCopyWith<_MarketRule> get copyWith => __$MarketRuleCopyWithImpl<_MarketRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketRule&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.multiple, multiple) || other.multiple == multiple)&&(identical(other.incomeBasis, incomeBasis) || other.incomeBasis == incomeBasis)&&(identical(other.whenLtvAbove, whenLtvAbove) || other.whenLtvAbove == whenLtvAbove)&&(identical(other.upTo, upTo) || other.upTo == upTo)&&(identical(other.rateAbove, rateAbove) || other.rateAbove == rateAbove)&&(identical(other.perBorrower, perBorrower) || other.perBorrower == perBorrower)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,rate,multiple,incomeBasis,whenLtvAbove,upTo,rateAbove,perBorrower,source);
}

@override
String toString() {
    return 'MarketRule(kind: $kind, rate: $rate, multiple: $multiple, incomeBasis: $incomeBasis, whenLtvAbove: $whenLtvAbove, upTo: $upTo, rateAbove: $rateAbove, perBorrower: $perBorrower, source: $source)';
}


}

/// @nodoc
abstract mixin class _$MarketRuleCopyWith<$Res> implements $MarketRuleCopyWith<$Res> {
  factory _$MarketRuleCopyWith(_MarketRule value, $Res Function(_MarketRule) _then) = __$MarketRuleCopyWithImpl;
@override @useResult
$Res call({
 MarketRuleKind kind,@JsonKey(name: 'ratePpm')@PpmJsonConverter() Rate? rate,@ExactDecimalJsonConverter() ExactDecimal? multiple, IncomeBasis? incomeBasis,@JsonKey(name: 'whenLtvAbovePpm')@PpmJsonConverter() Rate? whenLtvAbove, Money? upTo,@JsonKey(name: 'rateAbovePpm')@PpmJsonConverter() Rate? rateAbove, bool perBorrower, Source? source
});


@override $MoneyCopyWith<$Res>? get upTo;@override $SourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$MarketRuleCopyWithImpl<$Res>
    implements _$MarketRuleCopyWith<$Res> {
  __$MarketRuleCopyWithImpl(this._self, this._then);

  final _MarketRule _self;
  final $Res Function(_MarketRule) _then;

/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? rate = freezed,Object? multiple = freezed,Object? incomeBasis = freezed,Object? whenLtvAbove = freezed,Object? upTo = freezed,Object? rateAbove = freezed,Object? perBorrower = null,Object? source = freezed,}) {
  return _then(_MarketRule(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MarketRuleKind,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate?,multiple: freezed == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as ExactDecimal?,incomeBasis: freezed == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis?,whenLtvAbove: freezed == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate?,upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as Money?,rateAbove: freezed == rateAbove ? _self.rateAbove : rateAbove // ignore: cast_nullable_to_non_nullable
as Rate?,perBorrower: null == perBorrower ? _self.perBorrower : perBorrower // ignore: cast_nullable_to_non_nullable
as bool,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source?,
  ));
}

/// Create a copy of MarketRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get upTo {
    if (_self.upTo == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.upTo!, (value) {
    return _then(_self.copyWith(upTo: value));
  });
}/// Create a copy of MarketRule
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
mixin _$AreaFigures {

 String get areaId; String get areaName; int get homes; Money get pricePerM2; String get priceSource; Money get rentPerM2; String get rentSource;
/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaFiguresCopyWith<AreaFigures> get copyWith => _$AreaFiguresCopyWithImpl<AreaFigures>(this as AreaFigures, _$identity);

  /// Serializes this AreaFigures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AreaFigures;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaFigures&&(identical(other.areaId, _this.areaId) || other.areaId == _this.areaId)&&(identical(other.areaName, _this.areaName) || other.areaName == _this.areaName)&&(identical(other.homes, _this.homes) || other.homes == _this.homes)&&(identical(other.pricePerM2, _this.pricePerM2) || other.pricePerM2 == _this.pricePerM2)&&(identical(other.priceSource, _this.priceSource) || other.priceSource == _this.priceSource)&&(identical(other.rentPerM2, _this.rentPerM2) || other.rentPerM2 == _this.rentPerM2)&&(identical(other.rentSource, _this.rentSource) || other.rentSource == _this.rentSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AreaFigures;
  return Object.hash(runtimeType,_this.areaId,_this.areaName,_this.homes,_this.pricePerM2,_this.priceSource,_this.rentPerM2,_this.rentSource);
}

@override
String toString() {
  final _this = this as AreaFigures;
  return 'AreaFigures(areaId: ${_this.areaId}, areaName: ${_this.areaName}, homes: ${_this.homes}, pricePerM2: ${_this.pricePerM2}, priceSource: ${_this.priceSource}, rentPerM2: ${_this.rentPerM2}, rentSource: ${_this.rentSource})';
}


}

/// @nodoc
abstract mixin class $AreaFiguresCopyWith<$Res>  {
  factory $AreaFiguresCopyWith(AreaFigures value, $Res Function(AreaFigures) _then) = _$AreaFiguresCopyWithImpl;
@useResult
$Res call({
 String areaId, String areaName, int homes, Money pricePerM2, String priceSource, Money rentPerM2, String rentSource
});


$MoneyCopyWith<$Res> get pricePerM2;$MoneyCopyWith<$Res> get rentPerM2;

}
/// @nodoc
class _$AreaFiguresCopyWithImpl<$Res>
    implements $AreaFiguresCopyWith<$Res> {
  _$AreaFiguresCopyWithImpl(this._self, this._then);

  final AreaFigures _self;
  final $Res Function(AreaFigures) _then;

/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areaId = null,Object? areaName = null,Object? homes = null,Object? pricePerM2 = null,Object? priceSource = null,Object? rentPerM2 = null,Object? rentSource = null,}) {
  return _then(AreaFigures(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,homes: null == homes ? _self.homes : homes // ignore: cast_nullable_to_non_nullable
as int,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,rentPerM2: null == rentPerM2 ? _self.rentPerM2 : rentPerM2 // ignore: cast_nullable_to_non_nullable
as Money,rentSource: null == rentSource ? _self.rentSource : rentSource // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get rentPerM2 {
  
  return $MoneyCopyWith<$Res>(_self.rentPerM2, (value) {
    return _then(_self.copyWith(rentPerM2: value));
  });
}
}


/// Adds pattern-matching-related methods to [AreaFigures].
extension AreaFiguresPatterns on AreaFigures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaFigures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaFigures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaFigures value)  $default,){
final _that = this;
switch (_that) {
case _AreaFigures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaFigures value)?  $default,){
final _that = this;
switch (_that) {
case _AreaFigures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String areaId,  String areaName,  int homes,  Money pricePerM2,  String priceSource,  Money rentPerM2,  String rentSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaFigures() when $default != null:
return $default(_that.areaId,_that.areaName,_that.homes,_that.pricePerM2,_that.priceSource,_that.rentPerM2,_that.rentSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String areaId,  String areaName,  int homes,  Money pricePerM2,  String priceSource,  Money rentPerM2,  String rentSource)  $default,) {final _that = this;
switch (_that) {
case _AreaFigures():
return $default(_that.areaId,_that.areaName,_that.homes,_that.pricePerM2,_that.priceSource,_that.rentPerM2,_that.rentSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String areaId,  String areaName,  int homes,  Money pricePerM2,  String priceSource,  Money rentPerM2,  String rentSource)?  $default,) {final _that = this;
switch (_that) {
case _AreaFigures() when $default != null:
return $default(_that.areaId,_that.areaName,_that.homes,_that.pricePerM2,_that.priceSource,_that.rentPerM2,_that.rentSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaFigures implements AreaFigures {
  const _AreaFigures({required this.areaId, required this.areaName, required this.homes, required this.pricePerM2, required this.priceSource, required this.rentPerM2, required this.rentSource});
  factory _AreaFigures.fromJson(Map<String, dynamic> json) => _$AreaFiguresFromJson(json);

@override final  String areaId;
@override final  String areaName;
@override final  int homes;
@override final  Money pricePerM2;
@override final  String priceSource;
@override final  Money rentPerM2;
@override final  String rentSource;

/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaFiguresCopyWith<_AreaFigures> get copyWith => __$AreaFiguresCopyWithImpl<_AreaFigures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaFiguresToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaFigures&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.homes, homes) || other.homes == homes)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.priceSource, priceSource) || other.priceSource == priceSource)&&(identical(other.rentPerM2, rentPerM2) || other.rentPerM2 == rentPerM2)&&(identical(other.rentSource, rentSource) || other.rentSource == rentSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,areaId,areaName,homes,pricePerM2,priceSource,rentPerM2,rentSource);
}

@override
String toString() {
    return 'AreaFigures(areaId: $areaId, areaName: $areaName, homes: $homes, pricePerM2: $pricePerM2, priceSource: $priceSource, rentPerM2: $rentPerM2, rentSource: $rentSource)';
}


}

/// @nodoc
abstract mixin class _$AreaFiguresCopyWith<$Res> implements $AreaFiguresCopyWith<$Res> {
  factory _$AreaFiguresCopyWith(_AreaFigures value, $Res Function(_AreaFigures) _then) = __$AreaFiguresCopyWithImpl;
@override @useResult
$Res call({
 String areaId, String areaName, int homes, Money pricePerM2, String priceSource, Money rentPerM2, String rentSource
});


@override $MoneyCopyWith<$Res> get pricePerM2;@override $MoneyCopyWith<$Res> get rentPerM2;

}
/// @nodoc
class __$AreaFiguresCopyWithImpl<$Res>
    implements _$AreaFiguresCopyWith<$Res> {
  __$AreaFiguresCopyWithImpl(this._self, this._then);

  final _AreaFigures _self;
  final $Res Function(_AreaFigures) _then;

/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areaId = null,Object? areaName = null,Object? homes = null,Object? pricePerM2 = null,Object? priceSource = null,Object? rentPerM2 = null,Object? rentSource = null,}) {
  return _then(_AreaFigures(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,homes: null == homes ? _self.homes : homes // ignore: cast_nullable_to_non_nullable
as int,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,rentPerM2: null == rentPerM2 ? _self.rentPerM2 : rentPerM2 // ignore: cast_nullable_to_non_nullable
as Money,rentSource: null == rentSource ? _self.rentSource : rentSource // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}/// Create a copy of AreaFigures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get rentPerM2 {
  
  return $MoneyCopyWith<$Res>(_self.rentPerM2, (value) {
    return _then(_self.copyWith(rentPerM2: value));
  });
}
}


/// @nodoc
mixin _$MarketSnapshot {

 String get cityId; String get cityName; String get marketId; String get marketName; bool get sample;@CurrencyJsonConverter() Currency get currency; List<MarketRate> get rates; List<MarketRule> get rules; List<ProfileField> get waitingOn; List<AreaFigures> get areas;
/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketSnapshotCopyWith<MarketSnapshot> get copyWith => _$MarketSnapshotCopyWithImpl<MarketSnapshot>(this as MarketSnapshot, _$identity);

  /// Serializes this MarketSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketSnapshot&&(identical(other.cityId, _this.cityId) || other.cityId == _this.cityId)&&(identical(other.cityName, _this.cityName) || other.cityName == _this.cityName)&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.sample, _this.sample) || other.sample == _this.sample)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&const DeepCollectionEquality().equals(other.rates, _this.rates)&&const DeepCollectionEquality().equals(other.rules, _this.rules)&&const DeepCollectionEquality().equals(other.waitingOn, _this.waitingOn)&&const DeepCollectionEquality().equals(other.areas, _this.areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketSnapshot;
  return Object.hash(runtimeType,_this.cityId,_this.cityName,_this.marketId,_this.marketName,_this.sample,_this.currency,const DeepCollectionEquality().hash(_this.rates),const DeepCollectionEquality().hash(_this.rules),const DeepCollectionEquality().hash(_this.waitingOn),const DeepCollectionEquality().hash(_this.areas));
}

@override
String toString() {
  final _this = this as MarketSnapshot;
  return 'MarketSnapshot(cityId: ${_this.cityId}, cityName: ${_this.cityName}, marketId: ${_this.marketId}, marketName: ${_this.marketName}, sample: ${_this.sample}, currency: ${_this.currency}, rates: ${_this.rates}, rules: ${_this.rules}, waitingOn: ${_this.waitingOn}, areas: ${_this.areas})';
}


}

/// @nodoc
abstract mixin class $MarketSnapshotCopyWith<$Res>  {
  factory $MarketSnapshotCopyWith(MarketSnapshot value, $Res Function(MarketSnapshot) _then) = _$MarketSnapshotCopyWithImpl;
@useResult
$Res call({
 String cityId, String cityName, String marketId, String marketName, bool sample,@CurrencyJsonConverter() Currency currency, List<MarketRate> rates, List<MarketRule> rules, List<ProfileField> waitingOn, List<AreaFigures> areas
});




}
/// @nodoc
class _$MarketSnapshotCopyWithImpl<$Res>
    implements $MarketSnapshotCopyWith<$Res> {
  _$MarketSnapshotCopyWithImpl(this._self, this._then);

  final MarketSnapshot _self;
  final $Res Function(MarketSnapshot) _then;

/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityId = null,Object? cityName = null,Object? marketId = null,Object? marketName = null,Object? sample = null,Object? currency = null,Object? rates = null,Object? rules = null,Object? waitingOn = null,Object? areas = null,}) {
  return _then(MarketSnapshot(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as List<MarketRate>,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<MarketRule>,waitingOn: null == waitingOn ? _self.waitingOn : waitingOn // ignore: cast_nullable_to_non_nullable
as List<ProfileField>,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<AreaFigures>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketSnapshot].
extension MarketSnapshotPatterns on MarketSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _MarketSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cityId,  String cityName,  String marketId,  String marketName,  bool sample, @CurrencyJsonConverter()  Currency currency,  List<MarketRate> rates,  List<MarketRule> rules,  List<ProfileField> waitingOn,  List<AreaFigures> areas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
return $default(_that.cityId,_that.cityName,_that.marketId,_that.marketName,_that.sample,_that.currency,_that.rates,_that.rules,_that.waitingOn,_that.areas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cityId,  String cityName,  String marketId,  String marketName,  bool sample, @CurrencyJsonConverter()  Currency currency,  List<MarketRate> rates,  List<MarketRule> rules,  List<ProfileField> waitingOn,  List<AreaFigures> areas)  $default,) {final _that = this;
switch (_that) {
case _MarketSnapshot():
return $default(_that.cityId,_that.cityName,_that.marketId,_that.marketName,_that.sample,_that.currency,_that.rates,_that.rules,_that.waitingOn,_that.areas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cityId,  String cityName,  String marketId,  String marketName,  bool sample, @CurrencyJsonConverter()  Currency currency,  List<MarketRate> rates,  List<MarketRule> rules,  List<ProfileField> waitingOn,  List<AreaFigures> areas)?  $default,) {final _that = this;
switch (_that) {
case _MarketSnapshot() when $default != null:
return $default(_that.cityId,_that.cityName,_that.marketId,_that.marketName,_that.sample,_that.currency,_that.rates,_that.rules,_that.waitingOn,_that.areas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketSnapshot implements MarketSnapshot {
  const _MarketSnapshot({required this.cityId, required this.cityName, required this.marketId, required this.marketName, this.sample = true, @CurrencyJsonConverter() required this.currency, required  List<MarketRate> rates, required  List<MarketRule> rules,  List<ProfileField> waitingOn = const [], required  List<AreaFigures> areas}): _rates = rates,_rules = rules,_waitingOn = waitingOn,_areas = areas;
  factory _MarketSnapshot.fromJson(Map<String, dynamic> json) => _$MarketSnapshotFromJson(json);

@override final  String cityId;
@override final  String cityName;
@override final  String marketId;
@override final  String marketName;
@override@JsonKey() final  bool sample;
@override@CurrencyJsonConverter() final  Currency currency;
 final  List<MarketRate> _rates;
@override List<MarketRate> get rates {
  if (_rates is EqualUnmodifiableListView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rates);
}

 final  List<MarketRule> _rules;
@override List<MarketRule> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}

 final  List<ProfileField> _waitingOn;
@override@JsonKey() List<ProfileField> get waitingOn {
  if (_waitingOn is EqualUnmodifiableListView) return _waitingOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waitingOn);
}

 final  List<AreaFigures> _areas;
@override List<AreaFigures> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}


/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketSnapshotCopyWith<_MarketSnapshot> get copyWith => __$MarketSnapshotCopyWithImpl<_MarketSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketSnapshot&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.rates, _rates)&&const DeepCollectionEquality().equals(other.rules, _rules)&&const DeepCollectionEquality().equals(other.waitingOn, _waitingOn)&&const DeepCollectionEquality().equals(other.areas, _areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cityId,cityName,marketId,marketName,sample,currency,const DeepCollectionEquality().hash(_rates),const DeepCollectionEquality().hash(_rules),const DeepCollectionEquality().hash(_waitingOn),const DeepCollectionEquality().hash(_areas));
}

@override
String toString() {
    return 'MarketSnapshot(cityId: $cityId, cityName: $cityName, marketId: $marketId, marketName: $marketName, sample: $sample, currency: $currency, rates: $rates, rules: $rules, waitingOn: $waitingOn, areas: $areas)';
}


}

/// @nodoc
abstract mixin class _$MarketSnapshotCopyWith<$Res> implements $MarketSnapshotCopyWith<$Res> {
  factory _$MarketSnapshotCopyWith(_MarketSnapshot value, $Res Function(_MarketSnapshot) _then) = __$MarketSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String cityId, String cityName, String marketId, String marketName, bool sample,@CurrencyJsonConverter() Currency currency, List<MarketRate> rates, List<MarketRule> rules, List<ProfileField> waitingOn, List<AreaFigures> areas
});




}
/// @nodoc
class __$MarketSnapshotCopyWithImpl<$Res>
    implements _$MarketSnapshotCopyWith<$Res> {
  __$MarketSnapshotCopyWithImpl(this._self, this._then);

  final _MarketSnapshot _self;
  final $Res Function(_MarketSnapshot) _then;

/// Create a copy of MarketSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityId = null,Object? cityName = null,Object? marketId = null,Object? marketName = null,Object? sample = null,Object? currency = null,Object? rates = null,Object? rules = null,Object? waitingOn = null,Object? areas = null,}) {
  return _then(_MarketSnapshot(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as List<MarketRate>,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<MarketRule>,waitingOn: null == waitingOn ? _self._waitingOn : waitingOn // ignore: cast_nullable_to_non_nullable
as List<ProfileField>,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<AreaFigures>,
  ));
}


}

// dart format on
