// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_predicate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanPredicate {

 RateType? get rateType; YearRange? get termYears;
/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanPredicateCopyWith<LoanPredicate> get copyWith => _$LoanPredicateCopyWithImpl<LoanPredicate>(this as LoanPredicate, _$identity);

  /// Serializes this LoanPredicate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoanPredicate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanPredicate&&(identical(other.rateType, _this.rateType) || other.rateType == _this.rateType)&&(identical(other.termYears, _this.termYears) || other.termYears == _this.termYears));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoanPredicate;
  return Object.hash(runtimeType,_this.rateType,_this.termYears);
}

@override
String toString() {
  final _this = this as LoanPredicate;
  return 'LoanPredicate(rateType: ${_this.rateType}, termYears: ${_this.termYears})';
}


}

/// @nodoc
abstract mixin class $LoanPredicateCopyWith<$Res>  {
  factory $LoanPredicateCopyWith(LoanPredicate value, $Res Function(LoanPredicate) _then) = _$LoanPredicateCopyWithImpl;
@useResult
$Res call({
 RateType? rateType, YearRange? termYears
});


$YearRangeCopyWith<$Res>? get termYears;

}
/// @nodoc
class _$LoanPredicateCopyWithImpl<$Res>
    implements $LoanPredicateCopyWith<$Res> {
  _$LoanPredicateCopyWithImpl(this._self, this._then);

  final LoanPredicate _self;
  final $Res Function(LoanPredicate) _then;

/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rateType = freezed,Object? termYears = freezed,}) {
  return _then(LoanPredicate(
rateType: freezed == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType?,termYears: freezed == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as YearRange?,
  ));
}
/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YearRangeCopyWith<$Res>? get termYears {
    if (_self.termYears == null) {
    return null;
  }

  return $YearRangeCopyWith<$Res>(_self.termYears!, (value) {
    return _then(_self.copyWith(termYears: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoanPredicate].
extension LoanPredicatePatterns on LoanPredicate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoanPredicate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoanPredicate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoanPredicate value)  $default,){
final _that = this;
switch (_that) {
case _LoanPredicate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoanPredicate value)?  $default,){
final _that = this;
switch (_that) {
case _LoanPredicate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RateType? rateType,  YearRange? termYears)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoanPredicate() when $default != null:
return $default(_that.rateType,_that.termYears);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RateType? rateType,  YearRange? termYears)  $default,) {final _that = this;
switch (_that) {
case _LoanPredicate():
return $default(_that.rateType,_that.termYears);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RateType? rateType,  YearRange? termYears)?  $default,) {final _that = this;
switch (_that) {
case _LoanPredicate() when $default != null:
return $default(_that.rateType,_that.termYears);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoanPredicate implements LoanPredicate {
  const _LoanPredicate({this.rateType, this.termYears});
  factory _LoanPredicate.fromJson(Map<String, dynamic> json) => _$LoanPredicateFromJson(json);

@override final  RateType? rateType;
@override final  YearRange? termYears;

/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoanPredicateCopyWith<_LoanPredicate> get copyWith => __$LoanPredicateCopyWithImpl<_LoanPredicate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoanPredicateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoanPredicate&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.termYears, termYears) || other.termYears == termYears));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rateType,termYears);
}

@override
String toString() {
    return 'LoanPredicate(rateType: $rateType, termYears: $termYears)';
}


}

/// @nodoc
abstract mixin class _$LoanPredicateCopyWith<$Res> implements $LoanPredicateCopyWith<$Res> {
  factory _$LoanPredicateCopyWith(_LoanPredicate value, $Res Function(_LoanPredicate) _then) = __$LoanPredicateCopyWithImpl;
@override @useResult
$Res call({
 RateType? rateType, YearRange? termYears
});


@override $YearRangeCopyWith<$Res>? get termYears;

}
/// @nodoc
class __$LoanPredicateCopyWithImpl<$Res>
    implements _$LoanPredicateCopyWith<$Res> {
  __$LoanPredicateCopyWithImpl(this._self, this._then);

  final _LoanPredicate _self;
  final $Res Function(_LoanPredicate) _then;

/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rateType = freezed,Object? termYears = freezed,}) {
  return _then(_LoanPredicate(
rateType: freezed == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType?,termYears: freezed == termYears ? _self.termYears : termYears // ignore: cast_nullable_to_non_nullable
as YearRange?,
  ));
}

/// Create a copy of LoanPredicate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YearRangeCopyWith<$Res>? get termYears {
    if (_self.termYears == null) {
    return null;
  }

  return $YearRangeCopyWith<$Res>(_self.termYears!, (value) {
    return _then(_self.copyWith(termYears: value));
  });
}
}

// dart format on
