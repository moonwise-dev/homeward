// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionOutcome {

 Plan get plan; Map<String, Object?> get summary;
/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionOutcomeCopyWith<ActionOutcome> get copyWith => _$ActionOutcomeCopyWithImpl<ActionOutcome>(this as ActionOutcome, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ActionOutcome;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionOutcome&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&const DeepCollectionEquality().equals(other.summary, _this.summary));
}


@override
int get hashCode {
  final _this = this as ActionOutcome;
  return Object.hash(runtimeType,_this.plan,const DeepCollectionEquality().hash(_this.summary));
}

@override
String toString() {
  final _this = this as ActionOutcome;
  return 'ActionOutcome(plan: ${_this.plan}, summary: ${_this.summary})';
}


}

/// @nodoc
abstract mixin class $ActionOutcomeCopyWith<$Res>  {
  factory $ActionOutcomeCopyWith(ActionOutcome value, $Res Function(ActionOutcome) _then) = _$ActionOutcomeCopyWithImpl;
@useResult
$Res call({
 Plan plan, Map<String, Object?> summary
});


$PlanCopyWith<$Res> get plan;

}
/// @nodoc
class _$ActionOutcomeCopyWithImpl<$Res>
    implements $ActionOutcomeCopyWith<$Res> {
  _$ActionOutcomeCopyWithImpl(this._self, this._then);

  final ActionOutcome _self;
  final $Res Function(ActionOutcome) _then;

/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = null,Object? summary = null,}) {
  return _then(ActionOutcome(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as Plan,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanCopyWith<$Res> get plan {
  
  return $PlanCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActionOutcome].
extension ActionOutcomePatterns on ActionOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionOutcome value)  $default,){
final _that = this;
switch (_that) {
case _ActionOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _ActionOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Plan plan,  Map<String, Object?> summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionOutcome() when $default != null:
return $default(_that.plan,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Plan plan,  Map<String, Object?> summary)  $default,) {final _that = this;
switch (_that) {
case _ActionOutcome():
return $default(_that.plan,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Plan plan,  Map<String, Object?> summary)?  $default,) {final _that = this;
switch (_that) {
case _ActionOutcome() when $default != null:
return $default(_that.plan,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _ActionOutcome implements ActionOutcome {
  const _ActionOutcome({required this.plan, required  Map<String, Object?> summary}): _summary = summary;
  

@override final  Plan plan;
 final  Map<String, Object?> _summary;
@override Map<String, Object?> get summary {
  if (_summary is EqualUnmodifiableMapView) return _summary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_summary);
}


/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionOutcomeCopyWith<_ActionOutcome> get copyWith => __$ActionOutcomeCopyWithImpl<_ActionOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionOutcome&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other.summary, _summary));
}


@override
int get hashCode {
    return Object.hash(runtimeType,plan,const DeepCollectionEquality().hash(_summary));
}

@override
String toString() {
    return 'ActionOutcome(plan: $plan, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$ActionOutcomeCopyWith<$Res> implements $ActionOutcomeCopyWith<$Res> {
  factory _$ActionOutcomeCopyWith(_ActionOutcome value, $Res Function(_ActionOutcome) _then) = __$ActionOutcomeCopyWithImpl;
@override @useResult
$Res call({
 Plan plan, Map<String, Object?> summary
});


@override $PlanCopyWith<$Res> get plan;

}
/// @nodoc
class __$ActionOutcomeCopyWithImpl<$Res>
    implements _$ActionOutcomeCopyWith<$Res> {
  __$ActionOutcomeCopyWithImpl(this._self, this._then);

  final _ActionOutcome _self;
  final $Res Function(_ActionOutcome) _then;

/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = null,Object? summary = null,}) {
  return _then(_ActionOutcome(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as Plan,summary: null == summary ? _self._summary : summary // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanCopyWith<$Res> get plan {
  
  return $PlanCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}

// dart format on
