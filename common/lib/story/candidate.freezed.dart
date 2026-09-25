// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Candidate {

 String get id; String get label; String get query; GeoPoint? get point; String? get address; Money? get price; Money? get monthlyFee; String? get listingUrl; Listing? get listing;
/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidateCopyWith<Candidate> get copyWith => _$CandidateCopyWithImpl<Candidate>(this as Candidate, _$identity);

  /// Serializes this Candidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Candidate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Candidate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.point, _this.point) || other.point == _this.point)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.monthlyFee, _this.monthlyFee) || other.monthlyFee == _this.monthlyFee)&&(identical(other.listingUrl, _this.listingUrl) || other.listingUrl == _this.listingUrl)&&(identical(other.listing, _this.listing) || other.listing == _this.listing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Candidate;
  return Object.hash(runtimeType,_this.id,_this.label,_this.query,_this.point,_this.address,_this.price,_this.monthlyFee,_this.listingUrl,_this.listing);
}

@override
String toString() {
  final _this = this as Candidate;
  return 'Candidate(id: ${_this.id}, label: ${_this.label}, query: ${_this.query}, point: ${_this.point}, address: ${_this.address}, price: ${_this.price}, monthlyFee: ${_this.monthlyFee}, listingUrl: ${_this.listingUrl}, listing: ${_this.listing})';
}


}

/// @nodoc
abstract mixin class $CandidateCopyWith<$Res>  {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) _then) = _$CandidateCopyWithImpl;
@useResult
$Res call({
 String id, String label, String query, GeoPoint? point, String? address, Money? price, Money? monthlyFee, String? listingUrl, Listing? listing
});


$GeoPointCopyWith<$Res>? get point;$MoneyCopyWith<$Res>? get price;$MoneyCopyWith<$Res>? get monthlyFee;$ListingCopyWith<$Res>? get listing;

}
/// @nodoc
class _$CandidateCopyWithImpl<$Res>
    implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._self, this._then);

  final Candidate _self;
  final $Res Function(Candidate) _then;

/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? query = null,Object? point = freezed,Object? address = freezed,Object? price = freezed,Object? monthlyFee = freezed,Object? listingUrl = freezed,Object? listing = freezed,}) {
  return _then(Candidate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money?,monthlyFee: freezed == monthlyFee ? _self.monthlyFee : monthlyFee // ignore: cast_nullable_to_non_nullable
as Money?,listingUrl: freezed == listingUrl ? _self.listingUrl : listingUrl // ignore: cast_nullable_to_non_nullable
as String?,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}
/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get point {
    if (_self.point == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.point!, (value) {
    return _then(_self.copyWith(point: value));
  });
}/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get price {
    if (_self.price == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.price!, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Candidate
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
}/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res>? get listing {
    if (_self.listing == null) {
    return null;
  }

  return $ListingCopyWith<$Res>(_self.listing!, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}


/// Adds pattern-matching-related methods to [Candidate].
extension CandidatePatterns on Candidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Candidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Candidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Candidate value)  $default,){
final _that = this;
switch (_that) {
case _Candidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Candidate value)?  $default,){
final _that = this;
switch (_that) {
case _Candidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String query,  GeoPoint? point,  String? address,  Money? price,  Money? monthlyFee,  String? listingUrl,  Listing? listing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Candidate() when $default != null:
return $default(_that.id,_that.label,_that.query,_that.point,_that.address,_that.price,_that.monthlyFee,_that.listingUrl,_that.listing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String query,  GeoPoint? point,  String? address,  Money? price,  Money? monthlyFee,  String? listingUrl,  Listing? listing)  $default,) {final _that = this;
switch (_that) {
case _Candidate():
return $default(_that.id,_that.label,_that.query,_that.point,_that.address,_that.price,_that.monthlyFee,_that.listingUrl,_that.listing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String query,  GeoPoint? point,  String? address,  Money? price,  Money? monthlyFee,  String? listingUrl,  Listing? listing)?  $default,) {final _that = this;
switch (_that) {
case _Candidate() when $default != null:
return $default(_that.id,_that.label,_that.query,_that.point,_that.address,_that.price,_that.monthlyFee,_that.listingUrl,_that.listing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Candidate implements Candidate {
  const _Candidate({required this.id, required this.label, required this.query, this.point, this.address, this.price, this.monthlyFee, this.listingUrl, this.listing});
  factory _Candidate.fromJson(Map<String, dynamic> json) => _$CandidateFromJson(json);

@override final  String id;
@override final  String label;
@override final  String query;
@override final  GeoPoint? point;
@override final  String? address;
@override final  Money? price;
@override final  Money? monthlyFee;
@override final  String? listingUrl;
@override final  Listing? listing;

/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidateCopyWith<_Candidate> get copyWith => __$CandidateCopyWithImpl<_Candidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Candidate&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.query, query) || other.query == query)&&(identical(other.point, point) || other.point == point)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.monthlyFee, monthlyFee) || other.monthlyFee == monthlyFee)&&(identical(other.listingUrl, listingUrl) || other.listingUrl == listingUrl)&&(identical(other.listing, listing) || other.listing == listing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,query,point,address,price,monthlyFee,listingUrl,listing);
}

@override
String toString() {
    return 'Candidate(id: $id, label: $label, query: $query, point: $point, address: $address, price: $price, monthlyFee: $monthlyFee, listingUrl: $listingUrl, listing: $listing)';
}


}

/// @nodoc
abstract mixin class _$CandidateCopyWith<$Res> implements $CandidateCopyWith<$Res> {
  factory _$CandidateCopyWith(_Candidate value, $Res Function(_Candidate) _then) = __$CandidateCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String query, GeoPoint? point, String? address, Money? price, Money? monthlyFee, String? listingUrl, Listing? listing
});


@override $GeoPointCopyWith<$Res>? get point;@override $MoneyCopyWith<$Res>? get price;@override $MoneyCopyWith<$Res>? get monthlyFee;@override $ListingCopyWith<$Res>? get listing;

}
/// @nodoc
class __$CandidateCopyWithImpl<$Res>
    implements _$CandidateCopyWith<$Res> {
  __$CandidateCopyWithImpl(this._self, this._then);

  final _Candidate _self;
  final $Res Function(_Candidate) _then;

/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? query = null,Object? point = freezed,Object? address = freezed,Object? price = freezed,Object? monthlyFee = freezed,Object? listingUrl = freezed,Object? listing = freezed,}) {
  return _then(_Candidate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money?,monthlyFee: freezed == monthlyFee ? _self.monthlyFee : monthlyFee // ignore: cast_nullable_to_non_nullable
as Money?,listingUrl: freezed == listingUrl ? _self.listingUrl : listingUrl // ignore: cast_nullable_to_non_nullable
as String?,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}

/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get point {
    if (_self.point == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.point!, (value) {
    return _then(_self.copyWith(point: value));
  });
}/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get price {
    if (_self.price == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.price!, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Candidate
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
}/// Create a copy of Candidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res>? get listing {
    if (_self.listing == null) {
    return null;
  }

  return $ListingCopyWith<$Res>(_self.listing!, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}

// dart format on
