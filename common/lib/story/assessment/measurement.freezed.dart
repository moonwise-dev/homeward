// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Measurement {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Measurement);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Measurement()';
}


}

/// @nodoc
class $MeasurementCopyWith<$Res>  {
$MeasurementCopyWith(Measurement _, $Res Function(Measurement) __);
}


/// Adds pattern-matching-related methods to [Measurement].
extension MeasurementPatterns on Measurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RouteMeasurement value)?  route,TResult Function( NearestMeasurement value)?  nearest,TResult Function( CountMeasurement value)?  count,TResult Function( NoMeasurement value)?  none,TResult Function( UnavailableMeasurement value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RouteMeasurement() when route != null:
return route(_that);case NearestMeasurement() when nearest != null:
return nearest(_that);case CountMeasurement() when count != null:
return count(_that);case NoMeasurement() when none != null:
return none(_that);case UnavailableMeasurement() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RouteMeasurement value)  route,required TResult Function( NearestMeasurement value)  nearest,required TResult Function( CountMeasurement value)  count,required TResult Function( NoMeasurement value)  none,required TResult Function( UnavailableMeasurement value)  unavailable,}){
final _that = this;
switch (_that) {
case RouteMeasurement():
return route(_that);case NearestMeasurement():
return nearest(_that);case CountMeasurement():
return count(_that);case NoMeasurement():
return none(_that);case UnavailableMeasurement():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RouteMeasurement value)?  route,TResult? Function( NearestMeasurement value)?  nearest,TResult? Function( CountMeasurement value)?  count,TResult? Function( NoMeasurement value)?  none,TResult? Function( UnavailableMeasurement value)?  unavailable,}){
final _that = this;
switch (_that) {
case RouteMeasurement() when route != null:
return route(_that);case NearestMeasurement() when nearest != null:
return nearest(_that);case CountMeasurement() when count != null:
return count(_that);case NoMeasurement() when none != null:
return none(_that);case UnavailableMeasurement() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TravelMode mode,  int minutes,  int meters,  List<GeoPoint> path)?  route,TResult Function( int meters,  String? name,  GeoPoint? point)?  nearest,TResult Function( int count)?  count,TResult Function()?  none,TResult Function()?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RouteMeasurement() when route != null:
return route(_that.mode,_that.minutes,_that.meters,_that.path);case NearestMeasurement() when nearest != null:
return nearest(_that.meters,_that.name,_that.point);case CountMeasurement() when count != null:
return count(_that.count);case NoMeasurement() when none != null:
return none();case UnavailableMeasurement() when unavailable != null:
return unavailable();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TravelMode mode,  int minutes,  int meters,  List<GeoPoint> path)  route,required TResult Function( int meters,  String? name,  GeoPoint? point)  nearest,required TResult Function( int count)  count,required TResult Function()  none,required TResult Function()  unavailable,}) {final _that = this;
switch (_that) {
case RouteMeasurement():
return route(_that.mode,_that.minutes,_that.meters,_that.path);case NearestMeasurement():
return nearest(_that.meters,_that.name,_that.point);case CountMeasurement():
return count(_that.count);case NoMeasurement():
return none();case UnavailableMeasurement():
return unavailable();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TravelMode mode,  int minutes,  int meters,  List<GeoPoint> path)?  route,TResult? Function( int meters,  String? name,  GeoPoint? point)?  nearest,TResult? Function( int count)?  count,TResult? Function()?  none,TResult? Function()?  unavailable,}) {final _that = this;
switch (_that) {
case RouteMeasurement() when route != null:
return route(_that.mode,_that.minutes,_that.meters,_that.path);case NearestMeasurement() when nearest != null:
return nearest(_that.meters,_that.name,_that.point);case CountMeasurement() when count != null:
return count(_that.count);case NoMeasurement() when none != null:
return none();case UnavailableMeasurement() when unavailable != null:
return unavailable();case _:
  return null;

}
}

}

/// @nodoc


class RouteMeasurement implements Measurement {
  const RouteMeasurement({required this.mode, required this.minutes, required this.meters,  List<GeoPoint> path = const []}): _path = path;
  

 final  TravelMode mode;
 final  int minutes;
 final  int meters;
 final  List<GeoPoint> _path;
@JsonKey() List<GeoPoint> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteMeasurementCopyWith<RouteMeasurement> get copyWith => _$RouteMeasurementCopyWithImpl<RouteMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteMeasurement&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.meters, meters) || other.meters == meters)&&const DeepCollectionEquality().equals(other.path, _path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,minutes,meters,const DeepCollectionEquality().hash(_path));
}

@override
String toString() {
    return 'Measurement.route(mode: $mode, minutes: $minutes, meters: $meters, path: $path)';
}


}

/// @nodoc
abstract mixin class $RouteMeasurementCopyWith<$Res> implements $MeasurementCopyWith<$Res> {
  factory $RouteMeasurementCopyWith(RouteMeasurement value, $Res Function(RouteMeasurement) _then) = _$RouteMeasurementCopyWithImpl;
@useResult
$Res call({
 TravelMode mode, int minutes, int meters, List<GeoPoint> path
});




}
/// @nodoc
class _$RouteMeasurementCopyWithImpl<$Res>
    implements $RouteMeasurementCopyWith<$Res> {
  _$RouteMeasurementCopyWithImpl(this._self, this._then);

  final RouteMeasurement _self;
  final $Res Function(RouteMeasurement) _then;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? minutes = null,Object? meters = null,Object? path = null,}) {
  return _then(RouteMeasurement(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,meters: null == meters ? _self.meters : meters // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<GeoPoint>,
  ));
}


}

/// @nodoc


class NearestMeasurement implements Measurement {
  const NearestMeasurement({required this.meters, this.name, this.point});
  

 final  int meters;
 final  String? name;
 final  GeoPoint? point;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestMeasurementCopyWith<NearestMeasurement> get copyWith => _$NearestMeasurementCopyWithImpl<NearestMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestMeasurement&&(identical(other.meters, meters) || other.meters == meters)&&(identical(other.name, name) || other.name == name)&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode {
    return Object.hash(runtimeType,meters,name,point);
}

@override
String toString() {
    return 'Measurement.nearest(meters: $meters, name: $name, point: $point)';
}


}

/// @nodoc
abstract mixin class $NearestMeasurementCopyWith<$Res> implements $MeasurementCopyWith<$Res> {
  factory $NearestMeasurementCopyWith(NearestMeasurement value, $Res Function(NearestMeasurement) _then) = _$NearestMeasurementCopyWithImpl;
@useResult
$Res call({
 int meters, String? name, GeoPoint? point
});


$GeoPointCopyWith<$Res>? get point;

}
/// @nodoc
class _$NearestMeasurementCopyWithImpl<$Res>
    implements $NearestMeasurementCopyWith<$Res> {
  _$NearestMeasurementCopyWithImpl(this._self, this._then);

  final NearestMeasurement _self;
  final $Res Function(NearestMeasurement) _then;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meters = null,Object? name = freezed,Object? point = freezed,}) {
  return _then(NearestMeasurement(
meters: null == meters ? _self.meters : meters // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as GeoPoint?,
  ));
}

/// Create a copy of Measurement
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
}
}

/// @nodoc


class CountMeasurement implements Measurement {
  const CountMeasurement({required this.count});
  

 final  int count;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMeasurementCopyWith<CountMeasurement> get copyWith => _$CountMeasurementCopyWithImpl<CountMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMeasurement&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode {
    return Object.hash(runtimeType,count);
}

@override
String toString() {
    return 'Measurement.count(count: $count)';
}


}

/// @nodoc
abstract mixin class $CountMeasurementCopyWith<$Res> implements $MeasurementCopyWith<$Res> {
  factory $CountMeasurementCopyWith(CountMeasurement value, $Res Function(CountMeasurement) _then) = _$CountMeasurementCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$CountMeasurementCopyWithImpl<$Res>
    implements $CountMeasurementCopyWith<$Res> {
  _$CountMeasurementCopyWithImpl(this._self, this._then);

  final CountMeasurement _self;
  final $Res Function(CountMeasurement) _then;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(CountMeasurement(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NoMeasurement implements Measurement {
  const NoMeasurement();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NoMeasurement);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Measurement.none()';
}


}




/// @nodoc


class UnavailableMeasurement implements Measurement {
  const UnavailableMeasurement();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnavailableMeasurement);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Measurement.unavailable()';
}


}




// dart format on
