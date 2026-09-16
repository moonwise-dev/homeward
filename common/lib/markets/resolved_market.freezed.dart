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

 MarketId get id; String get name; Currency get currency; LendingRules get lending; List<CostRule> get purchaseCosts; List<CostRule> get recurringCosts; List<LoanType> get loanTypes; List<Source> get sources; Map<String, Set<ProfileField>> get pendingRules; Set<ProfileField> get requiredFields;
/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedMarketCopyWith<ResolvedMarket> get copyWith => _$ResolvedMarketCopyWithImpl<ResolvedMarket>(this as ResolvedMarket, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResolvedMarket;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedMarket&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.lending, _this.lending) || other.lending == _this.lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _this.purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _this.recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _this.loanTypes)&&const DeepCollectionEquality().equals(other.sources, _this.sources)&&const DeepCollectionEquality().equals(other.pendingRules, _this.pendingRules)&&const DeepCollectionEquality().equals(other.requiredFields, _this.requiredFields));
}


@override
int get hashCode {
  final _this = this as ResolvedMarket;
  return Object.hash(runtimeType,_this.id,_this.name,_this.currency,_this.lending,const DeepCollectionEquality().hash(_this.purchaseCosts),const DeepCollectionEquality().hash(_this.recurringCosts),const DeepCollectionEquality().hash(_this.loanTypes),const DeepCollectionEquality().hash(_this.sources),const DeepCollectionEquality().hash(_this.pendingRules),const DeepCollectionEquality().hash(_this.requiredFields));
}

@override
String toString() {
  final _this = this as ResolvedMarket;
  return 'ResolvedMarket(id: ${_this.id}, name: ${_this.name}, currency: ${_this.currency}, lending: ${_this.lending}, purchaseCosts: ${_this.purchaseCosts}, recurringCosts: ${_this.recurringCosts}, loanTypes: ${_this.loanTypes}, sources: ${_this.sources}, pendingRules: ${_this.pendingRules}, requiredFields: ${_this.requiredFields})';
}


}

/// @nodoc
abstract mixin class $ResolvedMarketCopyWith<$Res>  {
  factory $ResolvedMarketCopyWith(ResolvedMarket value, $Res Function(ResolvedMarket) _then) = _$ResolvedMarketCopyWithImpl;
@useResult
$Res call({
 MarketId id, String name, Currency currency, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<Source> sources, Map<String, Set<ProfileField>> pendingRules, Set<ProfileField> requiredFields
});


$LendingRulesCopyWith<$Res> get lending;

}
/// @nodoc
class _$ResolvedMarketCopyWithImpl<$Res>
    implements $ResolvedMarketCopyWith<$Res> {
  _$ResolvedMarketCopyWithImpl(this._self, this._then);

  final ResolvedMarket _self;
  final $Res Function(ResolvedMarket) _then;

/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? currency = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? sources = null,Object? pendingRules = null,Object? requiredFields = null,}) {
  return _then(ResolvedMarket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self.purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self.recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self.loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,pendingRules: null == pendingRules ? _self.pendingRules : pendingRules // ignore: cast_nullable_to_non_nullable
as Map<String, Set<ProfileField>>,requiredFields: null == requiredFields ? _self.requiredFields : requiredFields // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MarketId id,  String name,  Currency currency,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<Source> sources,  Map<String, Set<ProfileField>> pendingRules,  Set<ProfileField> requiredFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
return $default(_that.id,_that.name,_that.currency,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.sources,_that.pendingRules,_that.requiredFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MarketId id,  String name,  Currency currency,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<Source> sources,  Map<String, Set<ProfileField>> pendingRules,  Set<ProfileField> requiredFields)  $default,) {final _that = this;
switch (_that) {
case _ResolvedMarket():
return $default(_that.id,_that.name,_that.currency,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.sources,_that.pendingRules,_that.requiredFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MarketId id,  String name,  Currency currency,  LendingRules lending,  List<CostRule> purchaseCosts,  List<CostRule> recurringCosts,  List<LoanType> loanTypes,  List<Source> sources,  Map<String, Set<ProfileField>> pendingRules,  Set<ProfileField> requiredFields)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedMarket() when $default != null:
return $default(_that.id,_that.name,_that.currency,_that.lending,_that.purchaseCosts,_that.recurringCosts,_that.loanTypes,_that.sources,_that.pendingRules,_that.requiredFields);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedMarket implements ResolvedMarket {
  const _ResolvedMarket({required this.id, required this.name, required this.currency, required this.lending, required  List<CostRule> purchaseCosts, required  List<CostRule> recurringCosts, required  List<LoanType> loanTypes, required  List<Source> sources, required  Map<String, Set<ProfileField>> pendingRules, required  Set<ProfileField> requiredFields}): _purchaseCosts = purchaseCosts,_recurringCosts = recurringCosts,_loanTypes = loanTypes,_sources = sources,_pendingRules = pendingRules,_requiredFields = requiredFields;
  

@override final  MarketId id;
@override final  String name;
@override final  Currency currency;
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

 final  List<Source> _sources;
@override List<Source> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

 final  Map<String, Set<ProfileField>> _pendingRules;
@override Map<String, Set<ProfileField>> get pendingRules {
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
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedMarket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.lending, lending) || other.lending == lending)&&const DeepCollectionEquality().equals(other.purchaseCosts, _purchaseCosts)&&const DeepCollectionEquality().equals(other.recurringCosts, _recurringCosts)&&const DeepCollectionEquality().equals(other.loanTypes, _loanTypes)&&const DeepCollectionEquality().equals(other.sources, _sources)&&const DeepCollectionEquality().equals(other.pendingRules, _pendingRules)&&const DeepCollectionEquality().equals(other.requiredFields, _requiredFields));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,currency,lending,const DeepCollectionEquality().hash(_purchaseCosts),const DeepCollectionEquality().hash(_recurringCosts),const DeepCollectionEquality().hash(_loanTypes),const DeepCollectionEquality().hash(_sources),const DeepCollectionEquality().hash(_pendingRules),const DeepCollectionEquality().hash(_requiredFields));
}

@override
String toString() {
    return 'ResolvedMarket(id: $id, name: $name, currency: $currency, lending: $lending, purchaseCosts: $purchaseCosts, recurringCosts: $recurringCosts, loanTypes: $loanTypes, sources: $sources, pendingRules: $pendingRules, requiredFields: $requiredFields)';
}


}

/// @nodoc
abstract mixin class _$ResolvedMarketCopyWith<$Res> implements $ResolvedMarketCopyWith<$Res> {
  factory _$ResolvedMarketCopyWith(_ResolvedMarket value, $Res Function(_ResolvedMarket) _then) = __$ResolvedMarketCopyWithImpl;
@override @useResult
$Res call({
 MarketId id, String name, Currency currency, LendingRules lending, List<CostRule> purchaseCosts, List<CostRule> recurringCosts, List<LoanType> loanTypes, List<Source> sources, Map<String, Set<ProfileField>> pendingRules, Set<ProfileField> requiredFields
});


@override $LendingRulesCopyWith<$Res> get lending;

}
/// @nodoc
class __$ResolvedMarketCopyWithImpl<$Res>
    implements _$ResolvedMarketCopyWith<$Res> {
  __$ResolvedMarketCopyWithImpl(this._self, this._then);

  final _ResolvedMarket _self;
  final $Res Function(_ResolvedMarket) _then;

/// Create a copy of ResolvedMarket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? currency = null,Object? lending = null,Object? purchaseCosts = null,Object? recurringCosts = null,Object? loanTypes = null,Object? sources = null,Object? pendingRules = null,Object? requiredFields = null,}) {
  return _then(_ResolvedMarket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MarketId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,lending: null == lending ? _self.lending : lending // ignore: cast_nullable_to_non_nullable
as LendingRules,purchaseCosts: null == purchaseCosts ? _self._purchaseCosts : purchaseCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,recurringCosts: null == recurringCosts ? _self._recurringCosts : recurringCosts // ignore: cast_nullable_to_non_nullable
as List<CostRule>,loanTypes: null == loanTypes ? _self._loanTypes : loanTypes // ignore: cast_nullable_to_non_nullable
as List<LoanType>,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<Source>,pendingRules: null == pendingRules ? _self._pendingRules : pendingRules // ignore: cast_nullable_to_non_nullable
as Map<String, Set<ProfileField>>,requiredFields: null == requiredFields ? _self._requiredFields : requiredFields // ignore: cast_nullable_to_non_nullable
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
}
}

// dart format on
