// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResearchStep {

 String get label; ResearchStepState get state;
/// Create a copy of ResearchStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResearchStepCopyWith<ResearchStep> get copyWith => _$ResearchStepCopyWithImpl<ResearchStep>(this as ResearchStep, _$identity);

  /// Serializes this ResearchStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResearchStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResearchStep&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.state, _this.state) || other.state == _this.state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResearchStep;
  return Object.hash(runtimeType,_this.label,_this.state);
}

@override
String toString() {
  final _this = this as ResearchStep;
  return 'ResearchStep(label: ${_this.label}, state: ${_this.state})';
}


}

/// @nodoc
abstract mixin class $ResearchStepCopyWith<$Res>  {
  factory $ResearchStepCopyWith(ResearchStep value, $Res Function(ResearchStep) _then) = _$ResearchStepCopyWithImpl;
@useResult
$Res call({
 String label, ResearchStepState state
});




}
/// @nodoc
class _$ResearchStepCopyWithImpl<$Res>
    implements $ResearchStepCopyWith<$Res> {
  _$ResearchStepCopyWithImpl(this._self, this._then);

  final ResearchStep _self;
  final $Res Function(ResearchStep) _then;

/// Create a copy of ResearchStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? state = null,}) {
  return _then(ResearchStep(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ResearchStepState,
  ));
}

}


/// Adds pattern-matching-related methods to [ResearchStep].
extension ResearchStepPatterns on ResearchStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResearchStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResearchStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResearchStep value)  $default,){
final _that = this;
switch (_that) {
case _ResearchStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResearchStep value)?  $default,){
final _that = this;
switch (_that) {
case _ResearchStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  ResearchStepState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResearchStep() when $default != null:
return $default(_that.label,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  ResearchStepState state)  $default,) {final _that = this;
switch (_that) {
case _ResearchStep():
return $default(_that.label,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  ResearchStepState state)?  $default,) {final _that = this;
switch (_that) {
case _ResearchStep() when $default != null:
return $default(_that.label,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResearchStep implements ResearchStep {
  const _ResearchStep({required this.label, required this.state});
  factory _ResearchStep.fromJson(Map<String, dynamic> json) => _$ResearchStepFromJson(json);

@override final  String label;
@override final  ResearchStepState state;

/// Create a copy of ResearchStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResearchStepCopyWith<_ResearchStep> get copyWith => __$ResearchStepCopyWithImpl<_ResearchStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResearchStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResearchStep&&(identical(other.label, label) || other.label == label)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,state);
}

@override
String toString() {
    return 'ResearchStep(label: $label, state: $state)';
}


}

/// @nodoc
abstract mixin class _$ResearchStepCopyWith<$Res> implements $ResearchStepCopyWith<$Res> {
  factory _$ResearchStepCopyWith(_ResearchStep value, $Res Function(_ResearchStep) _then) = __$ResearchStepCopyWithImpl;
@override @useResult
$Res call({
 String label, ResearchStepState state
});




}
/// @nodoc
class __$ResearchStepCopyWithImpl<$Res>
    implements _$ResearchStepCopyWith<$Res> {
  __$ResearchStepCopyWithImpl(this._self, this._then);

  final _ResearchStep _self;
  final $Res Function(_ResearchStep) _then;

/// Create a copy of ResearchStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? state = null,}) {
  return _then(_ResearchStep(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ResearchStepState,
  ));
}


}

// dart format on
