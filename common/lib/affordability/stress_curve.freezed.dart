// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stress_curve.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StressCurve {

 List<StressPoint> get points; Rate get todayRate; Rate get stressRate; bool get afterDeduction; Money? get limit; ConstraintKind? get limitKind;
/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StressCurveCopyWith<StressCurve> get copyWith => _$StressCurveCopyWithImpl<StressCurve>(this as StressCurve, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StressCurve;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StressCurve&&const DeepCollectionEquality().equals(other.points, _this.points)&&(identical(other.todayRate, _this.todayRate) || other.todayRate == _this.todayRate)&&(identical(other.stressRate, _this.stressRate) || other.stressRate == _this.stressRate)&&(identical(other.afterDeduction, _this.afterDeduction) || other.afterDeduction == _this.afterDeduction)&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.limitKind, _this.limitKind) || other.limitKind == _this.limitKind));
}


@override
int get hashCode {
  final _this = this as StressCurve;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.points),_this.todayRate,_this.stressRate,_this.afterDeduction,_this.limit,_this.limitKind);
}

@override
String toString() {
  final _this = this as StressCurve;
  return 'StressCurve(points: ${_this.points}, todayRate: ${_this.todayRate}, stressRate: ${_this.stressRate}, afterDeduction: ${_this.afterDeduction}, limit: ${_this.limit}, limitKind: ${_this.limitKind})';
}


}

/// @nodoc
abstract mixin class $StressCurveCopyWith<$Res>  {
  factory $StressCurveCopyWith(StressCurve value, $Res Function(StressCurve) _then) = _$StressCurveCopyWithImpl;
@useResult
$Res call({
 List<StressPoint> points, Rate todayRate, Rate stressRate, bool afterDeduction, Money? limit, ConstraintKind? limitKind
});


$MoneyCopyWith<$Res>? get limit;

}
/// @nodoc
class _$StressCurveCopyWithImpl<$Res>
    implements $StressCurveCopyWith<$Res> {
  _$StressCurveCopyWithImpl(this._self, this._then);

  final StressCurve _self;
  final $Res Function(StressCurve) _then;

/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? todayRate = null,Object? stressRate = null,Object? afterDeduction = null,Object? limit = freezed,Object? limitKind = freezed,}) {
  return _then(StressCurve(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<StressPoint>,todayRate: null == todayRate ? _self.todayRate : todayRate // ignore: cast_nullable_to_non_nullable
as Rate,stressRate: null == stressRate ? _self.stressRate : stressRate // ignore: cast_nullable_to_non_nullable
as Rate,afterDeduction: null == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as Money?,limitKind: freezed == limitKind ? _self.limitKind : limitKind // ignore: cast_nullable_to_non_nullable
as ConstraintKind?,
  ));
}
/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get limit {
    if (_self.limit == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.limit!, (value) {
    return _then(_self.copyWith(limit: value));
  });
}
}


/// Adds pattern-matching-related methods to [StressCurve].
extension StressCurvePatterns on StressCurve {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StressCurve value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StressCurve() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StressCurve value)  $default,){
final _that = this;
switch (_that) {
case _StressCurve():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StressCurve value)?  $default,){
final _that = this;
switch (_that) {
case _StressCurve() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StressPoint> points,  Rate todayRate,  Rate stressRate,  bool afterDeduction,  Money? limit,  ConstraintKind? limitKind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StressCurve() when $default != null:
return $default(_that.points,_that.todayRate,_that.stressRate,_that.afterDeduction,_that.limit,_that.limitKind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StressPoint> points,  Rate todayRate,  Rate stressRate,  bool afterDeduction,  Money? limit,  ConstraintKind? limitKind)  $default,) {final _that = this;
switch (_that) {
case _StressCurve():
return $default(_that.points,_that.todayRate,_that.stressRate,_that.afterDeduction,_that.limit,_that.limitKind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StressPoint> points,  Rate todayRate,  Rate stressRate,  bool afterDeduction,  Money? limit,  ConstraintKind? limitKind)?  $default,) {final _that = this;
switch (_that) {
case _StressCurve() when $default != null:
return $default(_that.points,_that.todayRate,_that.stressRate,_that.afterDeduction,_that.limit,_that.limitKind);case _:
  return null;

}
}

}

/// @nodoc


class _StressCurve implements StressCurve {
  const _StressCurve({required  List<StressPoint> points, required this.todayRate, required this.stressRate, required this.afterDeduction, this.limit, this.limitKind}): _points = points;
  

 final  List<StressPoint> _points;
@override List<StressPoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  Rate todayRate;
@override final  Rate stressRate;
@override final  bool afterDeduction;
@override final  Money? limit;
@override final  ConstraintKind? limitKind;

/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StressCurveCopyWith<_StressCurve> get copyWith => __$StressCurveCopyWithImpl<_StressCurve>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StressCurve&&const DeepCollectionEquality().equals(other.points, _points)&&(identical(other.todayRate, todayRate) || other.todayRate == todayRate)&&(identical(other.stressRate, stressRate) || other.stressRate == stressRate)&&(identical(other.afterDeduction, afterDeduction) || other.afterDeduction == afterDeduction)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.limitKind, limitKind) || other.limitKind == limitKind));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),todayRate,stressRate,afterDeduction,limit,limitKind);
}

@override
String toString() {
    return 'StressCurve(points: $points, todayRate: $todayRate, stressRate: $stressRate, afterDeduction: $afterDeduction, limit: $limit, limitKind: $limitKind)';
}


}

/// @nodoc
abstract mixin class _$StressCurveCopyWith<$Res> implements $StressCurveCopyWith<$Res> {
  factory _$StressCurveCopyWith(_StressCurve value, $Res Function(_StressCurve) _then) = __$StressCurveCopyWithImpl;
@override @useResult
$Res call({
 List<StressPoint> points, Rate todayRate, Rate stressRate, bool afterDeduction, Money? limit, ConstraintKind? limitKind
});


@override $MoneyCopyWith<$Res>? get limit;

}
/// @nodoc
class __$StressCurveCopyWithImpl<$Res>
    implements _$StressCurveCopyWith<$Res> {
  __$StressCurveCopyWithImpl(this._self, this._then);

  final _StressCurve _self;
  final $Res Function(_StressCurve) _then;

/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? todayRate = null,Object? stressRate = null,Object? afterDeduction = null,Object? limit = freezed,Object? limitKind = freezed,}) {
  return _then(_StressCurve(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<StressPoint>,todayRate: null == todayRate ? _self.todayRate : todayRate // ignore: cast_nullable_to_non_nullable
as Rate,stressRate: null == stressRate ? _self.stressRate : stressRate // ignore: cast_nullable_to_non_nullable
as Rate,afterDeduction: null == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as Money?,limitKind: freezed == limitKind ? _self.limitKind : limitKind // ignore: cast_nullable_to_non_nullable
as ConstraintKind?,
  ));
}

/// Create a copy of StressCurve
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get limit {
    if (_self.limit == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.limit!, (value) {
    return _then(_self.copyWith(limit: value));
  });
}
}

/// @nodoc
mixin _$StressPoint {

 Rate get annualRate; Money get cost;
/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StressPointCopyWith<StressPoint> get copyWith => _$StressPointCopyWithImpl<StressPoint>(this as StressPoint, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StressPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StressPoint&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.cost, _this.cost) || other.cost == _this.cost));
}


@override
int get hashCode {
  final _this = this as StressPoint;
  return Object.hash(runtimeType,_this.annualRate,_this.cost);
}

@override
String toString() {
  final _this = this as StressPoint;
  return 'StressPoint(annualRate: ${_this.annualRate}, cost: ${_this.cost})';
}


}

/// @nodoc
abstract mixin class $StressPointCopyWith<$Res>  {
  factory $StressPointCopyWith(StressPoint value, $Res Function(StressPoint) _then) = _$StressPointCopyWithImpl;
@useResult
$Res call({
 Rate annualRate, Money cost
});


$MoneyCopyWith<$Res> get cost;

}
/// @nodoc
class _$StressPointCopyWithImpl<$Res>
    implements $StressPointCopyWith<$Res> {
  _$StressPointCopyWithImpl(this._self, this._then);

  final StressPoint _self;
  final $Res Function(StressPoint) _then;

/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annualRate = null,Object? cost = null,}) {
  return _then(StressPoint(
annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get cost {
  
  return $MoneyCopyWith<$Res>(_self.cost, (value) {
    return _then(_self.copyWith(cost: value));
  });
}
}


/// Adds pattern-matching-related methods to [StressPoint].
extension StressPointPatterns on StressPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StressPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StressPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StressPoint value)  $default,){
final _that = this;
switch (_that) {
case _StressPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StressPoint value)?  $default,){
final _that = this;
switch (_that) {
case _StressPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Rate annualRate,  Money cost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StressPoint() when $default != null:
return $default(_that.annualRate,_that.cost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Rate annualRate,  Money cost)  $default,) {final _that = this;
switch (_that) {
case _StressPoint():
return $default(_that.annualRate,_that.cost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Rate annualRate,  Money cost)?  $default,) {final _that = this;
switch (_that) {
case _StressPoint() when $default != null:
return $default(_that.annualRate,_that.cost);case _:
  return null;

}
}

}

/// @nodoc


class _StressPoint implements StressPoint {
  const _StressPoint({required this.annualRate, required this.cost});
  

@override final  Rate annualRate;
@override final  Money cost;

/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StressPointCopyWith<_StressPoint> get copyWith => __$StressPointCopyWithImpl<_StressPoint>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StressPoint&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.cost, cost) || other.cost == cost));
}


@override
int get hashCode {
    return Object.hash(runtimeType,annualRate,cost);
}

@override
String toString() {
    return 'StressPoint(annualRate: $annualRate, cost: $cost)';
}


}

/// @nodoc
abstract mixin class _$StressPointCopyWith<$Res> implements $StressPointCopyWith<$Res> {
  factory _$StressPointCopyWith(_StressPoint value, $Res Function(_StressPoint) _then) = __$StressPointCopyWithImpl;
@override @useResult
$Res call({
 Rate annualRate, Money cost
});


@override $MoneyCopyWith<$Res> get cost;

}
/// @nodoc
class __$StressPointCopyWithImpl<$Res>
    implements _$StressPointCopyWith<$Res> {
  __$StressPointCopyWithImpl(this._self, this._then);

  final _StressPoint _self;
  final $Res Function(_StressPoint) _then;

/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annualRate = null,Object? cost = null,}) {
  return _then(_StressPoint(
annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of StressPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get cost {
  
  return $MoneyCopyWith<$Res>(_self.cost, (value) {
    return _then(_self.copyWith(cost: value));
  });
}
}

// dart format on
