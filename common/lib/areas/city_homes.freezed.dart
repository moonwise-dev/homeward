// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_homes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
CityHomes _$CityHomesFromJson(
  Map<String, dynamic> json
) {
    return _HomeMap.fromJson(
      json
    );
}

/// @nodoc
mixin _$CityHomes {

 String get cityId; String get cityName; GeoPoint get centre; bool get renting; Money? get highestPrice; MapHousehold? get household; List<MapPlace> get places; List<MapArea> get areas; List<MapHome> get homes;
/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityHomesCopyWith<CityHomes> get copyWith => _$CityHomesCopyWithImpl<CityHomes>(this as CityHomes, _$identity);

  /// Serializes this CityHomes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CityHomes;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHomes&&(identical(other.cityId, _this.cityId) || other.cityId == _this.cityId)&&(identical(other.cityName, _this.cityName) || other.cityName == _this.cityName)&&(identical(other.centre, _this.centre) || other.centre == _this.centre)&&(identical(other.renting, _this.renting) || other.renting == _this.renting)&&(identical(other.highestPrice, _this.highestPrice) || other.highestPrice == _this.highestPrice)&&(identical(other.household, _this.household) || other.household == _this.household)&&const DeepCollectionEquality().equals(other.places, _this.places)&&const DeepCollectionEquality().equals(other.areas, _this.areas)&&const DeepCollectionEquality().equals(other.homes, _this.homes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CityHomes;
  return Object.hash(runtimeType,_this.cityId,_this.cityName,_this.centre,_this.renting,_this.highestPrice,_this.household,const DeepCollectionEquality().hash(_this.places),const DeepCollectionEquality().hash(_this.areas),const DeepCollectionEquality().hash(_this.homes));
}

@override
String toString() {
  final _this = this as CityHomes;
  return 'CityHomes(cityId: ${_this.cityId}, cityName: ${_this.cityName}, centre: ${_this.centre}, renting: ${_this.renting}, highestPrice: ${_this.highestPrice}, household: ${_this.household}, places: ${_this.places}, areas: ${_this.areas}, homes: ${_this.homes})';
}


}

/// @nodoc
abstract mixin class $CityHomesCopyWith<$Res>  {
  factory $CityHomesCopyWith(CityHomes value, $Res Function(CityHomes) _then) = _$CityHomesCopyWithImpl;
@useResult
$Res call({
 String cityId, String cityName, GeoPoint centre, bool renting, Money? highestPrice, MapHousehold? household, List<MapPlace> places, List<MapArea> areas, List<MapHome> homes
});


$GeoPointCopyWith<$Res> get centre;$MoneyCopyWith<$Res>? get highestPrice;$MapHouseholdCopyWith<$Res>? get household;

}
/// @nodoc
class _$CityHomesCopyWithImpl<$Res>
    implements $CityHomesCopyWith<$Res> {
  _$CityHomesCopyWithImpl(this._self, this._then);

  final CityHomes _self;
  final $Res Function(CityHomes) _then;

/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityId = null,Object? cityName = null,Object? centre = null,Object? renting = null,Object? highestPrice = freezed,Object? household = freezed,Object? places = null,Object? areas = null,Object? homes = null,}) {
  return _then(CityHomes(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,centre: null == centre ? _self.centre : centre // ignore: cast_nullable_to_non_nullable
as GeoPoint,renting: null == renting ? _self.renting : renting // ignore: cast_nullable_to_non_nullable
as bool,highestPrice: freezed == highestPrice ? _self.highestPrice : highestPrice // ignore: cast_nullable_to_non_nullable
as Money?,household: freezed == household ? _self.household : household // ignore: cast_nullable_to_non_nullable
as MapHousehold?,places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as List<MapPlace>,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<MapArea>,homes: null == homes ? _self.homes : homes // ignore: cast_nullable_to_non_nullable
as List<MapHome>,
  ));
}
/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get centre {
  
  return $GeoPointCopyWith<$Res>(_self.centre, (value) {
    return _then(_self.copyWith(centre: value));
  });
}/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get highestPrice {
    if (_self.highestPrice == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.highestPrice!, (value) {
    return _then(_self.copyWith(highestPrice: value));
  });
}/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapHouseholdCopyWith<$Res>? get household {
    if (_self.household == null) {
    return null;
  }

  return $MapHouseholdCopyWith<$Res>(_self.household!, (value) {
    return _then(_self.copyWith(household: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityHomes].
extension CityHomesPatterns on CityHomes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeMap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeMap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeMap value)  $default,){
final _that = this;
switch (_that) {
case _HomeMap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeMap value)?  $default,){
final _that = this;
switch (_that) {
case _HomeMap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cityId,  String cityName,  GeoPoint centre,  bool renting,  Money? highestPrice,  MapHousehold? household,  List<MapPlace> places,  List<MapArea> areas,  List<MapHome> homes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeMap() when $default != null:
return $default(_that.cityId,_that.cityName,_that.centre,_that.renting,_that.highestPrice,_that.household,_that.places,_that.areas,_that.homes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cityId,  String cityName,  GeoPoint centre,  bool renting,  Money? highestPrice,  MapHousehold? household,  List<MapPlace> places,  List<MapArea> areas,  List<MapHome> homes)  $default,) {final _that = this;
switch (_that) {
case _HomeMap():
return $default(_that.cityId,_that.cityName,_that.centre,_that.renting,_that.highestPrice,_that.household,_that.places,_that.areas,_that.homes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cityId,  String cityName,  GeoPoint centre,  bool renting,  Money? highestPrice,  MapHousehold? household,  List<MapPlace> places,  List<MapArea> areas,  List<MapHome> homes)?  $default,) {final _that = this;
switch (_that) {
case _HomeMap() when $default != null:
return $default(_that.cityId,_that.cityName,_that.centre,_that.renting,_that.highestPrice,_that.household,_that.places,_that.areas,_that.homes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeMap extends CityHomes {
  const _HomeMap({required this.cityId, required this.cityName, required this.centre, this.renting = false, this.highestPrice, this.household,  List<MapPlace> places = const [],  List<MapArea> areas = const [],  List<MapHome> homes = const []}): _places = places,_areas = areas,_homes = homes,super._();
  factory _HomeMap.fromJson(Map<String, dynamic> json) => _$HomeMapFromJson(json);

@override final  String cityId;
@override final  String cityName;
@override final  GeoPoint centre;
@override@JsonKey() final  bool renting;
@override final  Money? highestPrice;
@override final  MapHousehold? household;
 final  List<MapPlace> _places;
@override@JsonKey() List<MapPlace> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}

 final  List<MapArea> _areas;
@override@JsonKey() List<MapArea> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}

 final  List<MapHome> _homes;
@override@JsonKey() List<MapHome> get homes {
  if (_homes is EqualUnmodifiableListView) return _homes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homes);
}


/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeMapCopyWith<_HomeMap> get copyWith => __$HomeMapCopyWithImpl<_HomeMap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeMapToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeMap&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.centre, centre) || other.centre == centre)&&(identical(other.renting, renting) || other.renting == renting)&&(identical(other.highestPrice, highestPrice) || other.highestPrice == highestPrice)&&(identical(other.household, household) || other.household == household)&&const DeepCollectionEquality().equals(other.places, _places)&&const DeepCollectionEquality().equals(other.areas, _areas)&&const DeepCollectionEquality().equals(other.homes, _homes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cityId,cityName,centre,renting,highestPrice,household,const DeepCollectionEquality().hash(_places),const DeepCollectionEquality().hash(_areas),const DeepCollectionEquality().hash(_homes));
}

@override
String toString() {
    return 'CityHomes(cityId: $cityId, cityName: $cityName, centre: $centre, renting: $renting, highestPrice: $highestPrice, household: $household, places: $places, areas: $areas, homes: $homes)';
}


}

/// @nodoc
abstract mixin class _$HomeMapCopyWith<$Res> implements $CityHomesCopyWith<$Res> {
  factory _$HomeMapCopyWith(_HomeMap value, $Res Function(_HomeMap) _then) = __$HomeMapCopyWithImpl;
@override @useResult
$Res call({
 String cityId, String cityName, GeoPoint centre, bool renting, Money? highestPrice, MapHousehold? household, List<MapPlace> places, List<MapArea> areas, List<MapHome> homes
});


@override $GeoPointCopyWith<$Res> get centre;@override $MoneyCopyWith<$Res>? get highestPrice;@override $MapHouseholdCopyWith<$Res>? get household;

}
/// @nodoc
class __$HomeMapCopyWithImpl<$Res>
    implements _$HomeMapCopyWith<$Res> {
  __$HomeMapCopyWithImpl(this._self, this._then);

  final _HomeMap _self;
  final $Res Function(_HomeMap) _then;

/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityId = null,Object? cityName = null,Object? centre = null,Object? renting = null,Object? highestPrice = freezed,Object? household = freezed,Object? places = null,Object? areas = null,Object? homes = null,}) {
  return _then(_HomeMap(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,centre: null == centre ? _self.centre : centre // ignore: cast_nullable_to_non_nullable
as GeoPoint,renting: null == renting ? _self.renting : renting // ignore: cast_nullable_to_non_nullable
as bool,highestPrice: freezed == highestPrice ? _self.highestPrice : highestPrice // ignore: cast_nullable_to_non_nullable
as Money?,household: freezed == household ? _self.household : household // ignore: cast_nullable_to_non_nullable
as MapHousehold?,places: null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<MapPlace>,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<MapArea>,homes: null == homes ? _self._homes : homes // ignore: cast_nullable_to_non_nullable
as List<MapHome>,
  ));
}

/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get centre {
  
  return $GeoPointCopyWith<$Res>(_self.centre, (value) {
    return _then(_self.copyWith(centre: value));
  });
}/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get highestPrice {
    if (_self.highestPrice == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.highestPrice!, (value) {
    return _then(_self.copyWith(highestPrice: value));
  });
}/// Create a copy of CityHomes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapHouseholdCopyWith<$Res>? get household {
    if (_self.household == null) {
    return null;
  }

  return $MapHouseholdCopyWith<$Res>(_self.household!, (value) {
    return _then(_self.copyWith(household: value));
  });
}
}


/// @nodoc
mixin _$MapHousehold {

 int? get adults; List<int>? get childAges; Money? get grossMonthlyIncome; Money? get savings; Money? get maxRent; Set<ProfileAssumption> get assumed;
/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapHouseholdCopyWith<MapHousehold> get copyWith => _$MapHouseholdCopyWithImpl<MapHousehold>(this as MapHousehold, _$identity);

  /// Serializes this MapHousehold to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapHousehold;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapHousehold&&(identical(other.adults, _this.adults) || other.adults == _this.adults)&&const DeepCollectionEquality().equals(other.childAges, _this.childAges)&&(identical(other.grossMonthlyIncome, _this.grossMonthlyIncome) || other.grossMonthlyIncome == _this.grossMonthlyIncome)&&(identical(other.savings, _this.savings) || other.savings == _this.savings)&&(identical(other.maxRent, _this.maxRent) || other.maxRent == _this.maxRent)&&const DeepCollectionEquality().equals(other.assumed, _this.assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapHousehold;
  return Object.hash(runtimeType,_this.adults,const DeepCollectionEquality().hash(_this.childAges),_this.grossMonthlyIncome,_this.savings,_this.maxRent,const DeepCollectionEquality().hash(_this.assumed));
}

@override
String toString() {
  final _this = this as MapHousehold;
  return 'MapHousehold(adults: ${_this.adults}, childAges: ${_this.childAges}, grossMonthlyIncome: ${_this.grossMonthlyIncome}, savings: ${_this.savings}, maxRent: ${_this.maxRent}, assumed: ${_this.assumed})';
}


}

/// @nodoc
abstract mixin class $MapHouseholdCopyWith<$Res>  {
  factory $MapHouseholdCopyWith(MapHousehold value, $Res Function(MapHousehold) _then) = _$MapHouseholdCopyWithImpl;
@useResult
$Res call({
 int? adults, List<int>? childAges, Money? grossMonthlyIncome, Money? savings, Money? maxRent, Set<ProfileAssumption> assumed
});


$MoneyCopyWith<$Res>? get grossMonthlyIncome;$MoneyCopyWith<$Res>? get savings;$MoneyCopyWith<$Res>? get maxRent;

}
/// @nodoc
class _$MapHouseholdCopyWithImpl<$Res>
    implements $MapHouseholdCopyWith<$Res> {
  _$MapHouseholdCopyWithImpl(this._self, this._then);

  final MapHousehold _self;
  final $Res Function(MapHousehold) _then;

/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adults = freezed,Object? childAges = freezed,Object? grossMonthlyIncome = freezed,Object? savings = freezed,Object? maxRent = freezed,Object? assumed = null,}) {
  return _then(MapHousehold(
adults: freezed == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int?,childAges: freezed == childAges ? _self.childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>?,grossMonthlyIncome: freezed == grossMonthlyIncome ? _self.grossMonthlyIncome : grossMonthlyIncome // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,maxRent: freezed == maxRent ? _self.maxRent : maxRent // ignore: cast_nullable_to_non_nullable
as Money?,assumed: null == assumed ? _self.assumed : assumed // ignore: cast_nullable_to_non_nullable
as Set<ProfileAssumption>,
  ));
}
/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get grossMonthlyIncome {
    if (_self.grossMonthlyIncome == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.grossMonthlyIncome!, (value) {
    return _then(_self.copyWith(grossMonthlyIncome: value));
  });
}/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get maxRent {
    if (_self.maxRent == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.maxRent!, (value) {
    return _then(_self.copyWith(maxRent: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapHousehold].
extension MapHouseholdPatterns on MapHousehold {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapHousehold value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapHousehold() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapHousehold value)  $default,){
final _that = this;
switch (_that) {
case _MapHousehold():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapHousehold value)?  $default,){
final _that = this;
switch (_that) {
case _MapHousehold() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? adults,  List<int>? childAges,  Money? grossMonthlyIncome,  Money? savings,  Money? maxRent,  Set<ProfileAssumption> assumed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapHousehold() when $default != null:
return $default(_that.adults,_that.childAges,_that.grossMonthlyIncome,_that.savings,_that.maxRent,_that.assumed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? adults,  List<int>? childAges,  Money? grossMonthlyIncome,  Money? savings,  Money? maxRent,  Set<ProfileAssumption> assumed)  $default,) {final _that = this;
switch (_that) {
case _MapHousehold():
return $default(_that.adults,_that.childAges,_that.grossMonthlyIncome,_that.savings,_that.maxRent,_that.assumed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? adults,  List<int>? childAges,  Money? grossMonthlyIncome,  Money? savings,  Money? maxRent,  Set<ProfileAssumption> assumed)?  $default,) {final _that = this;
switch (_that) {
case _MapHousehold() when $default != null:
return $default(_that.adults,_that.childAges,_that.grossMonthlyIncome,_that.savings,_that.maxRent,_that.assumed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapHousehold implements MapHousehold {
  const _MapHousehold({this.adults,  List<int>? childAges, this.grossMonthlyIncome, this.savings, this.maxRent,  Set<ProfileAssumption> assumed = const {}}): _childAges = childAges,_assumed = assumed;
  factory _MapHousehold.fromJson(Map<String, dynamic> json) => _$MapHouseholdFromJson(json);

@override final  int? adults;
 final  List<int>? _childAges;
@override List<int>? get childAges {
  final value = _childAges;
  if (value == null) return null;
  if (_childAges is EqualUnmodifiableListView) return _childAges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Money? grossMonthlyIncome;
@override final  Money? savings;
@override final  Money? maxRent;
 final  Set<ProfileAssumption> _assumed;
@override@JsonKey() Set<ProfileAssumption> get assumed {
  if (_assumed is EqualUnmodifiableSetView) return _assumed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_assumed);
}


/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapHouseholdCopyWith<_MapHousehold> get copyWith => __$MapHouseholdCopyWithImpl<_MapHousehold>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapHouseholdToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapHousehold&&(identical(other.adults, adults) || other.adults == adults)&&const DeepCollectionEquality().equals(other.childAges, _childAges)&&(identical(other.grossMonthlyIncome, grossMonthlyIncome) || other.grossMonthlyIncome == grossMonthlyIncome)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.maxRent, maxRent) || other.maxRent == maxRent)&&const DeepCollectionEquality().equals(other.assumed, _assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,adults,const DeepCollectionEquality().hash(_childAges),grossMonthlyIncome,savings,maxRent,const DeepCollectionEquality().hash(_assumed));
}

@override
String toString() {
    return 'MapHousehold(adults: $adults, childAges: $childAges, grossMonthlyIncome: $grossMonthlyIncome, savings: $savings, maxRent: $maxRent, assumed: $assumed)';
}


}

/// @nodoc
abstract mixin class _$MapHouseholdCopyWith<$Res> implements $MapHouseholdCopyWith<$Res> {
  factory _$MapHouseholdCopyWith(_MapHousehold value, $Res Function(_MapHousehold) _then) = __$MapHouseholdCopyWithImpl;
@override @useResult
$Res call({
 int? adults, List<int>? childAges, Money? grossMonthlyIncome, Money? savings, Money? maxRent, Set<ProfileAssumption> assumed
});


@override $MoneyCopyWith<$Res>? get grossMonthlyIncome;@override $MoneyCopyWith<$Res>? get savings;@override $MoneyCopyWith<$Res>? get maxRent;

}
/// @nodoc
class __$MapHouseholdCopyWithImpl<$Res>
    implements _$MapHouseholdCopyWith<$Res> {
  __$MapHouseholdCopyWithImpl(this._self, this._then);

  final _MapHousehold _self;
  final $Res Function(_MapHousehold) _then;

/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adults = freezed,Object? childAges = freezed,Object? grossMonthlyIncome = freezed,Object? savings = freezed,Object? maxRent = freezed,Object? assumed = null,}) {
  return _then(_MapHousehold(
adults: freezed == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int?,childAges: freezed == childAges ? _self._childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>?,grossMonthlyIncome: freezed == grossMonthlyIncome ? _self.grossMonthlyIncome : grossMonthlyIncome // ignore: cast_nullable_to_non_nullable
as Money?,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,maxRent: freezed == maxRent ? _self.maxRent : maxRent // ignore: cast_nullable_to_non_nullable
as Money?,assumed: null == assumed ? _self._assumed : assumed // ignore: cast_nullable_to_non_nullable
as Set<ProfileAssumption>,
  ));
}

/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get grossMonthlyIncome {
    if (_self.grossMonthlyIncome == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.grossMonthlyIncome!, (value) {
    return _then(_self.copyWith(grossMonthlyIncome: value));
  });
}/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of MapHousehold
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get maxRent {
    if (_self.maxRent == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.maxRent!, (value) {
    return _then(_self.copyWith(maxRent: value));
  });
}
}


/// @nodoc
mixin _$MapPlace {

 String get id; String get name; GeoPoint get point; int get perWeek; TravelMode get mode; bool get assumed;
/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPlaceCopyWith<MapPlace> get copyWith => _$MapPlaceCopyWithImpl<MapPlace>(this as MapPlace, _$identity);

  /// Serializes this MapPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapPlace;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPlace&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.point, _this.point) || other.point == _this.point)&&(identical(other.perWeek, _this.perWeek) || other.perWeek == _this.perWeek)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.assumed, _this.assumed) || other.assumed == _this.assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapPlace;
  return Object.hash(runtimeType,_this.id,_this.name,_this.point,_this.perWeek,_this.mode,_this.assumed);
}

@override
String toString() {
  final _this = this as MapPlace;
  return 'MapPlace(id: ${_this.id}, name: ${_this.name}, point: ${_this.point}, perWeek: ${_this.perWeek}, mode: ${_this.mode}, assumed: ${_this.assumed})';
}


}

/// @nodoc
abstract mixin class $MapPlaceCopyWith<$Res>  {
  factory $MapPlaceCopyWith(MapPlace value, $Res Function(MapPlace) _then) = _$MapPlaceCopyWithImpl;
@useResult
$Res call({
 String id, String name, GeoPoint point, int perWeek, TravelMode mode, bool assumed
});


$GeoPointCopyWith<$Res> get point;

}
/// @nodoc
class _$MapPlaceCopyWithImpl<$Res>
    implements $MapPlaceCopyWith<$Res> {
  _$MapPlaceCopyWithImpl(this._self, this._then);

  final MapPlace _self;
  final $Res Function(MapPlace) _then;

/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? point = null,Object? perWeek = null,Object? mode = null,Object? assumed = null,}) {
  return _then(MapPlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,assumed: null == assumed ? _self.assumed : assumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapPlace].
extension MapPlacePatterns on MapPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPlace value)  $default,){
final _that = this;
switch (_that) {
case _MapPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPlace value)?  $default,){
final _that = this;
switch (_that) {
case _MapPlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  GeoPoint point,  int perWeek,  TravelMode mode,  bool assumed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPlace() when $default != null:
return $default(_that.id,_that.name,_that.point,_that.perWeek,_that.mode,_that.assumed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  GeoPoint point,  int perWeek,  TravelMode mode,  bool assumed)  $default,) {final _that = this;
switch (_that) {
case _MapPlace():
return $default(_that.id,_that.name,_that.point,_that.perWeek,_that.mode,_that.assumed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  GeoPoint point,  int perWeek,  TravelMode mode,  bool assumed)?  $default,) {final _that = this;
switch (_that) {
case _MapPlace() when $default != null:
return $default(_that.id,_that.name,_that.point,_that.perWeek,_that.mode,_that.assumed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapPlace implements MapPlace {
  const _MapPlace({required this.id, required this.name, required this.point, required this.perWeek, required this.mode, this.assumed = false});
  factory _MapPlace.fromJson(Map<String, dynamic> json) => _$MapPlaceFromJson(json);

@override final  String id;
@override final  String name;
@override final  GeoPoint point;
@override final  int perWeek;
@override final  TravelMode mode;
@override@JsonKey() final  bool assumed;

/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPlaceCopyWith<_MapPlace> get copyWith => __$MapPlaceCopyWithImpl<_MapPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.point, point) || other.point == point)&&(identical(other.perWeek, perWeek) || other.perWeek == perWeek)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.assumed, assumed) || other.assumed == assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,point,perWeek,mode,assumed);
}

@override
String toString() {
    return 'MapPlace(id: $id, name: $name, point: $point, perWeek: $perWeek, mode: $mode, assumed: $assumed)';
}


}

/// @nodoc
abstract mixin class _$MapPlaceCopyWith<$Res> implements $MapPlaceCopyWith<$Res> {
  factory _$MapPlaceCopyWith(_MapPlace value, $Res Function(_MapPlace) _then) = __$MapPlaceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, GeoPoint point, int perWeek, TravelMode mode, bool assumed
});


@override $GeoPointCopyWith<$Res> get point;

}
/// @nodoc
class __$MapPlaceCopyWithImpl<$Res>
    implements _$MapPlaceCopyWith<$Res> {
  __$MapPlaceCopyWithImpl(this._self, this._then);

  final _MapPlace _self;
  final $Res Function(_MapPlace) _then;

/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? point = null,Object? perWeek = null,Object? mode = null,Object? assumed = null,}) {
  return _then(_MapPlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,assumed: null == assumed ? _self.assumed : assumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MapPlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}


/// @nodoc
mixin _$MapArea {

 String get areaId; String get areaName; GeoPoint get centre; Map<String, int> get minutes; Map<String, String> get routes;
/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapAreaCopyWith<MapArea> get copyWith => _$MapAreaCopyWithImpl<MapArea>(this as MapArea, _$identity);

  /// Serializes this MapArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapArea;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapArea&&(identical(other.areaId, _this.areaId) || other.areaId == _this.areaId)&&(identical(other.areaName, _this.areaName) || other.areaName == _this.areaName)&&(identical(other.centre, _this.centre) || other.centre == _this.centre)&&const DeepCollectionEquality().equals(other.minutes, _this.minutes)&&const DeepCollectionEquality().equals(other.routes, _this.routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapArea;
  return Object.hash(runtimeType,_this.areaId,_this.areaName,_this.centre,const DeepCollectionEquality().hash(_this.minutes),const DeepCollectionEquality().hash(_this.routes));
}

@override
String toString() {
  final _this = this as MapArea;
  return 'MapArea(areaId: ${_this.areaId}, areaName: ${_this.areaName}, centre: ${_this.centre}, minutes: ${_this.minutes}, routes: ${_this.routes})';
}


}

/// @nodoc
abstract mixin class $MapAreaCopyWith<$Res>  {
  factory $MapAreaCopyWith(MapArea value, $Res Function(MapArea) _then) = _$MapAreaCopyWithImpl;
@useResult
$Res call({
 String areaId, String areaName, GeoPoint centre, Map<String, int> minutes, Map<String, String> routes
});


$GeoPointCopyWith<$Res> get centre;

}
/// @nodoc
class _$MapAreaCopyWithImpl<$Res>
    implements $MapAreaCopyWith<$Res> {
  _$MapAreaCopyWithImpl(this._self, this._then);

  final MapArea _self;
  final $Res Function(MapArea) _then;

/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areaId = null,Object? areaName = null,Object? centre = null,Object? minutes = null,Object? routes = null,}) {
  return _then(MapArea(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,centre: null == centre ? _self.centre : centre // ignore: cast_nullable_to_non_nullable
as GeoPoint,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,routes: null == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}
/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get centre {
  
  return $GeoPointCopyWith<$Res>(_self.centre, (value) {
    return _then(_self.copyWith(centre: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapArea].
extension MapAreaPatterns on MapArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapArea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapArea value)  $default,){
final _that = this;
switch (_that) {
case _MapArea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapArea value)?  $default,){
final _that = this;
switch (_that) {
case _MapArea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String areaId,  String areaName,  GeoPoint centre,  Map<String, int> minutes,  Map<String, String> routes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapArea() when $default != null:
return $default(_that.areaId,_that.areaName,_that.centre,_that.minutes,_that.routes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String areaId,  String areaName,  GeoPoint centre,  Map<String, int> minutes,  Map<String, String> routes)  $default,) {final _that = this;
switch (_that) {
case _MapArea():
return $default(_that.areaId,_that.areaName,_that.centre,_that.minutes,_that.routes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String areaId,  String areaName,  GeoPoint centre,  Map<String, int> minutes,  Map<String, String> routes)?  $default,) {final _that = this;
switch (_that) {
case _MapArea() when $default != null:
return $default(_that.areaId,_that.areaName,_that.centre,_that.minutes,_that.routes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapArea implements MapArea {
  const _MapArea({required this.areaId, required this.areaName, required this.centre,  Map<String, int> minutes = const {},  Map<String, String> routes = const {}}): _minutes = minutes,_routes = routes;
  factory _MapArea.fromJson(Map<String, dynamic> json) => _$MapAreaFromJson(json);

@override final  String areaId;
@override final  String areaName;
@override final  GeoPoint centre;
 final  Map<String, int> _minutes;
@override@JsonKey() Map<String, int> get minutes {
  if (_minutes is EqualUnmodifiableMapView) return _minutes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_minutes);
}

 final  Map<String, String> _routes;
@override@JsonKey() Map<String, String> get routes {
  if (_routes is EqualUnmodifiableMapView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_routes);
}


/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapAreaCopyWith<_MapArea> get copyWith => __$MapAreaCopyWithImpl<_MapArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapAreaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapArea&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.centre, centre) || other.centre == centre)&&const DeepCollectionEquality().equals(other.minutes, _minutes)&&const DeepCollectionEquality().equals(other.routes, _routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,areaId,areaName,centre,const DeepCollectionEquality().hash(_minutes),const DeepCollectionEquality().hash(_routes));
}

@override
String toString() {
    return 'MapArea(areaId: $areaId, areaName: $areaName, centre: $centre, minutes: $minutes, routes: $routes)';
}


}

/// @nodoc
abstract mixin class _$MapAreaCopyWith<$Res> implements $MapAreaCopyWith<$Res> {
  factory _$MapAreaCopyWith(_MapArea value, $Res Function(_MapArea) _then) = __$MapAreaCopyWithImpl;
@override @useResult
$Res call({
 String areaId, String areaName, GeoPoint centre, Map<String, int> minutes, Map<String, String> routes
});


@override $GeoPointCopyWith<$Res> get centre;

}
/// @nodoc
class __$MapAreaCopyWithImpl<$Res>
    implements _$MapAreaCopyWith<$Res> {
  __$MapAreaCopyWithImpl(this._self, this._then);

  final _MapArea _self;
  final $Res Function(_MapArea) _then;

/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areaId = null,Object? areaName = null,Object? centre = null,Object? minutes = null,Object? routes = null,}) {
  return _then(_MapArea(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,centre: null == centre ? _self.centre : centre // ignore: cast_nullable_to_non_nullable
as GeoPoint,minutes: null == minutes ? _self._minutes : minutes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,routes: null == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of MapArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get centre {
  
  return $GeoPointCopyWith<$Res>(_self.centre, (value) {
    return _then(_self.copyWith(centre: value));
  });
}
}


/// @nodoc
mixin _$MapHome {

 Listing get listing; HomeCost? get cost; RentFigure? get rent; Money? get ifRatesRise; bool? get withinBudget; String? get why;
/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapHomeCopyWith<MapHome> get copyWith => _$MapHomeCopyWithImpl<MapHome>(this as MapHome, _$identity);

  /// Serializes this MapHome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapHome;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapHome&&(identical(other.listing, _this.listing) || other.listing == _this.listing)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.rent, _this.rent) || other.rent == _this.rent)&&(identical(other.ifRatesRise, _this.ifRatesRise) || other.ifRatesRise == _this.ifRatesRise)&&(identical(other.withinBudget, _this.withinBudget) || other.withinBudget == _this.withinBudget)&&(identical(other.why, _this.why) || other.why == _this.why));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapHome;
  return Object.hash(runtimeType,_this.listing,_this.cost,_this.rent,_this.ifRatesRise,_this.withinBudget,_this.why);
}

@override
String toString() {
  final _this = this as MapHome;
  return 'MapHome(listing: ${_this.listing}, cost: ${_this.cost}, rent: ${_this.rent}, ifRatesRise: ${_this.ifRatesRise}, withinBudget: ${_this.withinBudget}, why: ${_this.why})';
}


}

/// @nodoc
abstract mixin class $MapHomeCopyWith<$Res>  {
  factory $MapHomeCopyWith(MapHome value, $Res Function(MapHome) _then) = _$MapHomeCopyWithImpl;
@useResult
$Res call({
 Listing listing, HomeCost? cost, RentFigure? rent, Money? ifRatesRise, bool? withinBudget, String? why
});


$ListingCopyWith<$Res> get listing;$HomeCostCopyWith<$Res>? get cost;$RentFigureCopyWith<$Res>? get rent;$MoneyCopyWith<$Res>? get ifRatesRise;

}
/// @nodoc
class _$MapHomeCopyWithImpl<$Res>
    implements $MapHomeCopyWith<$Res> {
  _$MapHomeCopyWithImpl(this._self, this._then);

  final MapHome _self;
  final $Res Function(MapHome) _then;

/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listing = null,Object? cost = freezed,Object? rent = freezed,Object? ifRatesRise = freezed,Object? withinBudget = freezed,Object? why = freezed,}) {
  return _then(MapHome(
listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as HomeCost?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure?,ifRatesRise: freezed == ifRatesRise ? _self.ifRatesRise : ifRatesRise // ignore: cast_nullable_to_non_nullable
as Money?,withinBudget: freezed == withinBudget ? _self.withinBudget : withinBudget // ignore: cast_nullable_to_non_nullable
as bool?,why: freezed == why ? _self.why : why // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res> get listing {
  
  return $ListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCostCopyWith<$Res>? get cost {
    if (_self.cost == null) {
    return null;
  }

  return $HomeCostCopyWith<$Res>(_self.cost!, (value) {
    return _then(_self.copyWith(cost: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res>? get rent {
    if (_self.rent == null) {
    return null;
  }

  return $RentFigureCopyWith<$Res>(_self.rent!, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get ifRatesRise {
    if (_self.ifRatesRise == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.ifRatesRise!, (value) {
    return _then(_self.copyWith(ifRatesRise: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapHome].
extension MapHomePatterns on MapHome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapHome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapHome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapHome value)  $default,){
final _that = this;
switch (_that) {
case _MapHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapHome value)?  $default,){
final _that = this;
switch (_that) {
case _MapHome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Listing listing,  HomeCost? cost,  RentFigure? rent,  Money? ifRatesRise,  bool? withinBudget,  String? why)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapHome() when $default != null:
return $default(_that.listing,_that.cost,_that.rent,_that.ifRatesRise,_that.withinBudget,_that.why);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Listing listing,  HomeCost? cost,  RentFigure? rent,  Money? ifRatesRise,  bool? withinBudget,  String? why)  $default,) {final _that = this;
switch (_that) {
case _MapHome():
return $default(_that.listing,_that.cost,_that.rent,_that.ifRatesRise,_that.withinBudget,_that.why);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Listing listing,  HomeCost? cost,  RentFigure? rent,  Money? ifRatesRise,  bool? withinBudget,  String? why)?  $default,) {final _that = this;
switch (_that) {
case _MapHome() when $default != null:
return $default(_that.listing,_that.cost,_that.rent,_that.ifRatesRise,_that.withinBudget,_that.why);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapHome extends MapHome {
  const _MapHome({required this.listing, this.cost, this.rent, this.ifRatesRise, this.withinBudget, this.why}): super._();
  factory _MapHome.fromJson(Map<String, dynamic> json) => _$MapHomeFromJson(json);

@override final  Listing listing;
@override final  HomeCost? cost;
@override final  RentFigure? rent;
@override final  Money? ifRatesRise;
@override final  bool? withinBudget;
@override final  String? why;

/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapHomeCopyWith<_MapHome> get copyWith => __$MapHomeCopyWithImpl<_MapHome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapHomeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapHome&&(identical(other.listing, listing) || other.listing == listing)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.ifRatesRise, ifRatesRise) || other.ifRatesRise == ifRatesRise)&&(identical(other.withinBudget, withinBudget) || other.withinBudget == withinBudget)&&(identical(other.why, why) || other.why == why));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,listing,cost,rent,ifRatesRise,withinBudget,why);
}

@override
String toString() {
    return 'MapHome(listing: $listing, cost: $cost, rent: $rent, ifRatesRise: $ifRatesRise, withinBudget: $withinBudget, why: $why)';
}


}

/// @nodoc
abstract mixin class _$MapHomeCopyWith<$Res> implements $MapHomeCopyWith<$Res> {
  factory _$MapHomeCopyWith(_MapHome value, $Res Function(_MapHome) _then) = __$MapHomeCopyWithImpl;
@override @useResult
$Res call({
 Listing listing, HomeCost? cost, RentFigure? rent, Money? ifRatesRise, bool? withinBudget, String? why
});


@override $ListingCopyWith<$Res> get listing;@override $HomeCostCopyWith<$Res>? get cost;@override $RentFigureCopyWith<$Res>? get rent;@override $MoneyCopyWith<$Res>? get ifRatesRise;

}
/// @nodoc
class __$MapHomeCopyWithImpl<$Res>
    implements _$MapHomeCopyWith<$Res> {
  __$MapHomeCopyWithImpl(this._self, this._then);

  final _MapHome _self;
  final $Res Function(_MapHome) _then;

/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listing = null,Object? cost = freezed,Object? rent = freezed,Object? ifRatesRise = freezed,Object? withinBudget = freezed,Object? why = freezed,}) {
  return _then(_MapHome(
listing: null == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as HomeCost?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure?,ifRatesRise: freezed == ifRatesRise ? _self.ifRatesRise : ifRatesRise // ignore: cast_nullable_to_non_nullable
as Money?,withinBudget: freezed == withinBudget ? _self.withinBudget : withinBudget // ignore: cast_nullable_to_non_nullable
as bool?,why: freezed == why ? _self.why : why // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res> get listing {
  
  return $ListingCopyWith<$Res>(_self.listing, (value) {
    return _then(_self.copyWith(listing: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCostCopyWith<$Res>? get cost {
    if (_self.cost == null) {
    return null;
  }

  return $HomeCostCopyWith<$Res>(_self.cost!, (value) {
    return _then(_self.copyWith(cost: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res>? get rent {
    if (_self.rent == null) {
    return null;
  }

  return $RentFigureCopyWith<$Res>(_self.rent!, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of MapHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get ifRatesRise {
    if (_self.ifRatesRise == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.ifRatesRise!, (value) {
    return _then(_self.copyWith(ifRatesRise: value));
  });
}
}

// dart format on
