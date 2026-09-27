// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_figure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentFigure {

 Money get monthly; bool get stated; Money? get perM2; int? get sizeM2; String? get source;
/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentFigureCopyWith<RentFigure> get copyWith => _$RentFigureCopyWithImpl<RentFigure>(this as RentFigure, _$identity);

  /// Serializes this RentFigure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RentFigure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentFigure&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.stated, _this.stated) || other.stated == _this.stated)&&(identical(other.perM2, _this.perM2) || other.perM2 == _this.perM2)&&(identical(other.sizeM2, _this.sizeM2) || other.sizeM2 == _this.sizeM2)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RentFigure;
  return Object.hash(runtimeType,_this.monthly,_this.stated,_this.perM2,_this.sizeM2,_this.source);
}

@override
String toString() {
  final _this = this as RentFigure;
  return 'RentFigure(monthly: ${_this.monthly}, stated: ${_this.stated}, perM2: ${_this.perM2}, sizeM2: ${_this.sizeM2}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $RentFigureCopyWith<$Res>  {
  factory $RentFigureCopyWith(RentFigure value, $Res Function(RentFigure) _then) = _$RentFigureCopyWithImpl;
@useResult
$Res call({
 Money monthly, bool stated, Money? perM2, int? sizeM2, String? source
});


$MoneyCopyWith<$Res> get monthly;$MoneyCopyWith<$Res>? get perM2;

}
/// @nodoc
class _$RentFigureCopyWithImpl<$Res>
    implements $RentFigureCopyWith<$Res> {
  _$RentFigureCopyWithImpl(this._self, this._then);

  final RentFigure _self;
  final $Res Function(RentFigure) _then;

/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthly = null,Object? stated = null,Object? perM2 = freezed,Object? sizeM2 = freezed,Object? source = freezed,}) {
  return _then(RentFigure(
monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as Money,stated: null == stated ? _self.stated : stated // ignore: cast_nullable_to_non_nullable
as bool,perM2: freezed == perM2 ? _self.perM2 : perM2 // ignore: cast_nullable_to_non_nullable
as Money?,sizeM2: freezed == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get monthly {
  
  return $MoneyCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get perM2 {
    if (_self.perM2 == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.perM2!, (value) {
    return _then(_self.copyWith(perM2: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentFigure].
extension RentFigurePatterns on RentFigure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentFigure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentFigure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentFigure value)  $default,){
final _that = this;
switch (_that) {
case _RentFigure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentFigure value)?  $default,){
final _that = this;
switch (_that) {
case _RentFigure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money monthly,  bool stated,  Money? perM2,  int? sizeM2,  String? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentFigure() when $default != null:
return $default(_that.monthly,_that.stated,_that.perM2,_that.sizeM2,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money monthly,  bool stated,  Money? perM2,  int? sizeM2,  String? source)  $default,) {final _that = this;
switch (_that) {
case _RentFigure():
return $default(_that.monthly,_that.stated,_that.perM2,_that.sizeM2,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money monthly,  bool stated,  Money? perM2,  int? sizeM2,  String? source)?  $default,) {final _that = this;
switch (_that) {
case _RentFigure() when $default != null:
return $default(_that.monthly,_that.stated,_that.perM2,_that.sizeM2,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentFigure implements RentFigure {
  const _RentFigure({required this.monthly, required this.stated, this.perM2, this.sizeM2, this.source});
  factory _RentFigure.fromJson(Map<String, dynamic> json) => _$RentFigureFromJson(json);

@override final  Money monthly;
@override final  bool stated;
@override final  Money? perM2;
@override final  int? sizeM2;
@override final  String? source;

/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentFigureCopyWith<_RentFigure> get copyWith => __$RentFigureCopyWithImpl<_RentFigure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentFigureToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentFigure&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.stated, stated) || other.stated == stated)&&(identical(other.perM2, perM2) || other.perM2 == perM2)&&(identical(other.sizeM2, sizeM2) || other.sizeM2 == sizeM2)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,monthly,stated,perM2,sizeM2,source);
}

@override
String toString() {
    return 'RentFigure(monthly: $monthly, stated: $stated, perM2: $perM2, sizeM2: $sizeM2, source: $source)';
}


}

/// @nodoc
abstract mixin class _$RentFigureCopyWith<$Res> implements $RentFigureCopyWith<$Res> {
  factory _$RentFigureCopyWith(_RentFigure value, $Res Function(_RentFigure) _then) = __$RentFigureCopyWithImpl;
@override @useResult
$Res call({
 Money monthly, bool stated, Money? perM2, int? sizeM2, String? source
});


@override $MoneyCopyWith<$Res> get monthly;@override $MoneyCopyWith<$Res>? get perM2;

}
/// @nodoc
class __$RentFigureCopyWithImpl<$Res>
    implements _$RentFigureCopyWith<$Res> {
  __$RentFigureCopyWithImpl(this._self, this._then);

  final _RentFigure _self;
  final $Res Function(_RentFigure) _then;

/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthly = null,Object? stated = null,Object? perM2 = freezed,Object? sizeM2 = freezed,Object? source = freezed,}) {
  return _then(_RentFigure(
monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as Money,stated: null == stated ? _self.stated : stated // ignore: cast_nullable_to_non_nullable
as bool,perM2: freezed == perM2 ? _self.perM2 : perM2 // ignore: cast_nullable_to_non_nullable
as Money?,sizeM2: freezed == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get monthly {
  
  return $MoneyCopyWith<$Res>(_self.monthly, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of RentFigure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get perM2 {
    if (_self.perM2 == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.perM2!, (value) {
    return _then(_self.copyWith(perM2: value));
  });
}
}

// dart format on
