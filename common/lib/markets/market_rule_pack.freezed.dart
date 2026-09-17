// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_rule_pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketRulePack {

@MarketIdJsonConverter() MarketId get id;@MarketIdJsonConverter() MarketId? get parent; String get name;@CurrencyJsonConverter() Currency? get currency;@LocaleTagJsonConverter() LocaleTag? get locale; int get version;@CalendarDateJsonConverter() CalendarDate get effectiveFrom;@CalendarDateJsonConverter() CalendarDate? get reviewedAt; String? get reviewedBy; List<ProfileFieldRequirement> get profileFields; LendingRules get lending; List<CostRule> get purchaseCosts; List<CostRule> get recurringCosts; List<LoanType> get loanTypes; List<String> get removedRuleIds; List<Source> get sources;
/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketRulePackCopyWith<MarketRulePack> get copyWith => _$MarketRulePackCopyWithImpl<MarketRulePack>(this as MarketRulePack, _$identity);

  /// Serializes this MarketRulePack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketRulePack;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketRulePack&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.parent, _this.parent) || other.parent == _this.parent)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.effectiveFrom, _this.effectiveFrom) || other.effectiveFrom == _this.effectiveFrom)&&(identical(other.reviewedAt, _this.reviewedAt) || other.reviewedAt == _this.reviewedAt)&&(identical(other.reviewedBy, _this.reviewedBy) || other.reviewedBy == _this.reviewedBy)&&const DeepCollectionEquality().equals(other.profileFields, _this.profileFields)&&(identical(other.lending, _this.lending) || other.lending == _this.lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _this.purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _this.recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _this.loanTypes)&&const DeepCollectionEquality().equals(other.removedRuleIds, _this.removedRuleIds)&&const DeepCollectionEquality().equals(other.sources, _this.sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketRulePack;
  return Object.hash(runtimeType,_this.id,_this.parent,_this.name,_this.currency,_this.locale,_this.version,_this.effectiveFrom,_this.reviewedAt,_this.reviewedBy,const DeepCollectionEquality().hash(_this.profileFields),_this.lending,const DeepCollectionEquality().hash(_this.purchaseCosts),const DeepCollectionEquality().hash(_this.recurringCosts),const DeepCollectionEquality().hash(_this.loanTypes),const DeepCollectionEquality().hash(_this.removedRuleIds),const DeepCollectionEquality().hash(_this.sources));
}

@override
String toString() {
  final _this = this as MarketRulePack;
  return 'MarketRulePack(id: ${_this.id}, parent: ${_this.parent}, name: ${_this.name}, currency: ${_this.currency}, locale: ${_this.locale}, version: ${_this.version}, effectiveFrom: ${_this.effectiveFrom}, reviewedAt: ${_this.reviewedAt}, reviewedBy: ${_this.reviewedBy}, profileFields: ${_this.profileFields}, lending: ${_this.lending}, purchaseCosts: ${_this.purchaseCosts}, recurringCosts: ${_this.recurringCosts}, loanTypes: ${_this.loanTypes}, removedRuleIds: ${_this.removedRuleIds}, sources: ${_this.sources})';
}


}

/// @nodoc
abstract mixin class $MarketRulePackCopyWith<$Res>  {
  factory $MarketRulePackCopyWith(MarketRulePack value, $Res Function(MarketRulePack) _then) = _$MarketRulePackCopyWithImpl;
@useResult
$Res call({
@MarketIdJsonConverter() MarketId id,@MarketIdJsonConverter() MarketId? parent, String name,@CurrencyJsonConverter() Currency? currency,@LocaleTagJsonConverter() LocaleTag? locale, int version,@CalendarDateJsonConverter() CalendarDate effectiveFrom,@CalendarDateJsonConverter() CalendarDate? reviewedAt, String? reviewedBy, List<ProfileFieldRequirement> profileFields, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<String> removedRuleIds, List<Source> sources
});


$LendingRulesCopyWith<$Res> get lending;

}
/// @nodoc
class _$MarketRulePackCopyWithImpl<$Res>
    implements $MarketRulePackCopyWith<$Res> {
  _$MarketRulePackCopyWithImpl(this._self, this._then);

  final MarketRulePack _self;
  final $Res Function(MarketRulePack) _then;

/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parent = freezed,Object? name = null,Object? currency = freezed,Object? locale = freezed,Object? version = null,Object? effectiveFrom = null,Object? reviewedAt = freezed,Object? reviewedBy = freezed,Object? profileFields = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? removedRuleIds = null,Object? sources = null,}) {
  return _then(MarketRulePack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as MarketId?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleTag?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as CalendarDate,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as CalendarDate?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,profileFields: null == profileFields ? _self.profileFields : profileFields // ignore: cast_nullable_to_non_nullable
as List<ProfileFieldRequirement>,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self.recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self.loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,removedRuleIds: null == removedRuleIds ? _self.removedRuleIds : removedRuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,
  ));
}
/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LendingRulesCopyWith<$Res> get lending {
  
  return $LendingRulesCopyWith<$Res>(_self.lending, (value) {
    return _then(_self.copyWith(lending: value));
  });
}
}


/// Adds pattern-matching-related methods to [MarketRulePack].
extension MarketRulePackPatterns on MarketRulePack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketRulePack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketRulePack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketRulePack value)  $default,){
final _that = this;
switch (_that) {
case _MarketRulePack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketRulePack value)?  $default,){
final _that = this;
switch (_that) {
case _MarketRulePack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id, @MarketIdJsonConverter()  MarketId? parent,  String name, @CurrencyJsonConverter()  Currency? currency, @LocaleTagJsonConverter()  LocaleTag? locale,  int version, @CalendarDateJsonConverter()  CalendarDate effectiveFrom, @CalendarDateJsonConverter()  CalendarDate? reviewedAt,  String? reviewedBy,  List<ProfileFieldRequirement> profileFields,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<String> removedRuleIds,  List<Source> sources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketRulePack() when $default != null:
return $default(_that.id,_that.parent,_that.name,_that.currency,_that.locale,_that.version,_that.effectiveFrom,_that.reviewedAt,_that.reviewedBy,_that.profileFields,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.removedRuleIds,_that.sources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MarketIdJsonConverter()  MarketId id, @MarketIdJsonConverter()  MarketId? parent,  String name, @CurrencyJsonConverter()  Currency? currency, @LocaleTagJsonConverter()  LocaleTag? locale,  int version, @CalendarDateJsonConverter()  CalendarDate effectiveFrom, @CalendarDateJsonConverter()  CalendarDate? reviewedAt,  String? reviewedBy,  List<ProfileFieldRequirement> profileFields,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<String> removedRuleIds,  List<Source> sources)  $default,) {final _that = this;
switch (_that) {
case _MarketRulePack():
return $default(_that.id,_that.parent,_that.name,_that.currency,_that.locale,_that.version,_that.effectiveFrom,_that.reviewedAt,_that.reviewedBy,_that.profileFields,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.removedRuleIds,_that.sources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MarketIdJsonConverter()  MarketId id, @MarketIdJsonConverter()  MarketId? parent,  String name, @CurrencyJsonConverter()  Currency? currency, @LocaleTagJsonConverter()  LocaleTag? locale,  int version, @CalendarDateJsonConverter()  CalendarDate effectiveFrom, @CalendarDateJsonConverter()  CalendarDate? reviewedAt,  String? reviewedBy,  List<ProfileFieldRequirement> profileFields,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<String> removedRuleIds,  List<Source> sources)?  $default,) {final _that = this;
switch (_that) {
case _MarketRulePack() when $default != null:
return $default(_that.id,_that.parent,_that.name,_that.currency,_that.locale,_that.version,_that.effectiveFrom,_that.reviewedAt,_that.reviewedBy,_that.profileFields,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.removedRuleIds,_that.sources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketRulePack extends MarketRulePack {
  const _MarketRulePack({@MarketIdJsonConverter() required this.id, @MarketIdJsonConverter() this.parent, required this.name, @CurrencyJsonConverter() this.currency, @LocaleTagJsonConverter() this.locale, required this.version, @CalendarDateJsonConverter() required this.effectiveFrom, @CalendarDateJsonConverter() this.reviewedAt, this.reviewedBy,  List<ProfileFieldRequirement> profileFields = const [], this.lending = const LendingRules(),  List<CostRule> purchaseCosts = const [],  List<CostRule> recurringCosts = const [],  List<LoanType> loanTypes = const [],  List<String> removedRuleIds = const [],  List<Source> sources = const []}): _profileFields = profileFields,_purchaseCosts = purchaseCosts,_recurringCosts = recurringCosts,_loanTypes = loanTypes,_removedRuleIds = removedRuleIds,_sources = sources,super._();
  factory _MarketRulePack.fromJson(Map<String, dynamic> json) => _$MarketRulePackFromJson(json);

@override@MarketIdJsonConverter() final  MarketId id;
@override@MarketIdJsonConverter() final  MarketId? parent;
@override final  String name;
@override@CurrencyJsonConverter() final  Currency? currency;
@override@LocaleTagJsonConverter() final  LocaleTag? locale;
@override final  int version;
@override@CalendarDateJsonConverter() final  CalendarDate effectiveFrom;
@override@CalendarDateJsonConverter() final  CalendarDate? reviewedAt;
@override final  String? reviewedBy;
 final  List<ProfileFieldRequirement> _profileFields;
@override@JsonKey() List<ProfileFieldRequirement> get profileFields {
  if (_profileFields is EqualUnmodifiableListView) return _profileFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileFields);
}

@override@JsonKey() final  LendingRules lending;
 final  List<CostRule> _purchaseCosts;
@override@JsonKey() List<CostRule> get purchaseCosts {
  if (_purchaseCosts is EqualUnmodifiableListView) return _purchaseCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchaseCosts);
}

 final  List<CostRule> _recurringCosts;
@override@JsonKey() List<CostRule> get recurringCosts {
  if (_recurringCosts is EqualUnmodifiableListView) return _recurringCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recurringCosts);
}

 final  List<LoanType> _loanTypes;
@override@JsonKey() List<LoanType> get loanTypes {
  if (_loanTypes is EqualUnmodifiableListView) return _loanTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loanTypes);
}

 final  List<String> _removedRuleIds;
@override@JsonKey() List<String> get removedRuleIds {
  if (_removedRuleIds is EqualUnmodifiableListView) return _removedRuleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_removedRuleIds);
}

 final  List<Source> _sources;
@override@JsonKey() List<Source> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}


/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketRulePackCopyWith<_MarketRulePack> get copyWith => __$MarketRulePackCopyWithImpl<_MarketRulePack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketRulePackToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketRulePack&&(identical(other.id, id) || other.id == id)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.version, version) || other.version == version)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&const DeepCollectionEquality().equals(other.profileFields, _profileFields)&&(identical(other.lending, lending) || other.lending == lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _loanTypes)&&const DeepCollectionEquality().equals(other.removedRuleIds, _removedRuleIds)&&const DeepCollectionEquality().equals(other.sources, _sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,parent,name,currency,locale,version,effectiveFrom,reviewedAt,reviewedBy,const DeepCollectionEquality().hash(_profileFields),lending,const DeepCollectionEquality().hash(_purchaseCosts),const DeepCollectionEquality().hash(_recurringCosts),const DeepCollectionEquality().hash(_loanTypes),const DeepCollectionEquality().hash(_removedRuleIds),const DeepCollectionEquality().hash(_sources));
}

@override
String toString() {
    return 'MarketRulePack(id: $id, parent: $parent, name: $name, currency: $currency, locale: $locale, version: $version, effectiveFrom: $effectiveFrom, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, profileFields: $profileFields, lending: $lending, purchaseCosts: $purchaseCosts, recurringCosts: $recurringCosts, loanTypes: $loanTypes, removedRuleIds: $removedRuleIds, sources: $sources)';
}


}

/// @nodoc
abstract mixin class _$MarketRulePackCopyWith<$Res> implements $MarketRulePackCopyWith<$Res> {
  factory _$MarketRulePackCopyWith(_MarketRulePack value, $Res Function(_MarketRulePack) _then) = __$MarketRulePackCopyWithImpl;
@override @useResult
$Res call({
@MarketIdJsonConverter() MarketId id,@MarketIdJsonConverter() MarketId? parent, String name,@CurrencyJsonConverter() Currency? currency,@LocaleTagJsonConverter() LocaleTag? locale, int version,@CalendarDateJsonConverter() CalendarDate effectiveFrom,@CalendarDateJsonConverter() CalendarDate? reviewedAt, String? reviewedBy, List<ProfileFieldRequirement> profileFields, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<String> removedRuleIds, List<Source> sources
});


@override $LendingRulesCopyWith<$Res> get lending;

}
/// @nodoc
class __$MarketRulePackCopyWithImpl<$Res>
    implements _$MarketRulePackCopyWith<$Res> {
  __$MarketRulePackCopyWithImpl(this._self, this._then);

  final _MarketRulePack _self;
  final $Res Function(_MarketRulePack) _then;

/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parent = freezed,Object? name = null,Object? currency = freezed,Object? locale = freezed,Object? version = null,Object? effectiveFrom = null,Object? reviewedAt = freezed,Object? reviewedBy = freezed,Object? profileFields = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? removedRuleIds = null,Object? sources = null,}) {
  return _then(_MarketRulePack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as MarketId?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleTag?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as CalendarDate,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as CalendarDate?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,profileFields: null == profileFields ? _self._profileFields : profileFields // ignore: cast_nullable_to_non_nullable
as List<ProfileFieldRequirement>,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self._purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self._recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self._loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,removedRuleIds: null == removedRuleIds ? _self._removedRuleIds : removedRuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,
  ));
}

/// Create a copy of MarketRulePack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LendingRulesCopyWith<$Res> get lending {
  
  return $LendingRulesCopyWith<$Res>(_self.lending, (value) {
    return _then(_self.copyWith(lending: value));
  });
}
}

// dart format on
