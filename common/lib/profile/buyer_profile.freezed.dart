// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuyerProfile {

@CountryCodeJsonConverter() CountryCode? get citizenship;@CountryCodeJsonConverter() CountryCode? get taxResidence; bool? get formerResident; ResidencyIntent? get residencyIntent; PropertyUse? get use; bool? get firstTime; Employment? get employment; int? get age;
/// Create a copy of BuyerProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerProfileCopyWith<BuyerProfile> get copyWith => _$BuyerProfileCopyWithImpl<BuyerProfile>(this as BuyerProfile, _$identity);

  /// Serializes this BuyerProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuyerProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerProfile&&(identical(other.citizenship, _this.citizenship) || other.citizenship == _this.citizenship)&&(identical(other.taxResidence, _this.taxResidence) || other.taxResidence == _this.taxResidence)&&(identical(other.formerResident, _this.formerResident) || other.formerResident == _this.formerResident)&&(identical(other.residencyIntent, _this.residencyIntent) || other.residencyIntent == _this.residencyIntent)&&(identical(other.use, _this.use) || other.use == _this.use)&&(identical(other.firstTime, _this.firstTime) || other.firstTime == _this.firstTime)&&(identical(other.employment, _this.employment) || other.employment == _this.employment)&&(identical(other.age, _this.age) || other.age == _this.age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuyerProfile;
  return Object.hash(runtimeType,_this.citizenship,_this.taxResidence,_this.formerResident,_this.residencyIntent,_this.use,_this.firstTime,_this.employment,_this.age);
}

@override
String toString() {
  final _this = this as BuyerProfile;
  return 'BuyerProfile(citizenship: ${_this.citizenship}, taxResidence: ${_this.taxResidence}, formerResident: ${_this.formerResident}, residencyIntent: ${_this.residencyIntent}, use: ${_this.use}, firstTime: ${_this.firstTime}, employment: ${_this.employment}, age: ${_this.age})';
}


}

/// @nodoc
abstract mixin class $BuyerProfileCopyWith<$Res>  {
  factory $BuyerProfileCopyWith(BuyerProfile value, $Res Function(BuyerProfile) _then) = _$BuyerProfileCopyWithImpl;
@useResult
$Res call({
@CountryCodeJsonConverter() CountryCode? citizenship,@CountryCodeJsonConverter() CountryCode? taxResidence, bool? formerResident, ResidencyIntent? residencyIntent, PropertyUse? use, bool? firstTime, Employment? employment, int? age
});




}
/// @nodoc
class _$BuyerProfileCopyWithImpl<$Res>
    implements $BuyerProfileCopyWith<$Res> {
  _$BuyerProfileCopyWithImpl(this._self, this._then);

  final BuyerProfile _self;
  final $Res Function(BuyerProfile) _then;

/// Create a copy of BuyerProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? citizenship = freezed,Object? taxResidence = freezed,Object? formerResident = freezed,Object? residencyIntent = freezed,Object? use = freezed,Object? firstTime = freezed,Object? employment = freezed,Object? age = freezed,}) {
  return _then(BuyerProfile(
citizenship: freezed == citizenship ? _self.citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as CountryCode?,taxResidence: freezed == taxResidence ? _self.taxResidence : taxResidence // ignore: cast_nullable_to_non_nullable
as CountryCode?,formerResident: freezed == formerResident ? _self.formerResident : formerResident // ignore: cast_nullable_to_non_nullable
as bool?,residencyIntent: freezed == residencyIntent ? _self.residencyIntent : residencyIntent // ignore: cast_nullable_to_non_nullable
as ResidencyIntent?,use: freezed == use ? _self.use : use // ignore: cast_nullable_to_non_nullable
as PropertyUse?,firstTime: freezed == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as bool?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as Employment?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyerProfile].
extension BuyerProfilePatterns on BuyerProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerProfile value)  $default,){
final _that = this;
switch (_that) {
case _BuyerProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerProfile value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CountryCodeJsonConverter()  CountryCode? citizenship, @CountryCodeJsonConverter()  CountryCode? taxResidence,  bool? formerResident,  ResidencyIntent? residencyIntent,  PropertyUse? use,  bool? firstTime,  Employment? employment,  int? age)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerProfile() when $default != null:
return $default(_that.citizenship,_that.taxResidence,_that.formerResident,_that.residencyIntent,_that.use,_that.firstTime,_that.employment,_that.age);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CountryCodeJsonConverter()  CountryCode? citizenship, @CountryCodeJsonConverter()  CountryCode? taxResidence,  bool? formerResident,  ResidencyIntent? residencyIntent,  PropertyUse? use,  bool? firstTime,  Employment? employment,  int? age)  $default,) {final _that = this;
switch (_that) {
case _BuyerProfile():
return $default(_that.citizenship,_that.taxResidence,_that.formerResident,_that.residencyIntent,_that.use,_that.firstTime,_that.employment,_that.age);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CountryCodeJsonConverter()  CountryCode? citizenship, @CountryCodeJsonConverter()  CountryCode? taxResidence,  bool? formerResident,  ResidencyIntent? residencyIntent,  PropertyUse? use,  bool? firstTime,  Employment? employment,  int? age)?  $default,) {final _that = this;
switch (_that) {
case _BuyerProfile() when $default != null:
return $default(_that.citizenship,_that.taxResidence,_that.formerResident,_that.residencyIntent,_that.use,_that.firstTime,_that.employment,_that.age);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerProfile implements BuyerProfile {
  const _BuyerProfile({@CountryCodeJsonConverter() this.citizenship, @CountryCodeJsonConverter() this.taxResidence, this.formerResident, this.residencyIntent, this.use, this.firstTime, this.employment, this.age});
  factory _BuyerProfile.fromJson(Map<String, dynamic> json) => _$BuyerProfileFromJson(json);

@override@CountryCodeJsonConverter() final  CountryCode? citizenship;
@override@CountryCodeJsonConverter() final  CountryCode? taxResidence;
@override final  bool? formerResident;
@override final  ResidencyIntent? residencyIntent;
@override final  PropertyUse? use;
@override final  bool? firstTime;
@override final  Employment? employment;
@override final  int? age;

/// Create a copy of BuyerProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerProfileCopyWith<_BuyerProfile> get copyWith => __$BuyerProfileCopyWithImpl<_BuyerProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerProfile&&(identical(other.citizenship, citizenship) || other.citizenship == citizenship)&&(identical(other.taxResidence, taxResidence) || other.taxResidence == taxResidence)&&(identical(other.formerResident, formerResident) || other.formerResident == formerResident)&&(identical(other.residencyIntent, residencyIntent) || other.residencyIntent == residencyIntent)&&(identical(other.use, use) || other.use == use)&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.age, age) || other.age == age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,citizenship,taxResidence,formerResident,residencyIntent,use,firstTime,employment,age);
}

@override
String toString() {
    return 'BuyerProfile(citizenship: $citizenship, taxResidence: $taxResidence, formerResident: $formerResident, residencyIntent: $residencyIntent, use: $use, firstTime: $firstTime, employment: $employment, age: $age)';
}


}

/// @nodoc
abstract mixin class _$BuyerProfileCopyWith<$Res> implements $BuyerProfileCopyWith<$Res> {
  factory _$BuyerProfileCopyWith(_BuyerProfile value, $Res Function(_BuyerProfile) _then) = __$BuyerProfileCopyWithImpl;
@override @useResult
$Res call({
@CountryCodeJsonConverter() CountryCode? citizenship,@CountryCodeJsonConverter() CountryCode? taxResidence, bool? formerResident, ResidencyIntent? residencyIntent, PropertyUse? use, bool? firstTime, Employment? employment, int? age
});




}
/// @nodoc
class __$BuyerProfileCopyWithImpl<$Res>
    implements _$BuyerProfileCopyWith<$Res> {
  __$BuyerProfileCopyWithImpl(this._self, this._then);

  final _BuyerProfile _self;
  final $Res Function(_BuyerProfile) _then;

/// Create a copy of BuyerProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? citizenship = freezed,Object? taxResidence = freezed,Object? formerResident = freezed,Object? residencyIntent = freezed,Object? use = freezed,Object? firstTime = freezed,Object? employment = freezed,Object? age = freezed,}) {
  return _then(_BuyerProfile(
citizenship: freezed == citizenship ? _self.citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as CountryCode?,taxResidence: freezed == taxResidence ? _self.taxResidence : taxResidence // ignore: cast_nullable_to_non_nullable
as CountryCode?,formerResident: freezed == formerResident ? _self.formerResident : formerResident // ignore: cast_nullable_to_non_nullable
as bool?,residencyIntent: freezed == residencyIntent ? _self.residencyIntent : residencyIntent // ignore: cast_nullable_to_non_nullable
as ResidencyIntent?,use: freezed == use ? _self.use : use // ignore: cast_nullable_to_non_nullable
as PropertyUse?,firstTime: freezed == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as bool?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as Employment?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
