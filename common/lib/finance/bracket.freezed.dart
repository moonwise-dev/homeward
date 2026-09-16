// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bracket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Bracket {

 Rate get rate; Money? get upTo; Money? get deduction;
/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BracketCopyWith<Bracket> get copyWith => _$BracketCopyWithImpl<Bracket>(this as Bracket, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Bracket;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bracket&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.upTo, _this.upTo) || other.upTo == _this.upTo)&&(identical(other.deduction, _this.deduction) || other.deduction == _this.deduction));
}


@override
int get hashCode {
  final _this = this as Bracket;
  return Object.hash(runtimeType,_this.rate,_this.upTo,_this.deduction);
}

@override
String toString() {
  final _this = this as Bracket;
  return 'Bracket(rate: ${_this.rate}, upTo: ${_this.upTo}, deduction: ${_this.deduction})';
}


}

/// @nodoc
abstract mixin class $BracketCopyWith<$Res>  {
  factory $BracketCopyWith(Bracket value, $Res Function(Bracket) _then) = _$BracketCopyWithImpl;
@useResult
$Res call({
 Rate rate, Money? upTo, Money? deduction
});


$MoneyCopyWith<$Res>? get upTo;$MoneyCopyWith<$Res>? get deduction;

}
/// @nodoc
class _$BracketCopyWithImpl<$Res>
    implements $BracketCopyWith<$Res> {
  _$BracketCopyWithImpl(this._self, this._then);

  final Bracket _self;
  final $Res Function(Bracket) _then;

/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rate = null,Object? upTo = freezed,Object? deduction = freezed,}) {
  return _then(Bracket(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as Money?,deduction: freezed == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}
/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get upTo {
    if (_self.upTo == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.upTo!, (value) {
    return _then(_self.copyWith(upTo: value));
  });
}/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get deduction {
    if (_self.deduction == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.deduction!, (value) {
    return _then(_self.copyWith(deduction: value));
  });
}
}


/// Adds pattern-matching-related methods to [Bracket].
extension BracketPatterns on Bracket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bracket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bracket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bracket value)  $default,){
final _that = this;
switch (_that) {
case _Bracket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bracket value)?  $default,){
final _that = this;
switch (_that) {
case _Bracket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Rate rate,  Money? upTo,  Money? deduction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bracket() when $default != null:
return $default(_that.rate,_that.upTo,_that.deduction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Rate rate,  Money? upTo,  Money? deduction)  $default,) {final _that = this;
switch (_that) {
case _Bracket():
return $default(_that.rate,_that.upTo,_that.deduction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Rate rate,  Money? upTo,  Money? deduction)?  $default,) {final _that = this;
switch (_that) {
case _Bracket() when $default != null:
return $default(_that.rate,_that.upTo,_that.deduction);case _:
  return null;

}
}

}

/// @nodoc


class _Bracket implements Bracket {
  const _Bracket({required this.rate, this.upTo, this.deduction});
  

@override final  Rate rate;
@override final  Money? upTo;
@override final  Money? deduction;

/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BracketCopyWith<_Bracket> get copyWith => __$BracketCopyWithImpl<_Bracket>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bracket&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.upTo, upTo) || other.upTo == upTo)&&(identical(other.deduction, deduction) || other.deduction == deduction));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rate,upTo,deduction);
}

@override
String toString() {
    return 'Bracket(rate: $rate, upTo: $upTo, deduction: $deduction)';
}


}

/// @nodoc
abstract mixin class _$BracketCopyWith<$Res> implements $BracketCopyWith<$Res> {
  factory _$BracketCopyWith(_Bracket value, $Res Function(_Bracket) _then) = __$BracketCopyWithImpl;
@override @useResult
$Res call({
 Rate rate, Money? upTo, Money? deduction
});


@override $MoneyCopyWith<$Res>? get upTo;@override $MoneyCopyWith<$Res>? get deduction;

}
/// @nodoc
class __$BracketCopyWithImpl<$Res>
    implements _$BracketCopyWith<$Res> {
  __$BracketCopyWithImpl(this._self, this._then);

  final _Bracket _self;
  final $Res Function(_Bracket) _then;

/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? upTo = freezed,Object? deduction = freezed,}) {
  return _then(_Bracket(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,upTo: freezed == upTo ? _self.upTo : upTo // ignore: cast_nullable_to_non_nullable
as Money?,deduction: freezed == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}

/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get upTo {
    if (_self.upTo == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.upTo!, (value) {
    return _then(_self.copyWith(upTo: value));
  });
}/// Create a copy of Bracket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get deduction {
    if (_self.deduction == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.deduction!, (value) {
    return _then(_self.copyWith(deduction: value));
  });
}
}

// dart format on
