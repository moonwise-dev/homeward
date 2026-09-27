// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_costs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseCosts {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseCosts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PurchaseCosts()';
}


}

/// @nodoc
class $PurchaseCostsCopyWith<$Res>  {
$PurchaseCostsCopyWith(PurchaseCosts _, $Res Function(PurchaseCosts) __);
}


/// Adds pattern-matching-related methods to [PurchaseCosts].
extension PurchaseCostsPatterns on PurchaseCosts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IncompletePurchaseCosts value)?  incomplete,TResult Function( EstimatedPurchaseCosts value)?  estimated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IncompletePurchaseCosts() when incomplete != null:
return incomplete(_that);case EstimatedPurchaseCosts() when estimated != null:
return estimated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IncompletePurchaseCosts value)  incomplete,required TResult Function( EstimatedPurchaseCosts value)  estimated,}){
final _that = this;
switch (_that) {
case IncompletePurchaseCosts():
return incomplete(_that);case EstimatedPurchaseCosts():
return estimated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IncompletePurchaseCosts value)?  incomplete,TResult? Function( EstimatedPurchaseCosts value)?  estimated,}){
final _that = this;
switch (_that) {
case IncompletePurchaseCosts() when incomplete != null:
return incomplete(_that);case EstimatedPurchaseCosts() when estimated != null:
return estimated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Set<ProfileField> missing)?  incomplete,TResult Function( List<PurchaseCharge> charges,  Money total,  Money refundable,  Money cashNeeded)?  estimated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IncompletePurchaseCosts() when incomplete != null:
return incomplete(_that.missing);case EstimatedPurchaseCosts() when estimated != null:
return estimated(_that.charges,_that.total,_that.refundable,_that.cashNeeded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Set<ProfileField> missing)  incomplete,required TResult Function( List<PurchaseCharge> charges,  Money total,  Money refundable,  Money cashNeeded)  estimated,}) {final _that = this;
switch (_that) {
case IncompletePurchaseCosts():
return incomplete(_that.missing);case EstimatedPurchaseCosts():
return estimated(_that.charges,_that.total,_that.refundable,_that.cashNeeded);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Set<ProfileField> missing)?  incomplete,TResult? Function( List<PurchaseCharge> charges,  Money total,  Money refundable,  Money cashNeeded)?  estimated,}) {final _that = this;
switch (_that) {
case IncompletePurchaseCosts() when incomplete != null:
return incomplete(_that.missing);case EstimatedPurchaseCosts() when estimated != null:
return estimated(_that.charges,_that.total,_that.refundable,_that.cashNeeded);case _:
  return null;

}
}

}

/// @nodoc


class IncompletePurchaseCosts implements PurchaseCosts {
  const IncompletePurchaseCosts({required  Set<ProfileField> missing}): _missing = missing;
  

 final  Set<ProfileField> _missing;
 Set<ProfileField> get missing {
  if (_missing is EqualUnmodifiableSetView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missing);
}


/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncompletePurchaseCostsCopyWith<IncompletePurchaseCosts> get copyWith => _$IncompletePurchaseCostsCopyWithImpl<IncompletePurchaseCosts>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IncompletePurchaseCosts&&const DeepCollectionEquality().equals(other.missing, _missing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_missing));
}

@override
String toString() {
    return 'PurchaseCosts.incomplete(missing: $missing)';
}


}

/// @nodoc
abstract mixin class $IncompletePurchaseCostsCopyWith<$Res> implements $PurchaseCostsCopyWith<$Res> {
  factory $IncompletePurchaseCostsCopyWith(IncompletePurchaseCosts value, $Res Function(IncompletePurchaseCosts) _then) = _$IncompletePurchaseCostsCopyWithImpl;
@useResult
$Res call({
 Set<ProfileField> missing
});




}
/// @nodoc
class _$IncompletePurchaseCostsCopyWithImpl<$Res>
    implements $IncompletePurchaseCostsCopyWith<$Res> {
  _$IncompletePurchaseCostsCopyWithImpl(this._self, this._then);

  final IncompletePurchaseCosts _self;
  final $Res Function(IncompletePurchaseCosts) _then;

/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? missing = null,}) {
  return _then(IncompletePurchaseCosts(
missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}


}

/// @nodoc


class EstimatedPurchaseCosts implements PurchaseCosts {
  const EstimatedPurchaseCosts({required  List<PurchaseCharge> charges, required this.total, required this.refundable, required this.cashNeeded}): _charges = charges;
  

 final  List<PurchaseCharge> _charges;
 List<PurchaseCharge> get charges {
  if (_charges is EqualUnmodifiableListView) return _charges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_charges);
}

 final  Money total;
 final  Money refundable;
 final  Money cashNeeded;

/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EstimatedPurchaseCostsCopyWith<EstimatedPurchaseCosts> get copyWith => _$EstimatedPurchaseCostsCopyWithImpl<EstimatedPurchaseCosts>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EstimatedPurchaseCosts&&const DeepCollectionEquality().equals(other.charges, _charges)&&(identical(other.total, total) || other.total == total)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_charges),total,refundable,cashNeeded);
}

@override
String toString() {
    return 'PurchaseCosts.estimated(charges: $charges, total: $total, refundable: $refundable, cashNeeded: $cashNeeded)';
}


}

/// @nodoc
abstract mixin class $EstimatedPurchaseCostsCopyWith<$Res> implements $PurchaseCostsCopyWith<$Res> {
  factory $EstimatedPurchaseCostsCopyWith(EstimatedPurchaseCosts value, $Res Function(EstimatedPurchaseCosts) _then) = _$EstimatedPurchaseCostsCopyWithImpl;
@useResult
$Res call({
 List<PurchaseCharge> charges, Money total, Money refundable, Money cashNeeded
});


$MoneyCopyWith<$Res> get total;$MoneyCopyWith<$Res> get refundable;$MoneyCopyWith<$Res> get cashNeeded;

}
/// @nodoc
class _$EstimatedPurchaseCostsCopyWithImpl<$Res>
    implements $EstimatedPurchaseCostsCopyWith<$Res> {
  _$EstimatedPurchaseCostsCopyWithImpl(this._self, this._then);

  final EstimatedPurchaseCosts _self;
  final $Res Function(EstimatedPurchaseCosts) _then;

/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? charges = null,Object? total = null,Object? refundable = null,Object? cashNeeded = null,}) {
  return _then(EstimatedPurchaseCosts(
charges: null == charges ? _self._charges : charges // ignore: cast_nullable_to_non_nullable
as List<PurchaseCharge>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as Money,cashNeeded: null == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get refundable {
  
  return $MoneyCopyWith<$Res>(_self.refundable, (value) {
    return _then(_self.copyWith(refundable: value));
  });
}/// Create a copy of PurchaseCosts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get cashNeeded {
  
  return $MoneyCopyWith<$Res>(_self.cashNeeded, (value) {
    return _then(_self.copyWith(cashNeeded: value));
  });
}
}

/// @nodoc
mixin _$PurchaseCharge {

 String get ruleId; String get label; String? get localTerm; Money get amount; Money? get refundable; RefundRule? get refund; String get sourceId;
/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseChargeCopyWith<PurchaseCharge> get copyWith => _$PurchaseChargeCopyWithImpl<PurchaseCharge>(this as PurchaseCharge, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PurchaseCharge;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseCharge&&(identical(other.ruleId, _this.ruleId) || other.ruleId == _this.ruleId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.localTerm, _this.localTerm) || other.localTerm == _this.localTerm)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.refundable, _this.refundable) || other.refundable == _this.refundable)&&(identical(other.refund, _this.refund) || other.refund == _this.refund)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}


@override
int get hashCode {
  final _this = this as PurchaseCharge;
  return Object.hash(runtimeType,_this.ruleId,_this.label,_this.localTerm,_this.amount,_this.refundable,_this.refund,_this.sourceId);
}

@override
String toString() {
  final _this = this as PurchaseCharge;
  return 'PurchaseCharge(ruleId: ${_this.ruleId}, label: ${_this.label}, localTerm: ${_this.localTerm}, amount: ${_this.amount}, refundable: ${_this.refundable}, refund: ${_this.refund}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $PurchaseChargeCopyWith<$Res>  {
  factory $PurchaseChargeCopyWith(PurchaseCharge value, $Res Function(PurchaseCharge) _then) = _$PurchaseChargeCopyWithImpl;
@useResult
$Res call({
 String ruleId, String label, String? localTerm, Money amount, Money? refundable, RefundRule? refund, String sourceId
});


$MoneyCopyWith<$Res> get amount;$MoneyCopyWith<$Res>? get refundable;$RefundRuleCopyWith<$Res>? get refund;

}
/// @nodoc
class _$PurchaseChargeCopyWithImpl<$Res>
    implements $PurchaseChargeCopyWith<$Res> {
  _$PurchaseChargeCopyWithImpl(this._self, this._then);

  final PurchaseCharge _self;
  final $Res Function(PurchaseCharge) _then;

/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ruleId = null,Object? label = null,Object? localTerm = freezed,Object? amount = null,Object? refundable = freezed,Object? refund = freezed,Object? sourceId = null,}) {
  return _then(PurchaseCharge(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,refundable: freezed == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as Money?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get refundable {
    if (_self.refundable == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.refundable!, (value) {
    return _then(_self.copyWith(refundable: value));
  });
}/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundRuleCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $RefundRuleCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurchaseCharge].
extension PurchaseChargePatterns on PurchaseCharge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseCharge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseCharge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseCharge value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseCharge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseCharge value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseCharge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ruleId,  String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseCharge() when $default != null:
return $default(_that.ruleId,_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ruleId,  String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _PurchaseCharge():
return $default(_that.ruleId,_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ruleId,  String label,  String? localTerm,  Money amount,  Money? refundable,  RefundRule? refund,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseCharge() when $default != null:
return $default(_that.ruleId,_that.label,_that.localTerm,_that.amount,_that.refundable,_that.refund,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseCharge implements PurchaseCharge {
  const _PurchaseCharge({required this.ruleId, required this.label, this.localTerm, required this.amount, this.refundable, this.refund, required this.sourceId});
  

@override final  String ruleId;
@override final  String label;
@override final  String? localTerm;
@override final  Money amount;
@override final  Money? refundable;
@override final  RefundRule? refund;
@override final  String sourceId;

/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseChargeCopyWith<_PurchaseCharge> get copyWith => __$PurchaseChargeCopyWithImpl<_PurchaseCharge>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCharge&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.label, label) || other.label == label)&&(identical(other.localTerm, localTerm) || other.localTerm == localTerm)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.refund, refund) || other.refund == refund)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ruleId,label,localTerm,amount,refundable,refund,sourceId);
}

@override
String toString() {
    return 'PurchaseCharge(ruleId: $ruleId, label: $label, localTerm: $localTerm, amount: $amount, refundable: $refundable, refund: $refund, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$PurchaseChargeCopyWith<$Res> implements $PurchaseChargeCopyWith<$Res> {
  factory _$PurchaseChargeCopyWith(_PurchaseCharge value, $Res Function(_PurchaseCharge) _then) = __$PurchaseChargeCopyWithImpl;
@override @useResult
$Res call({
 String ruleId, String label, String? localTerm, Money amount, Money? refundable, RefundRule? refund, String sourceId
});


@override $MoneyCopyWith<$Res> get amount;@override $MoneyCopyWith<$Res>? get refundable;@override $RefundRuleCopyWith<$Res>? get refund;

}
/// @nodoc
class __$PurchaseChargeCopyWithImpl<$Res>
    implements _$PurchaseChargeCopyWith<$Res> {
  __$PurchaseChargeCopyWithImpl(this._self, this._then);

  final _PurchaseCharge _self;
  final $Res Function(_PurchaseCharge) _then;

/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? label = null,Object? localTerm = freezed,Object? amount = null,Object? refundable = freezed,Object? refund = freezed,Object? sourceId = null,}) {
  return _then(_PurchaseCharge(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,localTerm: freezed == localTerm ? _self.localTerm : localTerm // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,refundable: freezed == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as Money?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as RefundRule?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get refundable {
    if (_self.refundable == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.refundable!, (value) {
    return _then(_self.copyWith(refundable: value));
  });
}/// Create a copy of PurchaseCharge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundRuleCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $RefundRuleCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}
}

// dart format on
