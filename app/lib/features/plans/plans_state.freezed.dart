// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlansState {

 List<PlanSummary> get plans; bool get isCreating; bool get isLoading;
/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlansStateCopyWith<PlansState> get copyWith => _$PlansStateCopyWithImpl<PlansState>(this as PlansState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlansState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlansState&&const DeepCollectionEquality().equals(other.plans, _this.plans)&&(identical(other.isCreating, _this.isCreating) || other.isCreating == _this.isCreating)&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading));
}


@override
int get hashCode {
  final _this = this as PlansState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.plans),_this.isCreating,_this.isLoading);
}

@override
String toString() {
  final _this = this as PlansState;
  return 'PlansState(plans: ${_this.plans}, isCreating: ${_this.isCreating}, isLoading: ${_this.isLoading})';
}


}

/// @nodoc
abstract mixin class $PlansStateCopyWith<$Res>  {
  factory $PlansStateCopyWith(PlansState value, $Res Function(PlansState) _then) = _$PlansStateCopyWithImpl;
@useResult
$Res call({
 List<PlanSummary> plans, bool isCreating, bool isLoading
});




}
/// @nodoc
class _$PlansStateCopyWithImpl<$Res>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._self, this._then);

  final PlansState _self;
  final $Res Function(PlansState) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plans = null,Object? isCreating = null,Object? isLoading = null,}) {
  return _then(PlansState(
plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<PlanSummary>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlansState].
extension PlansStatePatterns on PlansState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlansState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlansState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlansState value)  $default,){
final _that = this;
switch (_that) {
case _PlansState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlansState value)?  $default,){
final _that = this;
switch (_that) {
case _PlansState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlanSummary> plans,  bool isCreating,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlansState() when $default != null:
return $default(_that.plans,_that.isCreating,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlanSummary> plans,  bool isCreating,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _PlansState():
return $default(_that.plans,_that.isCreating,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlanSummary> plans,  bool isCreating,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _PlansState() when $default != null:
return $default(_that.plans,_that.isCreating,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _PlansState implements PlansState {
  const _PlansState({ List<PlanSummary> plans = const [], this.isCreating = false, this.isLoading = false}): _plans = plans;
  

 final  List<PlanSummary> _plans;
@override@JsonKey() List<PlanSummary> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override@JsonKey() final  bool isCreating;
@override@JsonKey() final  bool isLoading;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlansStateCopyWith<_PlansState> get copyWith => __$PlansStateCopyWithImpl<_PlansState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlansState&&const DeepCollectionEquality().equals(other.plans, _plans)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),isCreating,isLoading);
}

@override
String toString() {
    return 'PlansState(plans: $plans, isCreating: $isCreating, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$PlansStateCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$PlansStateCopyWith(_PlansState value, $Res Function(_PlansState) _then) = __$PlansStateCopyWithImpl;
@override @useResult
$Res call({
 List<PlanSummary> plans, bool isCreating, bool isLoading
});




}
/// @nodoc
class __$PlansStateCopyWithImpl<$Res>
    implements _$PlansStateCopyWith<$Res> {
  __$PlansStateCopyWithImpl(this._self, this._then);

  final _PlansState _self;
  final $Res Function(_PlansState) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? isCreating = null,Object? isLoading = null,}) {
  return _then(_PlansState(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<PlanSummary>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
