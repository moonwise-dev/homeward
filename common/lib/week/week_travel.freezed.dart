// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_travel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekTravel {

 String get fromId; String get fromName; GeoPoint get from; List<Trip> get trips;
/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekTravelCopyWith<WeekTravel> get copyWith => _$WeekTravelCopyWithImpl<WeekTravel>(this as WeekTravel, _$identity);

  /// Serializes this WeekTravel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeekTravel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekTravel&&(identical(other.fromId, _this.fromId) || other.fromId == _this.fromId)&&(identical(other.fromName, _this.fromName) || other.fromName == _this.fromName)&&(identical(other.from, _this.from) || other.from == _this.from)&&const DeepCollectionEquality().equals(other.trips, _this.trips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeekTravel;
  return Object.hash(runtimeType,_this.fromId,_this.fromName,_this.from,const DeepCollectionEquality().hash(_this.trips));
}

@override
String toString() {
  final _this = this as WeekTravel;
  return 'WeekTravel(fromId: ${_this.fromId}, fromName: ${_this.fromName}, from: ${_this.from}, trips: ${_this.trips})';
}


}

/// @nodoc
abstract mixin class $WeekTravelCopyWith<$Res>  {
  factory $WeekTravelCopyWith(WeekTravel value, $Res Function(WeekTravel) _then) = _$WeekTravelCopyWithImpl;
@useResult
$Res call({
 String fromId, String fromName, GeoPoint from, List<Trip> trips
});


$GeoPointCopyWith<$Res> get from;

}
/// @nodoc
class _$WeekTravelCopyWithImpl<$Res>
    implements $WeekTravelCopyWith<$Res> {
  _$WeekTravelCopyWithImpl(this._self, this._then);

  final WeekTravel _self;
  final $Res Function(WeekTravel) _then;

/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromId = null,Object? fromName = null,Object? from = null,Object? trips = null,}) {
  return _then(WeekTravel(
fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as GeoPoint,trips: null == trips ? _self.trips : trips // ignore: cast_nullable_to_non_nullable
as List<Trip>,
  ));
}
/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get from {
  
  return $GeoPointCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeekTravel].
extension WeekTravelPatterns on WeekTravel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekTravel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekTravel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekTravel value)  $default,){
final _that = this;
switch (_that) {
case _WeekTravel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekTravel value)?  $default,){
final _that = this;
switch (_that) {
case _WeekTravel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromId,  String fromName,  GeoPoint from,  List<Trip> trips)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekTravel() when $default != null:
return $default(_that.fromId,_that.fromName,_that.from,_that.trips);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromId,  String fromName,  GeoPoint from,  List<Trip> trips)  $default,) {final _that = this;
switch (_that) {
case _WeekTravel():
return $default(_that.fromId,_that.fromName,_that.from,_that.trips);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromId,  String fromName,  GeoPoint from,  List<Trip> trips)?  $default,) {final _that = this;
switch (_that) {
case _WeekTravel() when $default != null:
return $default(_that.fromId,_that.fromName,_that.from,_that.trips);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeekTravel extends WeekTravel {
  const _WeekTravel({required this.fromId, required this.fromName, required this.from, required  List<Trip> trips}): _trips = trips,super._();
  factory _WeekTravel.fromJson(Map<String, dynamic> json) => _$WeekTravelFromJson(json);

@override final  String fromId;
@override final  String fromName;
@override final  GeoPoint from;
 final  List<Trip> _trips;
@override List<Trip> get trips {
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trips);
}


/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekTravelCopyWith<_WeekTravel> get copyWith => __$WeekTravelCopyWithImpl<_WeekTravel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekTravelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekTravel&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.from, from) || other.from == from)&&const DeepCollectionEquality().equals(other.trips, _trips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fromId,fromName,from,const DeepCollectionEquality().hash(_trips));
}

@override
String toString() {
    return 'WeekTravel(fromId: $fromId, fromName: $fromName, from: $from, trips: $trips)';
}


}

/// @nodoc
abstract mixin class _$WeekTravelCopyWith<$Res> implements $WeekTravelCopyWith<$Res> {
  factory _$WeekTravelCopyWith(_WeekTravel value, $Res Function(_WeekTravel) _then) = __$WeekTravelCopyWithImpl;
@override @useResult
$Res call({
 String fromId, String fromName, GeoPoint from, List<Trip> trips
});


@override $GeoPointCopyWith<$Res> get from;

}
/// @nodoc
class __$WeekTravelCopyWithImpl<$Res>
    implements _$WeekTravelCopyWith<$Res> {
  __$WeekTravelCopyWithImpl(this._self, this._then);

  final _WeekTravel _self;
  final $Res Function(_WeekTravel) _then;

/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromId = null,Object? fromName = null,Object? from = null,Object? trips = null,}) {
  return _then(_WeekTravel(
fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as GeoPoint,trips: null == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<Trip>,
  ));
}

/// Create a copy of WeekTravel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get from {
  
  return $GeoPointCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}
}


/// @nodoc
mixin _$Trip {

 String get placeId; String get placeName; GeoPoint get to; int get perWeek; TravelMode get mode; int? get minutes; int? get meters;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Trip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.placeId, _this.placeId) || other.placeId == _this.placeId)&&(identical(other.placeName, _this.placeName) || other.placeName == _this.placeName)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.perWeek, _this.perWeek) || other.perWeek == _this.perWeek)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.minutes, _this.minutes) || other.minutes == _this.minutes)&&(identical(other.meters, _this.meters) || other.meters == _this.meters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Trip;
  return Object.hash(runtimeType,_this.placeId,_this.placeName,_this.to,_this.perWeek,_this.mode,_this.minutes,_this.meters);
}

@override
String toString() {
  final _this = this as Trip;
  return 'Trip(placeId: ${_this.placeId}, placeName: ${_this.placeName}, to: ${_this.to}, perWeek: ${_this.perWeek}, mode: ${_this.mode}, minutes: ${_this.minutes}, meters: ${_this.meters})';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
 String placeId, String placeName, GeoPoint to, int perWeek, TravelMode mode, int? minutes, int? meters
});


$GeoPointCopyWith<$Res> get to;

}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? placeName = null,Object? to = null,Object? perWeek = null,Object? mode = null,Object? minutes = freezed,Object? meters = freezed,}) {
  return _then(Trip(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as GeoPoint,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,meters: freezed == meters ? _self.meters : meters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get to {
  
  return $GeoPointCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String placeName,  GeoPoint to,  int perWeek,  TravelMode mode,  int? minutes,  int? meters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.placeId,_that.placeName,_that.to,_that.perWeek,_that.mode,_that.minutes,_that.meters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String placeName,  GeoPoint to,  int perWeek,  TravelMode mode,  int? minutes,  int? meters)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.placeId,_that.placeName,_that.to,_that.perWeek,_that.mode,_that.minutes,_that.meters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String placeName,  GeoPoint to,  int perWeek,  TravelMode mode,  int? minutes,  int? meters)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.placeId,_that.placeName,_that.to,_that.perWeek,_that.mode,_that.minutes,_that.meters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trip extends Trip {
  const _Trip({required this.placeId, required this.placeName, required this.to, required this.perWeek, required this.mode, this.minutes, this.meters}): super._();
  factory _Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

@override final  String placeId;
@override final  String placeName;
@override final  GeoPoint to;
@override final  int perWeek;
@override final  TravelMode mode;
@override final  int? minutes;
@override final  int? meters;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.to, to) || other.to == to)&&(identical(other.perWeek, perWeek) || other.perWeek == perWeek)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.meters, meters) || other.meters == meters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,placeId,placeName,to,perWeek,mode,minutes,meters);
}

@override
String toString() {
    return 'Trip(placeId: $placeId, placeName: $placeName, to: $to, perWeek: $perWeek, mode: $mode, minutes: $minutes, meters: $meters)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String placeName, GeoPoint to, int perWeek, TravelMode mode, int? minutes, int? meters
});


@override $GeoPointCopyWith<$Res> get to;

}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? placeName = null,Object? to = null,Object? perWeek = null,Object? mode = null,Object? minutes = freezed,Object? meters = freezed,}) {
  return _then(_Trip(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as GeoPoint,perWeek: null == perWeek ? _self.perWeek : perWeek // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,meters: freezed == meters ? _self.meters : meters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get to {
  
  return $GeoPointCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}

// dart format on
