// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constraint_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConstraintCheck {

 ConstraintKind get kind; String get ruleId; String get sourceId; Money get maxLoan;
/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstraintCheckCopyWith<ConstraintCheck> get copyWith => _$ConstraintCheckCopyWithImpl<ConstraintCheck>(this as ConstraintCheck, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConstraintCheck;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstraintCheck&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.ruleId, _this.ruleId) || other.ruleId == _this.ruleId)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.maxLoan, _this.maxLoan) || other.maxLoan == _this.maxLoan));
}


@override
int get hashCode {
  final _this = this as ConstraintCheck;
  return Object.hash(runtimeType,_this.kind,_this.ruleId,_this.sourceId,_this.maxLoan);
}

@override
String toString() {
  final _this = this as ConstraintCheck;
  return 'ConstraintCheck(kind: ${_this.kind}, ruleId: ${_this.ruleId}, sourceId: ${_this.sourceId}, maxLoan: ${_this.maxLoan})';
}


}

/// @nodoc
abstract mixin class $ConstraintCheckCopyWith<$Res>  {
  factory $ConstraintCheckCopyWith(ConstraintCheck value, $Res Function(ConstraintCheck) _then) = _$ConstraintCheckCopyWithImpl;
@useResult
$Res call({
 ConstraintKind kind, String ruleId, String sourceId, Money maxLoan
});


$MoneyCopyWith<$Res> get maxLoan;

}
/// @nodoc
class _$ConstraintCheckCopyWithImpl<$Res>
    implements $ConstraintCheckCopyWith<$Res> {
  _$ConstraintCheckCopyWithImpl(this._self, this._then);

  final ConstraintCheck _self;
  final $Res Function(ConstraintCheck) _then;

/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? ruleId = null,Object? sourceId = null,Object? maxLoan = null,}) {
  return _then(ConstraintCheck(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConstraintCheck].
extension ConstraintCheckPatterns on ConstraintCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConstraintCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConstraintCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConstraintCheck value)  $default,){
final _that = this;
switch (_that) {
case _ConstraintCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConstraintCheck value)?  $default,){
final _that = this;
switch (_that) {
case _ConstraintCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  String sourceId,  Money maxLoan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConstraintCheck() when $default != null:
return $default(_that.kind,_that.ruleId,_that.sourceId,_that.maxLoan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  String sourceId,  Money maxLoan)  $default,) {final _that = this;
switch (_that) {
case _ConstraintCheck():
return $default(_that.kind,_that.ruleId,_that.sourceId,_that.maxLoan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConstraintKind kind,  String ruleId,  String sourceId,  Money maxLoan)?  $default,) {final _that = this;
switch (_that) {
case _ConstraintCheck() when $default != null:
return $default(_that.kind,_that.ruleId,_that.sourceId,_that.maxLoan);case _:
  return null;

}
}

}

/// @nodoc


class _ConstraintCheck extends ConstraintCheck {
  const _ConstraintCheck({required this.kind, required this.ruleId, required this.sourceId, required this.maxLoan}): super._();
  

@override final  ConstraintKind kind;
@override final  String ruleId;
@override final  String sourceId;
@override final  Money maxLoan;

/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstraintCheckCopyWith<_ConstraintCheck> get copyWith => __$ConstraintCheckCopyWithImpl<_ConstraintCheck>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConstraintCheck&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,ruleId,sourceId,maxLoan);
}

@override
String toString() {
    return 'ConstraintCheck(kind: $kind, ruleId: $ruleId, sourceId: $sourceId, maxLoan: $maxLoan)';
}


}

/// @nodoc
abstract mixin class _$ConstraintCheckCopyWith<$Res> implements $ConstraintCheckCopyWith<$Res> {
  factory _$ConstraintCheckCopyWith(_ConstraintCheck value, $Res Function(_ConstraintCheck) _then) = __$ConstraintCheckCopyWithImpl;
@override @useResult
$Res call({
 ConstraintKind kind, String ruleId, String sourceId, Money maxLoan
});


@override $MoneyCopyWith<$Res> get maxLoan;

}
/// @nodoc
class __$ConstraintCheckCopyWithImpl<$Res>
    implements _$ConstraintCheckCopyWith<$Res> {
  __$ConstraintCheckCopyWithImpl(this._self, this._then);

  final _ConstraintCheck _self;
  final $Res Function(_ConstraintCheck) _then;

/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? ruleId = null,Object? sourceId = null,Object? maxLoan = null,}) {
  return _then(_ConstraintCheck(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of ConstraintCheck
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}
}

// dart format on
