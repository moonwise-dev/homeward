// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Listing {

 String get id; String get areaId; String get areaName; String get name; String get title; String get blurb; String get description; String get address; GeoPoint get point; HomeType get homeType; int get rooms; int get bedrooms; int get sizeM2; int? get floor; int? get yearBuilt; OutdoorSpace get outdoor; HomeStyle get style; Money get price; Money? get monthlyFee; Money get pricePerM2; Money get areaPricePerM2; String get priceSource; List<String> get photos; String? get photoCredit;
/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingCopyWith<Listing> get copyWith => _$ListingCopyWithImpl<Listing>(this as Listing, _$identity);

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Listing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Listing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.areaId, _this.areaId) || other.areaId == _this.areaId)&&(identical(other.areaName, _this.areaName) || other.areaName == _this.areaName)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.blurb, _this.blurb) || other.blurb == _this.blurb)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.point, _this.point) || other.point == _this.point)&&(identical(other.homeType, _this.homeType) || other.homeType == _this.homeType)&&(identical(other.rooms, _this.rooms) || other.rooms == _this.rooms)&&(identical(other.bedrooms, _this.bedrooms) || other.bedrooms == _this.bedrooms)&&(identical(other.sizeM2, _this.sizeM2) || other.sizeM2 == _this.sizeM2)&&(identical(other.floor, _this.floor) || other.floor == _this.floor)&&(identical(other.yearBuilt, _this.yearBuilt) || other.yearBuilt == _this.yearBuilt)&&(identical(other.outdoor, _this.outdoor) || other.outdoor == _this.outdoor)&&(identical(other.style, _this.style) || other.style == _this.style)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.monthlyFee, _this.monthlyFee) || other.monthlyFee == _this.monthlyFee)&&(identical(other.pricePerM2, _this.pricePerM2) || other.pricePerM2 == _this.pricePerM2)&&(identical(other.areaPricePerM2, _this.areaPricePerM2) || other.areaPricePerM2 == _this.areaPricePerM2)&&(identical(other.priceSource, _this.priceSource) || other.priceSource == _this.priceSource)&&const DeepCollectionEquality().equals(other.photos, _this.photos)&&(identical(other.photoCredit, _this.photoCredit) || other.photoCredit == _this.photoCredit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Listing;
  return Object.hashAll([runtimeType,_this.id,_this.areaId,_this.areaName,_this.name,_this.title,_this.blurb,_this.description,_this.address,_this.point,_this.homeType,_this.rooms,_this.bedrooms,_this.sizeM2,_this.floor,_this.yearBuilt,_this.outdoor,_this.style,_this.price,_this.monthlyFee,_this.pricePerM2,_this.areaPricePerM2,_this.priceSource,const DeepCollectionEquality().hash(_this.photos),_this.photoCredit]);
}

@override
String toString() {
  final _this = this as Listing;
  return 'Listing(id: ${_this.id}, areaId: ${_this.areaId}, areaName: ${_this.areaName}, name: ${_this.name}, title: ${_this.title}, blurb: ${_this.blurb}, description: ${_this.description}, address: ${_this.address}, point: ${_this.point}, homeType: ${_this.homeType}, rooms: ${_this.rooms}, bedrooms: ${_this.bedrooms}, sizeM2: ${_this.sizeM2}, floor: ${_this.floor}, yearBuilt: ${_this.yearBuilt}, outdoor: ${_this.outdoor}, style: ${_this.style}, price: ${_this.price}, monthlyFee: ${_this.monthlyFee}, pricePerM2: ${_this.pricePerM2}, areaPricePerM2: ${_this.areaPricePerM2}, priceSource: ${_this.priceSource}, photos: ${_this.photos}, photoCredit: ${_this.photoCredit})';
}


}

/// @nodoc
abstract mixin class $ListingCopyWith<$Res>  {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) _then) = _$ListingCopyWithImpl;
@useResult
$Res call({
 String id, String areaId, String areaName, String name, String title, String blurb, String description, String address, GeoPoint point, HomeType homeType, int rooms, int bedrooms, int sizeM2, int? floor, int? yearBuilt, OutdoorSpace outdoor, HomeStyle style, Money price, Money? monthlyFee, Money pricePerM2, Money areaPricePerM2, String priceSource, List<String> photos, String? photoCredit
});


$GeoPointCopyWith<$Res> get point;$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get monthlyFee;$MoneyCopyWith<$Res> get pricePerM2;$MoneyCopyWith<$Res> get areaPricePerM2;

}
/// @nodoc
class _$ListingCopyWithImpl<$Res>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._self, this._then);

  final Listing _self;
  final $Res Function(Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? areaId = null,Object? areaName = null,Object? name = null,Object? title = null,Object? blurb = null,Object? description = null,Object? address = null,Object? point = null,Object? homeType = null,Object? rooms = null,Object? bedrooms = null,Object? sizeM2 = null,Object? floor = freezed,Object? yearBuilt = freezed,Object? outdoor = null,Object? style = null,Object? price = null,Object? monthlyFee = freezed,Object? pricePerM2 = null,Object? areaPricePerM2 = null,Object? priceSource = null,Object? photos = null,Object? photoCredit = freezed,}) {
  return _then(Listing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,blurb: null == blurb ? _self.blurb : blurb // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,homeType: null == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,sizeM2: null == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,yearBuilt: freezed == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int?,outdoor: null == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,monthlyFee: freezed == monthlyFee ? _self.monthlyFee : monthlyFee // ignore: cast_nullable_to_non_nullable
as Money?,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,areaPricePerM2: null == areaPricePerM2 ? _self.areaPricePerM2 : areaPricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,photoCredit: freezed == photoCredit ? _self.photoCredit : photoCredit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get monthlyFee {
    if (_self.monthlyFee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.monthlyFee!, (value) {
    return _then(_self.copyWith(monthlyFee: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get areaPricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.areaPricePerM2, (value) {
    return _then(_self.copyWith(areaPricePerM2: value));
  });
}
}


/// Adds pattern-matching-related methods to [Listing].
extension ListingPatterns on Listing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Listing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Listing value)  $default,){
final _that = this;
switch (_that) {
case _Listing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Listing value)?  $default,){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String areaId,  String areaName,  String name,  String title,  String blurb,  String description,  String address,  GeoPoint point,  HomeType homeType,  int rooms,  int bedrooms,  int sizeM2,  int? floor,  int? yearBuilt,  OutdoorSpace outdoor,  HomeStyle style,  Money price,  Money? monthlyFee,  Money pricePerM2,  Money areaPricePerM2,  String priceSource,  List<String> photos,  String? photoCredit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.id,_that.areaId,_that.areaName,_that.name,_that.title,_that.blurb,_that.description,_that.address,_that.point,_that.homeType,_that.rooms,_that.bedrooms,_that.sizeM2,_that.floor,_that.yearBuilt,_that.outdoor,_that.style,_that.price,_that.monthlyFee,_that.pricePerM2,_that.areaPricePerM2,_that.priceSource,_that.photos,_that.photoCredit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String areaId,  String areaName,  String name,  String title,  String blurb,  String description,  String address,  GeoPoint point,  HomeType homeType,  int rooms,  int bedrooms,  int sizeM2,  int? floor,  int? yearBuilt,  OutdoorSpace outdoor,  HomeStyle style,  Money price,  Money? monthlyFee,  Money pricePerM2,  Money areaPricePerM2,  String priceSource,  List<String> photos,  String? photoCredit)  $default,) {final _that = this;
switch (_that) {
case _Listing():
return $default(_that.id,_that.areaId,_that.areaName,_that.name,_that.title,_that.blurb,_that.description,_that.address,_that.point,_that.homeType,_that.rooms,_that.bedrooms,_that.sizeM2,_that.floor,_that.yearBuilt,_that.outdoor,_that.style,_that.price,_that.monthlyFee,_that.pricePerM2,_that.areaPricePerM2,_that.priceSource,_that.photos,_that.photoCredit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String areaId,  String areaName,  String name,  String title,  String blurb,  String description,  String address,  GeoPoint point,  HomeType homeType,  int rooms,  int bedrooms,  int sizeM2,  int? floor,  int? yearBuilt,  OutdoorSpace outdoor,  HomeStyle style,  Money price,  Money? monthlyFee,  Money pricePerM2,  Money areaPricePerM2,  String priceSource,  List<String> photos,  String? photoCredit)?  $default,) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.id,_that.areaId,_that.areaName,_that.name,_that.title,_that.blurb,_that.description,_that.address,_that.point,_that.homeType,_that.rooms,_that.bedrooms,_that.sizeM2,_that.floor,_that.yearBuilt,_that.outdoor,_that.style,_that.price,_that.monthlyFee,_that.pricePerM2,_that.areaPricePerM2,_that.priceSource,_that.photos,_that.photoCredit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Listing extends Listing {
  const _Listing({required this.id, required this.areaId, required this.areaName, required this.name, required this.title, required this.blurb, this.description = '', required this.address, required this.point, required this.homeType, required this.rooms, required this.bedrooms, required this.sizeM2, this.floor, this.yearBuilt, required this.outdoor, required this.style, required this.price, this.monthlyFee, required this.pricePerM2, required this.areaPricePerM2, required this.priceSource, required  List<String> photos, this.photoCredit}): _photos = photos,super._();
  factory _Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

@override final  String id;
@override final  String areaId;
@override final  String areaName;
@override final  String name;
@override final  String title;
@override final  String blurb;
@override@JsonKey() final  String description;
@override final  String address;
@override final  GeoPoint point;
@override final  HomeType homeType;
@override final  int rooms;
@override final  int bedrooms;
@override final  int sizeM2;
@override final  int? floor;
@override final  int? yearBuilt;
@override final  OutdoorSpace outdoor;
@override final  HomeStyle style;
@override final  Money price;
@override final  Money? monthlyFee;
@override final  Money pricePerM2;
@override final  Money areaPricePerM2;
@override final  String priceSource;
 final  List<String> _photos;
@override List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  String? photoCredit;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingCopyWith<_Listing> get copyWith => __$ListingCopyWithImpl<_Listing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listing&&(identical(other.id, id) || other.id == id)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.blurb, blurb) || other.blurb == blurb)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.point, point) || other.point == point)&&(identical(other.homeType, homeType) || other.homeType == homeType)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.sizeM2, sizeM2) || other.sizeM2 == sizeM2)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.yearBuilt, yearBuilt) || other.yearBuilt == yearBuilt)&&(identical(other.outdoor, outdoor) || other.outdoor == outdoor)&&(identical(other.style, style) || other.style == style)&&(identical(other.price, price) || other.price == price)&&(identical(other.monthlyFee, monthlyFee) || other.monthlyFee == monthlyFee)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.areaPricePerM2, areaPricePerM2) || other.areaPricePerM2 == areaPricePerM2)&&(identical(other.priceSource, priceSource) || other.priceSource == priceSource)&&const DeepCollectionEquality().equals(other.photos, _photos)&&(identical(other.photoCredit, photoCredit) || other.photoCredit == photoCredit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,areaId,areaName,name,title,blurb,description,address,point,homeType,rooms,bedrooms,sizeM2,floor,yearBuilt,outdoor,style,price,monthlyFee,pricePerM2,areaPricePerM2,priceSource,const DeepCollectionEquality().hash(_photos),photoCredit]);
}

@override
String toString() {
    return 'Listing(id: $id, areaId: $areaId, areaName: $areaName, name: $name, title: $title, blurb: $blurb, description: $description, address: $address, point: $point, homeType: $homeType, rooms: $rooms, bedrooms: $bedrooms, sizeM2: $sizeM2, floor: $floor, yearBuilt: $yearBuilt, outdoor: $outdoor, style: $style, price: $price, monthlyFee: $monthlyFee, pricePerM2: $pricePerM2, areaPricePerM2: $areaPricePerM2, priceSource: $priceSource, photos: $photos, photoCredit: $photoCredit)';
}


}

/// @nodoc
abstract mixin class _$ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$ListingCopyWith(_Listing value, $Res Function(_Listing) _then) = __$ListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String areaId, String areaName, String name, String title, String blurb, String description, String address, GeoPoint point, HomeType homeType, int rooms, int bedrooms, int sizeM2, int? floor, int? yearBuilt, OutdoorSpace outdoor, HomeStyle style, Money price, Money? monthlyFee, Money pricePerM2, Money areaPricePerM2, String priceSource, List<String> photos, String? photoCredit
});


@override $GeoPointCopyWith<$Res> get point;@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get monthlyFee;@override $MoneyCopyWith<$Res> get pricePerM2;@override $MoneyCopyWith<$Res> get areaPricePerM2;

}
/// @nodoc
class __$ListingCopyWithImpl<$Res>
    implements _$ListingCopyWith<$Res> {
  __$ListingCopyWithImpl(this._self, this._then);

  final _Listing _self;
  final $Res Function(_Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? areaId = null,Object? areaName = null,Object? name = null,Object? title = null,Object? blurb = null,Object? description = null,Object? address = null,Object? point = null,Object? homeType = null,Object? rooms = null,Object? bedrooms = null,Object? sizeM2 = null,Object? floor = freezed,Object? yearBuilt = freezed,Object? outdoor = null,Object? style = null,Object? price = null,Object? monthlyFee = freezed,Object? pricePerM2 = null,Object? areaPricePerM2 = null,Object? priceSource = null,Object? photos = null,Object? photoCredit = freezed,}) {
  return _then(_Listing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,blurb: null == blurb ? _self.blurb : blurb // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint,homeType: null == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,sizeM2: null == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,yearBuilt: freezed == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int?,outdoor: null == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,monthlyFee: freezed == monthlyFee ? _self.monthlyFee : monthlyFee // ignore: cast_nullable_to_non_nullable
as Money?,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,areaPricePerM2: null == areaPricePerM2 ? _self.areaPricePerM2 : areaPricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,photoCredit: freezed == photoCredit ? _self.photoCredit : photoCredit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get point {
  
  return $GeoPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get monthlyFee {
    if (_self.monthlyFee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.monthlyFee!, (value) {
    return _then(_self.copyWith(monthlyFee: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get areaPricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.areaPricePerM2, (value) {
    return _then(_self.copyWith(areaPricePerM2: value));
  });
}
}

// dart format on
