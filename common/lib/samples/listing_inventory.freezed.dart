// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingInventory {

 String get cityId; String get name; String get marketId; List<Listing> get listings;
/// Create a copy of ListingInventory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingInventoryCopyWith<ListingInventory> get copyWith => _$ListingInventoryCopyWithImpl<ListingInventory>(this as ListingInventory, _$identity);

  /// Serializes this ListingInventory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ListingInventory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingInventory&&(identical(other.cityId, _this.cityId) || other.cityId == _this.cityId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&const DeepCollectionEquality().equals(other.listings, _this.listings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ListingInventory;
  return Object.hash(runtimeType,_this.cityId,_this.name,_this.marketId,const DeepCollectionEquality().hash(_this.listings));
}

@override
String toString() {
  final _this = this as ListingInventory;
  return 'ListingInventory(cityId: ${_this.cityId}, name: ${_this.name}, marketId: ${_this.marketId}, listings: ${_this.listings})';
}


}

/// @nodoc
abstract mixin class $ListingInventoryCopyWith<$Res>  {
  factory $ListingInventoryCopyWith(ListingInventory value, $Res Function(ListingInventory) _then) = _$ListingInventoryCopyWithImpl;
@useResult
$Res call({
 String cityId, String name, String marketId, List<Listing> listings
});




}
/// @nodoc
class _$ListingInventoryCopyWithImpl<$Res>
    implements $ListingInventoryCopyWith<$Res> {
  _$ListingInventoryCopyWithImpl(this._self, this._then);

  final ListingInventory _self;
  final $Res Function(ListingInventory) _then;

/// Create a copy of ListingInventory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityId = null,Object? name = null,Object? marketId = null,Object? listings = null,}) {
  return _then(ListingInventory(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<Listing>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingInventory].
extension ListingInventoryPatterns on ListingInventory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingInventory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingInventory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingInventory value)  $default,){
final _that = this;
switch (_that) {
case _ListingInventory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingInventory value)?  $default,){
final _that = this;
switch (_that) {
case _ListingInventory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cityId,  String name,  String marketId,  List<Listing> listings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingInventory() when $default != null:
return $default(_that.cityId,_that.name,_that.marketId,_that.listings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cityId,  String name,  String marketId,  List<Listing> listings)  $default,) {final _that = this;
switch (_that) {
case _ListingInventory():
return $default(_that.cityId,_that.name,_that.marketId,_that.listings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cityId,  String name,  String marketId,  List<Listing> listings)?  $default,) {final _that = this;
switch (_that) {
case _ListingInventory() when $default != null:
return $default(_that.cityId,_that.name,_that.marketId,_that.listings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingInventory extends ListingInventory {
  const _ListingInventory({required this.cityId, required this.name, required this.marketId, required  List<Listing> listings}): _listings = listings,super._();
  factory _ListingInventory.fromJson(Map<String, dynamic> json) => _$ListingInventoryFromJson(json);

@override final  String cityId;
@override final  String name;
@override final  String marketId;
 final  List<Listing> _listings;
@override List<Listing> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}


/// Create a copy of ListingInventory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingInventoryCopyWith<_ListingInventory> get copyWith => __$ListingInventoryCopyWithImpl<_ListingInventory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingInventoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingInventory&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.marketId, marketId) || other.marketId == marketId)&&const DeepCollectionEquality().equals(other.listings, _listings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cityId,name,marketId,const DeepCollectionEquality().hash(_listings));
}

@override
String toString() {
    return 'ListingInventory(cityId: $cityId, name: $name, marketId: $marketId, listings: $listings)';
}


}

/// @nodoc
abstract mixin class _$ListingInventoryCopyWith<$Res> implements $ListingInventoryCopyWith<$Res> {
  factory _$ListingInventoryCopyWith(_ListingInventory value, $Res Function(_ListingInventory) _then) = __$ListingInventoryCopyWithImpl;
@override @useResult
$Res call({
 String cityId, String name, String marketId, List<Listing> listings
});




}
/// @nodoc
class __$ListingInventoryCopyWithImpl<$Res>
    implements _$ListingInventoryCopyWith<$Res> {
  __$ListingInventoryCopyWithImpl(this._self, this._then);

  final _ListingInventory _self;
  final $Res Function(_ListingInventory) _then;

/// Create a copy of ListingInventory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityId = null,Object? name = null,Object? marketId = null,Object? listings = null,}) {
  return _then(_ListingInventory(
cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<Listing>,
  ));
}


}

// dart format on
