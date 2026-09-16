// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'living_costs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivingCosts {

 String get id;@CurrencyJsonConverter() Currency get currency; int get year; List<IndividualCost> get individual; List<HouseholdCost> get household; Source get source;
/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivingCostsCopyWith<LivingCosts> get copyWith => _$LivingCostsCopyWithImpl<LivingCosts>(this as LivingCosts, _$identity);

  /// Serializes this LivingCosts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LivingCosts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivingCosts&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.year, _this.year) || other.year == _this.year)&&const DeepCollectionEquality().equals(other.individual, _this.individual)&&const DeepCollectionEquality().equals(other.household, _this.household)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LivingCosts;
  return Object.hash(runtimeType,_this.id,_this.currency,_this.year,const DeepCollectionEquality().hash(_this.individual),const DeepCollectionEquality().hash(_this.household),_this.source);
}

@override
String toString() {
  final _this = this as LivingCosts;
  return 'LivingCosts(id: ${_this.id}, currency: ${_this.currency}, year: ${_this.year}, individual: ${_this.individual}, household: ${_this.household}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $LivingCostsCopyWith<$Res>  {
  factory $LivingCostsCopyWith(LivingCosts value, $Res Function(LivingCosts) _then) = _$LivingCostsCopyWithImpl;
@useResult
$Res call({
 String id,@CurrencyJsonConverter() Currency currency, int year, List<IndividualCost> individual, List<HouseholdCost> household, Source source
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$LivingCostsCopyWithImpl<$Res>
    implements $LivingCostsCopyWith<$Res> {
  _$LivingCostsCopyWithImpl(this._self, this._then);

  final LivingCosts _self;
  final $Res Function(LivingCosts) _then;

/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? currency = null,Object? year = null,Object? individual = null,Object? household = null,Object? source = null,}) {
  return _then(LivingCosts(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,individual: null == individual ? _self.individual : individual // ignore: cast_nullable_to_non_nullable
as List<IndividualCost>,household: null == household ? _self.household : household // ignore: cast_nullable_to_non_nullable
as List<HouseholdCost>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}
/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [LivingCosts].
extension LivingCostsPatterns on LivingCosts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivingCosts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivingCosts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivingCosts value)  $default,){
final _that = this;
switch (_that) {
case _LivingCosts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivingCosts value)?  $default,){
final _that = this;
switch (_that) {
case _LivingCosts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  List<IndividualCost> individual,  List<HouseholdCost> household,  Source source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivingCosts() when $default != null:
return $default(_that.id,_that.currency,_that.year,_that.individual,_that.household,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  List<IndividualCost> individual,  List<HouseholdCost> household,  Source source)  $default,) {final _that = this;
switch (_that) {
case _LivingCosts():
return $default(_that.id,_that.currency,_that.year,_that.individual,_that.household,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @CurrencyJsonConverter()  Currency currency,  int year,  List<IndividualCost> individual,  List<HouseholdCost> household,  Source source)?  $default,) {final _that = this;
switch (_that) {
case _LivingCosts() when $default != null:
return $default(_that.id,_that.currency,_that.year,_that.individual,_that.household,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LivingCosts extends LivingCosts {
  const _LivingCosts({required this.id, @CurrencyJsonConverter() required this.currency, required this.year, required  List<IndividualCost> individual, required  List<HouseholdCost> household, required this.source}): _individual = individual,_household = household,super._();
  factory _LivingCosts.fromJson(Map<String, dynamic> json) => _$LivingCostsFromJson(json);

@override final  String id;
@override@CurrencyJsonConverter() final  Currency currency;
@override final  int year;
 final  List<IndividualCost> _individual;
@override List<IndividualCost> get individual {
  if (_individual is EqualUnmodifiableListView) return _individual;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_individual);
}

 final  List<HouseholdCost> _household;
@override List<HouseholdCost> get household {
  if (_household is EqualUnmodifiableListView) return _household;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_household);
}

@override final  Source source;

/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivingCostsCopyWith<_LivingCosts> get copyWith => __$LivingCostsCopyWithImpl<_LivingCosts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LivingCostsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivingCosts&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other.individual, _individual)&&const DeepCollectionEquality().equals(other.household, _household)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,currency,year,const DeepCollectionEquality().hash(_individual),const DeepCollectionEquality().hash(_household),source);
}

@override
String toString() {
    return 'LivingCosts(id: $id, currency: $currency, year: $year, individual: $individual, household: $household, source: $source)';
}


}

/// @nodoc
abstract mixin class _$LivingCostsCopyWith<$Res> implements $LivingCostsCopyWith<$Res> {
  factory _$LivingCostsCopyWith(_LivingCosts value, $Res Function(_LivingCosts) _then) = __$LivingCostsCopyWithImpl;
@override @useResult
$Res call({
 String id,@CurrencyJsonConverter() Currency currency, int year, List<IndividualCost> individual, List<HouseholdCost> household, Source source
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$LivingCostsCopyWithImpl<$Res>
    implements _$LivingCostsCopyWith<$Res> {
  __$LivingCostsCopyWithImpl(this._self, this._then);

  final _LivingCosts _self;
  final $Res Function(_LivingCosts) _then;

/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? currency = null,Object? year = null,Object? individual = null,Object? household = null,Object? source = null,}) {
  return _then(_LivingCosts(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,individual: null == individual ? _self._individual : individual // ignore: cast_nullable_to_non_nullable
as List<IndividualCost>,household: null == household ? _self._household : household // ignore: cast_nullable_to_non_nullable
as List<HouseholdCost>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,
  ));
}

/// Create a copy of LivingCosts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc
mixin _$IndividualCost {

 int get ageFrom; int? get ageTo;@ExactDecimalJsonConverter() ExactDecimal get monthly;
/// Create a copy of IndividualCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualCostCopyWith<IndividualCost> get copyWith => _$IndividualCostCopyWithImpl<IndividualCost>(this as IndividualCost, _$identity);

  /// Serializes this IndividualCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IndividualCost;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualCost&&(identical(other.ageFrom, _this.ageFrom) || other.ageFrom == _this.ageFrom)&&(identical(other.ageTo, _this.ageTo) || other.ageTo == _this.ageTo)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IndividualCost;
  return Object.hash(runtimeType,_this.ageFrom,_this.ageTo,_this.monthly);
}

@override
String toString() {
  final _this = this as IndividualCost;
  return 'IndividualCost(ageFrom: ${_this.ageFrom}, ageTo: ${_this.ageTo}, monthly: ${_this.monthly})';
}


}

/// @nodoc
abstract mixin class $IndividualCostCopyWith<$Res>  {
  factory $IndividualCostCopyWith(IndividualCost value, $Res Function(IndividualCost) _then) = _$IndividualCostCopyWithImpl;
@useResult
$Res call({
 int ageFrom, int? ageTo,@ExactDecimalJsonConverter() ExactDecimal monthly
});




}
/// @nodoc
class _$IndividualCostCopyWithImpl<$Res>
    implements $IndividualCostCopyWith<$Res> {
  _$IndividualCostCopyWithImpl(this._self, this._then);

  final IndividualCost _self;
  final $Res Function(IndividualCost) _then;

/// Create a copy of IndividualCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ageFrom = null,Object? ageTo = freezed,Object? monthly = null,}) {
  return _then(IndividualCost(
ageFrom: null == ageFrom ? _self.ageFrom : ageFrom // ignore: cast_nullable_to_non_nullable
as int,ageTo: freezed == ageTo ? _self.ageTo : ageTo // ignore: cast_nullable_to_non_nullable
as int?,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [IndividualCost].
extension IndividualCostPatterns on IndividualCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndividualCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndividualCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndividualCost value)  $default,){
final _that = this;
switch (_that) {
case _IndividualCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndividualCost value)?  $default,){
final _that = this;
switch (_that) {
case _IndividualCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ageFrom,  int? ageTo, @ExactDecimalJsonConverter()  ExactDecimal monthly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualCost() when $default != null:
return $default(_that.ageFrom,_that.ageTo,_that.monthly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ageFrom,  int? ageTo, @ExactDecimalJsonConverter()  ExactDecimal monthly)  $default,) {final _that = this;
switch (_that) {
case _IndividualCost():
return $default(_that.ageFrom,_that.ageTo,_that.monthly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ageFrom,  int? ageTo, @ExactDecimalJsonConverter()  ExactDecimal monthly)?  $default,) {final _that = this;
switch (_that) {
case _IndividualCost() when $default != null:
return $default(_that.ageFrom,_that.ageTo,_that.monthly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualCost implements IndividualCost {
  const _IndividualCost({required this.ageFrom, this.ageTo, @ExactDecimalJsonConverter() required this.monthly});
  factory _IndividualCost.fromJson(Map<String, dynamic> json) => _$IndividualCostFromJson(json);

@override final  int ageFrom;
@override final  int? ageTo;
@override@ExactDecimalJsonConverter() final  ExactDecimal monthly;

/// Create a copy of IndividualCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualCostCopyWith<_IndividualCost> get copyWith => __$IndividualCostCopyWithImpl<_IndividualCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualCostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualCost&&(identical(other.ageFrom, ageFrom) || other.ageFrom == ageFrom)&&(identical(other.ageTo, ageTo) || other.ageTo == ageTo)&&(identical(other.monthly, monthly) || other.monthly == monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ageFrom,ageTo,monthly);
}

@override
String toString() {
    return 'IndividualCost(ageFrom: $ageFrom, ageTo: $ageTo, monthly: $monthly)';
}


}

/// @nodoc
abstract mixin class _$IndividualCostCopyWith<$Res> implements $IndividualCostCopyWith<$Res> {
  factory _$IndividualCostCopyWith(_IndividualCost value, $Res Function(_IndividualCost) _then) = __$IndividualCostCopyWithImpl;
@override @useResult
$Res call({
 int ageFrom, int? ageTo,@ExactDecimalJsonConverter() ExactDecimal monthly
});




}
/// @nodoc
class __$IndividualCostCopyWithImpl<$Res>
    implements _$IndividualCostCopyWith<$Res> {
  __$IndividualCostCopyWithImpl(this._self, this._then);

  final _IndividualCost _self;
  final $Res Function(_IndividualCost) _then;

/// Create a copy of IndividualCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ageFrom = null,Object? ageTo = freezed,Object? monthly = null,}) {
  return _then(_IndividualCost(
ageFrom: null == ageFrom ? _self.ageFrom : ageFrom // ignore: cast_nullable_to_non_nullable
as int,ageTo: freezed == ageTo ? _self.ageTo : ageTo // ignore: cast_nullable_to_non_nullable
as int?,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}


}


/// @nodoc
mixin _$HouseholdCost {

 int get persons;@ExactDecimalJsonConverter() ExactDecimal get monthly;
/// Create a copy of HouseholdCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseholdCostCopyWith<HouseholdCost> get copyWith => _$HouseholdCostCopyWithImpl<HouseholdCost>(this as HouseholdCost, _$identity);

  /// Serializes this HouseholdCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HouseholdCost;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseholdCost&&(identical(other.persons, _this.persons) || other.persons == _this.persons)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HouseholdCost;
  return Object.hash(runtimeType,_this.persons,_this.monthly);
}

@override
String toString() {
  final _this = this as HouseholdCost;
  return 'HouseholdCost(persons: ${_this.persons}, monthly: ${_this.monthly})';
}


}

/// @nodoc
abstract mixin class $HouseholdCostCopyWith<$Res>  {
  factory $HouseholdCostCopyWith(HouseholdCost value, $Res Function(HouseholdCost) _then) = _$HouseholdCostCopyWithImpl;
@useResult
$Res call({
 int persons,@ExactDecimalJsonConverter() ExactDecimal monthly
});




}
/// @nodoc
class _$HouseholdCostCopyWithImpl<$Res>
    implements $HouseholdCostCopyWith<$Res> {
  _$HouseholdCostCopyWithImpl(this._self, this._then);

  final HouseholdCost _self;
  final $Res Function(HouseholdCost) _then;

/// Create a copy of HouseholdCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? persons = null,Object? monthly = null,}) {
  return _then(HouseholdCost(
persons: null == persons ? _self.persons : persons // ignore: cast_nullable_to_non_nullable
as int,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseholdCost].
extension HouseholdCostPatterns on HouseholdCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseholdCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseholdCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseholdCost value)  $default,){
final _that = this;
switch (_that) {
case _HouseholdCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseholdCost value)?  $default,){
final _that = this;
switch (_that) {
case _HouseholdCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int persons, @ExactDecimalJsonConverter()  ExactDecimal monthly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseholdCost() when $default != null:
return $default(_that.persons,_that.monthly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int persons, @ExactDecimalJsonConverter()  ExactDecimal monthly)  $default,) {final _that = this;
switch (_that) {
case _HouseholdCost():
return $default(_that.persons,_that.monthly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int persons, @ExactDecimalJsonConverter()  ExactDecimal monthly)?  $default,) {final _that = this;
switch (_that) {
case _HouseholdCost() when $default != null:
return $default(_that.persons,_that.monthly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseholdCost implements HouseholdCost {
  const _HouseholdCost({required this.persons, @ExactDecimalJsonConverter() required this.monthly});
  factory _HouseholdCost.fromJson(Map<String, dynamic> json) => _$HouseholdCostFromJson(json);

@override final  int persons;
@override@ExactDecimalJsonConverter() final  ExactDecimal monthly;

/// Create a copy of HouseholdCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseholdCostCopyWith<_HouseholdCost> get copyWith => __$HouseholdCostCopyWithImpl<_HouseholdCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseholdCostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseholdCost&&(identical(other.persons, persons) || other.persons == persons)&&(identical(other.monthly, monthly) || other.monthly == monthly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,persons,monthly);
}

@override
String toString() {
    return 'HouseholdCost(persons: $persons, monthly: $monthly)';
}


}

/// @nodoc
abstract mixin class _$HouseholdCostCopyWith<$Res> implements $HouseholdCostCopyWith<$Res> {
  factory _$HouseholdCostCopyWith(_HouseholdCost value, $Res Function(_HouseholdCost) _then) = __$HouseholdCostCopyWithImpl;
@override @useResult
$Res call({
 int persons,@ExactDecimalJsonConverter() ExactDecimal monthly
});




}
/// @nodoc
class __$HouseholdCostCopyWithImpl<$Res>
    implements _$HouseholdCostCopyWith<$Res> {
  __$HouseholdCostCopyWithImpl(this._self, this._then);

  final _HouseholdCost _self;
  final $Res Function(_HouseholdCost) _then;

/// Create a copy of HouseholdCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? persons = null,Object? monthly = null,}) {
  return _then(_HouseholdCost(
persons: null == persons ? _self.persons : persons // ignore: cast_nullable_to_non_nullable
as int,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as ExactDecimal,
  ));
}


}

// dart format on
