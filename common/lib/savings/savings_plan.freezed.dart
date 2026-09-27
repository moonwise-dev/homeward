// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavingsPlanSlice {

 String get marketName; bool get sample; String? get homeId; String? get homeName; Money get price; Money get downPayment; bool get downPaymentChosen; Money get cashNeeded; bool get costsIncluded; Money get saved; Money get monthlySaving; Money get toSave; int get months;@CalendarDateJsonConverter() CalendarDate get from;@CalendarDateJsonConverter() CalendarDate get reachedIn;
/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsPlanSliceCopyWith<SavingsPlanSlice> get copyWith => _$SavingsPlanSliceCopyWithImpl<SavingsPlanSlice>(this as SavingsPlanSlice, _$identity);

  /// Serializes this SavingsPlanSlice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SavingsPlanSlice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsPlanSlice&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName)&&(identical(other.sample, _this.sample) || other.sample == _this.sample)&&(identical(other.homeId, _this.homeId) || other.homeId == _this.homeId)&&(identical(other.homeName, _this.homeName) || other.homeName == _this.homeName)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.downPayment, _this.downPayment) || other.downPayment == _this.downPayment)&&(identical(other.downPaymentChosen, _this.downPaymentChosen) || other.downPaymentChosen == _this.downPaymentChosen)&&(identical(other.cashNeeded, _this.cashNeeded) || other.cashNeeded == _this.cashNeeded)&&(identical(other.costsIncluded, _this.costsIncluded) || other.costsIncluded == _this.costsIncluded)&&(identical(other.saved, _this.saved) || other.saved == _this.saved)&&(identical(other.monthlySaving, _this.monthlySaving) || other.monthlySaving == _this.monthlySaving)&&(identical(other.toSave, _this.toSave) || other.toSave == _this.toSave)&&(identical(other.months, _this.months) || other.months == _this.months)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.reachedIn, _this.reachedIn) || other.reachedIn == _this.reachedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SavingsPlanSlice;
  return Object.hash(runtimeType,_this.marketName,_this.sample,_this.homeId,_this.homeName,_this.price,_this.downPayment,_this.downPaymentChosen,_this.cashNeeded,_this.costsIncluded,_this.saved,_this.monthlySaving,_this.toSave,_this.months,_this.from,_this.reachedIn);
}

@override
String toString() {
  final _this = this as SavingsPlanSlice;
  return 'SavingsPlanSlice(marketName: ${_this.marketName}, sample: ${_this.sample}, homeId: ${_this.homeId}, homeName: ${_this.homeName}, price: ${_this.price}, downPayment: ${_this.downPayment}, downPaymentChosen: ${_this.downPaymentChosen}, cashNeeded: ${_this.cashNeeded}, costsIncluded: ${_this.costsIncluded}, saved: ${_this.saved}, monthlySaving: ${_this.monthlySaving}, toSave: ${_this.toSave}, months: ${_this.months}, from: ${_this.from}, reachedIn: ${_this.reachedIn})';
}


}

/// @nodoc
abstract mixin class $SavingsPlanSliceCopyWith<$Res>  {
  factory $SavingsPlanSliceCopyWith(SavingsPlanSlice value, $Res Function(SavingsPlanSlice) _then) = _$SavingsPlanSliceCopyWithImpl;
@useResult
$Res call({
 String marketName, bool sample, String? homeId, String? homeName, Money price, Money downPayment, bool downPaymentChosen, Money cashNeeded, bool costsIncluded, Money saved, Money monthlySaving, Money toSave, int months,@CalendarDateJsonConverter() CalendarDate from,@CalendarDateJsonConverter() CalendarDate reachedIn
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res> get downPayment;$MoneyCopyWith<$Res> get cashNeeded;$MoneyCopyWith<$Res> get saved;$MoneyCopyWith<$Res> get monthlySaving;$MoneyCopyWith<$Res> get toSave;

}
/// @nodoc
class _$SavingsPlanSliceCopyWithImpl<$Res>
    implements $SavingsPlanSliceCopyWith<$Res> {
  _$SavingsPlanSliceCopyWithImpl(this._self, this._then);

  final SavingsPlanSlice _self;
  final $Res Function(SavingsPlanSlice) _then;

/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketName = null,Object? sample = null,Object? homeId = freezed,Object? homeName = freezed,Object? price = null,Object? downPayment = null,Object? downPaymentChosen = null,Object? cashNeeded = null,Object? costsIncluded = null,Object? saved = null,Object? monthlySaving = null,Object? toSave = null,Object? months = null,Object? from = null,Object? reachedIn = null,}) {
  return _then(SavingsPlanSlice(
marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,downPaymentChosen: null == downPaymentChosen ? _self.downPaymentChosen : downPaymentChosen // ignore: cast_nullable_to_non_nullable
as bool,cashNeeded: null == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money,costsIncluded: null == costsIncluded ? _self.costsIncluded : costsIncluded // ignore: cast_nullable_to_non_nullable
as bool,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as Money,monthlySaving: null == monthlySaving ? _self.monthlySaving : monthlySaving // ignore: cast_nullable_to_non_nullable
as Money,toSave: null == toSave ? _self.toSave : toSave // ignore: cast_nullable_to_non_nullable
as Money,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as CalendarDate,reachedIn: null == reachedIn ? _self.reachedIn : reachedIn // ignore: cast_nullable_to_non_nullable
as CalendarDate,
  ));
}
/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get cashNeeded {
  
  return $MoneyCopyWith<$Res>(_self.cashNeeded, (value) {
    return _then(_self.copyWith(cashNeeded: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get saved {
  
  return $MoneyCopyWith<$Res>(_self.saved, (value) {
    return _then(_self.copyWith(saved: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get monthlySaving {
  
  return $MoneyCopyWith<$Res>(_self.monthlySaving, (value) {
    return _then(_self.copyWith(monthlySaving: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get toSave {
  
  return $MoneyCopyWith<$Res>(_self.toSave, (value) {
    return _then(_self.copyWith(toSave: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavingsPlanSlice].
extension SavingsPlanSlicePatterns on SavingsPlanSlice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsPlanSlice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsPlanSlice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsPlanSlice value)  $default,){
final _that = this;
switch (_that) {
case _SavingsPlanSlice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsPlanSlice value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsPlanSlice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  bool downPaymentChosen,  Money cashNeeded,  bool costsIncluded,  Money saved,  Money monthlySaving,  Money toSave,  int months, @CalendarDateJsonConverter()  CalendarDate from, @CalendarDateJsonConverter()  CalendarDate reachedIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsPlanSlice() when $default != null:
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.downPaymentChosen,_that.cashNeeded,_that.costsIncluded,_that.saved,_that.monthlySaving,_that.toSave,_that.months,_that.from,_that.reachedIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  bool downPaymentChosen,  Money cashNeeded,  bool costsIncluded,  Money saved,  Money monthlySaving,  Money toSave,  int months, @CalendarDateJsonConverter()  CalendarDate from, @CalendarDateJsonConverter()  CalendarDate reachedIn)  $default,) {final _that = this;
switch (_that) {
case _SavingsPlanSlice():
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.downPaymentChosen,_that.cashNeeded,_that.costsIncluded,_that.saved,_that.monthlySaving,_that.toSave,_that.months,_that.from,_that.reachedIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String marketName,  bool sample,  String? homeId,  String? homeName,  Money price,  Money downPayment,  bool downPaymentChosen,  Money cashNeeded,  bool costsIncluded,  Money saved,  Money monthlySaving,  Money toSave,  int months, @CalendarDateJsonConverter()  CalendarDate from, @CalendarDateJsonConverter()  CalendarDate reachedIn)?  $default,) {final _that = this;
switch (_that) {
case _SavingsPlanSlice() when $default != null:
return $default(_that.marketName,_that.sample,_that.homeId,_that.homeName,_that.price,_that.downPayment,_that.downPaymentChosen,_that.cashNeeded,_that.costsIncluded,_that.saved,_that.monthlySaving,_that.toSave,_that.months,_that.from,_that.reachedIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsPlanSlice extends SavingsPlanSlice {
  const _SavingsPlanSlice({required this.marketName, this.sample = true, this.homeId, this.homeName, required this.price, required this.downPayment, this.downPaymentChosen = false, required this.cashNeeded, this.costsIncluded = true, required this.saved, required this.monthlySaving, required this.toSave, required this.months, @CalendarDateJsonConverter() required this.from, @CalendarDateJsonConverter() required this.reachedIn}): super._();
  factory _SavingsPlanSlice.fromJson(Map<String, dynamic> json) => _$SavingsPlanSliceFromJson(json);

@override final  String marketName;
@override@JsonKey() final  bool sample;
@override final  String? homeId;
@override final  String? homeName;
@override final  Money price;
@override final  Money downPayment;
@override@JsonKey() final  bool downPaymentChosen;
@override final  Money cashNeeded;
@override@JsonKey() final  bool costsIncluded;
@override final  Money saved;
@override final  Money monthlySaving;
@override final  Money toSave;
@override final  int months;
@override@CalendarDateJsonConverter() final  CalendarDate from;
@override@CalendarDateJsonConverter() final  CalendarDate reachedIn;

/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsPlanSliceCopyWith<_SavingsPlanSlice> get copyWith => __$SavingsPlanSliceCopyWithImpl<_SavingsPlanSlice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsPlanSliceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsPlanSlice&&(identical(other.marketName, marketName) || other.marketName == marketName)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.homeName, homeName) || other.homeName == homeName)&&(identical(other.price, price) || other.price == price)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.downPaymentChosen, downPaymentChosen) || other.downPaymentChosen == downPaymentChosen)&&(identical(other.cashNeeded, cashNeeded) || other.cashNeeded == cashNeeded)&&(identical(other.costsIncluded, costsIncluded) || other.costsIncluded == costsIncluded)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.monthlySaving, monthlySaving) || other.monthlySaving == monthlySaving)&&(identical(other.toSave, toSave) || other.toSave == toSave)&&(identical(other.months, months) || other.months == months)&&(identical(other.from, from) || other.from == from)&&(identical(other.reachedIn, reachedIn) || other.reachedIn == reachedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,marketName,sample,homeId,homeName,price,downPayment,downPaymentChosen,cashNeeded,costsIncluded,saved,monthlySaving,toSave,months,from,reachedIn);
}

@override
String toString() {
    return 'SavingsPlanSlice(marketName: $marketName, sample: $sample, homeId: $homeId, homeName: $homeName, price: $price, downPayment: $downPayment, downPaymentChosen: $downPaymentChosen, cashNeeded: $cashNeeded, costsIncluded: $costsIncluded, saved: $saved, monthlySaving: $monthlySaving, toSave: $toSave, months: $months, from: $from, reachedIn: $reachedIn)';
}


}

/// @nodoc
abstract mixin class _$SavingsPlanSliceCopyWith<$Res> implements $SavingsPlanSliceCopyWith<$Res> {
  factory _$SavingsPlanSliceCopyWith(_SavingsPlanSlice value, $Res Function(_SavingsPlanSlice) _then) = __$SavingsPlanSliceCopyWithImpl;
@override @useResult
$Res call({
 String marketName, bool sample, String? homeId, String? homeName, Money price, Money downPayment, bool downPaymentChosen, Money cashNeeded, bool costsIncluded, Money saved, Money monthlySaving, Money toSave, int months,@CalendarDateJsonConverter() CalendarDate from,@CalendarDateJsonConverter() CalendarDate reachedIn
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res> get downPayment;@override $MoneyCopyWith<$Res> get cashNeeded;@override $MoneyCopyWith<$Res> get saved;@override $MoneyCopyWith<$Res> get monthlySaving;@override $MoneyCopyWith<$Res> get toSave;

}
/// @nodoc
class __$SavingsPlanSliceCopyWithImpl<$Res>
    implements _$SavingsPlanSliceCopyWith<$Res> {
  __$SavingsPlanSliceCopyWithImpl(this._self, this._then);

  final _SavingsPlanSlice _self;
  final $Res Function(_SavingsPlanSlice) _then;

/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketName = null,Object? sample = null,Object? homeId = freezed,Object? homeName = freezed,Object? price = null,Object? downPayment = null,Object? downPaymentChosen = null,Object? cashNeeded = null,Object? costsIncluded = null,Object? saved = null,Object? monthlySaving = null,Object? toSave = null,Object? months = null,Object? from = null,Object? reachedIn = null,}) {
  return _then(_SavingsPlanSlice(
marketName: null == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as Money,downPaymentChosen: null == downPaymentChosen ? _self.downPaymentChosen : downPaymentChosen // ignore: cast_nullable_to_non_nullable
as bool,cashNeeded: null == cashNeeded ? _self.cashNeeded : cashNeeded // ignore: cast_nullable_to_non_nullable
as Money,costsIncluded: null == costsIncluded ? _self.costsIncluded : costsIncluded // ignore: cast_nullable_to_non_nullable
as bool,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as Money,monthlySaving: null == monthlySaving ? _self.monthlySaving : monthlySaving // ignore: cast_nullable_to_non_nullable
as Money,toSave: null == toSave ? _self.toSave : toSave // ignore: cast_nullable_to_non_nullable
as Money,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as CalendarDate,reachedIn: null == reachedIn ? _self.reachedIn : reachedIn // ignore: cast_nullable_to_non_nullable
as CalendarDate,
  ));
}

/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get downPayment {
  
  return $MoneyCopyWith<$Res>(_self.downPayment, (value) {
    return _then(_self.copyWith(downPayment: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get cashNeeded {
  
  return $MoneyCopyWith<$Res>(_self.cashNeeded, (value) {
    return _then(_self.copyWith(cashNeeded: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get saved {
  
  return $MoneyCopyWith<$Res>(_self.saved, (value) {
    return _then(_self.copyWith(saved: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get monthlySaving {
  
  return $MoneyCopyWith<$Res>(_self.monthlySaving, (value) {
    return _then(_self.copyWith(monthlySaving: value));
  });
}/// Create a copy of SavingsPlanSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get toSave {
  
  return $MoneyCopyWith<$Res>(_self.toSave, (value) {
    return _then(_self.copyWith(toSave: value));
  });
}
}

// dart format on
