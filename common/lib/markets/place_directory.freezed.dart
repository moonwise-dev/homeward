// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_directory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Place {

 String get name; List<String> get aliases; PlaceKind get kind;@MarketIdJsonConverter() List<MarketId> get marketIds;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Place;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Place&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.aliases, _this.aliases)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.marketIds, _this.marketIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Place;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.aliases),_this.kind,const DeepCollectionEquality().hash(_this.marketIds));
}

@override
String toString() {
  final _this = this as Place;
  return 'Place(name: ${_this.name}, aliases: ${_this.aliases}, kind: ${_this.kind}, marketIds: ${_this.marketIds})';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
 String name, List<String> aliases, PlaceKind kind,@MarketIdJsonConverter() List<MarketId> marketIds
});




}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? aliases = null,Object? kind = null,Object? marketIds = null,}) {
  return _then(Place(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self.aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaceKind,marketIds: null == marketIds ? _self.marketIds : marketIds // ignore: cast_nullable_to_non_nullable
as List<MarketId>,
  ));
}

}


/// Adds pattern-matching-related methods to [Place].
extension PlacePatterns on Place {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Place value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Place value)  $default,){
final _that = this;
switch (_that) {
case _Place():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Place value)?  $default,){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> aliases,  PlaceKind kind, @MarketIdJsonConverter()  List<MarketId> marketIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.name,_that.aliases,_that.kind,_that.marketIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> aliases,  PlaceKind kind, @MarketIdJsonConverter()  List<MarketId> marketIds)  $default,) {final _that = this;
switch (_that) {
case _Place():
return $default(_that.name,_that.aliases,_that.kind,_that.marketIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> aliases,  PlaceKind kind, @MarketIdJsonConverter()  List<MarketId> marketIds)?  $default,) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.name,_that.aliases,_that.kind,_that.marketIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Place implements Place {
  const _Place({required this.name,  List<String> aliases = const [], required this.kind, @MarketIdJsonConverter() required  List<MarketId> marketIds}): _aliases = aliases,_marketIds = marketIds;
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

@override final  String name;
 final  List<String> _aliases;
@override@JsonKey() List<String> get aliases {
  if (_aliases is EqualUnmodifiableListView) return _aliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aliases);
}

@override final  PlaceKind kind;
 final  List<MarketId> _marketIds;
@override@MarketIdJsonConverter() List<MarketId> get marketIds {
  if (_marketIds is EqualUnmodifiableListView) return _marketIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketIds);
}


/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Place&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.aliases, _aliases)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.marketIds, _marketIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_aliases),kind,const DeepCollectionEquality().hash(_marketIds));
}

@override
String toString() {
    return 'Place(name: $name, aliases: $aliases, kind: $kind, marketIds: $marketIds)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> aliases, PlaceKind kind,@MarketIdJsonConverter() List<MarketId> marketIds
});




}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? aliases = null,Object? kind = null,Object? marketIds = null,}) {
  return _then(_Place(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self._aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlaceKind,marketIds: null == marketIds ? _self._marketIds : marketIds // ignore: cast_nullable_to_non_nullable
as List<MarketId>,
  ));
}


}


/// @nodoc
mixin _$PlaceDirectory {

 Source get source; List<Place> get places;
/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceDirectoryCopyWith<PlaceDirectory> get copyWith => _$PlaceDirectoryCopyWithImpl<PlaceDirectory>(this as PlaceDirectory, _$identity);

  /// Serializes this PlaceDirectory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlaceDirectory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceDirectory&&(identical(other.source, _this.source) || other.source == _this.source)&&const DeepCollectionEquality().equals(other.places, _this.places));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlaceDirectory;
  return Object.hash(runtimeType,_this.source,const DeepCollectionEquality().hash(_this.places));
}

@override
String toString() {
  final _this = this as PlaceDirectory;
  return 'PlaceDirectory(source: ${_this.source}, places: ${_this.places})';
}


}

/// @nodoc
abstract mixin class $PlaceDirectoryCopyWith<$Res>  {
  factory $PlaceDirectoryCopyWith(PlaceDirectory value, $Res Function(PlaceDirectory) _then) = _$PlaceDirectoryCopyWithImpl;
@useResult
$Res call({
 Source source, List<Place> places
});


$SourceCopyWith<$Res> get source;

}
/// @nodoc
class _$PlaceDirectoryCopyWithImpl<$Res>
    implements $PlaceDirectoryCopyWith<$Res> {
  _$PlaceDirectoryCopyWithImpl(this._self, this._then);

  final PlaceDirectory _self;
  final $Res Function(PlaceDirectory) _then;

/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? places = null,}) {
  return _then(PlaceDirectory(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}
/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaceDirectory].
extension PlaceDirectoryPatterns on PlaceDirectory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceDirectory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceDirectory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceDirectory value)  $default,){
final _that = this;
switch (_that) {
case _PlaceDirectory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceDirectory value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceDirectory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Source source,  List<Place> places)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceDirectory() when $default != null:
return $default(_that.source,_that.places);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Source source,  List<Place> places)  $default,) {final _that = this;
switch (_that) {
case _PlaceDirectory():
return $default(_that.source,_that.places);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Source source,  List<Place> places)?  $default,) {final _that = this;
switch (_that) {
case _PlaceDirectory() when $default != null:
return $default(_that.source,_that.places);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceDirectory extends PlaceDirectory {
  const _PlaceDirectory({required this.source, required  List<Place> places}): _places = places,super._();
  factory _PlaceDirectory.fromJson(Map<String, dynamic> json) => _$PlaceDirectoryFromJson(json);

@override final  Source source;
 final  List<Place> _places;
@override List<Place> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}


/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceDirectoryCopyWith<_PlaceDirectory> get copyWith => __$PlaceDirectoryCopyWithImpl<_PlaceDirectory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceDirectoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceDirectory&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.places, _places));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,source,const DeepCollectionEquality().hash(_places));
}

@override
String toString() {
    return 'PlaceDirectory(source: $source, places: $places)';
}


}

/// @nodoc
abstract mixin class _$PlaceDirectoryCopyWith<$Res> implements $PlaceDirectoryCopyWith<$Res> {
  factory _$PlaceDirectoryCopyWith(_PlaceDirectory value, $Res Function(_PlaceDirectory) _then) = __$PlaceDirectoryCopyWithImpl;
@override @useResult
$Res call({
 Source source, List<Place> places
});


@override $SourceCopyWith<$Res> get source;

}
/// @nodoc
class __$PlaceDirectoryCopyWithImpl<$Res>
    implements _$PlaceDirectoryCopyWith<$Res> {
  __$PlaceDirectoryCopyWithImpl(this._self, this._then);

  final _PlaceDirectory _self;
  final $Res Function(_PlaceDirectory) _then;

/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? places = null,}) {
  return _then(_PlaceDirectory(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Source,places: null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}

/// Create a copy of PlaceDirectory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceCopyWith<$Res> get source {
  
  return $SourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
