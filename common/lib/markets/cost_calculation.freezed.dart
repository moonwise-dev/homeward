// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_calculation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
CostCalculation _$CostCalculationFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'flatRate':
          return FlatRateCalculation.fromJson(
            json
          );
                case 'brackets':
          return BracketsCalculation.fromJson(
            json
          );
                case 'fixed':
          return FixedCalculation.fromJson(
            json
          );
                case 'percentWithMin':
          return PercentWithMinCalculation.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'CostCalculation',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$CostCalculation {



  /// Serializes this CostCalculation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CostCalculation);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CostCalculation()';
}


}

/// @nodoc
class $CostCalculationCopyWith<$Res>  {
$CostCalculationCopyWith(CostCalculation _, $Res Function(CostCalculation) __);
}


/// Adds pattern-matching-related methods to [CostCalculation].
extension CostCalculationPatterns on CostCalculation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FlatRateCalculation value)?  flatRate,TResult Function( BracketsCalculation value)?  brackets,TResult Function( FixedCalculation value)?  fixed,TResult Function( PercentWithMinCalculation value)?  percentWithMin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FlatRateCalculation() when flatRate != null:
return flatRate(_that);case BracketsCalculation() when brackets != null:
return brackets(_that);case FixedCalculation() when fixed != null:
return fixed(_that);case PercentWithMinCalculation() when percentWithMin != null:
return percentWithMin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FlatRateCalculation value)  flatRate,required TResult Function( BracketsCalculation value)  brackets,required TResult Function( FixedCalculation value)  fixed,required TResult Function( PercentWithMinCalculation value)  percentWithMin,}){
final _that = this;
switch (_that) {
case FlatRateCalculation():
return flatRate(_that);case BracketsCalculation():
return brackets(_that);case FixedCalculation():
return fixed(_that);case PercentWithMinCalculation():
return percentWithMin(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FlatRateCalculation value)?  flatRate,TResult? Function( BracketsCalculation value)?  brackets,TResult? Function( FixedCalculation value)?  fixed,TResult? Function( PercentWithMinCalculation value)?  percentWithMin,}){
final _that = this;
switch (_that) {
case FlatRateCalculation() when flatRate != null:
return flatRate(_that);case BracketsCalculation() when brackets != null:
return brackets(_that);case FixedCalculation() when fixed != null:
return fixed(_that);case PercentWithMinCalculation() when percentWithMin != null:
return percentWithMin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@PercentJsonConverter()  Rate rate)?  flatRate,TResult Function( List<BracketRule> brackets,  bool marginal)?  brackets,TResult Function(@ExactDecimalJsonConverter()  ExactDecimal amount)?  fixed,TResult Function(@PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal min)?  percentWithMin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FlatRateCalculation() when flatRate != null:
return flatRate(_that.rate);case BracketsCalculation() when brackets != null:
return brackets(_that.brackets,_that.marginal);case FixedCalculation() when fixed != null:
return fixed(_that.amount);case PercentWithMinCalculation() when percentWithMin != null:
return percentWithMin(_that.rate,_that.min);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@PercentJsonConverter()  Rate rate)  flatRate,required TResult Function( List<BracketRule> brackets,  bool marginal)  brackets,required TResult Function(@ExactDecimalJsonConverter()  ExactDecimal amount)  fixed,required TResult Function(@PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal min)  percentWithMin,}) {final _that = this;
switch (_that) {
case FlatRateCalculation():
return flatRate(_that.rate);case BracketsCalculation():
return brackets(_that.brackets,_that.marginal);case FixedCalculation():
return fixed(_that.amount);case PercentWithMinCalculation():
return percentWithMin(_that.rate,_that.min);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@PercentJsonConverter()  Rate rate)?  flatRate,TResult? Function( List<BracketRule> brackets,  bool marginal)?  brackets,TResult? Function(@ExactDecimalJsonConverter()  ExactDecimal amount)?  fixed,TResult? Function(@PercentJsonConverter()  Rate rate, @ExactDecimalJsonConverter()  ExactDecimal min)?  percentWithMin,}) {final _that = this;
switch (_that) {
case FlatRateCalculation() when flatRate != null:
return flatRate(_that.rate);case BracketsCalculation() when brackets != null:
return brackets(_that.brackets,_that.marginal);case FixedCalculation() when fixed != null:
return fixed(_that.amount);case PercentWithMinCalculation() when percentWithMin != null:
return percentWithMin(_that.rate,_that.min);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FlatRateCalculation implements CostCalculation {
  const FlatRateCalculation({@PercentJsonConverter() required this.rate,  String? $type}): $type = $type ?? 'flatRate';
  factory FlatRateCalculation.fromJson(Map<String, dynamic> json) => _$FlatRateCalculationFromJson(json);

@PercentJsonConverter() final  Rate rate;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlatRateCalculationCopyWith<FlatRateCalculation> get copyWith => _$FlatRateCalculationCopyWithImpl<FlatRateCalculation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlatRateCalculationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FlatRateCalculation&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rate);
}

@override
String toString() {
    return 'CostCalculation.flatRate(rate: $rate)';
}


}

/// @nodoc
abstract mixin class $FlatRateCalculationCopyWith<$Res> implements $CostCalculationCopyWith<$Res> {
  factory $FlatRateCalculationCopyWith(FlatRateCalculation value, $Res Function(FlatRateCalculation) _then) = _$FlatRateCalculationCopyWithImpl;
@useResult
$Res call({
@PercentJsonConverter() Rate rate
});




}
/// @nodoc
class _$FlatRateCalculationCopyWithImpl<$Res>
    implements $FlatRateCalculationCopyWith<$Res> {
  _$FlatRateCalculationCopyWithImpl(this._self, this._then);

  final FlatRateCalculation _self;
  final $Res Function(FlatRateCalculation) _then;

/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = null,}) {
  return _then(FlatRateCalculation(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BracketsCalculation implements CostCalculation {
  const BracketsCalculation({required  List<BracketRule> brackets, required this.marginal,  String? $type}): _brackets = brackets,$type = $type ?? 'brackets';
  factory BracketsCalculation.fromJson(Map<String, dynamic> json) => _$BracketsCalculationFromJson(json);

 final  List<BracketRule> _brackets;
 List<BracketRule> get brackets {
  if (_brackets is EqualUnmodifiableListView) return _brackets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brackets);
}

 final  bool marginal;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BracketsCalculationCopyWith<BracketsCalculation> get copyWith => _$BracketsCalculationCopyWithImpl<BracketsCalculation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BracketsCalculationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BracketsCalculation&&const DeepCollectionEquality().equals(other.brackets, _brackets)&&(identical(other.marginal, marginal) || other.marginal == marginal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_brackets),marginal);
}

@override
String toString() {
    return 'CostCalculation.brackets(brackets: $brackets, marginal: $marginal)';
}


}

/// @nodoc
abstract mixin class $BracketsCalculationCopyWith<$Res> implements $CostCalculationCopyWith<$Res> {
  factory $BracketsCalculationCopyWith(BracketsCalculation value, $Res Function(BracketsCalculation) _then) = _$BracketsCalculationCopyWithImpl;
@useResult
$Res call({
 List<BracketRule> brackets, bool marginal
});




}
/// @nodoc
class _$BracketsCalculationCopyWithImpl<$Res>
    implements $BracketsCalculationCopyWith<$Res> {
  _$BracketsCalculationCopyWithImpl(this._self, this._then);

  final BracketsCalculation _self;
  final $Res Function(BracketsCalculation) _then;

/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brackets = null,Object? marginal = null,}) {
  return _then(BracketsCalculation(
brackets: null == brackets ? _self._brackets : brackets // ignore: cast_nullable_to_non_nullable
as List<BracketRule>,marginal: null == marginal ? _self.marginal : marginal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class FixedCalculation implements CostCalculation {
  const FixedCalculation({@ExactDecimalJsonConverter() required this.amount,  String? $type}): $type = $type ?? 'fixed';
  factory FixedCalculation.fromJson(Map<String, dynamic> json) => _$FixedCalculationFromJson(json);

@ExactDecimalJsonConverter() final  ExactDecimal amount;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixedCalculationCopyWith<FixedCalculation> get copyWith => _$FixedCalculationCopyWithImpl<FixedCalculation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixedCalculationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FixedCalculation&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,amount);
}

@override
String toString() {
    return 'CostCalculation.fixed(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $FixedCalculationCopyWith<$Res> implements $CostCalculationCopyWith<$Res> {
  factory $FixedCalculationCopyWith(FixedCalculation value, $Res Function(FixedCalculation) _then) = _$FixedCalculationCopyWithImpl;
@useResult
$Res call({
@ExactDecimalJsonConverter() ExactDecimal amount
});




}
/// @nodoc
class _$FixedCalculationCopyWithImpl<$Res>
    implements $FixedCalculationCopyWith<$Res> {
  _$FixedCalculationCopyWithImpl(this._self, this._then);

  final FixedCalculation _self;
  final $Res Function(FixedCalculation) _then;

/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(FixedCalculation(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PercentWithMinCalculation implements CostCalculation {
  const PercentWithMinCalculation({@PercentJsonConverter() required this.rate, @ExactDecimalJsonConverter() required this.min,  String? $type}): $type = $type ?? 'percentWithMin';
  factory PercentWithMinCalculation.fromJson(Map<String, dynamic> json) => _$PercentWithMinCalculationFromJson(json);

@PercentJsonConverter() final  Rate rate;
@ExactDecimalJsonConverter() final  ExactDecimal min;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PercentWithMinCalculationCopyWith<PercentWithMinCalculation> get copyWith => _$PercentWithMinCalculationCopyWithImpl<PercentWithMinCalculation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PercentWithMinCalculationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PercentWithMinCalculation&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.min, min) || other.min == min));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rate,min);
}

@override
String toString() {
    return 'CostCalculation.percentWithMin(rate: $rate, min: $min)';
}


}

/// @nodoc
abstract mixin class $PercentWithMinCalculationCopyWith<$Res> implements $CostCalculationCopyWith<$Res> {
  factory $PercentWithMinCalculationCopyWith(PercentWithMinCalculation value, $Res Function(PercentWithMinCalculation) _then) = _$PercentWithMinCalculationCopyWithImpl;
@useResult
$Res call({
@PercentJsonConverter() Rate rate,@ExactDecimalJsonConverter() ExactDecimal min
});




}
/// @nodoc
class _$PercentWithMinCalculationCopyWithImpl<$Res>
    implements $PercentWithMinCalculationCopyWith<$Res> {
  _$PercentWithMinCalculationCopyWithImpl(this._self, this._then);

  final PercentWithMinCalculation _self;
  final $Res Function(PercentWithMinCalculation) _then;

/// Create a copy of CostCalculation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? min = null,}) {
  return _then(PercentWithMinCalculation(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}


}

// dart format on
