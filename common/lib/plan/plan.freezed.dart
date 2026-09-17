// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Plan {

@MarketIdJsonConverter() MarketId? get marketId; BuyerProfile get profile; Scenario? get scenario;
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCopyWith<Plan> get copyWith => _$PlanCopyWithImpl<Plan>(this as Plan, _$identity);

  /// Serializes this Plan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Plan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plan&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.scenario, _this.scenario) || other.scenario == _this.scenario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Plan;
  return Object.hash(runtimeType,_this.marketId,_this.profile,_this.scenario);
}

@override
String toString() {
  final _this = this as Plan;
  return 'Plan(marketId: ${_this.marketId}, profile: ${_this.profile}, scenario: ${_this.scenario})';
}


}

/// @nodoc
abstract mixin class $PlanCopyWith<$Res>  {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) _then) = _$PlanCopyWithImpl;
@useResult
$Res call({
@MarketIdJsonConverter() MarketId? marketId, BuyerProfile profile, Scenario? scenario
});


$BuyerProfileCopyWith<$Res> get profile;$ScenarioCopyWith<$Res>? get scenario;

}
/// @nodoc
class _$PlanCopyWithImpl<$Res>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._self, this._then);

  final Plan _self;
  final $Res Function(Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketId = freezed,Object? profile = null,Object? scenario = freezed,}) {
  return _then(Plan(
marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as BuyerProfile,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as Scenario?,
  ));
}
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerProfileCopyWith<$Res> get profile {
  
  return $BuyerProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScenarioCopyWith<$Res>? get scenario {
    if (_self.scenario == null) {
    return null;
  }

  return $ScenarioCopyWith<$Res>(_self.scenario!, (value) {
    return _then(_self.copyWith(scenario: value));
  });
}
}


/// Adds pattern-matching-related methods to [Plan].
extension PlanPatterns on Plan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Plan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Plan value)  $default,){
final _that = this;
switch (_that) {
case _Plan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Plan value)?  $default,){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  Scenario? scenario)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.marketId,_that.profile,_that.scenario);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  Scenario? scenario)  $default,) {final _that = this;
switch (_that) {
case _Plan():
return $default(_that.marketId,_that.profile,_that.scenario);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  Scenario? scenario)?  $default,) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.marketId,_that.profile,_that.scenario);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Plan implements Plan {
  const _Plan({@MarketIdJsonConverter() this.marketId, this.profile = const BuyerProfile(), this.scenario});
  factory _Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

@override@MarketIdJsonConverter() final  MarketId? marketId;
@override@JsonKey() final  BuyerProfile profile;
@override final  Scenario? scenario;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCopyWith<_Plan> get copyWith => __$PlanCopyWithImpl<_Plan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plan&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.scenario, scenario) || other.scenario == scenario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,marketId,profile,scenario);
}

@override
String toString() {
    return 'Plan(marketId: $marketId, profile: $profile, scenario: $scenario)';
}


}

/// @nodoc
abstract mixin class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) _then) = __$PlanCopyWithImpl;
@override @useResult
$Res call({
@MarketIdJsonConverter() MarketId? marketId, BuyerProfile profile, Scenario? scenario
});


@override $BuyerProfileCopyWith<$Res> get profile;@override $ScenarioCopyWith<$Res>? get scenario;

}
/// @nodoc
class __$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(this._self, this._then);

  final _Plan _self;
  final $Res Function(_Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketId = freezed,Object? profile = null,Object? scenario = freezed,}) {
  return _then(_Plan(
marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as BuyerProfile,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as Scenario?,
  ));
}

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerProfileCopyWith<$Res> get profile {
  
  return $BuyerProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScenarioCopyWith<$Res>? get scenario {
    if (_self.scenario == null) {
    return null;
  }

  return $ScenarioCopyWith<$Res>(_self.scenario!, (value) {
    return _then(_self.copyWith(scenario: value));
  });
}
}

// dart format on
