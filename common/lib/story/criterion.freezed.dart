// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'criterion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Criterion {

 CriterionKind get kind; String? get anchorId; int? get withinMeters; int? get count; bool get mustHave;
/// Create a copy of Criterion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CriterionCopyWith<Criterion> get copyWith => _$CriterionCopyWithImpl<Criterion>(this as Criterion, _$identity);

  /// Serializes this Criterion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Criterion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Criterion&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.anchorId, _this.anchorId) || other.anchorId == _this.anchorId)&&(identical(other.withinMeters, _this.withinMeters) || other.withinMeters == _this.withinMeters)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.mustHave, _this.mustHave) || other.mustHave == _this.mustHave));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Criterion;
  return Object.hash(runtimeType,_this.kind,_this.anchorId,_this.withinMeters,_this.count,_this.mustHave);
}

@override
String toString() {
  final _this = this as Criterion;
  return 'Criterion(kind: ${_this.kind}, anchorId: ${_this.anchorId}, withinMeters: ${_this.withinMeters}, count: ${_this.count}, mustHave: ${_this.mustHave})';
}


}

/// @nodoc
abstract mixin class $CriterionCopyWith<$Res>  {
  factory $CriterionCopyWith(Criterion value, $Res Function(Criterion) _then) = _$CriterionCopyWithImpl;
@useResult
$Res call({
 CriterionKind kind, String? anchorId, int? withinMeters, int? count, bool mustHave
});




}
/// @nodoc
class _$CriterionCopyWithImpl<$Res>
    implements $CriterionCopyWith<$Res> {
  _$CriterionCopyWithImpl(this._self, this._then);

  final Criterion _self;
  final $Res Function(Criterion) _then;

/// Create a copy of Criterion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? anchorId = freezed,Object? withinMeters = freezed,Object? count = freezed,Object? mustHave = null,}) {
  return _then(Criterion(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CriterionKind,anchorId: freezed == anchorId ? _self.anchorId : anchorId // ignore: cast_nullable_to_non_nullable
as String?,withinMeters: freezed == withinMeters ? _self.withinMeters : withinMeters // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,mustHave: null == mustHave ? _self.mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Criterion].
extension CriterionPatterns on Criterion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Criterion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Criterion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Criterion value)  $default,){
final _that = this;
switch (_that) {
case _Criterion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Criterion value)?  $default,){
final _that = this;
switch (_that) {
case _Criterion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CriterionKind kind,  String? anchorId,  int? withinMeters,  int? count,  bool mustHave)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Criterion() when $default != null:
return $default(_that.kind,_that.anchorId,_that.withinMeters,_that.count,_that.mustHave);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CriterionKind kind,  String? anchorId,  int? withinMeters,  int? count,  bool mustHave)  $default,) {final _that = this;
switch (_that) {
case _Criterion():
return $default(_that.kind,_that.anchorId,_that.withinMeters,_that.count,_that.mustHave);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CriterionKind kind,  String? anchorId,  int? withinMeters,  int? count,  bool mustHave)?  $default,) {final _that = this;
switch (_that) {
case _Criterion() when $default != null:
return $default(_that.kind,_that.anchorId,_that.withinMeters,_that.count,_that.mustHave);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Criterion extends Criterion {
  const _Criterion({required this.kind, this.anchorId, this.withinMeters, this.count, this.mustHave = false}): super._();
  factory _Criterion.fromJson(Map<String, dynamic> json) => _$CriterionFromJson(json);

@override final  CriterionKind kind;
@override final  String? anchorId;
@override final  int? withinMeters;
@override final  int? count;
@override@JsonKey() final  bool mustHave;

/// Create a copy of Criterion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CriterionCopyWith<_Criterion> get copyWith => __$CriterionCopyWithImpl<_Criterion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CriterionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Criterion&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.anchorId, anchorId) || other.anchorId == anchorId)&&(identical(other.withinMeters, withinMeters) || other.withinMeters == withinMeters)&&(identical(other.count, count) || other.count == count)&&(identical(other.mustHave, mustHave) || other.mustHave == mustHave));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,anchorId,withinMeters,count,mustHave);
}

@override
String toString() {
    return 'Criterion(kind: $kind, anchorId: $anchorId, withinMeters: $withinMeters, count: $count, mustHave: $mustHave)';
}


}

/// @nodoc
abstract mixin class _$CriterionCopyWith<$Res> implements $CriterionCopyWith<$Res> {
  factory _$CriterionCopyWith(_Criterion value, $Res Function(_Criterion) _then) = __$CriterionCopyWithImpl;
@override @useResult
$Res call({
 CriterionKind kind, String? anchorId, int? withinMeters, int? count, bool mustHave
});




}
/// @nodoc
class __$CriterionCopyWithImpl<$Res>
    implements _$CriterionCopyWith<$Res> {
  __$CriterionCopyWithImpl(this._self, this._then);

  final _Criterion _self;
  final $Res Function(_Criterion) _then;

/// Create a copy of Criterion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? anchorId = freezed,Object? withinMeters = freezed,Object? count = freezed,Object? mustHave = null,}) {
  return _then(_Criterion(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CriterionKind,anchorId: freezed == anchorId ? _self.anchorId : anchorId // ignore: cast_nullable_to_non_nullable
as String?,withinMeters: freezed == withinMeters ? _self.withinMeters : withinMeters // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,mustHave: null == mustHave ? _self.mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
