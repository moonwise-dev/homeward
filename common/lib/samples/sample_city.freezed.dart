// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SampleCity {

 String get id; String get name; List<String> get aliases;@MarketIdJsonConverter() MarketId get marketId;@CurrencyJsonConverter() Currency get currency; String get pricePeriod; List<Source> get sources; List<SampleArea> get areas; Map<String, List<String>> get lineups;
/// Create a copy of SampleCity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SampleCityCopyWith<SampleCity> get copyWith => _$SampleCityCopyWithImpl<SampleCity>(this as SampleCity, _$identity);

  /// Serializes this SampleCity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SampleCity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleCity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.aliases, _this.aliases)&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.pricePeriod, _this.pricePeriod) || other.pricePeriod == _this.pricePeriod)&&const DeepCollectionEquality().equals(other.sources, _this.sources)&&const DeepCollectionEquality().equals(other.areas, _this.areas)&&const DeepCollectionEquality().equals(other.lineups, _this.lineups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SampleCity;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.aliases),_this.marketId,_this.currency,_this.pricePeriod,const DeepCollectionEquality().hash(_this.sources),const DeepCollectionEquality().hash(_this.areas),const DeepCollectionEquality().hash(_this.lineups));
}

@override
String toString() {
  final _this = this as SampleCity;
  return 'SampleCity(id: ${_this.id}, name: ${_this.name}, aliases: ${_this.aliases}, marketId: ${_this.marketId}, currency: ${_this.currency}, pricePeriod: ${_this.pricePeriod}, sources: ${_this.sources}, areas: ${_this.areas}, lineups: ${_this.lineups})';
}


}

/// @nodoc
abstract mixin class $SampleCityCopyWith<$Res>  {
  factory $SampleCityCopyWith(SampleCity value, $Res Function(SampleCity) _then) = _$SampleCityCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> aliases,@MarketIdJsonConverter() MarketId marketId,@CurrencyJsonConverter() Currency currency, String pricePeriod, List<Source> sources, List<SampleArea> areas, Map<String, List<String>> lineups
});




}
/// @nodoc
class _$SampleCityCopyWithImpl<$Res>
    implements $SampleCityCopyWith<$Res> {
  _$SampleCityCopyWithImpl(this._self, this._then);

  final SampleCity _self;
  final $Res Function(SampleCity) _then;

/// Create a copy of SampleCity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? aliases = null,Object? marketId = null,Object? currency = null,Object? pricePeriod = null,Object? sources = null,Object? areas = null,Object? lineups = null,}) {
  return _then(SampleCity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self.aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,pricePeriod: null == pricePeriod ? _self.pricePeriod : pricePeriod // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<SampleArea>,lineups: null == lineups ? _self.lineups : lineups // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SampleCity].
extension SampleCityPatterns on SampleCity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SampleCity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SampleCity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SampleCity value)  $default,){
final _that = this;
switch (_that) {
case _SampleCity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SampleCity value)?  $default,){
final _that = this;
switch (_that) {
case _SampleCity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> aliases, @MarketIdJsonConverter()  MarketId marketId, @CurrencyJsonConverter()  Currency currency,  String pricePeriod,  List<Source> sources,  List<SampleArea> areas,  Map<String, List<String>> lineups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SampleCity() when $default != null:
return $default(_that.id,_that.name,_that.aliases,_that.marketId,_that.currency,_that.pricePeriod,_that.sources,_that.areas,_that.lineups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> aliases, @MarketIdJsonConverter()  MarketId marketId, @CurrencyJsonConverter()  Currency currency,  String pricePeriod,  List<Source> sources,  List<SampleArea> areas,  Map<String, List<String>> lineups)  $default,) {final _that = this;
switch (_that) {
case _SampleCity():
return $default(_that.id,_that.name,_that.aliases,_that.marketId,_that.currency,_that.pricePeriod,_that.sources,_that.areas,_that.lineups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> aliases, @MarketIdJsonConverter()  MarketId marketId, @CurrencyJsonConverter()  Currency currency,  String pricePeriod,  List<Source> sources,  List<SampleArea> areas,  Map<String, List<String>> lineups)?  $default,) {final _that = this;
switch (_that) {
case _SampleCity() when $default != null:
return $default(_that.id,_that.name,_that.aliases,_that.marketId,_that.currency,_that.pricePeriod,_that.sources,_that.areas,_that.lineups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SampleCity extends SampleCity {
  const _SampleCity({required this.id, required this.name,  List<String> aliases = const [], @MarketIdJsonConverter() required this.marketId, @CurrencyJsonConverter() required this.currency, required this.pricePeriod, required  List<Source> sources, required  List<SampleArea> areas,  Map<String, List<String>> lineups = const {}}): _aliases = aliases,_sources = sources,_areas = areas,_lineups = lineups,super._();
  factory _SampleCity.fromJson(Map<String, dynamic> json) => _$SampleCityFromJson(json);

@override final  String id;
@override final  String name;
 final  List<String> _aliases;
@override@JsonKey() List<String> get aliases {
  if (_aliases is EqualUnmodifiableListView) return _aliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aliases);
}

@override@MarketIdJsonConverter() final  MarketId marketId;
@override@CurrencyJsonConverter() final  Currency currency;
@override final  String pricePeriod;
 final  List<Source> _sources;
@override List<Source> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

 final  List<SampleArea> _areas;
@override List<SampleArea> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}

 final  Map<String, List<String>> _lineups;
@override@JsonKey() Map<String, List<String>> get lineups {
  if (_lineups is EqualUnmodifiableMapView) return _lineups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lineups);
}


/// Create a copy of SampleCity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SampleCityCopyWith<_SampleCity> get copyWith => __$SampleCityCopyWithImpl<_SampleCity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SampleCityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SampleCity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.aliases, _aliases)&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.pricePeriod, pricePeriod) || other.pricePeriod == pricePeriod)&&const DeepCollectionEquality().equals(other.sources, _sources)&&const DeepCollectionEquality().equals(other.areas, _areas)&&const DeepCollectionEquality().equals(other.lineups, _lineups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_aliases),marketId,currency,pricePeriod,const DeepCollectionEquality().hash(_sources),const DeepCollectionEquality().hash(_areas),const DeepCollectionEquality().hash(_lineups));
}

@override
String toString() {
    return 'SampleCity(id: $id, name: $name, aliases: $aliases, marketId: $marketId, currency: $currency, pricePeriod: $pricePeriod, sources: $sources, areas: $areas, lineups: $lineups)';
}


}

/// @nodoc
abstract mixin class _$SampleCityCopyWith<$Res> implements $SampleCityCopyWith<$Res> {
  factory _$SampleCityCopyWith(_SampleCity value, $Res Function(_SampleCity) _then) = __$SampleCityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> aliases,@MarketIdJsonConverter() MarketId marketId,@CurrencyJsonConverter() Currency currency, String pricePeriod, List<Source> sources, List<SampleArea> areas, Map<String, List<String>> lineups
});




}
/// @nodoc
class __$SampleCityCopyWithImpl<$Res>
    implements _$SampleCityCopyWith<$Res> {
  __$SampleCityCopyWithImpl(this._self, this._then);

  final _SampleCity _self;
  final $Res Function(_SampleCity) _then;

/// Create a copy of SampleCity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? aliases = null,Object? marketId = null,Object? currency = null,Object? pricePeriod = null,Object? sources = null,Object? areas = null,Object? lineups = null,}) {
  return _then(_SampleCity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self._aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,marketId: null == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,pricePeriod: null == pricePeriod ? _self.pricePeriod : pricePeriod // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<SampleArea>,lineups: null == lineups ? _self._lineups : lineups // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
