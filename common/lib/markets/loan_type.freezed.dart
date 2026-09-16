// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoanType {

 String get id; String get label; RateType get rateType; String get referenceRateId; RateRange get typicalSpread; int get fixedYears; String get sourceId;
/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanTypeCopyWith<LoanType> get copyWith => _$LoanTypeCopyWithImpl<LoanType>(this as LoanType, _$identity);

  /// Serializes this LoanType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoanType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.rateType, _this.rateType) || other.rateType == _this.rateType)&&(identical(other.referenceRateId, _this.referenceRateId) || other.referenceRateId == _this.referenceRateId)&&(identical(other.typicalSpread, _this.typicalSpread) || other.typicalSpread == _this.typicalSpread)&&(identical(other.fixedYears, _this.fixedYears) || other.fixedYears == _this.fixedYears)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoanType;
  return Object.hash(runtimeType,_this.id,_this.label,_this.rateType,_this.referenceRateId,_this.typicalSpread,_this.fixedYears,_this.sourceId);
}

@override
String toString() {
  final _this = this as LoanType;
  return 'LoanType(id: ${_this.id}, label: ${_this.label}, rateType: ${_this.rateType}, referenceRateId: ${_this.referenceRateId}, typicalSpread: ${_this.typicalSpread}, fixedYears: ${_this.fixedYears}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $LoanTypeCopyWith<$Res>  {
  factory $LoanTypeCopyWith(LoanType value, $Res Function(LoanType) _then) = _$LoanTypeCopyWithImpl;
@useResult
$Res call({
 String id, String label, RateType rateType, String referenceRateId, RateRange typicalSpread, int fixedYears, String sourceId
});


$RateRangeCopyWith<$Res> get typicalSpread;

}
/// @nodoc
class _$LoanTypeCopyWithImpl<$Res>
    implements $LoanTypeCopyWith<$Res> {
  _$LoanTypeCopyWithImpl(this._self, this._then);

  final LoanType _self;
  final $Res Function(LoanType) _then;

/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? rateType = null,Object? referenceRateId = null,Object? typicalSpread = null,Object? fixedYears = null,Object? sourceId = null,}) {
  return _then(LoanType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,referenceRateId: null == referenceRateId ? _self.referenceRateId : referenceRateId // ignore: cast_nullable_to_non_nullable
as String,typicalSpread: null == typicalSpread ? _self.typicalSpread : typicalSpread // ignore: cast_nullable_to_non_nullable
as RateRange,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res> get typicalSpread {
  
  return $RateRangeCopyWith<$Res>(_self.typicalSpread, (value) {
    return _then(_self.copyWith(typicalSpread: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoanType].
extension LoanTypePatterns on LoanType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoanType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoanType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoanType value)  $default,){
final _that = this;
switch (_that) {
case _LoanType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoanType value)?  $default,){
final _that = this;
switch (_that) {
case _LoanType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  RateType rateType,  String referenceRateId,  RateRange typicalSpread,  int fixedYears,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoanType() when $default != null:
return $default(_that.id,_that.label,_that.rateType,_that.referenceRateId,_that.typicalSpread,_that.fixedYears,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  RateType rateType,  String referenceRateId,  RateRange typicalSpread,  int fixedYears,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _LoanType():
return $default(_that.id,_that.label,_that.rateType,_that.referenceRateId,_that.typicalSpread,_that.fixedYears,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  RateType rateType,  String referenceRateId,  RateRange typicalSpread,  int fixedYears,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _LoanType() when $default != null:
return $default(_that.id,_that.label,_that.rateType,_that.referenceRateId,_that.typicalSpread,_that.fixedYears,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoanType implements LoanType {
  const _LoanType({required this.id, required this.label, required this.rateType, required this.referenceRateId, required this.typicalSpread, this.fixedYears = 0, required this.sourceId});
  factory _LoanType.fromJson(Map<String, dynamic> json) => _$LoanTypeFromJson(json);

@override final  String id;
@override final  String label;
@override final  RateType rateType;
@override final  String referenceRateId;
@override final  RateRange typicalSpread;
@override@JsonKey() final  int fixedYears;
@override final  String sourceId;

/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoanTypeCopyWith<_LoanType> get copyWith => __$LoanTypeCopyWithImpl<_LoanType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoanTypeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoanType&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.referenceRateId, referenceRateId) || other.referenceRateId == referenceRateId)&&(identical(other.typicalSpread, typicalSpread) || other.typicalSpread == typicalSpread)&&(identical(other.fixedYears, fixedYears) || other.fixedYears == fixedYears)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,rateType,referenceRateId,typicalSpread,fixedYears,sourceId);
}

@override
String toString() {
    return 'LoanType(id: $id, label: $label, rateType: $rateType, referenceRateId: $referenceRateId, typicalSpread: $typicalSpread, fixedYears: $fixedYears, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$LoanTypeCopyWith<$Res> implements $LoanTypeCopyWith<$Res> {
  factory _$LoanTypeCopyWith(_LoanType value, $Res Function(_LoanType) _then) = __$LoanTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, RateType rateType, String referenceRateId, RateRange typicalSpread, int fixedYears, String sourceId
});


@override $RateRangeCopyWith<$Res> get typicalSpread;

}
/// @nodoc
class __$LoanTypeCopyWithImpl<$Res>
    implements _$LoanTypeCopyWith<$Res> {
  __$LoanTypeCopyWithImpl(this._self, this._then);

  final _LoanType _self;
  final $Res Function(_LoanType) _then;

/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? rateType = null,Object? referenceRateId = null,Object? typicalSpread = null,Object? fixedYears = null,Object? sourceId = null,}) {
  return _then(_LoanType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,referenceRateId: null == referenceRateId ? _self.referenceRateId : referenceRateId // ignore: cast_nullable_to_non_nullable
as String,typicalSpread: null == typicalSpread ? _self.typicalSpread : typicalSpread // ignore: cast_nullable_to_non_nullable
as RateRange,fixedYears: null == fixedYears ? _self.fixedYears : fixedYears // ignore: cast_nullable_to_non_nullable
as int,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LoanType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateRangeCopyWith<$Res> get typicalSpread {
  
  return $RateRangeCopyWith<$Res>(_self.typicalSpread, (value) {
    return _then(_self.copyWith(typicalSpread: value));
  });
}
}

// dart format on
