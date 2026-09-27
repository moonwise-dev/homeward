// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amortization_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AmortizationTier {

 Rate get whenLtvAbove; Rate get annualRate;
/// Create a copy of AmortizationTier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmortizationTierCopyWith<AmortizationTier> get copyWith => _$AmortizationTierCopyWithImpl<AmortizationTier>(this as AmortizationTier, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AmortizationTier;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmortizationTier&&(identical(other.whenLtvAbove, _this.whenLtvAbove) || other.whenLtvAbove == _this.whenLtvAbove)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate));
}


@override
int get hashCode {
  final _this = this as AmortizationTier;
  return Object.hash(runtimeType,_this.whenLtvAbove,_this.annualRate);
}

@override
String toString() {
  final _this = this as AmortizationTier;
  return 'AmortizationTier(whenLtvAbove: ${_this.whenLtvAbove}, annualRate: ${_this.annualRate})';
}


}

/// @nodoc
abstract mixin class $AmortizationTierCopyWith<$Res>  {
  factory $AmortizationTierCopyWith(AmortizationTier value, $Res Function(AmortizationTier) _then) = _$AmortizationTierCopyWithImpl;
@useResult
$Res call({
 Rate whenLtvAbove, Rate annualRate
});




}
/// @nodoc
class _$AmortizationTierCopyWithImpl<$Res>
    implements $AmortizationTierCopyWith<$Res> {
  _$AmortizationTierCopyWithImpl(this._self, this._then);

  final AmortizationTier _self;
  final $Res Function(AmortizationTier) _then;

/// Create a copy of AmortizationTier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? whenLtvAbove = null,Object? annualRate = null,}) {
  return _then(AmortizationTier(
whenLtvAbove: null == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}

}


/// Adds pattern-matching-related methods to [AmortizationTier].
extension AmortizationTierPatterns on AmortizationTier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmortizationTier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmortizationTier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmortizationTier value)  $default,){
final _that = this;
switch (_that) {
case _AmortizationTier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmortizationTier value)?  $default,){
final _that = this;
switch (_that) {
case _AmortizationTier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Rate whenLtvAbove,  Rate annualRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmortizationTier() when $default != null:
return $default(_that.whenLtvAbove,_that.annualRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Rate whenLtvAbove,  Rate annualRate)  $default,) {final _that = this;
switch (_that) {
case _AmortizationTier():
return $default(_that.whenLtvAbove,_that.annualRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Rate whenLtvAbove,  Rate annualRate)?  $default,) {final _that = this;
switch (_that) {
case _AmortizationTier() when $default != null:
return $default(_that.whenLtvAbove,_that.annualRate);case _:
  return null;

}
}

}

/// @nodoc


class _AmortizationTier implements AmortizationTier {
  const _AmortizationTier({required this.whenLtvAbove, required this.annualRate});
  

@override final  Rate whenLtvAbove;
@override final  Rate annualRate;

/// Create a copy of AmortizationTier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmortizationTierCopyWith<_AmortizationTier> get copyWith => __$AmortizationTierCopyWithImpl<_AmortizationTier>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmortizationTier&&(identical(other.whenLtvAbove, whenLtvAbove) || other.whenLtvAbove == whenLtvAbove)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,whenLtvAbove,annualRate);
}

@override
String toString() {
    return 'AmortizationTier(whenLtvAbove: $whenLtvAbove, annualRate: $annualRate)';
}


}

/// @nodoc
abstract mixin class _$AmortizationTierCopyWith<$Res> implements $AmortizationTierCopyWith<$Res> {
  factory _$AmortizationTierCopyWith(_AmortizationTier value, $Res Function(_AmortizationTier) _then) = __$AmortizationTierCopyWithImpl;
@override @useResult
$Res call({
 Rate whenLtvAbove, Rate annualRate
});




}
/// @nodoc
class __$AmortizationTierCopyWithImpl<$Res>
    implements _$AmortizationTierCopyWith<$Res> {
  __$AmortizationTierCopyWithImpl(this._self, this._then);

  final _AmortizationTier _self;
  final $Res Function(_AmortizationTier) _then;

/// Create a copy of AmortizationTier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? whenLtvAbove = null,Object? annualRate = null,}) {
  return _then(_AmortizationTier(
whenLtvAbove: null == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,
  ));
}


}

// dart format on
