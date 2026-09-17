// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eligibility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EligibilityItem {

 String get ruleId; EligibilityStatus get status;
/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityItemCopyWith<EligibilityItem> get copyWith => _$EligibilityItemCopyWithImpl<EligibilityItem>(this as EligibilityItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EligibilityItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibilityItem&&(identical(other.ruleId, _this.ruleId) || other.ruleId == _this.ruleId)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as EligibilityItem;
  return Object.hash(runtimeType,_this.ruleId,_this.status);
}

@override
String toString() {
  final _this = this as EligibilityItem;
  return 'EligibilityItem(ruleId: ${_this.ruleId}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $EligibilityItemCopyWith<$Res>  {
  factory $EligibilityItemCopyWith(EligibilityItem value, $Res Function(EligibilityItem) _then) = _$EligibilityItemCopyWithImpl;
@useResult
$Res call({
 String ruleId, EligibilityStatus status
});




}
/// @nodoc
class _$EligibilityItemCopyWithImpl<$Res>
    implements $EligibilityItemCopyWith<$Res> {
  _$EligibilityItemCopyWithImpl(this._self, this._then);

  final EligibilityItem _self;
  final $Res Function(EligibilityItem) _then;

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ruleId = null,Object? status = null,}) {
  return _then(_self.copyWith(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EligibilityStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibilityItem].
extension EligibilityItemPatterns on EligibilityItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoanEligibility value)?  loan,TResult Function( TermEligibility value)?  term,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoanEligibility() when loan != null:
return loan(_that);case TermEligibility() when term != null:
return term(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoanEligibility value)  loan,required TResult Function( TermEligibility value)  term,}){
final _that = this;
switch (_that) {
case LoanEligibility():
return loan(_that);case TermEligibility():
return term(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoanEligibility value)?  loan,TResult? Function( TermEligibility value)?  term,}){
final _that = this;
switch (_that) {
case LoanEligibility() when loan != null:
return loan(_that);case TermEligibility() when term != null:
return term(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String ruleId,  EligibilityStatus status,  ConstraintKind kind,  Money maxLoan,  Money leastDownPayment)?  loan,TResult Function( String ruleId,  EligibilityStatus status,  TermLimit limit,  int allowedYears)?  term,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoanEligibility() when loan != null:
return loan(_that.ruleId,_that.status,_that.kind,_that.maxLoan,_that.leastDownPayment);case TermEligibility() when term != null:
return term(_that.ruleId,_that.status,_that.limit,_that.allowedYears);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String ruleId,  EligibilityStatus status,  ConstraintKind kind,  Money maxLoan,  Money leastDownPayment)  loan,required TResult Function( String ruleId,  EligibilityStatus status,  TermLimit limit,  int allowedYears)  term,}) {final _that = this;
switch (_that) {
case LoanEligibility():
return loan(_that.ruleId,_that.status,_that.kind,_that.maxLoan,_that.leastDownPayment);case TermEligibility():
return term(_that.ruleId,_that.status,_that.limit,_that.allowedYears);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String ruleId,  EligibilityStatus status,  ConstraintKind kind,  Money maxLoan,  Money leastDownPayment)?  loan,TResult? Function( String ruleId,  EligibilityStatus status,  TermLimit limit,  int allowedYears)?  term,}) {final _that = this;
switch (_that) {
case LoanEligibility() when loan != null:
return loan(_that.ruleId,_that.status,_that.kind,_that.maxLoan,_that.leastDownPayment);case TermEligibility() when term != null:
return term(_that.ruleId,_that.status,_that.limit,_that.allowedYears);case _:
  return null;

}
}

}

/// @nodoc


class LoanEligibility implements EligibilityItem {
  const LoanEligibility({required this.ruleId, required this.status, required this.kind, required this.maxLoan, required this.leastDownPayment});
  

@override final  String ruleId;
@override final  EligibilityStatus status;
 final  ConstraintKind kind;
 final  Money maxLoan;
 final  Money leastDownPayment;

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanEligibilityCopyWith<LoanEligibility> get copyWith => _$LoanEligibilityCopyWithImpl<LoanEligibility>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanEligibility&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.status, status) || other.status == status)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.maxLoan, maxLoan) || other.maxLoan == maxLoan)&&(identical(other.leastDownPayment, leastDownPayment) || other.leastDownPayment == leastDownPayment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ruleId,status,kind,maxLoan,leastDownPayment);
}

@override
String toString() {
    return 'EligibilityItem.loan(ruleId: $ruleId, status: $status, kind: $kind, maxLoan: $maxLoan, leastDownPayment: $leastDownPayment)';
}


}

/// @nodoc
abstract mixin class $LoanEligibilityCopyWith<$Res> implements $EligibilityItemCopyWith<$Res> {
  factory $LoanEligibilityCopyWith(LoanEligibility value, $Res Function(LoanEligibility) _then) = _$LoanEligibilityCopyWithImpl;
@override @useResult
$Res call({
 String ruleId, EligibilityStatus status, ConstraintKind kind, Money maxLoan, Money leastDownPayment
});


$MoneyCopyWith<$Res> get maxLoan;$MoneyCopyWith<$Res> get leastDownPayment;

}
/// @nodoc
class _$LoanEligibilityCopyWithImpl<$Res>
    implements $LoanEligibilityCopyWith<$Res> {
  _$LoanEligibilityCopyWithImpl(this._self, this._then);

  final LoanEligibility _self;
  final $Res Function(LoanEligibility) _then;

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? status = null,Object? kind = null,Object? maxLoan = null,Object? leastDownPayment = null,}) {
  return _then(LoanEligibility(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EligibilityStatus,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConstraintKind,maxLoan: null == maxLoan ? _self.maxLoan : maxLoan // ignore: cast_nullable_to_non_nullable
as Money,leastDownPayment: null == leastDownPayment ? _self.leastDownPayment : leastDownPayment // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get maxLoan {
  
  return $MoneyCopyWith<$Res>(_self.maxLoan, (value) {
    return _then(_self.copyWith(maxLoan: value));
  });
}/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get leastDownPayment {
  
  return $MoneyCopyWith<$Res>(_self.leastDownPayment, (value) {
    return _then(_self.copyWith(leastDownPayment: value));
  });
}
}

/// @nodoc


class TermEligibility implements EligibilityItem {
  const TermEligibility({required this.ruleId, required this.status, required this.limit, required this.allowedYears});
  

@override final  String ruleId;
@override final  EligibilityStatus status;
 final  TermLimit limit;
 final  int allowedYears;

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermEligibilityCopyWith<TermEligibility> get copyWith => _$TermEligibilityCopyWithImpl<TermEligibility>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TermEligibility&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.status, status) || other.status == status)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.allowedYears, allowedYears) || other.allowedYears == allowedYears));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ruleId,status,limit,allowedYears);
}

@override
String toString() {
    return 'EligibilityItem.term(ruleId: $ruleId, status: $status, limit: $limit, allowedYears: $allowedYears)';
}


}

/// @nodoc
abstract mixin class $TermEligibilityCopyWith<$Res> implements $EligibilityItemCopyWith<$Res> {
  factory $TermEligibilityCopyWith(TermEligibility value, $Res Function(TermEligibility) _then) = _$TermEligibilityCopyWithImpl;
@override @useResult
$Res call({
 String ruleId, EligibilityStatus status, TermLimit limit, int allowedYears
});




}
/// @nodoc
class _$TermEligibilityCopyWithImpl<$Res>
    implements $TermEligibilityCopyWith<$Res> {
  _$TermEligibilityCopyWithImpl(this._self, this._then);

  final TermEligibility _self;
  final $Res Function(TermEligibility) _then;

/// Create a copy of EligibilityItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? status = null,Object? limit = null,Object? allowedYears = null,}) {
  return _then(TermEligibility(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EligibilityStatus,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as TermLimit,allowedYears: null == allowedYears ? _self.allowedYears : allowedYears // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Eligibility {

 List<EligibilityItem> get items; Set<ProfileField> get missing;
/// Create a copy of Eligibility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityCopyWith<Eligibility> get copyWith => _$EligibilityCopyWithImpl<Eligibility>(this as Eligibility, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Eligibility;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Eligibility&&const DeepCollectionEquality().equals(other.items, _this.items)&&const DeepCollectionEquality().equals(other.missing, _this.missing));
}


@override
int get hashCode {
  final _this = this as Eligibility;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),const DeepCollectionEquality().hash(_this.missing));
}

@override
String toString() {
  final _this = this as Eligibility;
  return 'Eligibility(items: ${_this.items}, missing: ${_this.missing})';
}


}

/// @nodoc
abstract mixin class $EligibilityCopyWith<$Res>  {
  factory $EligibilityCopyWith(Eligibility value, $Res Function(Eligibility) _then) = _$EligibilityCopyWithImpl;
@useResult
$Res call({
 List<EligibilityItem> items, Set<ProfileField> missing
});




}
/// @nodoc
class _$EligibilityCopyWithImpl<$Res>
    implements $EligibilityCopyWith<$Res> {
  _$EligibilityCopyWithImpl(this._self, this._then);

  final Eligibility _self;
  final $Res Function(Eligibility) _then;

/// Create a copy of Eligibility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? missing = null,}) {
  return _then(Eligibility(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EligibilityItem>,missing: null == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}

}


/// Adds pattern-matching-related methods to [Eligibility].
extension EligibilityPatterns on Eligibility {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Eligibility value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Eligibility() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Eligibility value)  $default,){
final _that = this;
switch (_that) {
case _Eligibility():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Eligibility value)?  $default,){
final _that = this;
switch (_that) {
case _Eligibility() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EligibilityItem> items,  Set<ProfileField> missing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Eligibility() when $default != null:
return $default(_that.items,_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EligibilityItem> items,  Set<ProfileField> missing)  $default,) {final _that = this;
switch (_that) {
case _Eligibility():
return $default(_that.items,_that.missing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EligibilityItem> items,  Set<ProfileField> missing)?  $default,) {final _that = this;
switch (_that) {
case _Eligibility() when $default != null:
return $default(_that.items,_that.missing);case _:
  return null;

}
}

}

/// @nodoc


class _Eligibility extends Eligibility {
  const _Eligibility({required  List<EligibilityItem> items, required  Set<ProfileField> missing}): _items = items,_missing = missing,super._();
  

 final  List<EligibilityItem> _items;
@override List<EligibilityItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Set<ProfileField> _missing;
@override Set<ProfileField> get missing {
  if (_missing is EqualUnmodifiableSetView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missing);
}


/// Create a copy of Eligibility
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibilityCopyWith<_Eligibility> get copyWith => __$EligibilityCopyWithImpl<_Eligibility>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Eligibility&&const DeepCollectionEquality().equals(other.items, _items)&&const DeepCollectionEquality().equals(other.missing, _missing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_missing));
}

@override
String toString() {
    return 'Eligibility(items: $items, missing: $missing)';
}


}

/// @nodoc
abstract mixin class _$EligibilityCopyWith<$Res> implements $EligibilityCopyWith<$Res> {
  factory _$EligibilityCopyWith(_Eligibility value, $Res Function(_Eligibility) _then) = __$EligibilityCopyWithImpl;
@override @useResult
$Res call({
 List<EligibilityItem> items, Set<ProfileField> missing
});




}
/// @nodoc
class __$EligibilityCopyWithImpl<$Res>
    implements _$EligibilityCopyWith<$Res> {
  __$EligibilityCopyWithImpl(this._self, this._then);

  final _Eligibility _self;
  final $Res Function(_Eligibility) _then;

/// Create a copy of Eligibility
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? missing = null,}) {
  return _then(_Eligibility(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EligibilityItem>,missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}


}

// dart format on
