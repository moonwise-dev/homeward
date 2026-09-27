// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_ceiling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthlyCeiling {

 ConstraintKind get kind; String get ruleId; Money get amount; bool get afterDeduction;
/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyCeilingCopyWith<MonthlyCeiling> get copyWith => _$MonthlyCeilingCopyWithImpl<MonthlyCeiling>(this as MonthlyCeiling, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MonthlyCeiling;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyCeiling&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.ruleId, _this.ruleId) || other.ruleId == _this.ruleId)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.afterDeduction, _this.afterDeduction) || other.afterDeduction == _this.afterDeduction));
}


@override
int get hashCode {
  final _this = this as MonthlyCeiling;
  return Object.hash(runtimeType,_this.kind,_this.ruleId,_this.amount,_this.afterDeduction);
}

@override
String toString() {
  final _this = this as MonthlyCeiling;
  return 'MonthlyCeiling(kind: ${_this.kind}, ruleId: ${_this.ruleId}, amount: ${_this.amount}, afterDeduction: ${_this.afterDeduction})';
}


}

/// @nodoc
abstract mixin class $MonthlyCeilingCopyWith<$Res>  {
  factory $MonthlyCeilingCopyWith(MonthlyCeiling value, $Res Function(MonthlyCeiling) _then) = _$MonthlyCeilingCopyWithImpl;
@useResult
$Res call({
 ConstraintKind kind, String ruleId, Money amount, bool afterDeduction
});


$MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class _$MonthlyCeilingCopyWithImpl<$Res>
    implements $MonthlyCeilingCopyWith<$Res> {
  _$MonthlyCeilingCopyWithImpl(this._self, this._then);

  final MonthlyCeiling _self;
  final $Res Function(MonthlyCeiling) _then;

/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? ruleId = null,Object? amount = null,Object? afterDeduction = null,}) {
  return _then(MonthlyCeiling(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: null == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyCeiling].
extension MonthlyCeilingPatterns on MonthlyCeiling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyCeiling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyCeiling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyCeiling value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyCeiling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyCeiling value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyCeiling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  Money amount,  bool afterDeduction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyCeiling() when $default != null:
return $default(_that.kind,_that.ruleId,_that.amount,_that.afterDeduction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConstraintKind kind,  String ruleId,  Money amount,  bool afterDeduction)  $default,) {final _that = this;
switch (_that) {
case _MonthlyCeiling():
return $default(_that.kind,_that.ruleId,_that.amount,_that.afterDeduction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConstraintKind kind,  String ruleId,  Money amount,  bool afterDeduction)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyCeiling() when $default != null:
return $default(_that.kind,_that.ruleId,_that.amount,_that.afterDeduction);case _:
  return null;

}
}

}

/// @nodoc


class _MonthlyCeiling implements MonthlyCeiling {
  const _MonthlyCeiling({required this.kind, required this.ruleId, required this.amount, required this.afterDeduction});
  

@override final  ConstraintKind kind;
@override final  String ruleId;
@override final  Money amount;
@override final  bool afterDeduction;

/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyCeilingCopyWith<_MonthlyCeiling> get copyWith => __$MonthlyCeilingCopyWithImpl<_MonthlyCeiling>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyCeiling&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.afterDeduction, afterDeduction) || other.afterDeduction == afterDeduction));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,ruleId,amount,afterDeduction);
}

@override
String toString() {
    return 'MonthlyCeiling(kind: $kind, ruleId: $ruleId, amount: $amount, afterDeduction: $afterDeduction)';
}


}

/// @nodoc
abstract mixin class _$MonthlyCeilingCopyWith<$Res> implements $MonthlyCeilingCopyWith<$Res> {
  factory _$MonthlyCeilingCopyWith(_MonthlyCeiling value, $Res Function(_MonthlyCeiling) _then) = __$MonthlyCeilingCopyWithImpl;
@override @useResult
$Res call({
 ConstraintKind kind, String ruleId, Money amount, bool afterDeduction
});


@override $MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class __$MonthlyCeilingCopyWithImpl<$Res>
    implements _$MonthlyCeilingCopyWith<$Res> {
  __$MonthlyCeilingCopyWithImpl(this._self, this._then);

  final _MonthlyCeiling _self;
  final $Res Function(_MonthlyCeiling) _then;

/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? ruleId = null,Object? amount = null,Object? afterDeduction = null,}) {
  return _then(_MonthlyCeiling(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,afterDeduction: null == afterDeduction ? _self.afterDeduction : afterDeduction // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthlyCeiling
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

// dart format on
