// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResearchProgress {

 List<ResearchStep> get steps;
/// Create a copy of ResearchProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResearchProgressCopyWith<ResearchProgress> get copyWith => _$ResearchProgressCopyWithImpl<ResearchProgress>(this as ResearchProgress, _$identity);

  /// Serializes this ResearchProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResearchProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResearchProgress&&const DeepCollectionEquality().equals(other.steps, _this.steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResearchProgress;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.steps));
}

@override
String toString() {
  final _this = this as ResearchProgress;
  return 'ResearchProgress(steps: ${_this.steps})';
}


}

/// @nodoc
abstract mixin class $ResearchProgressCopyWith<$Res>  {
  factory $ResearchProgressCopyWith(ResearchProgress value, $Res Function(ResearchProgress) _then) = _$ResearchProgressCopyWithImpl;
@useResult
$Res call({
 List<ResearchStep> steps
});




}
/// @nodoc
class _$ResearchProgressCopyWithImpl<$Res>
    implements $ResearchProgressCopyWith<$Res> {
  _$ResearchProgressCopyWithImpl(this._self, this._then);

  final ResearchProgress _self;
  final $Res Function(ResearchProgress) _then;

/// Create a copy of ResearchProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,}) {
  return _then(ResearchProgress(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<ResearchStep>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResearchProgress].
extension ResearchProgressPatterns on ResearchProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResearchProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResearchProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResearchProgress value)  $default,){
final _that = this;
switch (_that) {
case _ResearchProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResearchProgress value)?  $default,){
final _that = this;
switch (_that) {
case _ResearchProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ResearchStep> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResearchProgress() when $default != null:
return $default(_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ResearchStep> steps)  $default,) {final _that = this;
switch (_that) {
case _ResearchProgress():
return $default(_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ResearchStep> steps)?  $default,) {final _that = this;
switch (_that) {
case _ResearchProgress() when $default != null:
return $default(_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResearchProgress implements ResearchProgress {
  const _ResearchProgress({ List<ResearchStep> steps = const []}): _steps = steps;
  factory _ResearchProgress.fromJson(Map<String, dynamic> json) => _$ResearchProgressFromJson(json);

 final  List<ResearchStep> _steps;
@override@JsonKey() List<ResearchStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of ResearchProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResearchProgressCopyWith<_ResearchProgress> get copyWith => __$ResearchProgressCopyWithImpl<_ResearchProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResearchProgressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResearchProgress&&const DeepCollectionEquality().equals(other.steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_steps));
}

@override
String toString() {
    return 'ResearchProgress(steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$ResearchProgressCopyWith<$Res> implements $ResearchProgressCopyWith<$Res> {
  factory _$ResearchProgressCopyWith(_ResearchProgress value, $Res Function(_ResearchProgress) _then) = __$ResearchProgressCopyWithImpl;
@override @useResult
$Res call({
 List<ResearchStep> steps
});




}
/// @nodoc
class __$ResearchProgressCopyWithImpl<$Res>
    implements _$ResearchProgressCopyWith<$Res> {
  __$ResearchProgressCopyWithImpl(this._self, this._then);

  final _ResearchProgress _self;
  final $Res Function(_ResearchProgress) _then;

/// Create a copy of ResearchProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,}) {
  return _then(_ResearchProgress(
steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<ResearchStep>,
  ));
}


}

// dart format on
