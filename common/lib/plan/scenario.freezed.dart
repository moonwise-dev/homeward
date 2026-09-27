// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Scenario {

 Money get price; Money get downPayment; int get termYears; String get loanTypeId;@JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter() Rate get rateSpread;@JsonKey(name: 'rateShockPpm')@PpmJsonConverter() Rate get rateShock; Money? get associationFee;
/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScenarioCopyWith<Scenario> get copyWith => _$ScenarioCopyWithImpl<Scenario>(this as Scenario, _$identity);

  /// Serializes this Scenario to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Scenario;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scenario&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.termYears, _this.termYears) || other.termYears == _this.termYears)&&(identical(other.loanTypeId, _this.loanTypeId) || other.loanTypeId == _this.loanTypeId)&&(identical(other.rateSpread, _this.rateSpread) || other.rateSpread == _this.rateSpread)&&(identical(other.rateShock, _this.rateShock) || other.rateShock == _this.rateShock)&&(identical(other.associationFee, _this.associationFee) || other.associationFee == _this.associationFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Scenario;
  return Object.hash(runtimeType,_this.price,_this.downPayment,_this.termYears,_this.loanTypeId,_this.rateSpread,_this.rateShock,_this.associationFee);
}

@override
String toString() {
  final _this = this as Scenario;
  return 'Scenario(price: ${_this.price}, downPayment: ${_this.downPayment}, termYears: ${_this.termYears}, loanTypeId: ${_this.loanTypeId}, rateSpread: ${_this.rateSpread}, rateShock: ${_this.rateShock}, associationFee: ${_this.associationFee})';
}


}

/// @nodoc
abstract mixin class $ScenarioCopyWith<$Res>  {
  factory $ScenarioCopyWith(Scenario value, $Res Function(Scenario) _then) = _$ScenarioCopyWithImpl;
@useResult
$Res call({
 Money price, Money downPayment, int termYears, String loanTypeId,@JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter() Rate rateSpread,@JsonKey(name: 'rateShockPpm')@PpmJsonConverter() Rate rateShock, Money? associationFee
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res>? get associationFee;

}
/// @nodoc
class _$ScenarioCopyWithImpl<$Res>
    implements $ScenarioCopyWith<$Res> {
  _$ScenarioCopyWithImpl(this._self, this._then);

  final Scenario _self;
  final $Res Function(Scenario) _then;

/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? downPayment = null,Object? termYears = null,Object? loanTypeId = null,Object? rateSpread = null,Object? rateShock = null,Object? associationFee = freezed,}) {
  return _then(Scenario(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,rateSpread: null == rateSpread ? _self.rateSpread : rateSpread // ignore: cast_nullable_to_non_nullable
as Rate,rateShock: null == rateShock ? _self.rateShock : rateShock // ignore: cast_nullable_to_non_nullable
as Rate,associationFee: freezed == associationFee ? _self.associationFee : associationFee // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}
/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get associationFee {
    if (_self.associationFee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.associationFee!, (value) {
    return _then(_self.copyWith(associationFee: value));
  });
}
}


/// Adds pattern-matching-related methods to [Scenario].
extension ScenarioPatterns on Scenario {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scenario value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scenario() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scenario value)  $default,){
final _that = this;
switch (_that) {
case _Scenario():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scenario value)?  $default,){
final _that = this;
switch (_that) {
case _Scenario() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money price,  Money downPayment,  int termYears,  String loanTypeId, @JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter()  Rate rateSpread, @JsonKey(name: 'rateShockPpm')@PpmJsonConverter()  Rate rateShock,  Money? associationFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scenario() when $default != null:
return $default(_that.price,_that.downPayment,_that.termYears,_that.loanTypeId,_that.rateSpread,_that.rateShock,_that.associationFee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money price,  Money downPayment,  int termYears,  String loanTypeId, @JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter()  Rate rateSpread, @JsonKey(name: 'rateShockPpm')@PpmJsonConverter()  Rate rateShock,  Money? associationFee)  $default,) {final _that = this;
switch (_that) {
case _Scenario():
return $default(_that.price,_that.downPayment,_that.termYears,_that.loanTypeId,_that.rateSpread,_that.rateShock,_that.associationFee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money price,  Money downPayment,  int termYears,  String loanTypeId, @JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter()  Rate rateSpread, @JsonKey(name: 'rateShockPpm')@PpmJsonConverter()  Rate rateShock,  Money? associationFee)?  $default,) {final _that = this;
switch (_that) {
case _Scenario() when $default != null:
return $default(_that.price,_that.downPayment,_that.termYears,_that.loanTypeId,_that.rateSpread,_that.rateShock,_that.associationFee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Scenario extends Scenario {
  const _Scenario({required this.price, required this.downPayment, required this.termYears, required this.loanTypeId, @JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter() required this.rateSpread, @JsonKey(name: 'rateShockPpm')@PpmJsonConverter() this.rateShock = Rate.zero, this.associationFee}): assert(termYears > 0, 'termYears must be positive'),super._();
  factory _Scenario.fromJson(Map<String, dynamic> json) => _$ScenarioFromJson(json);

@override final  Money price;
@override final  Money downPayment;
@override final  int termYears;
@override final  String loanTypeId;
@override@JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter() final  Rate rateSpread;
@override@JsonKey(name: 'rateShockPpm')@PpmJsonConverter() final  Rate rateShock;
@override final  Money? associationFee;

/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScenarioCopyWith<_Scenario> get copyWith => __$ScenarioCopyWithImpl<_Scenario>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScenarioToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scenario&&(identical(other.price, price) || other.price == price)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.termYears, termYears) || other.termYears == termYears)&&(identical(other.loanTypeId, loanTypeId) || other.loanTypeId == loanTypeId)&&(identical(other.rateSpread, rateSpread) || other.rateSpread == rateSpread)&&(identical(other.rateShock, rateShock) || other.rateShock == rateShock)&&(identical(other.associationFee, associationFee) || other.associationFee == associationFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,price,downPayment,termYears,loanTypeId,rateSpread,rateShock,associationFee);
}

@override
String toString() {
    return 'Scenario(price: $price, downPayment: $downPayment, termYears: $termYears, loanTypeId: $loanTypeId, rateSpread: $rateSpread, rateShock: $rateShock, associationFee: $associationFee)';
}


}

/// @nodoc
abstract mixin class _$ScenarioCopyWith<$Res> implements $ScenarioCopyWith<$Res> {
  factory _$ScenarioCopyWith(_Scenario value, $Res Function(_Scenario) _then) = __$ScenarioCopyWithImpl;
@override @useResult
$Res call({
 Money price, Money downPayment, int termYears, String loanTypeId,@JsonKey(name: 'rateSpreadPpm')@PpmJsonConverter() Rate rateSpread,@JsonKey(name: 'rateShockPpm')@PpmJsonConverter() Rate rateShock, Money? associationFee
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res>? get associationFee;

}
/// @nodoc
class __$ScenarioCopyWithImpl<$Res>
    implements _$ScenarioCopyWith<$Res> {
  __$ScenarioCopyWithImpl(this._self, this._then);

  final _Scenario _self;
  final $Res Function(_Scenario) _then;

/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? downPayment = null,Object? termYears = null,Object? loanTypeId = null,Object? rateSpread = null,Object? rateShock = null,Object? associationFee = freezed,}) {
  return _then(_Scenario(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,termYears: null == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as int,loanTypeId: null == loanTypeId ? _self.loanTypeId : loanTypeId // ignore: cast_nullable_to_non_nullable
as String,rateSpread: null == rateSpread ? _self.rateSpread : rateSpread // ignore: cast_nullable_to_non_nullable
as Rate,rateShock: null == rateShock ? _self.rateShock : rateShock // ignore: cast_nullable_to_non_nullable
as Rate,associationFee: freezed == associationFee ? _self.associationFee : associationFee // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}

/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of Scenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get associationFee {
    if (_self.associationFee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.associationFee!, (value) {
    return _then(_self.copyWith(associationFee: value));
  });
}
}

// dart format on
