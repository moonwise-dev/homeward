// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obstacle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Obstacle {

 String get id; BuyerPredicate? get appliesTo; String get title; ObstacleSeverity get severity; String get mitigation;@PeriodJsonConverter() Period? get typicalDuration; String get sourceId;
/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObstacleCopyWith<Obstacle> get copyWith => _$ObstacleCopyWithImpl<Obstacle>(this as Obstacle, _$identity);

  /// Serializes this Obstacle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Obstacle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Obstacle&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.mitigation, _this.mitigation) || other.mitigation == _this.mitigation)&&(identical(other.typicalDuration, _this.typicalDuration) || other.typicalDuration == _this.typicalDuration)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Obstacle;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.title,_this.severity,_this.mitigation,_this.typicalDuration,_this.sourceId);
}

@override
String toString() {
  final _this = this as Obstacle;
  return 'Obstacle(id: ${_this.id}, appliesTo: ${_this.appliesTo}, title: ${_this.title}, severity: ${_this.severity}, mitigation: ${_this.mitigation}, typicalDuration: ${_this.typicalDuration}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $ObstacleCopyWith<$Res>  {
  factory $ObstacleCopyWith(Obstacle value, $Res Function(Obstacle) _then) = _$ObstacleCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo, String title, ObstacleSeverity severity, String mitigation,@PeriodJsonConverter() Period? typicalDuration, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$ObstacleCopyWithImpl<$Res>
    implements $ObstacleCopyWith<$Res> {
  _$ObstacleCopyWithImpl(this._self, this._then);

  final Obstacle _self;
  final $Res Function(Obstacle) _then;

/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? title = null,Object? severity = null,Object? mitigation = null,Object? typicalDuration = freezed,Object? sourceId = null,}) {
  return _then(Obstacle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as ObstacleSeverity,mitigation: null == mitigation ? _self.mitigation : mitigation // ignore: cast_nullable_to_non_nullable
as String,typicalDuration: freezed == typicalDuration ? _self.typicalDuration : typicalDuration // ignore: cast_nullable_to_non_nullable
as Period?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Obstacle].
extension ObstaclePatterns on Obstacle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Obstacle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Obstacle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Obstacle value)  $default,){
final _that = this;
switch (_that) {
case _Obstacle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Obstacle value)?  $default,){
final _that = this;
switch (_that) {
case _Obstacle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  String title,  ObstacleSeverity severity,  String mitigation, @PeriodJsonConverter()  Period? typicalDuration,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Obstacle() when $default != null:
return $default(_that.id,_that.appliesTo,_that.title,_that.severity,_that.mitigation,_that.typicalDuration,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  String title,  ObstacleSeverity severity,  String mitigation, @PeriodJsonConverter()  Period? typicalDuration,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _Obstacle():
return $default(_that.id,_that.appliesTo,_that.title,_that.severity,_that.mitigation,_that.typicalDuration,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo,  String title,  ObstacleSeverity severity,  String mitigation, @PeriodJsonConverter()  Period? typicalDuration,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _Obstacle() when $default != null:
return $default(_that.id,_that.appliesTo,_that.title,_that.severity,_that.mitigation,_that.typicalDuration,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Obstacle implements Obstacle {
  const _Obstacle({required this.id, this.appliesTo, required this.title, required this.severity, required this.mitigation, @PeriodJsonConverter() this.typicalDuration, required this.sourceId});
  factory _Obstacle.fromJson(Map<String, dynamic> json) => _$ObstacleFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override final  String title;
@override final  ObstacleSeverity severity;
@override final  String mitigation;
@override@PeriodJsonConverter() final  Period? typicalDuration;
@override final  String sourceId;

/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObstacleCopyWith<_Obstacle> get copyWith => __$ObstacleCopyWithImpl<_Obstacle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ObstacleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Obstacle&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.title, title) || other.title == title)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.mitigation, mitigation) || other.mitigation == mitigation)&&(identical(other.typicalDuration, typicalDuration) || other.typicalDuration == typicalDuration)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,title,severity,mitigation,typicalDuration,sourceId);
}

@override
String toString() {
    return 'Obstacle(id: $id, appliesTo: $appliesTo, title: $title, severity: $severity, mitigation: $mitigation, typicalDuration: $typicalDuration, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$ObstacleCopyWith<$Res> implements $ObstacleCopyWith<$Res> {
  factory _$ObstacleCopyWith(_Obstacle value, $Res Function(_Obstacle) _then) = __$ObstacleCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo, String title, ObstacleSeverity severity, String mitigation,@PeriodJsonConverter() Period? typicalDuration, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$ObstacleCopyWithImpl<$Res>
    implements _$ObstacleCopyWith<$Res> {
  __$ObstacleCopyWithImpl(this._self, this._then);

  final _Obstacle _self;
  final $Res Function(_Obstacle) _then;

/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? title = null,Object? severity = null,Object? mitigation = null,Object? typicalDuration = freezed,Object? sourceId = null,}) {
  return _then(_Obstacle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as ObstacleSeverity,mitigation: null == mitigation ? _self.mitigation : mitigation // ignore: cast_nullable_to_non_nullable
as String,typicalDuration: freezed == typicalDuration ? _self.typicalDuration : typicalDuration // ignore: cast_nullable_to_non_nullable
as Period?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Obstacle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}

// dart format on
