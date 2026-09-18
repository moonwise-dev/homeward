// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_predicate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuyerPredicate {

 Residency? get residency; bool? get formerResident; ResidencyIntent? get residencyIntent; Region? get citizenship; Region? get residencyRegion; PropertyUse? get use; bool? get firstTime; Employment? get employment; YearRange? get age;
/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<BuyerPredicate> get copyWith => _$BuyerPredicateCopyWithImpl<BuyerPredicate>(this as BuyerPredicate, _$identity);

  /// Serializes this BuyerPredicate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuyerPredicate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerPredicate&&(identical(other.residency, _this.residency) || other.residency == _this.residency)&&(identical(other.formerResident, _this.formerResident) || other.formerResident == _this.formerResident)&&(identical(other.residencyIntent, _this.residencyIntent) || other.residencyIntent == _this.residencyIntent)&&(identical(other.citizenship, _this.citizenship) || other.citizenship == _this.citizenship)&&(identical(other.residencyRegion, _this.residencyRegion) || other.residencyRegion == _this.residencyRegion)&&(identical(other.use, _this.use) || other.use == _this.use)&&(identical(other.firstTime, _this.firstTime) || other.firstTime == _this.firstTime)&&(identical(other.employment, _this.employment) || other.employment == _this.employment)&&(identical(other.age, _this.age) || other.age == _this.age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuyerPredicate;
  return Object.hash(runtimeType,_this.residency,_this.formerResident,_this.residencyIntent,_this.citizenship,_this.residencyRegion,_this.use,_this.firstTime,_this.employment,_this.age);
}

@override
String toString() {
  final _this = this as BuyerPredicate;
  return 'BuyerPredicate(residency: ${_this.residency}, formerResident: ${_this.formerResident}, residencyIntent: ${_this.residencyIntent}, citizenship: ${_this.citizenship}, residencyRegion: ${_this.residencyRegion}, use: ${_this.use}, firstTime: ${_this.firstTime}, employment: ${_this.employment}, age: ${_this.age})';
}


}

/// @nodoc
abstract mixin class $BuyerPredicateCopyWith<$Res>  {
  factory $BuyerPredicateCopyWith(BuyerPredicate value, $Res Function(BuyerPredicate) _then) = _$BuyerPredicateCopyWithImpl;
@useResult
$Res call({
 Residency? residency, bool? formerResident, ResidencyIntent? residencyIntent, Region? citizenship, Region? residencyRegion, PropertyUse? use, bool? firstTime, Employment? employment, YearRange? age
});


$YearRangeCopyWith<$Res>? get age;

}
/// @nodoc
class _$BuyerPredicateCopyWithImpl<$Res>
    implements $BuyerPredicateCopyWith<$Res> {
  _$BuyerPredicateCopyWithImpl(this._self, this._then);

  final BuyerPredicate _self;
  final $Res Function(BuyerPredicate) _then;

/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? residency = freezed,Object? formerResident = freezed,Object? residencyIntent = freezed,Object? citizenship = freezed,Object? residencyRegion = freezed,Object? use = freezed,Object? firstTime = freezed,Object? employment = freezed,Object? age = freezed,}) {
  return _then(BuyerPredicate(
residency: freezed == residency ? _self.residency : residency // ignore: cast_nullable_to_non_nullable
as Residency?,formerResident: freezed == formerResident ? _self.formerResident : formerResident // ignore: cast_nullable_to_non_nullable
as bool?,residencyIntent: freezed == residencyIntent ? _self.residencyIntent : residencyIntent // ignore: cast_nullable_to_non_nullable
as ResidencyIntent?,citizenship: freezed == citizenship ? _self.citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as Region?,residencyRegion: freezed == residencyRegion ? _self.residencyRegion : residencyRegion // ignore: cast_nullable_to_non_nullable
as Region?,use: freezed == use ? _self.use : use // ignore: cast_nullable_to_non_nullable
as PropertyUse?,firstTime: freezed == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as bool?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as Employment?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as YearRange?,
  ));
}
/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YearRangeCopyWith<$Res>? get age {
    if (_self.age == null) {
    return null;
  }

  return $YearRangeCopyWith<$Res>(_self.age!, (value) {
    return _then(_self.copyWith(age: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuyerPredicate].
extension BuyerPredicatePatterns on BuyerPredicate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerPredicate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerPredicate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerPredicate value)  $default,){
final _that = this;
switch (_that) {
case _BuyerPredicate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerPredicate value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerPredicate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Residency? residency,  bool? formerResident,  ResidencyIntent? residencyIntent,  Region? citizenship,  Region? residencyRegion,  PropertyUse? use,  bool? firstTime,  Employment? employment,  YearRange? age)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerPredicate() when $default != null:
return $default(_that.residency,_that.formerResident,_that.residencyIntent,_that.citizenship,_that.residencyRegion,_that.use,_that.firstTime,_that.employment,_that.age);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Residency? residency,  bool? formerResident,  ResidencyIntent? residencyIntent,  Region? citizenship,  Region? residencyRegion,  PropertyUse? use,  bool? firstTime,  Employment? employment,  YearRange? age)  $default,) {final _that = this;
switch (_that) {
case _BuyerPredicate():
return $default(_that.residency,_that.formerResident,_that.residencyIntent,_that.citizenship,_that.residencyRegion,_that.use,_that.firstTime,_that.employment,_that.age);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Residency? residency,  bool? formerResident,  ResidencyIntent? residencyIntent,  Region? citizenship,  Region? residencyRegion,  PropertyUse? use,  bool? firstTime,  Employment? employment,  YearRange? age)?  $default,) {final _that = this;
switch (_that) {
case _BuyerPredicate() when $default != null:
return $default(_that.residency,_that.formerResident,_that.residencyIntent,_that.citizenship,_that.residencyRegion,_that.use,_that.firstTime,_that.employment,_that.age);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerPredicate implements BuyerPredicate {
  const _BuyerPredicate({this.residency, this.formerResident, this.residencyIntent, this.citizenship, this.residencyRegion, this.use, this.firstTime, this.employment, this.age});
  factory _BuyerPredicate.fromJson(Map<String, dynamic> json) => _$BuyerPredicateFromJson(json);

@override final  Residency? residency;
@override final  bool? formerResident;
@override final  ResidencyIntent? residencyIntent;
@override final  Region? citizenship;
@override final  Region? residencyRegion;
@override final  PropertyUse? use;
@override final  bool? firstTime;
@override final  Employment? employment;
@override final  YearRange? age;

/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerPredicateCopyWith<_BuyerPredicate> get copyWith => __$BuyerPredicateCopyWithImpl<_BuyerPredicate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerPredicateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerPredicate&&(identical(other.residency, residency) || other.residency == residency)&&(identical(other.formerResident, formerResident) || other.formerResident == formerResident)&&(identical(other.residencyIntent, residencyIntent) || other.residencyIntent == residencyIntent)&&(identical(other.citizenship, citizenship) || other.citizenship == citizenship)&&(identical(other.residencyRegion, residencyRegion) || other.residencyRegion == residencyRegion)&&(identical(other.use, use) || other.use == use)&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.age, age) || other.age == age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,residency,formerResident,residencyIntent,citizenship,residencyRegion,use,firstTime,employment,age);
}

@override
String toString() {
    return 'BuyerPredicate(residency: $residency, formerResident: $formerResident, residencyIntent: $residencyIntent, citizenship: $citizenship, residencyRegion: $residencyRegion, use: $use, firstTime: $firstTime, employment: $employment, age: $age)';
}


}

/// @nodoc
abstract mixin class _$BuyerPredicateCopyWith<$Res> implements $BuyerPredicateCopyWith<$Res> {
  factory _$BuyerPredicateCopyWith(_BuyerPredicate value, $Res Function(_BuyerPredicate) _then) = __$BuyerPredicateCopyWithImpl;
@override @useResult
$Res call({
 Residency? residency, bool? formerResident, ResidencyIntent? residencyIntent, Region? citizenship, Region? residencyRegion, PropertyUse? use, bool? firstTime, Employment? employment, YearRange? age
});


@override $YearRangeCopyWith<$Res>? get age;

}
/// @nodoc
class __$BuyerPredicateCopyWithImpl<$Res>
    implements _$BuyerPredicateCopyWith<$Res> {
  __$BuyerPredicateCopyWithImpl(this._self, this._then);

  final _BuyerPredicate _self;
  final $Res Function(_BuyerPredicate) _then;

/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? residency = freezed,Object? formerResident = freezed,Object? residencyIntent = freezed,Object? citizenship = freezed,Object? residencyRegion = freezed,Object? use = freezed,Object? firstTime = freezed,Object? employment = freezed,Object? age = freezed,}) {
  return _then(_BuyerPredicate(
residency: freezed == residency ? _self.residency : residency // ignore: cast_nullable_to_non_nullable
as Residency?,formerResident: freezed == formerResident ? _self.formerResident : formerResident // ignore: cast_nullable_to_non_nullable
as bool?,residencyIntent: freezed == residencyIntent ? _self.residencyIntent : residencyIntent // ignore: cast_nullable_to_non_nullable
as ResidencyIntent?,citizenship: freezed == citizenship ? _self.citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as Region?,residencyRegion: freezed == residencyRegion ? _self.residencyRegion : residencyRegion // ignore: cast_nullable_to_non_nullable
as Region?,use: freezed == use ? _self.use : use // ignore: cast_nullable_to_non_nullable
as PropertyUse?,firstTime: freezed == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as bool?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as Employment?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as YearRange?,
  ));
}

/// Create a copy of BuyerPredicate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YearRangeCopyWith<$Res>? get age {
    if (_self.age == null) {
    return null;
  }

  return $YearRangeCopyWith<$Res>(_self.age!, (value) {
    return _then(_self.copyWith(age: value));
  });
}
}

// dart format on
