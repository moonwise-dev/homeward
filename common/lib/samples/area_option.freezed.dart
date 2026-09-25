// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AreaOption {

 String get id; String get areaId; String get areaName; String get character; HomeType get homeType; int get rooms; int get sizeM2; Money get price; Money get pricePerM2; String get priceSource; int? get minutes; TravelMode? get mode; String? get anchorLabel;
/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaOptionCopyWith<AreaOption> get copyWith => _$AreaOptionCopyWithImpl<AreaOption>(this as AreaOption, _$identity);

  /// Serializes this AreaOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AreaOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.areaId, _this.areaId) || other.areaId == _this.areaId)&&(identical(other.areaName, _this.areaName) || other.areaName == _this.areaName)&&(identical(other.character, _this.character) || other.character == _this.character)&&(identical(other.homeType, _this.homeType) || other.homeType == _this.homeType)&&(identical(other.rooms, _this.rooms) || other.rooms == _this.rooms)&&(identical(other.sizeM2, _this.sizeM2) || other.sizeM2 == _this.sizeM2)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.pricePerM2, _this.pricePerM2) || other.pricePerM2 == _this.pricePerM2)&&(identical(other.priceSource, _this.priceSource) || other.priceSource == _this.priceSource)&&(identical(other.minutes, _this.minutes) || other.minutes == _this.minutes)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.anchorLabel, _this.anchorLabel) || other.anchorLabel == _this.anchorLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AreaOption;
  return Object.hash(runtimeType,_this.id,_this.areaId,_this.areaName,_this.character,_this.homeType,_this.rooms,_this.sizeM2,_this.price,_this.pricePerM2,_this.priceSource,_this.minutes,_this.mode,_this.anchorLabel);
}

@override
String toString() {
  final _this = this as AreaOption;
  return 'AreaOption(id: ${_this.id}, areaId: ${_this.areaId}, areaName: ${_this.areaName}, character: ${_this.character}, homeType: ${_this.homeType}, rooms: ${_this.rooms}, sizeM2: ${_this.sizeM2}, price: ${_this.price}, pricePerM2: ${_this.pricePerM2}, priceSource: ${_this.priceSource}, minutes: ${_this.minutes}, mode: ${_this.mode}, anchorLabel: ${_this.anchorLabel})';
}


}

/// @nodoc
abstract mixin class $AreaOptionCopyWith<$Res>  {
  factory $AreaOptionCopyWith(AreaOption value, $Res Function(AreaOption) _then) = _$AreaOptionCopyWithImpl;
@useResult
$Res call({
 String id, String areaId, String areaName, String character, HomeType homeType, int rooms, int sizeM2, Money price, Money pricePerM2, String priceSource, int? minutes, TravelMode? mode, String? anchorLabel
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res> get pricePerM2;

}
/// @nodoc
class _$AreaOptionCopyWithImpl<$Res>
    implements $AreaOptionCopyWith<$Res> {
  _$AreaOptionCopyWithImpl(this._self, this._then);

  final AreaOption _self;
  final $Res Function(AreaOption) _then;

/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? areaId = null,Object? areaName = null,Object? character = null,Object? homeType = null,Object? rooms = null,Object? sizeM2 = null,Object? price = null,Object? pricePerM2 = null,Object? priceSource = null,Object? minutes = freezed,Object? mode = freezed,Object? anchorLabel = freezed,}) {
  return _then(AreaOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,homeType: null == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,sizeM2: null == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode?,anchorLabel: freezed == anchorLabel ? _self.anchorLabel : anchorLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}
}


/// Adds pattern-matching-related methods to [AreaOption].
extension AreaOptionPatterns on AreaOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaOption value)  $default,){
final _that = this;
switch (_that) {
case _AreaOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaOption value)?  $default,){
final _that = this;
switch (_that) {
case _AreaOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String areaId,  String areaName,  String character,  HomeType homeType,  int rooms,  int sizeM2,  Money price,  Money pricePerM2,  String priceSource,  int? minutes,  TravelMode? mode,  String? anchorLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaOption() when $default != null:
return $default(_that.id,_that.areaId,_that.areaName,_that.character,_that.homeType,_that.rooms,_that.sizeM2,_that.price,_that.pricePerM2,_that.priceSource,_that.minutes,_that.mode,_that.anchorLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String areaId,  String areaName,  String character,  HomeType homeType,  int rooms,  int sizeM2,  Money price,  Money pricePerM2,  String priceSource,  int? minutes,  TravelMode? mode,  String? anchorLabel)  $default,) {final _that = this;
switch (_that) {
case _AreaOption():
return $default(_that.id,_that.areaId,_that.areaName,_that.character,_that.homeType,_that.rooms,_that.sizeM2,_that.price,_that.pricePerM2,_that.priceSource,_that.minutes,_that.mode,_that.anchorLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String areaId,  String areaName,  String character,  HomeType homeType,  int rooms,  int sizeM2,  Money price,  Money pricePerM2,  String priceSource,  int? minutes,  TravelMode? mode,  String? anchorLabel)?  $default,) {final _that = this;
switch (_that) {
case _AreaOption() when $default != null:
return $default(_that.id,_that.areaId,_that.areaName,_that.character,_that.homeType,_that.rooms,_that.sizeM2,_that.price,_that.pricePerM2,_that.priceSource,_that.minutes,_that.mode,_that.anchorLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaOption implements AreaOption {
  const _AreaOption({required this.id, required this.areaId, required this.areaName, required this.character, required this.homeType, required this.rooms, required this.sizeM2, required this.price, required this.pricePerM2, required this.priceSource, this.minutes, this.mode, this.anchorLabel});
  factory _AreaOption.fromJson(Map<String, dynamic> json) => _$AreaOptionFromJson(json);

@override final  String id;
@override final  String areaId;
@override final  String areaName;
@override final  String character;
@override final  HomeType homeType;
@override final  int rooms;
@override final  int sizeM2;
@override final  Money price;
@override final  Money pricePerM2;
@override final  String priceSource;
@override final  int? minutes;
@override final  TravelMode? mode;
@override final  String? anchorLabel;

/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaOptionCopyWith<_AreaOption> get copyWith => __$AreaOptionCopyWithImpl<_AreaOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaOption&&(identical(other.id, id) || other.id == id)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.character, character) || other.character == character)&&(identical(other.homeType, homeType) || other.homeType == homeType)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.sizeM2, sizeM2) || other.sizeM2 == sizeM2)&&(identical(other.price, price) || other.price == price)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.priceSource, priceSource) || other.priceSource == priceSource)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.anchorLabel, anchorLabel) || other.anchorLabel == anchorLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,areaId,areaName,character,homeType,rooms,sizeM2,price,pricePerM2,priceSource,minutes,mode,anchorLabel);
}

@override
String toString() {
    return 'AreaOption(id: $id, areaId: $areaId, areaName: $areaName, character: $character, homeType: $homeType, rooms: $rooms, sizeM2: $sizeM2, price: $price, pricePerM2: $pricePerM2, priceSource: $priceSource, minutes: $minutes, mode: $mode, anchorLabel: $anchorLabel)';
}


}

/// @nodoc
abstract mixin class _$AreaOptionCopyWith<$Res> implements $AreaOptionCopyWith<$Res> {
  factory _$AreaOptionCopyWith(_AreaOption value, $Res Function(_AreaOption) _then) = __$AreaOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String areaId, String areaName, String character, HomeType homeType, int rooms, int sizeM2, Money price, Money pricePerM2, String priceSource, int? minutes, TravelMode? mode, String? anchorLabel
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res> get pricePerM2;

}
/// @nodoc
class __$AreaOptionCopyWithImpl<$Res>
    implements _$AreaOptionCopyWith<$Res> {
  __$AreaOptionCopyWithImpl(this._self, this._then);

  final _AreaOption _self;
  final $Res Function(_AreaOption) _then;

/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? areaId = null,Object? areaName = null,Object? character = null,Object? homeType = null,Object? rooms = null,Object? sizeM2 = null,Object? price = null,Object? pricePerM2 = null,Object? priceSource = null,Object? minutes = freezed,Object? mode = freezed,Object? anchorLabel = freezed,}) {
  return _then(_AreaOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,homeType: null == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,sizeM2: null == sizeM2 ? _self.sizeM2 : sizeM2 // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as Money,priceSource: null == priceSource ? _self.priceSource : priceSource // ignore: cast_nullable_to_non_nullable
as String,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode?,anchorLabel: freezed == anchorLabel ? _self.anchorLabel : anchorLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of AreaOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pricePerM2 {
  
  return $MoneyCopyWith<$Res>(_self.pricePerM2, (value) {
    return _then(_self.copyWith(pricePerM2: value));
  });
}
}

// dart format on
