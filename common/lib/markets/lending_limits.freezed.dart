// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lending_limits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LtvLimit {

 String get id; BuyerPredicate? get appliesTo;@PercentJsonConverter() Rate get rate; RateRange? get typicalRange; String get sourceId;
/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LtvLimitCopyWith<LtvLimit> get copyWith => _$LtvLimitCopyWithImpl<LtvLimit>(this as LtvLimit, _$identity);

  /// Serializes this LtvLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LtvLimit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LtvLimit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.typicalRange, _this.typicalRange) || other.typicalRange == _this.typicalRange)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LtvLimit;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.rate,_this.typicalRange,_this.sourceId);
}

@override
String toString() {
  final _this = this as LtvLimit;
  return 'LtvLimit(id: ${_this.id}, appliesTo: ${_this.appliesTo}, rate: ${_this.rate}, typicalRange: ${_this.typicalRange}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $LtvLimitCopyWith<$Res>  {
  factory $LtvLimitCopyWith(LtvLimit value, $Res Function(LtvLimit) _then) = _$LtvLimitCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate rate, RateRange? typicalRange, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;$RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class _$LtvLimitCopyWithImpl<$Res>
    implements $LtvLimitCopyWith<$Res> {
  _$LtvLimitCopyWithImpl(this._self, this._then);

  final LtvLimit _self;
  final $Res Function(LtvLimit) _then;

/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? rate = null,Object? typicalRange = freezed,Object? sourceId = null,}) {
  return _then(LtvLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [LtvLimit].
extension LtvLimitPatterns on LtvLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LtvLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LtvLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LtvLimit value)  $default,){
final _that = this;
switch (_that) {
case _LtvLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LtvLimit value)?  $default,){
final _that = this;
switch (_that) {
case _LtvLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  RateRange? typicalRange,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LtvLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.rate,_that.typicalRange,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  RateRange? typicalRange,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _LtvLimit():
return $default(_that.id,_that.appliesTo,_that.rate,_that.typicalRange,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  RateRange? typicalRange,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _LtvLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.rate,_that.typicalRange,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LtvLimit implements LtvLimit {
  const _LtvLimit({required this.id, this.appliesTo, @PercentJsonConverter() required this.rate, this.typicalRange, required this.sourceId});
  factory _LtvLimit.fromJson(Map<String, dynamic> json) => _$LtvLimitFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override@PercentJsonConverter() final  Rate rate;
@override final  RateRange? typicalRange;
@override final  String sourceId;

/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LtvLimitCopyWith<_LtvLimit> get copyWith => __$LtvLimitCopyWithImpl<_LtvLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LtvLimitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LtvLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.typicalRange, typicalRange) || other.typicalRange == typicalRange)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,rate,typicalRange,sourceId);
}

@override
String toString() {
    return 'LtvLimit(id: $id, appliesTo: $appliesTo, rate: $rate, typicalRange: $typicalRange, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$LtvLimitCopyWith<$Res> implements $LtvLimitCopyWith<$Res> {
  factory _$LtvLimitCopyWith(_LtvLimit value, $Res Function(_LtvLimit) _then) = __$LtvLimitCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate rate, RateRange? typicalRange, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;@override $RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class __$LtvLimitCopyWithImpl<$Res>
    implements _$LtvLimitCopyWith<$Res> {
  __$LtvLimitCopyWithImpl(this._self, this._then);

  final _LtvLimit _self;
  final $Res Function(_LtvLimit) _then;

/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? rate = null,Object? typicalRange = freezed,Object? sourceId = null,}) {
  return _then(_LtvLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LtvLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// @nodoc
mixin _$DstiLimit {

 String get id; BuyerPredicate? get appliesTo;@PercentJsonConverter() Rate get rate; IncomeBasis get incomeBasis;@PercentJsonConverter() Rate? get exceptionQuota; String get sourceId;
/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DstiLimitCopyWith<DstiLimit> get copyWith => _$DstiLimitCopyWithImpl<DstiLimit>(this as DstiLimit, _$identity);

  /// Serializes this DstiLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DstiLimit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DstiLimit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.incomeBasis, _this.incomeBasis) || other.incomeBasis == _this.incomeBasis)&&(identical(other.exceptionQuota, _this.exceptionQuota) || other.exceptionQuota == _this.exceptionQuota)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DstiLimit;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.rate,_this.incomeBasis,_this.exceptionQuota,_this.sourceId);
}

@override
String toString() {
  final _this = this as DstiLimit;
  return 'DstiLimit(id: ${_this.id}, appliesTo: ${_this.appliesTo}, rate: ${_this.rate}, incomeBasis: ${_this.incomeBasis}, exceptionQuota: ${_this.exceptionQuota}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $DstiLimitCopyWith<$Res>  {
  factory $DstiLimitCopyWith(DstiLimit value, $Res Function(DstiLimit) _then) = _$DstiLimitCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate rate, IncomeBasis incomeBasis,@PercentJsonConverter() Rate? exceptionQuota, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$DstiLimitCopyWithImpl<$Res>
    implements $DstiLimitCopyWith<$Res> {
  _$DstiLimitCopyWithImpl(this._self, this._then);

  final DstiLimit _self;
  final $Res Function(DstiLimit) _then;

/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? rate = null,Object? incomeBasis = null,Object? exceptionQuota = freezed,Object? sourceId = null,}) {
  return _then(DstiLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,incomeBasis: null == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis,exceptionQuota: freezed == exceptionQuota ? _self.exceptionQuota : exceptionQuota // ignore: cast_nullable_to_non_nullable
as Rate?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [DstiLimit].
extension DstiLimitPatterns on DstiLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DstiLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DstiLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DstiLimit value)  $default,){
final _that = this;
switch (_that) {
case _DstiLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DstiLimit value)?  $default,){
final _that = this;
switch (_that) {
case _DstiLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  IncomeBasis incomeBasis, @PercentJsonConverter()  Rate? exceptionQuota,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DstiLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.rate,_that.incomeBasis,_that.exceptionQuota,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  IncomeBasis incomeBasis, @PercentJsonConverter()  Rate? exceptionQuota,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _DstiLimit():
return $default(_that.id,_that.appliesTo,_that.rate,_that.incomeBasis,_that.exceptionQuota,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate rate,  IncomeBasis incomeBasis, @PercentJsonConverter()  Rate? exceptionQuota,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _DstiLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.rate,_that.incomeBasis,_that.exceptionQuota,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DstiLimit implements DstiLimit {
  const _DstiLimit({required this.id, this.appliesTo, @PercentJsonConverter() required this.rate, required this.incomeBasis, @PercentJsonConverter() this.exceptionQuota, required this.sourceId});
  factory _DstiLimit.fromJson(Map<String, dynamic> json) => _$DstiLimitFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override@PercentJsonConverter() final  Rate rate;
@override final  IncomeBasis incomeBasis;
@override@PercentJsonConverter() final  Rate? exceptionQuota;
@override final  String sourceId;

/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DstiLimitCopyWith<_DstiLimit> get copyWith => __$DstiLimitCopyWithImpl<_DstiLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DstiLimitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DstiLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.incomeBasis, incomeBasis) || other.incomeBasis == incomeBasis)&&(identical(other.exceptionQuota, exceptionQuota) || other.exceptionQuota == exceptionQuota)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,rate,incomeBasis,exceptionQuota,sourceId);
}

@override
String toString() {
    return 'DstiLimit(id: $id, appliesTo: $appliesTo, rate: $rate, incomeBasis: $incomeBasis, exceptionQuota: $exceptionQuota, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$DstiLimitCopyWith<$Res> implements $DstiLimitCopyWith<$Res> {
  factory _$DstiLimitCopyWith(_DstiLimit value, $Res Function(_DstiLimit) _then) = __$DstiLimitCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate rate, IncomeBasis incomeBasis,@PercentJsonConverter() Rate? exceptionQuota, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$DstiLimitCopyWithImpl<$Res>
    implements _$DstiLimitCopyWith<$Res> {
  __$DstiLimitCopyWithImpl(this._self, this._then);

  final _DstiLimit _self;
  final $Res Function(_DstiLimit) _then;

/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? rate = null,Object? incomeBasis = null,Object? exceptionQuota = freezed,Object? sourceId = null,}) {
  return _then(_DstiLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,incomeBasis: null == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis,exceptionQuota: freezed == exceptionQuota ? _self.exceptionQuota : exceptionQuota // ignore: cast_nullable_to_non_nullable
as Rate?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DstiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// @nodoc
mixin _$LtiLimit {

 String get id; BuyerPredicate? get appliesTo;@ExactDecimalJsonConverter() ExactDecimal get multiple; IncomeBasis get incomeBasis; RateRange? get typicalRange; String get sourceId;
/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LtiLimitCopyWith<LtiLimit> get copyWith => _$LtiLimitCopyWithImpl<LtiLimit>(this as LtiLimit, _$identity);

  /// Serializes this LtiLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LtiLimit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LtiLimit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.multiple, _this.multiple) || other.multiple == _this.multiple)&&(identical(other.incomeBasis, _this.incomeBasis) || other.incomeBasis == _this.incomeBasis)&&(identical(other.typicalRange, _this.typicalRange) || other.typicalRange == _this.typicalRange)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LtiLimit;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.multiple,_this.incomeBasis,_this.typicalRange,_this.sourceId);
}

@override
String toString() {
  final _this = this as LtiLimit;
  return 'LtiLimit(id: ${_this.id}, appliesTo: ${_this.appliesTo}, multiple: ${_this.multiple}, incomeBasis: ${_this.incomeBasis}, typicalRange: ${_this.typicalRange}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $LtiLimitCopyWith<$Res>  {
  factory $LtiLimitCopyWith(LtiLimit value, $Res Function(LtiLimit) _then) = _$LtiLimitCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@ExactDecimalJsonConverter() ExactDecimal multiple, IncomeBasis incomeBasis, RateRange? typicalRange, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;$RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class _$LtiLimitCopyWithImpl<$Res>
    implements $LtiLimitCopyWith<$Res> {
  _$LtiLimitCopyWithImpl(this._self, this._then);

  final LtiLimit _self;
  final $Res Function(LtiLimit) _then;

/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? multiple = null,Object? incomeBasis = null,Object? typicalRange = freezed,Object? sourceId = null,}) {
  return _then(LtiLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,multiple: null == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as ExactDecimal,incomeBasis: null == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [LtiLimit].
extension LtiLimitPatterns on LtiLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LtiLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LtiLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LtiLimit value)  $default,){
final _that = this;
switch (_that) {
case _LtiLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LtiLimit value)?  $default,){
final _that = this;
switch (_that) {
case _LtiLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @ExactDecimalJsonConverter()  ExactDecimal multiple,  IncomeBasis incomeBasis,  RateRange? typicalRange,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LtiLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.multiple,_that.incomeBasis,_that.typicalRange,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @ExactDecimalJsonConverter()  ExactDecimal multiple,  IncomeBasis incomeBasis,  RateRange? typicalRange,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _LtiLimit():
return $default(_that.id,_that.appliesTo,_that.multiple,_that.incomeBasis,_that.typicalRange,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo, @ExactDecimalJsonConverter()  ExactDecimal multiple,  IncomeBasis incomeBasis,  RateRange? typicalRange,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _LtiLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.multiple,_that.incomeBasis,_that.typicalRange,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LtiLimit implements LtiLimit {
  const _LtiLimit({required this.id, this.appliesTo, @ExactDecimalJsonConverter() required this.multiple, required this.incomeBasis, this.typicalRange, required this.sourceId});
  factory _LtiLimit.fromJson(Map<String, dynamic> json) => _$LtiLimitFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override@ExactDecimalJsonConverter() final  ExactDecimal multiple;
@override final  IncomeBasis incomeBasis;
@override final  RateRange? typicalRange;
@override final  String sourceId;

/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LtiLimitCopyWith<_LtiLimit> get copyWith => __$LtiLimitCopyWithImpl<_LtiLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LtiLimitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LtiLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.multiple, multiple) || other.multiple == multiple)&&(identical(other.incomeBasis, incomeBasis) || other.incomeBasis == incomeBasis)&&(identical(other.typicalRange, typicalRange) || other.typicalRange == typicalRange)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,multiple,incomeBasis,typicalRange,sourceId);
}

@override
String toString() {
    return 'LtiLimit(id: $id, appliesTo: $appliesTo, multiple: $multiple, incomeBasis: $incomeBasis, typicalRange: $typicalRange, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$LtiLimitCopyWith<$Res> implements $LtiLimitCopyWith<$Res> {
  factory _$LtiLimitCopyWith(_LtiLimit value, $Res Function(_LtiLimit) _then) = __$LtiLimitCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@ExactDecimalJsonConverter() ExactDecimal multiple, IncomeBasis incomeBasis, RateRange? typicalRange, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;@override $RateRangeCopyWith<$Res>? get typicalRange;

}
/// @nodoc
class __$LtiLimitCopyWithImpl<$Res>
    implements _$LtiLimitCopyWith<$Res> {
  __$LtiLimitCopyWithImpl(this._self, this._then);

  final _LtiLimit _self;
  final $Res Function(_LtiLimit) _then;

/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? multiple = null,Object? incomeBasis = null,Object? typicalRange = freezed,Object? sourceId = null,}) {
  return _then(_LtiLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,multiple: null == multiple ? _self.multiple : multiple // ignore: cast_nullable_to_non_nullable
as ExactDecimal,incomeBasis: null == incomeBasis ? _self.incomeBasis : incomeBasis // ignore: cast_nullable_to_non_nullable
as IncomeBasis,typicalRange: freezed == typicalRange ? _self.typicalRange : typicalRange // ignore: cast_nullable_to_non_nullable
as RateRange?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of LtiLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res>? get typicalRange {
    if (_self.typicalRange == null) {
    return null;
  }

  return $RateRangeCopyWith<$Res>(_self.typicalRange!, (value) {
    return _then(_self.copyWith(typicalRange: value));
  });
}
}


/// @nodoc
mixin _$StressRule {

 String get id; BuyerPredicate? get appliesTo; LoanPredicate? get appliesToLoan; StressKind get kind;@PercentJsonConverter() Rate get rate; String get sourceId;
/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StressRuleCopyWith<StressRule> get copyWith => _$StressRuleCopyWithImpl<StressRule>(this as StressRule, _$identity);

  /// Serializes this StressRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StressRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StressRule&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.appliesToLoan, _this.appliesToLoan) || other.appliesToLoan == _this.appliesToLoan)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StressRule;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.appliesToLoan,_this.kind,_this.rate,_this.sourceId);
}

@override
String toString() {
  final _this = this as StressRule;
  return 'StressRule(id: ${_this.id}, appliesTo: ${_this.appliesTo}, appliesToLoan: ${_this.appliesToLoan}, kind: ${_this.kind}, rate: ${_this.rate}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $StressRuleCopyWith<$Res>  {
  factory $StressRuleCopyWith(StressRule value, $Res Function(StressRule) _then) = _$StressRuleCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo, LoanPredicate? appliesToLoan, StressKind kind,@PercentJsonConverter() Rate rate, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;$LoanPredicateCopyWith<$Res>? get appliesToLoan;

}
/// @nodoc
class _$StressRuleCopyWithImpl<$Res>
    implements $StressRuleCopyWith<$Res> {
  _$StressRuleCopyWithImpl(this._self, this._then);

  final StressRule _self;
  final $Res Function(StressRule) _then;

/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? appliesToLoan = freezed,Object? kind = null,Object? rate = null,Object? sourceId = null,}) {
  return _then(StressRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,appliesToLoan: freezed == appliesToLoan ? _self.appliesToLoan : appliesToLoan // ignore: cast_nullable_to_non_nullable
as LoanPredicate?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as StressKind,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoanPredicateCopyWith<$Res>? get appliesToLoan {
    if (_self.appliesToLoan == null) {
    return null;
  }

  return $LoanPredicateCopyWith<$Res>(_self.appliesToLoan!, (value) {
    return _then(_self.copyWith(appliesToLoan: value));
  });
}
}


/// Adds pattern-matching-related methods to [StressRule].
extension StressRulePatterns on StressRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StressRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StressRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StressRule value)  $default,){
final _that = this;
switch (_that) {
case _StressRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StressRule value)?  $default,){
final _that = this;
switch (_that) {
case _StressRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  LoanPredicate? appliesToLoan,  StressKind kind, @PercentJsonConverter()  Rate rate,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StressRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.appliesToLoan,_that.kind,_that.rate,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  LoanPredicate? appliesToLoan,  StressKind kind, @PercentJsonConverter()  Rate rate,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _StressRule():
return $default(_that.id,_that.appliesTo,_that.appliesToLoan,_that.kind,_that.rate,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo,  LoanPredicate? appliesToLoan,  StressKind kind, @PercentJsonConverter()  Rate rate,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _StressRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.appliesToLoan,_that.kind,_that.rate,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StressRule implements StressRule {
  const _StressRule({required this.id, this.appliesTo, this.appliesToLoan, required this.kind, @PercentJsonConverter() required this.rate, required this.sourceId});
  factory _StressRule.fromJson(Map<String, dynamic> json) => _$StressRuleFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override final  LoanPredicate? appliesToLoan;
@override final  StressKind kind;
@override@PercentJsonConverter() final  Rate rate;
@override final  String sourceId;

/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StressRuleCopyWith<_StressRule> get copyWith => __$StressRuleCopyWithImpl<_StressRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StressRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StressRule&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.appliesToLoan, appliesToLoan) || other.appliesToLoan == appliesToLoan)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,appliesToLoan,kind,rate,sourceId);
}

@override
String toString() {
    return 'StressRule(id: $id, appliesTo: $appliesTo, appliesToLoan: $appliesToLoan, kind: $kind, rate: $rate, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$StressRuleCopyWith<$Res> implements $StressRuleCopyWith<$Res> {
  factory _$StressRuleCopyWith(_StressRule value, $Res Function(_StressRule) _then) = __$StressRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo, LoanPredicate? appliesToLoan, StressKind kind,@PercentJsonConverter() Rate rate, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;@override $LoanPredicateCopyWith<$Res>? get appliesToLoan;

}
/// @nodoc
class __$StressRuleCopyWithImpl<$Res>
    implements _$StressRuleCopyWith<$Res> {
  __$StressRuleCopyWithImpl(this._self, this._then);

  final _StressRule _self;
  final $Res Function(_StressRule) _then;

/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? appliesToLoan = freezed,Object? kind = null,Object? rate = null,Object? sourceId = null,}) {
  return _then(_StressRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,appliesToLoan: freezed == appliesToLoan ? _self.appliesToLoan : appliesToLoan // ignore: cast_nullable_to_non_nullable
as LoanPredicate?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as StressKind,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}/// Create a copy of StressRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoanPredicateCopyWith<$Res>? get appliesToLoan {
    if (_self.appliesToLoan == null) {
    return null;
  }

  return $LoanPredicateCopyWith<$Res>(_self.appliesToLoan!, (value) {
    return _then(_self.copyWith(appliesToLoan: value));
  });
}
}


/// @nodoc
mixin _$YearsLimit {

 String get id; BuyerPredicate? get appliesTo; int get years; String get sourceId;
/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YearsLimitCopyWith<YearsLimit> get copyWith => _$YearsLimitCopyWithImpl<YearsLimit>(this as YearsLimit, _$identity);

  /// Serializes this YearsLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as YearsLimit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearsLimit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.years, _this.years) || other.years == _this.years)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as YearsLimit;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.years,_this.sourceId);
}

@override
String toString() {
  final _this = this as YearsLimit;
  return 'YearsLimit(id: ${_this.id}, appliesTo: ${_this.appliesTo}, years: ${_this.years}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $YearsLimitCopyWith<$Res>  {
  factory $YearsLimitCopyWith(YearsLimit value, $Res Function(YearsLimit) _then) = _$YearsLimitCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo, int years, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$YearsLimitCopyWithImpl<$Res>
    implements $YearsLimitCopyWith<$Res> {
  _$YearsLimitCopyWithImpl(this._self, this._then);

  final YearsLimit _self;
  final $Res Function(YearsLimit) _then;

/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? years = null,Object? sourceId = null,}) {
  return _then(YearsLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as int,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [YearsLimit].
extension YearsLimitPatterns on YearsLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YearsLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YearsLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YearsLimit value)  $default,){
final _that = this;
switch (_that) {
case _YearsLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YearsLimit value)?  $default,){
final _that = this;
switch (_that) {
case _YearsLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  int years,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YearsLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.years,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  int years,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _YearsLimit():
return $default(_that.id,_that.appliesTo,_that.years,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo,  int years,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _YearsLimit() when $default != null:
return $default(_that.id,_that.appliesTo,_that.years,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YearsLimit implements YearsLimit {
  const _YearsLimit({required this.id, this.appliesTo, required this.years, required this.sourceId});
  factory _YearsLimit.fromJson(Map<String, dynamic> json) => _$YearsLimitFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override final  int years;
@override final  String sourceId;

/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YearsLimitCopyWith<_YearsLimit> get copyWith => __$YearsLimitCopyWithImpl<_YearsLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YearsLimitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _YearsLimit&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.years, years) || other.years == years)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,years,sourceId);
}

@override
String toString() {
    return 'YearsLimit(id: $id, appliesTo: $appliesTo, years: $years, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$YearsLimitCopyWith<$Res> implements $YearsLimitCopyWith<$Res> {
  factory _$YearsLimitCopyWith(_YearsLimit value, $Res Function(_YearsLimit) _then) = __$YearsLimitCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo, int years, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$YearsLimitCopyWithImpl<$Res>
    implements _$YearsLimitCopyWith<$Res> {
  __$YearsLimitCopyWithImpl(this._self, this._then);

  final _YearsLimit _self;
  final $Res Function(_YearsLimit) _then;

/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? years = null,Object? sourceId = null,}) {
  return _then(_YearsLimit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as int,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of YearsLimit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// @nodoc
mixin _$IncomeAdjustment {

 String get id; BuyerPredicate? get appliesTo; int get whenAgeAtMaturityAbove;@PercentJsonConverter() Rate get reduction; bool get weightedByTermShare; bool get exceptRetired; String get sourceId;
/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeAdjustmentCopyWith<IncomeAdjustment> get copyWith => _$IncomeAdjustmentCopyWithImpl<IncomeAdjustment>(this as IncomeAdjustment, _$identity);

  /// Serializes this IncomeAdjustment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IncomeAdjustment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeAdjustment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.whenAgeAtMaturityAbove, _this.whenAgeAtMaturityAbove) || other.whenAgeAtMaturityAbove == _this.whenAgeAtMaturityAbove)&&(identical(other.reduction, _this.reduction) || other.reduction == _this.reduction)&&(identical(other.weightedByTermShare, _this.weightedByTermShare) || other.weightedByTermShare == _this.weightedByTermShare)&&(identical(other.exceptRetired, _this.exceptRetired) || other.exceptRetired == _this.exceptRetired)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IncomeAdjustment;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.whenAgeAtMaturityAbove,_this.reduction,_this.weightedByTermShare,_this.exceptRetired,_this.sourceId);
}

@override
String toString() {
  final _this = this as IncomeAdjustment;
  return 'IncomeAdjustment(id: ${_this.id}, appliesTo: ${_this.appliesTo}, whenAgeAtMaturityAbove: ${_this.whenAgeAtMaturityAbove}, reduction: ${_this.reduction}, weightedByTermShare: ${_this.weightedByTermShare}, exceptRetired: ${_this.exceptRetired}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $IncomeAdjustmentCopyWith<$Res>  {
  factory $IncomeAdjustmentCopyWith(IncomeAdjustment value, $Res Function(IncomeAdjustment) _then) = _$IncomeAdjustmentCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo, int whenAgeAtMaturityAbove,@PercentJsonConverter() Rate reduction, bool weightedByTermShare, bool exceptRetired, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$IncomeAdjustmentCopyWithImpl<$Res>
    implements $IncomeAdjustmentCopyWith<$Res> {
  _$IncomeAdjustmentCopyWithImpl(this._self, this._then);

  final IncomeAdjustment _self;
  final $Res Function(IncomeAdjustment) _then;

/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? whenAgeAtMaturityAbove = null,Object? reduction = null,Object? weightedByTermShare = null,Object? exceptRetired = null,Object? sourceId = null,}) {
  return _then(IncomeAdjustment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,whenAgeAtMaturityAbove: null == whenAgeAtMaturityAbove ? _self.whenAgeAtMaturityAbove : whenAgeAtMaturityAbove // ignore: cast_nullable_to_non_nullable
as int,reduction: null == reduction ? _self.reduction : reduction // ignore: cast_nullable_to_non_nullable
as Rate,weightedByTermShare: null == weightedByTermShare ? _self.weightedByTermShare : weightedByTermShare // ignore: cast_nullable_to_non_nullable
as bool,exceptRetired: null == exceptRetired ? _self.exceptRetired : exceptRetired // ignore: cast_nullable_to_non_nullable
as bool,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [IncomeAdjustment].
extension IncomeAdjustmentPatterns on IncomeAdjustment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeAdjustment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeAdjustment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeAdjustment value)  $default,){
final _that = this;
switch (_that) {
case _IncomeAdjustment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeAdjustment value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeAdjustment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  int whenAgeAtMaturityAbove, @PercentJsonConverter()  Rate reduction,  bool weightedByTermShare,  bool exceptRetired,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeAdjustment() when $default != null:
return $default(_that.id,_that.appliesTo,_that.whenAgeAtMaturityAbove,_that.reduction,_that.weightedByTermShare,_that.exceptRetired,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo,  int whenAgeAtMaturityAbove, @PercentJsonConverter()  Rate reduction,  bool weightedByTermShare,  bool exceptRetired,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _IncomeAdjustment():
return $default(_that.id,_that.appliesTo,_that.whenAgeAtMaturityAbove,_that.reduction,_that.weightedByTermShare,_that.exceptRetired,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo,  int whenAgeAtMaturityAbove, @PercentJsonConverter()  Rate reduction,  bool weightedByTermShare,  bool exceptRetired,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _IncomeAdjustment() when $default != null:
return $default(_that.id,_that.appliesTo,_that.whenAgeAtMaturityAbove,_that.reduction,_that.weightedByTermShare,_that.exceptRetired,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeAdjustment implements IncomeAdjustment {
  const _IncomeAdjustment({required this.id, this.appliesTo, required this.whenAgeAtMaturityAbove, @PercentJsonConverter() required this.reduction, required this.weightedByTermShare, required this.exceptRetired, required this.sourceId});
  factory _IncomeAdjustment.fromJson(Map<String, dynamic> json) => _$IncomeAdjustmentFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override final  int whenAgeAtMaturityAbove;
@override@PercentJsonConverter() final  Rate reduction;
@override final  bool weightedByTermShare;
@override final  bool exceptRetired;
@override final  String sourceId;

/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeAdjustmentCopyWith<_IncomeAdjustment> get copyWith => __$IncomeAdjustmentCopyWithImpl<_IncomeAdjustment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeAdjustmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeAdjustment&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.whenAgeAtMaturityAbove, whenAgeAtMaturityAbove) || other.whenAgeAtMaturityAbove == whenAgeAtMaturityAbove)&&(identical(other.reduction, reduction) || other.reduction == reduction)&&(identical(other.weightedByTermShare, weightedByTermShare) || other.weightedByTermShare == weightedByTermShare)&&(identical(other.exceptRetired, exceptRetired) || other.exceptRetired == exceptRetired)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,whenAgeAtMaturityAbove,reduction,weightedByTermShare,exceptRetired,sourceId);
}

@override
String toString() {
    return 'IncomeAdjustment(id: $id, appliesTo: $appliesTo, whenAgeAtMaturityAbove: $whenAgeAtMaturityAbove, reduction: $reduction, weightedByTermShare: $weightedByTermShare, exceptRetired: $exceptRetired, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$IncomeAdjustmentCopyWith<$Res> implements $IncomeAdjustmentCopyWith<$Res> {
  factory _$IncomeAdjustmentCopyWith(_IncomeAdjustment value, $Res Function(_IncomeAdjustment) _then) = __$IncomeAdjustmentCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo, int whenAgeAtMaturityAbove,@PercentJsonConverter() Rate reduction, bool weightedByTermShare, bool exceptRetired, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$IncomeAdjustmentCopyWithImpl<$Res>
    implements _$IncomeAdjustmentCopyWith<$Res> {
  __$IncomeAdjustmentCopyWithImpl(this._self, this._then);

  final _IncomeAdjustment _self;
  final $Res Function(_IncomeAdjustment) _then;

/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? whenAgeAtMaturityAbove = null,Object? reduction = null,Object? weightedByTermShare = null,Object? exceptRetired = null,Object? sourceId = null,}) {
  return _then(_IncomeAdjustment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,whenAgeAtMaturityAbove: null == whenAgeAtMaturityAbove ? _self.whenAgeAtMaturityAbove : whenAgeAtMaturityAbove // ignore: cast_nullable_to_non_nullable
as int,reduction: null == reduction ? _self.reduction : reduction // ignore: cast_nullable_to_non_nullable
as Rate,weightedByTermShare: null == weightedByTermShare ? _self.weightedByTermShare : weightedByTermShare // ignore: cast_nullable_to_non_nullable
as bool,exceptRetired: null == exceptRetired ? _self.exceptRetired : exceptRetired // ignore: cast_nullable_to_non_nullable
as bool,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of IncomeAdjustment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// @nodoc
mixin _$AmortizationRule {

 String get id; BuyerPredicate? get appliesTo;@PercentJsonConverter() Rate get whenLtvAbove;@PercentJsonConverter() Rate get annualRate; String get sourceId;
/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmortizationRuleCopyWith<AmortizationRule> get copyWith => _$AmortizationRuleCopyWithImpl<AmortizationRule>(this as AmortizationRule, _$identity);

  /// Serializes this AmortizationRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AmortizationRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmortizationRule&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.whenLtvAbove, _this.whenLtvAbove) || other.whenLtvAbove == _this.whenLtvAbove)&&(identical(other.annualRate, _this.annualRate) || other.annualRate == _this.annualRate)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AmortizationRule;
  return Object.hash(runtimeType,_this.id,_this.appliesTo,_this.whenLtvAbove,_this.annualRate,_this.sourceId);
}

@override
String toString() {
  final _this = this as AmortizationRule;
  return 'AmortizationRule(id: ${_this.id}, appliesTo: ${_this.appliesTo}, whenLtvAbove: ${_this.whenLtvAbove}, annualRate: ${_this.annualRate}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $AmortizationRuleCopyWith<$Res>  {
  factory $AmortizationRuleCopyWith(AmortizationRule value, $Res Function(AmortizationRule) _then) = _$AmortizationRuleCopyWithImpl;
@useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate whenLtvAbove,@PercentJsonConverter() Rate annualRate, String sourceId
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$AmortizationRuleCopyWithImpl<$Res>
    implements $AmortizationRuleCopyWith<$Res> {
  _$AmortizationRuleCopyWithImpl(this._self, this._then);

  final AmortizationRule _self;
  final $Res Function(AmortizationRule) _then;

/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? appliesTo = freezed,Object? whenLtvAbove = null,Object? annualRate = null,Object? sourceId = null,}) {
  return _then(AmortizationRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,whenLtvAbove: null == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [AmortizationRule].
extension AmortizationRulePatterns on AmortizationRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmortizationRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmortizationRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmortizationRule value)  $default,){
final _that = this;
switch (_that) {
case _AmortizationRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmortizationRule value)?  $default,){
final _that = this;
switch (_that) {
case _AmortizationRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate whenLtvAbove, @PercentJsonConverter()  Rate annualRate,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmortizationRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.whenLtvAbove,_that.annualRate,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate whenLtvAbove, @PercentJsonConverter()  Rate annualRate,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _AmortizationRule():
return $default(_that.id,_that.appliesTo,_that.whenLtvAbove,_that.annualRate,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BuyerPredicate? appliesTo, @PercentJsonConverter()  Rate whenLtvAbove, @PercentJsonConverter()  Rate annualRate,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _AmortizationRule() when $default != null:
return $default(_that.id,_that.appliesTo,_that.whenLtvAbove,_that.annualRate,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmortizationRule extends AmortizationRule {
  const _AmortizationRule({required this.id, this.appliesTo, @PercentJsonConverter() required this.whenLtvAbove, @PercentJsonConverter() required this.annualRate, required this.sourceId}): super._();
  factory _AmortizationRule.fromJson(Map<String, dynamic> json) => _$AmortizationRuleFromJson(json);

@override final  String id;
@override final  BuyerPredicate? appliesTo;
@override@PercentJsonConverter() final  Rate whenLtvAbove;
@override@PercentJsonConverter() final  Rate annualRate;
@override final  String sourceId;

/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmortizationRuleCopyWith<_AmortizationRule> get copyWith => __$AmortizationRuleCopyWithImpl<_AmortizationRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmortizationRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmortizationRule&&(identical(other.id, id) || other.id == id)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.whenLtvAbove, whenLtvAbove) || other.whenLtvAbove == whenLtvAbove)&&(identical(other.annualRate, annualRate) || other.annualRate == annualRate)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,appliesTo,whenLtvAbove,annualRate,sourceId);
}

@override
String toString() {
    return 'AmortizationRule(id: $id, appliesTo: $appliesTo, whenLtvAbove: $whenLtvAbove, annualRate: $annualRate, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$AmortizationRuleCopyWith<$Res> implements $AmortizationRuleCopyWith<$Res> {
  factory _$AmortizationRuleCopyWith(_AmortizationRule value, $Res Function(_AmortizationRule) _then) = __$AmortizationRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, BuyerPredicate? appliesTo,@PercentJsonConverter() Rate whenLtvAbove,@PercentJsonConverter() Rate annualRate, String sourceId
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$AmortizationRuleCopyWithImpl<$Res>
    implements _$AmortizationRuleCopyWith<$Res> {
  __$AmortizationRuleCopyWithImpl(this._self, this._then);

  final _AmortizationRule _self;
  final $Res Function(_AmortizationRule) _then;

/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? appliesTo = freezed,Object? whenLtvAbove = null,Object? annualRate = null,Object? sourceId = null,}) {
  return _then(_AmortizationRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,whenLtvAbove: null == whenLtvAbove ? _self.whenLtvAbove : whenLtvAbove // ignore: cast_nullable_to_non_nullable
as Rate,annualRate: null == annualRate ? _self.annualRate : annualRate // ignore: cast_nullable_to_non_nullable
as Rate,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AmortizationRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}

// dart format on
