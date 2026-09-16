// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthlyPayment {

 Money get interest; Money get amortization;
/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyPaymentCopyWith<MonthlyPayment> get copyWith => _$MonthlyPaymentCopyWithImpl<MonthlyPayment>(this as MonthlyPayment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MonthlyPayment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyPayment&&(identical(other.interest, _this.interest) || other.interest == _this.interest)&&(identical(other.amortization, _this.amortization) || other.amortization == _this.amortization));
}


@override
int get hashCode {
  final _this = this as MonthlyPayment;
  return Object.hash(runtimeType,_this.interest,_this.amortization);
}

@override
String toString() {
  final _this = this as MonthlyPayment;
  return 'MonthlyPayment(interest: ${_this.interest}, amortization: ${_this.amortization})';
}


}

/// @nodoc
abstract mixin class $MonthlyPaymentCopyWith<$Res>  {
  factory $MonthlyPaymentCopyWith(MonthlyPayment value, $Res Function(MonthlyPayment) _then) = _$MonthlyPaymentCopyWithImpl;
@useResult
$Res call({
 Money interest, Money amortization
});


$MoneyCopyWith<$Res> get interest;$MoneyCopyWith<$Res> get amortization;

}
/// @nodoc
class _$MonthlyPaymentCopyWithImpl<$Res>
    implements $MonthlyPaymentCopyWith<$Res> {
  _$MonthlyPaymentCopyWithImpl(this._self, this._then);

  final MonthlyPayment _self;
  final $Res Function(MonthlyPayment) _then;

/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interest = null,Object? amortization = null,}) {
  return _then(MonthlyPayment(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interest {
  
  return $MoneyCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amortization {
  
  return $MoneyCopyWith<$Res>(_self.amortization, (value) {
    return _then(_self.copyWith(amortization: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyPayment].
extension MonthlyPaymentPatterns on MonthlyPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyPayment value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyPayment value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money interest,  Money amortization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyPayment() when $default != null:
return $default(_that.interest,_that.amortization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money interest,  Money amortization)  $default,) {final _that = this;
switch (_that) {
case _MonthlyPayment():
return $default(_that.interest,_that.amortization);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money interest,  Money amortization)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyPayment() when $default != null:
return $default(_that.interest,_that.amortization);case _:
  return null;

}
}

}

/// @nodoc


class _MonthlyPayment extends MonthlyPayment {
  const _MonthlyPayment({required this.interest, required this.amortization}): super._();
  

@override final  Money interest;
@override final  Money amortization;

/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyPaymentCopyWith<_MonthlyPayment> get copyWith => __$MonthlyPaymentCopyWithImpl<_MonthlyPayment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyPayment&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.amortization, amortization) || other.amortization == amortization));
}


@override
int get hashCode {
    return Object.hash(runtimeType,interest,amortization);
}

@override
String toString() {
    return 'MonthlyPayment(interest: $interest, amortization: $amortization)';
}


}

/// @nodoc
abstract mixin class _$MonthlyPaymentCopyWith<$Res> implements $MonthlyPaymentCopyWith<$Res> {
  factory _$MonthlyPaymentCopyWith(_MonthlyPayment value, $Res Function(_MonthlyPayment) _then) = __$MonthlyPaymentCopyWithImpl;
@override @useResult
$Res call({
 Money interest, Money amortization
});


@override $MoneyCopyWith<$Res> get interest;@override $MoneyCopyWith<$Res> get amortization;

}
/// @nodoc
class __$MonthlyPaymentCopyWithImpl<$Res>
    implements _$MonthlyPaymentCopyWith<$Res> {
  __$MonthlyPaymentCopyWithImpl(this._self, this._then);

  final _MonthlyPayment _self;
  final $Res Function(_MonthlyPayment) _then;

/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interest = null,Object? amortization = null,}) {
  return _then(_MonthlyPayment(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as Money,amortization: null == amortization ? _self.amortization : amortization // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get interest {
  
  return $MoneyCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}/// Create a copy of MonthlyPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amortization {
  
  return $MoneyCopyWith<$Res>(_self.amortization, (value) {
    return _then(_self.copyWith(amortization: value));
  });
}
}

// dart format on
