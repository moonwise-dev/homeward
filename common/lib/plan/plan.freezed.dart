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

@MarketIdJsonConverter() MarketId? get marketId; BuyerProfile get profile; BuyerProfile? get profileDraft; Scenario? get scenario; Scenario? get scenarioDraft;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plan&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.profileDraft, _this.profileDraft) || other.profileDraft == _this.profileDraft)&&(identical(other.scenario, _this.scenario) || other.scenario == _this.scenario)&&(identical(other.scenarioDraft, _this.scenarioDraft) || other.scenarioDraft == _this.scenarioDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Plan;
  return Object.hash(runtimeType,_this.marketId,_this.profile,_this.profileDraft,_this.scenario,_this.scenarioDraft);
}

@override
String toString() {
  final _this = this as Plan;
  return 'Plan(marketId: ${_this.marketId}, profile: ${_this.profile}, profileDraft: ${_this.profileDraft}, scenario: ${_this.scenario}, scenarioDraft: ${_this.scenarioDraft})';
}


}

/// @nodoc
abstract mixin class $PlanCopyWith<$Res>  {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) _then) = _$PlanCopyWithImpl;
@useResult
$Res call({
@MarketIdJsonConverter() MarketId? marketId, BuyerProfile profile, BuyerProfile? profileDraft, Scenario? scenario, Scenario? scenarioDraft
});


$BuyerProfileCopyWith<$Res> get profile;$BuyerProfileCopyWith<$Res>? get profileDraft;$ScenarioCopyWith<$Res>? get scenario;$ScenarioCopyWith<$Res>? get scenarioDraft;

}
/// @nodoc
class _$PlanCopyWithImpl<$Res>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._self, this._then);

  final Plan _self;
  final $Res Function(Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketId = freezed,Object? profile = null,Object? profileDraft = freezed,Object? scenario = freezed,Object? scenarioDraft = freezed,}) {
  return _then(Plan(
marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as BuyerProfile,profileDraft: freezed == profileDraft ? _self.profileDraft : profileDraft // ignore: cast_nullable_to_non_nullable
as BuyerProfile?,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as Scenario?,scenarioDraft: freezed == scenarioDraft ? _self.scenarioDraft : scenarioDraft // ignore: cast_nullable_to_non_nullable
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
$BuyerProfileCopyWith<$Res>? get profileDraft {
    if (_self.profileDraft == null) {
    return null;
  }

  return $BuyerProfileCopyWith<$Res>(_self.profileDraft!, (value) {
    return _then(_self.copyWith(profileDraft: value));
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
}/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScenarioCopyWith<$Res>? get scenarioDraft {
    if (_self.scenarioDraft == null) {
    return null;
  }

  return $ScenarioCopyWith<$Res>(_self.scenarioDraft!, (value) {
    return _then(_self.copyWith(scenarioDraft: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  BuyerProfile? profileDraft,  Scenario? scenario,  Scenario? scenarioDraft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.marketId,_that.profile,_that.profileDraft,_that.scenario,_that.scenarioDraft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  BuyerProfile? profileDraft,  Scenario? scenario,  Scenario? scenarioDraft)  $default,) {final _that = this;
switch (_that) {
case _Plan():
return $default(_that.marketId,_that.profile,_that.profileDraft,_that.scenario,_that.scenarioDraft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MarketIdJsonConverter()  MarketId? marketId,  BuyerProfile profile,  BuyerProfile? profileDraft,  Scenario? scenario,  Scenario? scenarioDraft)?  $default,) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.marketId,_that.profile,_that.profileDraft,_that.scenario,_that.scenarioDraft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Plan implements Plan {
  const _Plan({@MarketIdJsonConverter() this.marketId, this.profile = const BuyerProfile(), this.profileDraft, this.scenario, this.scenarioDraft});
  factory _Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

@override@MarketIdJsonConverter() final  MarketId? marketId;
@override@JsonKey() final  BuyerProfile profile;
@override final  BuyerProfile? profileDraft;
@override final  Scenario? scenario;
@override final  Scenario? scenarioDraft;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plan&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.profileDraft, profileDraft) || other.profileDraft == profileDraft)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.scenarioDraft, scenarioDraft) || other.scenarioDraft == scenarioDraft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,marketId,profile,profileDraft,scenario,scenarioDraft);
}

@override
String toString() {
    return 'Plan(marketId: $marketId, profile: $profile, profileDraft: $profileDraft, scenario: $scenario, scenarioDraft: $scenarioDraft)';
}


}

/// @nodoc
abstract mixin class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) _then) = __$PlanCopyWithImpl;
@override @useResult
$Res call({
@MarketIdJsonConverter() MarketId? marketId, BuyerProfile profile, BuyerProfile? profileDraft, Scenario? scenario, Scenario? scenarioDraft
});


@override $BuyerProfileCopyWith<$Res> get profile;@override $BuyerProfileCopyWith<$Res>? get profileDraft;@override $ScenarioCopyWith<$Res>? get scenario;@override $ScenarioCopyWith<$Res>? get scenarioDraft;

}
/// @nodoc
class __$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(this._self, this._then);

  final _Plan _self;
  final $Res Function(_Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketId = freezed,Object? profile = null,Object? profileDraft = freezed,Object? scenario = freezed,Object? scenarioDraft = freezed,}) {
  return _then(_Plan(
marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as MarketId?,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as BuyerProfile,profileDraft: freezed == profileDraft ? _self.profileDraft : profileDraft // ignore: cast_nullable_to_non_nullable
as BuyerProfile?,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as Scenario?,scenarioDraft: freezed == scenarioDraft ? _self.scenarioDraft : scenarioDraft // ignore: cast_nullable_to_non_nullable
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
$BuyerProfileCopyWith<$Res>? get profileDraft {
    if (_self.profileDraft == null) {
    return null;
  }

  return $BuyerProfileCopyWith<$Res>(_self.profileDraft!, (value) {
    return _then(_self.copyWith(profileDraft: value));
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
}/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScenarioCopyWith<$Res>? get scenarioDraft {
    if (_self.scenarioDraft == null) {
    return null;
  }

  return $ScenarioCopyWith<$Res>(_self.scenarioDraft!, (value) {
    return _then(_self.copyWith(scenarioDraft: value));
  });
}
}

// dart format on
