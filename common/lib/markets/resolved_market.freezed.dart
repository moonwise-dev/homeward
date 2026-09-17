// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolved_market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResolvedMarket {

@MarketIdJsonConverter() MarketId get id; String get name; Coverage get coverage;@CurrencyJsonConverter() Currency get currency;@LocaleTagJsonConverter() LocaleTag get locale; LendingRules get lending; List<CostRule> get purchaseCosts; List<CostRule> get recurringCosts; List<LoanType> get loanTypes; List<ProfileFieldRequirement> get profileFields; Map<String, ReferenceRate> get referenceRates; LivingCosts? get livingCosts; List<Source> get sources; Map<String, PendingRule> get pendingRules; Set<ProfileField> get requiredFields;
/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedMarketCopyWith<ResolvedMarket> get copyWith => _$ResolvedMarketCopyWithImpl<ResolvedMarket>(this as ResolvedMarket, _$identity);

  /// Serializes this ResolvedMarket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResolvedMarket;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedMarket&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.coverage, _this.coverage) || other.coverage == _this.coverage)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.lending, _this.lending) || other.lending == _this.lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _this.purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _this.recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _this.loanTypes)&&const DeepCollectionEquality().equals(other.profileFields, _this.profileFields)&&const DeepCollectionEquality().equals(other.referenceRates, _this.referenceRates)&&(identical(other.livingCosts, _this.livingCosts) || other.livingCosts == _this.livingCosts)&&const DeepCollectionEquality().equals(other.sources, _this.sources)&&const DeepCollectionEquality().equals(other.pendingRules, _this.pendingRules)&&const DeepCollectionEquality().equals(other.requiredFields, _this.requiredFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResolvedMarket;
  return Object.hash(runtimeType,_this.id,_this.name,_this.coverage,_this.currency,_this.locale,_this.lending,const DeepCollectionEquality().hash(_this.purchaseCosts),const DeepCollectionEquality().hash(_this.recurringCosts),const DeepCollectionEquality().hash(_this.loanTypes),const DeepCollectionEquality().hash(_this.profileFields),const DeepCollectionEquality().hash(_this.referenceRates),_this.livingCosts,const DeepCollectionEquality().hash(_this.sources),const DeepCollectionEquality().hash(_this.pendingRules),const DeepCollectionEquality().hash(_this.requiredFields));
}

@override
String toString() {
  final _this = this as ResolvedMarket;
  return 'ResolvedMarket(id: ${_this.id}, name: ${_this.name}, coverage: ${_this.coverage}, currency: ${_this.currency}, locale: ${_this.locale}, lending: ${_this.lending}, purchaseCosts: ${_this.purchaseCosts}, recurringCosts: ${_this.recurringCosts}, loanTypes: ${_this.loanTypes}, profileFields: ${_this.profileFields}, referenceRates: ${_this.referenceRates}, livingCosts: ${_this.livingCosts}, sources: ${_this.sources}, pendingRules: ${_this.pendingRules}, requiredFields: ${_this.requiredFields})';
}


}

/// @nodoc
abstract mixin class $ResolvedMarketCopyWith<$Res>  {
  factory $ResolvedMarketCopyWith(ResolvedMarket value, $Res Function(ResolvedMarket) _then) = _$ResolvedMarketCopyWithImpl;
@useResult
$Res call({
@MarketIdJsonConverter() MarketId id, String name, Coverage coverage,@CurrencyJsonConverter() Currency currency,@LocaleTagJsonConverter() LocaleTag locale, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<ProfileFieldRequirement> profileFields, Map<String, ReferenceRate> referenceRates, LivingCosts? livingCosts, List<Source> sources, Map<String, PendingRule> pendingRules, Set<ProfileField> requiredFields
});


$LendingRulesCopyWith<$Res> get lending;$LivingCostsCopyWith<$Res>? get livingCosts;

}
/// @nodoc
class _$ResolvedMarketCopyWithImpl<$Res>
    implements $ResolvedMarketCopyWith<$Res> {
  _$ResolvedMarketCopyWithImpl(this._self, this._then);

  final ResolvedMarket _self;
  final $Res Function(ResolvedMarket) _then;

/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverage = null,Object? currency = null,Object? locale = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? profileFields = null,Object? referenceRates = null,Object? livingCosts = freezed,Object? sources = null,Object? pendingRules = null,Object? requiredFields = null,}) {
  return _then(ResolvedMarket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverage: null == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as Coverage,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleTag,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self.recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self.loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,profileFields: null == profileFields ? _self.profileFields : profileFields // ignore: cast_nullable_to_non_nullable
as List<ProfileFieldRequirement>,referenceRates: null == referenceRates ? _self.referenceRates : referenceRates // ignore: cast_nullable_to_non_nullable
as Map<String, ReferenceRate>,livingCosts: freezed == livingCosts ? _self.livingCosts : livingCosts // ignore: cast_nullable_to_non_nullable
as LivingCosts?,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,pendingRules: null == pendingRules ? _self.pendingRules : pendingRules // ignore: cast_nullable_to_non_nullable
as Map<String, PendingRule>,requiredFields: null == requiredFields ? _self.requiredFields : requiredFields // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}
/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LendingRulesCopyWith<$Res> get lending {
  
  return $LendingRulesCopyWith<$Res>(_self.lending, (value) {
    return _then(_self.copyWith(lending: value));
  });
}/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivingCostsCopyWith<$Res>? get livingCosts {
    if (_self.livingCosts == null) {
    return null;
  }

  return $LivingCostsCopyWith<$Res>(_self.livingCosts!, (value) {
    return _then(_self.copyWith(livingCosts: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedMarket].
extension ResolvedMarketPatterns on ResolvedMarket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedMarket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedMarket value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedMarket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedMarket value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage, @CurrencyJsonConverter()  Currency currency, @LocaleTagJsonConverter()  LocaleTag locale,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<ProfileFieldRequirement> profileFields,  Map<String, ReferenceRate> referenceRates,  LivingCosts? livingCosts,  List<Source> sources,  Map<String, PendingRule> pendingRules,  Set<ProfileField> requiredFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
return $default(_that.id,_that.name,_that.coverage,_that.currency,_that.locale,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.profileFields,_that.referenceRates,_that.livingCosts,_that.sources,_that.pendingRules,_that.requiredFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage, @CurrencyJsonConverter()  Currency currency, @LocaleTagJsonConverter()  LocaleTag locale,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<ProfileFieldRequirement> profileFields,  Map<String, ReferenceRate> referenceRates,  LivingCosts? livingCosts,  List<Source> sources,  Map<String, PendingRule> pendingRules,  Set<ProfileField> requiredFields)  $default,) {final _that = this;
switch (_that) {
case _ResolvedMarket():
return $default(_that.id,_that.name,_that.coverage,_that.currency,_that.locale,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.profileFields,_that.referenceRates,_that.livingCosts,_that.sources,_that.pendingRules,_that.requiredFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MarketIdJsonConverter()  MarketId id,  String name,  Coverage coverage, @CurrencyJsonConverter()  Currency currency, @LocaleTagJsonConverter()  LocaleTag locale,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<ProfileFieldRequirement> profileFields,  Map<String, ReferenceRate> referenceRates,  LivingCosts? livingCosts,  List<Source> sources,  Map<String, PendingRule> pendingRules,  Set<ProfileField> requiredFields)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
return $default(_that.id,_that.name,_that.coverage,_that.currency,_that.locale,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.profileFields,_that.referenceRates,_that.livingCosts,_that.sources,_that.pendingRules,_that.requiredFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResolvedMarket extends ResolvedMarket {
  const _ResolvedMarket({@MarketIdJsonConverter() required this.id, required this.name, this.coverage = Coverage.curated, @CurrencyJsonConverter() required this.currency, @LocaleTagJsonConverter() required this.locale, required this.lending, required  List<CostRule> purchaseCosts, required  List<CostRule> recurringCosts, required  List<LoanType> loanTypes,  List<ProfileFieldRequirement> profileFields = const [],  Map<String, ReferenceRate> referenceRates = const {}, this.livingCosts, required  List<Source> sources, required  Map<String, PendingRule> pendingRules, required  Set<ProfileField> requiredFields}): _purchaseCosts = purchaseCosts,_recurringCosts = recurringCosts,_loanTypes = loanTypes,_profileFields = profileFields,_referenceRates = referenceRates,_sources = sources,_pendingRules = pendingRules,_requiredFields = requiredFields,super._();
  factory _ResolvedMarket.fromJson(Map<String, dynamic> json) => _$ResolvedMarketFromJson(json);

@override@MarketIdJsonConverter() final  MarketId id;
@override final  String name;
@override@JsonKey() final  Coverage coverage;
@override@CurrencyJsonConverter() final  Currency currency;
@override@LocaleTagJsonConverter() final  LocaleTag locale;
@override final  LendingRules lending;
 final  List<CostRule> _purchaseCosts;
@override List<CostRule> get purchaseCosts {
  if (_purchaseCosts is EqualUnmodifiableListView) return _purchaseCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchaseCosts);
}

 final  List<CostRule> _recurringCosts;
@override List<CostRule> get recurringCosts {
  if (_recurringCosts is EqualUnmodifiableListView) return _recurringCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recurringCosts);
}

 final  List<LoanType> _loanTypes;
@override List<LoanType> get loanTypes {
  if (_loanTypes is EqualUnmodifiableListView) return _loanTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loanTypes);
}

 final  List<ProfileFieldRequirement> _profileFields;
@override@JsonKey() List<ProfileFieldRequirement> get profileFields {
  if (_profileFields is EqualUnmodifiableListView) return _profileFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileFields);
}

 final  Map<String, ReferenceRate> _referenceRates;
@override@JsonKey() Map<String, ReferenceRate> get referenceRates {
  if (_referenceRates is EqualUnmodifiableMapView) return _referenceRates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_referenceRates);
}

@override final  LivingCosts? livingCosts;
 final  List<Source> _sources;
@override List<Source> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

 final  Map<String, PendingRule> _pendingRules;
@override Map<String, PendingRule> get pendingRules {
  if (_pendingRules is EqualUnmodifiableMapView) return _pendingRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pendingRules);
}

 final  Set<ProfileField> _requiredFields;
@override Set<ProfileField> get requiredFields {
  if (_requiredFields is EqualUnmodifiableSetView) return _requiredFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_requiredFields);
}


/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedMarketCopyWith<_ResolvedMarket> get copyWith => __$ResolvedMarketCopyWithImpl<_ResolvedMarket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResolvedMarketToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedMarket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverage, coverage) || other.coverage == coverage)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.lending, lending) || other.lending == lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _loanTypes)&&const DeepCollectionEquality().equals(other.profileFields, _profileFields)&&const DeepCollectionEquality().equals(other.referenceRates, _referenceRates)&&(identical(other.livingCosts, livingCosts) || other.livingCosts == livingCosts)&&const DeepCollectionEquality().equals(other.sources, _sources)&&const DeepCollectionEquality().equals(other.pendingRules, _pendingRules)&&const DeepCollectionEquality().equals(other.requiredFields, _requiredFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,coverage,currency,locale,lending,const DeepCollectionEquality().hash(_purchaseCosts),const DeepCollectionEquality().hash(_recurringCosts),const DeepCollectionEquality().hash(_loanTypes),const DeepCollectionEquality().hash(_profileFields),const DeepCollectionEquality().hash(_referenceRates),livingCosts,const DeepCollectionEquality().hash(_sources),const DeepCollectionEquality().hash(_pendingRules),const DeepCollectionEquality().hash(_requiredFields));
}

@override
String toString() {
    return 'ResolvedMarket(id: $id, name: $name, coverage: $coverage, currency: $currency, locale: $locale, lending: $lending, purchaseCosts: $purchaseCosts, recurringCosts: $recurringCosts, loanTypes: $loanTypes, profileFields: $profileFields, referenceRates: $referenceRates, livingCosts: $livingCosts, sources: $sources, pendingRules: $pendingRules, requiredFields: $requiredFields)';
}


}

/// @nodoc
abstract mixin class _$ResolvedMarketCopyWith<$Res> implements $ResolvedMarketCopyWith<$Res> {
  factory _$ResolvedMarketCopyWith(_ResolvedMarket value, $Res Function(_ResolvedMarket) _then) = __$ResolvedMarketCopyWithImpl;
@override @useResult
$Res call({
@MarketIdJsonConverter() MarketId id, String name, Coverage coverage,@CurrencyJsonConverter() Currency currency,@LocaleTagJsonConverter() LocaleTag locale, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<ProfileFieldRequirement> profileFields, Map<String, ReferenceRate> referenceRates, LivingCosts? livingCosts, List<Source> sources, Map<String, PendingRule> pendingRules, Set<ProfileField> requiredFields
});


@override $LendingRulesCopyWith<$Res> get lending;@override $LivingCostsCopyWith<$Res>? get livingCosts;

}
/// @nodoc
class __$ResolvedMarketCopyWithImpl<$Res>
    implements _$ResolvedMarketCopyWith<$Res> {
  __$ResolvedMarketCopyWithImpl(this._self, this._then);

  final _ResolvedMarket _self;
  final $Res Function(_ResolvedMarket) _then;

/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverage = null,Object? currency = null,Object? locale = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? profileFields = null,Object? referenceRates = null,Object? livingCosts = freezed,Object? sources = null,Object? pendingRules = null,Object? requiredFields = null,}) {
  return _then(_ResolvedMarket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverage: null == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as Coverage,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleTag,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self._purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self._recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self._loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,profileFields: null == profileFields ? _self._profileFields : profileFields // ignore: cast_nullable_to_non_nullable
as List<ProfileFieldRequirement>,referenceRates: null == referenceRates ? _self._referenceRates : referenceRates // ignore: cast_nullable_to_non_nullable
as Map<String, ReferenceRate>,livingCosts: freezed == livingCosts ? _self.livingCosts : livingCosts // ignore: cast_nullable_to_non_nullable
as LivingCosts?,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,pendingRules: null == pendingRules ? _self._pendingRules : pendingRules // ignore: cast_nullable_to_non_nullable
as Map<String, PendingRule>,requiredFields: null == requiredFields ? _self._requiredFields : requiredFields // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}

/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LendingRulesCopyWith<$Res> get lending {
  
  return $LendingRulesCopyWith<$Res>(_self.lending, (value) {
    return _then(_self.copyWith(lending: value));
  });
}/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivingCostsCopyWith<$Res>? get livingCosts {
    if (_self.livingCosts == null) {
    return null;
  }

  return $LivingCostsCopyWith<$Res>(_self.livingCosts!, (value) {
    return _then(_self.copyWith(livingCosts: value));
  });
}
}


/// @nodoc
mixin _$PendingRule {

 RuleSection get section; Set<ProfileField> get missing;
/// Create a copy of PendingRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingRuleCopyWith<PendingRule> get copyWith => _$PendingRuleCopyWithImpl<PendingRule>(this as PendingRule, _$identity);

  /// Serializes this PendingRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PendingRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingRule&&(identical(other.section, _this.section) || other.section == _this.section)&&const DeepCollectionEquality().equals(other.missing, _this.missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PendingRule;
  return Object.hash(runtimeType,_this.section,const DeepCollectionEquality().hash(_this.missing));
}

@override
String toString() {
  final _this = this as PendingRule;
  return 'PendingRule(section: ${_this.section}, missing: ${_this.missing})';
}


}

/// @nodoc
abstract mixin class $PendingRuleCopyWith<$Res>  {
  factory $PendingRuleCopyWith(PendingRule value, $Res Function(PendingRule) _then) = _$PendingRuleCopyWithImpl;
@useResult
$Res call({
 RuleSection section, Set<ProfileField> missing
});




}
/// @nodoc
class _$PendingRuleCopyWithImpl<$Res>
    implements $PendingRuleCopyWith<$Res> {
  _$PendingRuleCopyWithImpl(this._self, this._then);

  final PendingRule _self;
  final $Res Function(PendingRule) _then;

/// Create a copy of PendingRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? section = null,Object? missing = null,}) {
  return _then(PendingRule(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RuleSection,missing: null == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingRule].
extension PendingRulePatterns on PendingRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingRule value)  $default,){
final _that = this;
switch (_that) {
case _PendingRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingRule value)?  $default,){
final _that = this;
switch (_that) {
case _PendingRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RuleSection section,  Set<ProfileField> missing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingRule() when $default != null:
return $default(_that.section,_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RuleSection section,  Set<ProfileField> missing)  $default,) {final _that = this;
switch (_that) {
case _PendingRule():
return $default(_that.section,_that.missing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RuleSection section,  Set<ProfileField> missing)?  $default,) {final _that = this;
switch (_that) {
case _PendingRule() when $default != null:
return $default(_that.section,_that.missing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingRule implements PendingRule {
  const _PendingRule({required this.section, required  Set<ProfileField> missing}): _missing = missing;
  factory _PendingRule.fromJson(Map<String, dynamic> json) => _$PendingRuleFromJson(json);

@override final  RuleSection section;
 final  Set<ProfileField> _missing;
@override Set<ProfileField> get missing {
  if (_missing is EqualUnmodifiableSetView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missing);
}


/// Create a copy of PendingRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingRuleCopyWith<_PendingRule> get copyWith => __$PendingRuleCopyWithImpl<_PendingRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingRule&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other.missing, _missing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,section,const DeepCollectionEquality().hash(_missing));
}

@override
String toString() {
    return 'PendingRule(section: $section, missing: $missing)';
}


}

/// @nodoc
abstract mixin class _$PendingRuleCopyWith<$Res> implements $PendingRuleCopyWith<$Res> {
  factory _$PendingRuleCopyWith(_PendingRule value, $Res Function(_PendingRule) _then) = __$PendingRuleCopyWithImpl;
@override @useResult
$Res call({
 RuleSection section, Set<ProfileField> missing
});




}
/// @nodoc
class __$PendingRuleCopyWithImpl<$Res>
    implements _$PendingRuleCopyWith<$Res> {
  __$PendingRuleCopyWithImpl(this._self, this._then);

  final _PendingRule _self;
  final $Res Function(_PendingRule) _then;

/// Create a copy of PendingRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? section = null,Object? missing = null,}) {
  return _then(_PendingRule(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RuleSection,missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}


}

// dart format on
