// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SharingPerson {

 String get label; Money? get income; int? get roomM2;
/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharingPersonCopyWith<SharingPerson> get copyWith => _$SharingPersonCopyWithImpl<SharingPerson>(this as SharingPerson, _$identity);

  /// Serializes this SharingPerson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SharingPerson;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingPerson&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.income, _this.income) || other.income == _this.income)&&(identical(other.roomM2, _this.roomM2) || other.roomM2 == _this.roomM2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SharingPerson;
  return Object.hash(runtimeType,_this.label,_this.income,_this.roomM2);
}

@override
String toString() {
  final _this = this as SharingPerson;
  return 'SharingPerson(label: ${_this.label}, income: ${_this.income}, roomM2: ${_this.roomM2})';
}


}

/// @nodoc
abstract mixin class $SharingPersonCopyWith<$Res>  {
  factory $SharingPersonCopyWith(SharingPerson value, $Res Function(SharingPerson) _then) = _$SharingPersonCopyWithImpl;
@useResult
$Res call({
 String label, Money? income, int? roomM2
});


$MoneyCopyWith<$Res>? get income;

}
/// @nodoc
class _$SharingPersonCopyWithImpl<$Res>
    implements $SharingPersonCopyWith<$Res> {
  _$SharingPersonCopyWithImpl(this._self, this._then);

  final SharingPerson _self;
  final $Res Function(SharingPerson) _then;

/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? income = freezed,Object? roomM2 = freezed,}) {
  return _then(SharingPerson(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,income: freezed == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money?,roomM2: freezed == roomM2 ? _self.roomM2 : roomM2 // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get income {
    if (_self.income == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.income!, (value) {
    return _then(_self.copyWith(income: value));
  });
}
}


/// Adds pattern-matching-related methods to [SharingPerson].
extension SharingPersonPatterns on SharingPerson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharingPerson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharingPerson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharingPerson value)  $default,){
final _that = this;
switch (_that) {
case _SharingPerson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharingPerson value)?  $default,){
final _that = this;
switch (_that) {
case _SharingPerson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Money? income,  int? roomM2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharingPerson() when $default != null:
return $default(_that.label,_that.income,_that.roomM2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Money? income,  int? roomM2)  $default,) {final _that = this;
switch (_that) {
case _SharingPerson():
return $default(_that.label,_that.income,_that.roomM2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Money? income,  int? roomM2)?  $default,) {final _that = this;
switch (_that) {
case _SharingPerson() when $default != null:
return $default(_that.label,_that.income,_that.roomM2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SharingPerson implements SharingPerson {
  const _SharingPerson({required this.label, this.income, this.roomM2});
  factory _SharingPerson.fromJson(Map<String, dynamic> json) => _$SharingPersonFromJson(json);

@override final  String label;
@override final  Money? income;
@override final  int? roomM2;

/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharingPersonCopyWith<_SharingPerson> get copyWith => __$SharingPersonCopyWithImpl<_SharingPerson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SharingPersonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharingPerson&&(identical(other.label, label) || other.label == label)&&(identical(other.income, income) || other.income == income)&&(identical(other.roomM2, roomM2) || other.roomM2 == roomM2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,income,roomM2);
}

@override
String toString() {
    return 'SharingPerson(label: $label, income: $income, roomM2: $roomM2)';
}


}

/// @nodoc
abstract mixin class _$SharingPersonCopyWith<$Res> implements $SharingPersonCopyWith<$Res> {
  factory _$SharingPersonCopyWith(_SharingPerson value, $Res Function(_SharingPerson) _then) = __$SharingPersonCopyWithImpl;
@override @useResult
$Res call({
 String label, Money? income, int? roomM2
});


@override $MoneyCopyWith<$Res>? get income;

}
/// @nodoc
class __$SharingPersonCopyWithImpl<$Res>
    implements _$SharingPersonCopyWith<$Res> {
  __$SharingPersonCopyWithImpl(this._self, this._then);

  final _SharingPerson _self;
  final $Res Function(_SharingPerson) _then;

/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? income = freezed,Object? roomM2 = freezed,}) {
  return _then(_SharingPerson(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,income: freezed == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money?,roomM2: freezed == roomM2 ? _self.roomM2 : roomM2 // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of SharingPerson
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get income {
    if (_self.income == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.income!, (value) {
    return _then(_self.copyWith(income: value));
  });
}
}


/// @nodoc
mixin _$PersonShare {

 String get label; Money get rent; Money? get bills;
/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonShareCopyWith<PersonShare> get copyWith => _$PersonShareCopyWithImpl<PersonShare>(this as PersonShare, _$identity);

  /// Serializes this PersonShare to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonShare;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonShare&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.rent, _this.rent) || other.rent == _this.rent)&&(identical(other.bills, _this.bills) || other.bills == _this.bills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonShare;
  return Object.hash(runtimeType,_this.label,_this.rent,_this.bills);
}

@override
String toString() {
  final _this = this as PersonShare;
  return 'PersonShare(label: ${_this.label}, rent: ${_this.rent}, bills: ${_this.bills})';
}


}

/// @nodoc
abstract mixin class $PersonShareCopyWith<$Res>  {
  factory $PersonShareCopyWith(PersonShare value, $Res Function(PersonShare) _then) = _$PersonShareCopyWithImpl;
@useResult
$Res call({
 String label, Money rent, Money? bills
});


$MoneyCopyWith<$Res> get rent;$MoneyCopyWith<$Res>? get bills;

}
/// @nodoc
class _$PersonShareCopyWithImpl<$Res>
    implements $PersonShareCopyWith<$Res> {
  _$PersonShareCopyWithImpl(this._self, this._then);

  final PersonShare _self;
  final $Res Function(PersonShare) _then;

/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? rent = null,Object? bills = freezed,}) {
  return _then(PersonShare(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as Money,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}
/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get rent {
  
  return $MoneyCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get bills {
    if (_self.bills == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.bills!, (value) {
    return _then(_self.copyWith(bills: value));
  });
}
}


/// Adds pattern-matching-related methods to [PersonShare].
extension PersonSharePatterns on PersonShare {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonShare value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonShare() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonShare value)  $default,){
final _that = this;
switch (_that) {
case _PersonShare():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonShare value)?  $default,){
final _that = this;
switch (_that) {
case _PersonShare() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Money rent,  Money? bills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonShare() when $default != null:
return $default(_that.label,_that.rent,_that.bills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Money rent,  Money? bills)  $default,) {final _that = this;
switch (_that) {
case _PersonShare():
return $default(_that.label,_that.rent,_that.bills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Money rent,  Money? bills)?  $default,) {final _that = this;
switch (_that) {
case _PersonShare() when $default != null:
return $default(_that.label,_that.rent,_that.bills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonShare extends PersonShare {
  const _PersonShare({required this.label, required this.rent, this.bills}): super._();
  factory _PersonShare.fromJson(Map<String, dynamic> json) => _$PersonShareFromJson(json);

@override final  String label;
@override final  Money rent;
@override final  Money? bills;

/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonShareCopyWith<_PersonShare> get copyWith => __$PersonShareCopyWithImpl<_PersonShare>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonShareToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonShare&&(identical(other.label, label) || other.label == label)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.bills, bills) || other.bills == bills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,rent,bills);
}

@override
String toString() {
    return 'PersonShare(label: $label, rent: $rent, bills: $bills)';
}


}

/// @nodoc
abstract mixin class _$PersonShareCopyWith<$Res> implements $PersonShareCopyWith<$Res> {
  factory _$PersonShareCopyWith(_PersonShare value, $Res Function(_PersonShare) _then) = __$PersonShareCopyWithImpl;
@override @useResult
$Res call({
 String label, Money rent, Money? bills
});


@override $MoneyCopyWith<$Res> get rent;@override $MoneyCopyWith<$Res>? get bills;

}
/// @nodoc
class __$PersonShareCopyWithImpl<$Res>
    implements _$PersonShareCopyWith<$Res> {
  __$PersonShareCopyWithImpl(this._self, this._then);

  final _PersonShare _self;
  final $Res Function(_PersonShare) _then;

/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? rent = null,Object? bills = freezed,}) {
  return _then(_PersonShare(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as Money,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as Money?,
  ));
}

/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get rent {
  
  return $MoneyCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of PersonShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get bills {
    if (_self.bills == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.bills!, (value) {
    return _then(_self.copyWith(bills: value));
  });
}
}


/// @nodoc
mixin _$RuleSplit {

 SplitRule get rule; List<PersonShare> get shares;
/// Create a copy of RuleSplit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleSplitCopyWith<RuleSplit> get copyWith => _$RuleSplitCopyWithImpl<RuleSplit>(this as RuleSplit, _$identity);

  /// Serializes this RuleSplit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RuleSplit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleSplit&&(identical(other.rule, _this.rule) || other.rule == _this.rule)&&const DeepCollectionEquality().equals(other.shares, _this.shares));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RuleSplit;
  return Object.hash(runtimeType,_this.rule,const DeepCollectionEquality().hash(_this.shares));
}

@override
String toString() {
  final _this = this as RuleSplit;
  return 'RuleSplit(rule: ${_this.rule}, shares: ${_this.shares})';
}


}

/// @nodoc
abstract mixin class $RuleSplitCopyWith<$Res>  {
  factory $RuleSplitCopyWith(RuleSplit value, $Res Function(RuleSplit) _then) = _$RuleSplitCopyWithImpl;
@useResult
$Res call({
 SplitRule rule, List<PersonShare> shares
});




}
/// @nodoc
class _$RuleSplitCopyWithImpl<$Res>
    implements $RuleSplitCopyWith<$Res> {
  _$RuleSplitCopyWithImpl(this._self, this._then);

  final RuleSplit _self;
  final $Res Function(RuleSplit) _then;

/// Create a copy of RuleSplit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rule = null,Object? shares = null,}) {
  return _then(RuleSplit(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as SplitRule,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as List<PersonShare>,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleSplit].
extension RuleSplitPatterns on RuleSplit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleSplit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleSplit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleSplit value)  $default,){
final _that = this;
switch (_that) {
case _RuleSplit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleSplit value)?  $default,){
final _that = this;
switch (_that) {
case _RuleSplit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SplitRule rule,  List<PersonShare> shares)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleSplit() when $default != null:
return $default(_that.rule,_that.shares);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SplitRule rule,  List<PersonShare> shares)  $default,) {final _that = this;
switch (_that) {
case _RuleSplit():
return $default(_that.rule,_that.shares);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SplitRule rule,  List<PersonShare> shares)?  $default,) {final _that = this;
switch (_that) {
case _RuleSplit() when $default != null:
return $default(_that.rule,_that.shares);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleSplit implements RuleSplit {
  const _RuleSplit({required this.rule, required  List<PersonShare> shares}): _shares = shares;
  factory _RuleSplit.fromJson(Map<String, dynamic> json) => _$RuleSplitFromJson(json);

@override final  SplitRule rule;
 final  List<PersonShare> _shares;
@override List<PersonShare> get shares {
  if (_shares is EqualUnmodifiableListView) return _shares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shares);
}


/// Create a copy of RuleSplit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleSplitCopyWith<_RuleSplit> get copyWith => __$RuleSplitCopyWithImpl<_RuleSplit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleSplitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleSplit&&(identical(other.rule, rule) || other.rule == rule)&&const DeepCollectionEquality().equals(other.shares, _shares));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rule,const DeepCollectionEquality().hash(_shares));
}

@override
String toString() {
    return 'RuleSplit(rule: $rule, shares: $shares)';
}


}

/// @nodoc
abstract mixin class _$RuleSplitCopyWith<$Res> implements $RuleSplitCopyWith<$Res> {
  factory _$RuleSplitCopyWith(_RuleSplit value, $Res Function(_RuleSplit) _then) = __$RuleSplitCopyWithImpl;
@override @useResult
$Res call({
 SplitRule rule, List<PersonShare> shares
});




}
/// @nodoc
class __$RuleSplitCopyWithImpl<$Res>
    implements _$RuleSplitCopyWith<$Res> {
  __$RuleSplitCopyWithImpl(this._self, this._then);

  final _RuleSplit _self;
  final $Res Function(_RuleSplit) _then;

/// Create a copy of RuleSplit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rule = null,Object? shares = null,}) {
  return _then(_RuleSplit(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as SplitRule,shares: null == shares ? _self._shares : shares // ignore: cast_nullable_to_non_nullable
as List<PersonShare>,
  ));
}


}


/// @nodoc
mixin _$RentSplitSlice {

 RentFigure get rent; Money? get bills; String? get homeId; String? get homeName; int? get homeM2; List<SharingPerson> get people; List<RuleSplit> get splits; SplitRule? get chosen;
/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentSplitSliceCopyWith<RentSplitSlice> get copyWith => _$RentSplitSliceCopyWithImpl<RentSplitSlice>(this as RentSplitSlice, _$identity);

  /// Serializes this RentSplitSlice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RentSplitSlice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentSplitSlice&&(identical(other.rent, _this.rent) || other.rent == _this.rent)&&(identical(other.bills, _this.bills) || other.bills == _this.bills)&&(identical(other.homeId, _this.homeId) || other.homeId == _this.homeId)&&(identical(other.homeName, _this.homeName) || other.homeName == _this.homeName)&&(identical(other.homeM2, _this.homeM2) || other.homeM2 == _this.homeM2)&&const DeepCollectionEquality().equals(other.people, _this.people)&&const DeepCollectionEquality().equals(other.splits, _this.splits)&&(identical(other.chosen, _this.chosen) || other.chosen == _this.chosen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RentSplitSlice;
  return Object.hash(runtimeType,_this.rent,_this.bills,_this.homeId,_this.homeName,_this.homeM2,const DeepCollectionEquality().hash(_this.people),const DeepCollectionEquality().hash(_this.splits),_this.chosen);
}

@override
String toString() {
  final _this = this as RentSplitSlice;
  return 'RentSplitSlice(rent: ${_this.rent}, bills: ${_this.bills}, homeId: ${_this.homeId}, homeName: ${_this.homeName}, homeM2: ${_this.homeM2}, people: ${_this.people}, splits: ${_this.splits}, chosen: ${_this.chosen})';
}


}

/// @nodoc
abstract mixin class $RentSplitSliceCopyWith<$Res>  {
  factory $RentSplitSliceCopyWith(RentSplitSlice value, $Res Function(RentSplitSlice) _then) = _$RentSplitSliceCopyWithImpl;
@useResult
$Res call({
 RentFigure rent, Money? bills, String? homeId, String? homeName, int? homeM2, List<SharingPerson> people, List<RuleSplit> splits, SplitRule? chosen
});


$RentFigureCopyWith<$Res> get rent;$MoneyCopyWith<$Res>? get bills;

}
/// @nodoc
class _$RentSplitSliceCopyWithImpl<$Res>
    implements $RentSplitSliceCopyWith<$Res> {
  _$RentSplitSliceCopyWithImpl(this._self, this._then);

  final RentSplitSlice _self;
  final $Res Function(RentSplitSlice) _then;

/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rent = null,Object? bills = freezed,Object? homeId = freezed,Object? homeName = freezed,Object? homeM2 = freezed,Object? people = null,Object? splits = null,Object? chosen = freezed,}) {
  return _then(RentSplitSlice(
rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as Money?,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,homeM2: freezed == homeM2 ? _self.homeM2 : homeM2 // ignore: cast_nullable_to_non_nullable
as int?,people: null == people ? _self.people : people // ignore: cast_nullable_to_non_nullable
as List<SharingPerson>,splits: null == splits ? _self.splits : splits // ignore: cast_nullable_to_non_nullable
as List<RuleSplit>,chosen: freezed == chosen ? _self.chosen : chosen // ignore: cast_nullable_to_non_nullable
as SplitRule?,
  ));
}
/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res> get rent {
  
  return $RentFigureCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get bills {
    if (_self.bills == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.bills!, (value) {
    return _then(_self.copyWith(bills: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentSplitSlice].
extension RentSplitSlicePatterns on RentSplitSlice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentSplitSlice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentSplitSlice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentSplitSlice value)  $default,){
final _that = this;
switch (_that) {
case _RentSplitSlice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentSplitSlice value)?  $default,){
final _that = this;
switch (_that) {
case _RentSplitSlice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RentFigure rent,  Money? bills,  String? homeId,  String? homeName,  int? homeM2,  List<SharingPerson> people,  List<RuleSplit> splits,  SplitRule? chosen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentSplitSlice() when $default != null:
return $default(_that.rent,_that.bills,_that.homeId,_that.homeName,_that.homeM2,_that.people,_that.splits,_that.chosen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RentFigure rent,  Money? bills,  String? homeId,  String? homeName,  int? homeM2,  List<SharingPerson> people,  List<RuleSplit> splits,  SplitRule? chosen)  $default,) {final _that = this;
switch (_that) {
case _RentSplitSlice():
return $default(_that.rent,_that.bills,_that.homeId,_that.homeName,_that.homeM2,_that.people,_that.splits,_that.chosen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RentFigure rent,  Money? bills,  String? homeId,  String? homeName,  int? homeM2,  List<SharingPerson> people,  List<RuleSplit> splits,  SplitRule? chosen)?  $default,) {final _that = this;
switch (_that) {
case _RentSplitSlice() when $default != null:
return $default(_that.rent,_that.bills,_that.homeId,_that.homeName,_that.homeM2,_that.people,_that.splits,_that.chosen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentSplitSlice extends RentSplitSlice {
  const _RentSplitSlice({required this.rent, this.bills, this.homeId, this.homeName, this.homeM2, required  List<SharingPerson> people, required  List<RuleSplit> splits, this.chosen}): _people = people,_splits = splits,super._();
  factory _RentSplitSlice.fromJson(Map<String, dynamic> json) => _$RentSplitSliceFromJson(json);

@override final  RentFigure rent;
@override final  Money? bills;
@override final  String? homeId;
@override final  String? homeName;
@override final  int? homeM2;
 final  List<SharingPerson> _people;
@override List<SharingPerson> get people {
  if (_people is EqualUnmodifiableListView) return _people;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_people);
}

 final  List<RuleSplit> _splits;
@override List<RuleSplit> get splits {
  if (_splits is EqualUnmodifiableListView) return _splits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_splits);
}

@override final  SplitRule? chosen;

/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentSplitSliceCopyWith<_RentSplitSlice> get copyWith => __$RentSplitSliceCopyWithImpl<_RentSplitSlice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentSplitSliceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentSplitSlice&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.bills, bills) || other.bills == bills)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.homeName, homeName) || other.homeName == homeName)&&(identical(other.homeM2, homeM2) || other.homeM2 == homeM2)&&const DeepCollectionEquality().equals(other.people, _people)&&const DeepCollectionEquality().equals(other.splits, _splits)&&(identical(other.chosen, chosen) || other.chosen == chosen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rent,bills,homeId,homeName,homeM2,const DeepCollectionEquality().hash(_people),const DeepCollectionEquality().hash(_splits),chosen);
}

@override
String toString() {
    return 'RentSplitSlice(rent: $rent, bills: $bills, homeId: $homeId, homeName: $homeName, homeM2: $homeM2, people: $people, splits: $splits, chosen: $chosen)';
}


}

/// @nodoc
abstract mixin class _$RentSplitSliceCopyWith<$Res> implements $RentSplitSliceCopyWith<$Res> {
  factory _$RentSplitSliceCopyWith(_RentSplitSlice value, $Res Function(_RentSplitSlice) _then) = __$RentSplitSliceCopyWithImpl;
@override @useResult
$Res call({
 RentFigure rent, Money? bills, String? homeId, String? homeName, int? homeM2, List<SharingPerson> people, List<RuleSplit> splits, SplitRule? chosen
});


@override $RentFigureCopyWith<$Res> get rent;@override $MoneyCopyWith<$Res>? get bills;

}
/// @nodoc
class __$RentSplitSliceCopyWithImpl<$Res>
    implements _$RentSplitSliceCopyWith<$Res> {
  __$RentSplitSliceCopyWithImpl(this._self, this._then);

  final _RentSplitSlice _self;
  final $Res Function(_RentSplitSlice) _then;

/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rent = null,Object? bills = freezed,Object? homeId = freezed,Object? homeName = freezed,Object? homeM2 = freezed,Object? people = null,Object? splits = null,Object? chosen = freezed,}) {
  return _then(_RentSplitSlice(
rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as RentFigure,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as Money?,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String?,homeName: freezed == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String?,homeM2: freezed == homeM2 ? _self.homeM2 : homeM2 // ignore: cast_nullable_to_non_nullable
as int?,people: null == people ? _self._people : people // ignore: cast_nullable_to_non_nullable
as List<SharingPerson>,splits: null == splits ? _self._splits : splits // ignore: cast_nullable_to_non_nullable
as List<RuleSplit>,chosen: freezed == chosen ? _self.chosen : chosen // ignore: cast_nullable_to_non_nullable
as SplitRule?,
  ));
}

/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RentFigureCopyWith<$Res> get rent {
  
  return $RentFigureCopyWith<$Res>(_self.rent, (value) {
    return _then(_self.copyWith(rent: value));
  });
}/// Create a copy of RentSplitSlice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get bills {
    if (_self.bills == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.bills!, (value) {
    return _then(_self.copyWith(bills: value));
  });
}
}

// dart format on
