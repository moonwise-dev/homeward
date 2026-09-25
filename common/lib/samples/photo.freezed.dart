// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoCredit {

 String get name; String get url;
/// Create a copy of PhotoCredit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCreditCopyWith<PhotoCredit> get copyWith => _$PhotoCreditCopyWithImpl<PhotoCredit>(this as PhotoCredit, _$identity);

  /// Serializes this PhotoCredit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhotoCredit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoCredit&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhotoCredit;
  return Object.hash(runtimeType,_this.name,_this.url);
}

@override
String toString() {
  final _this = this as PhotoCredit;
  return 'PhotoCredit(name: ${_this.name}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $PhotoCreditCopyWith<$Res>  {
  factory $PhotoCreditCopyWith(PhotoCredit value, $Res Function(PhotoCredit) _then) = _$PhotoCreditCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PhotoCreditCopyWithImpl<$Res>
    implements $PhotoCreditCopyWith<$Res> {
  _$PhotoCreditCopyWithImpl(this._self, this._then);

  final PhotoCredit _self;
  final $Res Function(PhotoCredit) _then;

/// Create a copy of PhotoCredit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(PhotoCredit(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoCredit].
extension PhotoCreditPatterns on PhotoCredit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoCredit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoCredit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoCredit value)  $default,){
final _that = this;
switch (_that) {
case _PhotoCredit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoCredit value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoCredit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoCredit() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _PhotoCredit():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PhotoCredit() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoCredit implements PhotoCredit {
  const _PhotoCredit({required this.name, required this.url});
  factory _PhotoCredit.fromJson(Map<String, dynamic> json) => _$PhotoCreditFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PhotoCredit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCreditCopyWith<_PhotoCredit> get copyWith => __$PhotoCreditCopyWithImpl<_PhotoCredit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoCreditToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoCredit&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,url);
}

@override
String toString() {
    return 'PhotoCredit(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PhotoCreditCopyWith<$Res> implements $PhotoCreditCopyWith<$Res> {
  factory _$PhotoCreditCopyWith(_PhotoCredit value, $Res Function(_PhotoCredit) _then) = __$PhotoCreditCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PhotoCreditCopyWithImpl<$Res>
    implements _$PhotoCreditCopyWith<$Res> {
  __$PhotoCreditCopyWithImpl(this._self, this._then);

  final _PhotoCredit _self;
  final $Res Function(_PhotoCredit) _then;

/// Create a copy of PhotoCredit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PhotoCredit(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PhotoTraits {

 HomeType? get homeType; OutdoorSpace? get outdoor; HomeStyle? get style; List<CriterionKind> get criteria; List<String> get areaIds;
/// Create a copy of PhotoTraits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoTraitsCopyWith<PhotoTraits> get copyWith => _$PhotoTraitsCopyWithImpl<PhotoTraits>(this as PhotoTraits, _$identity);

  /// Serializes this PhotoTraits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhotoTraits;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoTraits&&(identical(other.homeType, _this.homeType) || other.homeType == _this.homeType)&&(identical(other.outdoor, _this.outdoor) || other.outdoor == _this.outdoor)&&(identical(other.style, _this.style) || other.style == _this.style)&&const DeepCollectionEquality().equals(other.criteria, _this.criteria)&&const DeepCollectionEquality().equals(other.areaIds, _this.areaIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhotoTraits;
  return Object.hash(runtimeType,_this.homeType,_this.outdoor,_this.style,const DeepCollectionEquality().hash(_this.criteria),const DeepCollectionEquality().hash(_this.areaIds));
}

@override
String toString() {
  final _this = this as PhotoTraits;
  return 'PhotoTraits(homeType: ${_this.homeType}, outdoor: ${_this.outdoor}, style: ${_this.style}, criteria: ${_this.criteria}, areaIds: ${_this.areaIds})';
}


}

/// @nodoc
abstract mixin class $PhotoTraitsCopyWith<$Res>  {
  factory $PhotoTraitsCopyWith(PhotoTraits value, $Res Function(PhotoTraits) _then) = _$PhotoTraitsCopyWithImpl;
@useResult
$Res call({
 HomeType? homeType, OutdoorSpace? outdoor, HomeStyle? style, List<CriterionKind> criteria, List<String> areaIds
});




}
/// @nodoc
class _$PhotoTraitsCopyWithImpl<$Res>
    implements $PhotoTraitsCopyWith<$Res> {
  _$PhotoTraitsCopyWithImpl(this._self, this._then);

  final PhotoTraits _self;
  final $Res Function(PhotoTraits) _then;

/// Create a copy of PhotoTraits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeType = freezed,Object? outdoor = freezed,Object? style = freezed,Object? criteria = null,Object? areaIds = null,}) {
  return _then(PhotoTraits(
homeType: freezed == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType?,outdoor: freezed == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle?,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<CriterionKind>,areaIds: null == areaIds ? _self.areaIds : areaIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoTraits].
extension PhotoTraitsPatterns on PhotoTraits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoTraits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoTraits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoTraits value)  $default,){
final _that = this;
switch (_that) {
case _PhotoTraits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoTraits value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoTraits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  List<CriterionKind> criteria,  List<String> areaIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoTraits() when $default != null:
return $default(_that.homeType,_that.outdoor,_that.style,_that.criteria,_that.areaIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  List<CriterionKind> criteria,  List<String> areaIds)  $default,) {final _that = this;
switch (_that) {
case _PhotoTraits():
return $default(_that.homeType,_that.outdoor,_that.style,_that.criteria,_that.areaIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  List<CriterionKind> criteria,  List<String> areaIds)?  $default,) {final _that = this;
switch (_that) {
case _PhotoTraits() when $default != null:
return $default(_that.homeType,_that.outdoor,_that.style,_that.criteria,_that.areaIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoTraits implements PhotoTraits {
  const _PhotoTraits({this.homeType, this.outdoor, this.style,  List<CriterionKind> criteria = const [],  List<String> areaIds = const []}): _criteria = criteria,_areaIds = areaIds;
  factory _PhotoTraits.fromJson(Map<String, dynamic> json) => _$PhotoTraitsFromJson(json);

@override final  HomeType? homeType;
@override final  OutdoorSpace? outdoor;
@override final  HomeStyle? style;
 final  List<CriterionKind> _criteria;
@override@JsonKey() List<CriterionKind> get criteria {
  if (_criteria is EqualUnmodifiableListView) return _criteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_criteria);
}

 final  List<String> _areaIds;
@override@JsonKey() List<String> get areaIds {
  if (_areaIds is EqualUnmodifiableListView) return _areaIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areaIds);
}


/// Create a copy of PhotoTraits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoTraitsCopyWith<_PhotoTraits> get copyWith => __$PhotoTraitsCopyWithImpl<_PhotoTraits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoTraitsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoTraits&&(identical(other.homeType, homeType) || other.homeType == homeType)&&(identical(other.outdoor, outdoor) || other.outdoor == outdoor)&&(identical(other.style, style) || other.style == style)&&const DeepCollectionEquality().equals(other.criteria, _criteria)&&const DeepCollectionEquality().equals(other.areaIds, _areaIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,homeType,outdoor,style,const DeepCollectionEquality().hash(_criteria),const DeepCollectionEquality().hash(_areaIds));
}

@override
String toString() {
    return 'PhotoTraits(homeType: $homeType, outdoor: $outdoor, style: $style, criteria: $criteria, areaIds: $areaIds)';
}


}

/// @nodoc
abstract mixin class _$PhotoTraitsCopyWith<$Res> implements $PhotoTraitsCopyWith<$Res> {
  factory _$PhotoTraitsCopyWith(_PhotoTraits value, $Res Function(_PhotoTraits) _then) = __$PhotoTraitsCopyWithImpl;
@override @useResult
$Res call({
 HomeType? homeType, OutdoorSpace? outdoor, HomeStyle? style, List<CriterionKind> criteria, List<String> areaIds
});




}
/// @nodoc
class __$PhotoTraitsCopyWithImpl<$Res>
    implements _$PhotoTraitsCopyWith<$Res> {
  __$PhotoTraitsCopyWithImpl(this._self, this._then);

  final _PhotoTraits _self;
  final $Res Function(_PhotoTraits) _then;

/// Create a copy of PhotoTraits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeType = freezed,Object? outdoor = freezed,Object? style = freezed,Object? criteria = null,Object? areaIds = null,}) {
  return _then(_PhotoTraits(
homeType: freezed == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType?,outdoor: freezed == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle?,criteria: null == criteria ? _self._criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<CriterionKind>,areaIds: null == areaIds ? _self._areaIds : areaIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Photo {

 String get id; String get caption; PhotoCredit get credit; PhotoTraits get traits;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Photo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.caption, _this.caption) || other.caption == _this.caption)&&(identical(other.credit, _this.credit) || other.credit == _this.credit)&&(identical(other.traits, _this.traits) || other.traits == _this.traits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Photo;
  return Object.hash(runtimeType,_this.id,_this.caption,_this.credit,_this.traits);
}

@override
String toString() {
  final _this = this as Photo;
  return 'Photo(id: ${_this.id}, caption: ${_this.caption}, credit: ${_this.credit}, traits: ${_this.traits})';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
 String id, String caption, PhotoCredit credit, PhotoTraits traits
});


$PhotoCreditCopyWith<$Res> get credit;$PhotoTraitsCopyWith<$Res> get traits;

}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? caption = null,Object? credit = null,Object? traits = null,}) {
  return _then(Photo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as PhotoCredit,traits: null == traits ? _self.traits : traits // ignore: cast_nullable_to_non_nullable
as PhotoTraits,
  ));
}
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCreditCopyWith<$Res> get credit {
  
  return $PhotoCreditCopyWith<$Res>(_self.credit, (value) {
    return _then(_self.copyWith(credit: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoTraitsCopyWith<$Res> get traits {
  
  return $PhotoTraitsCopyWith<$Res>(_self.traits, (value) {
    return _then(_self.copyWith(traits: value));
  });
}
}


/// Adds pattern-matching-related methods to [Photo].
extension PhotoPatterns on Photo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Photo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Photo value)  $default,){
final _that = this;
switch (_that) {
case _Photo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Photo value)?  $default,){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String caption,  PhotoCredit credit,  PhotoTraits traits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.caption,_that.credit,_that.traits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String caption,  PhotoCredit credit,  PhotoTraits traits)  $default,) {final _that = this;
switch (_that) {
case _Photo():
return $default(_that.id,_that.caption,_that.credit,_that.traits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String caption,  PhotoCredit credit,  PhotoTraits traits)?  $default,) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.caption,_that.credit,_that.traits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Photo implements Photo {
  const _Photo({required this.id, required this.caption, required this.credit, this.traits = const PhotoTraits()});
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

@override final  String id;
@override final  String caption;
@override final  PhotoCredit credit;
@override@JsonKey() final  PhotoTraits traits;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.traits, traits) || other.traits == traits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,caption,credit,traits);
}

@override
String toString() {
    return 'Photo(id: $id, caption: $caption, credit: $credit, traits: $traits)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String caption, PhotoCredit credit, PhotoTraits traits
});


@override $PhotoCreditCopyWith<$Res> get credit;@override $PhotoTraitsCopyWith<$Res> get traits;

}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? caption = null,Object? credit = null,Object? traits = null,}) {
  return _then(_Photo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as PhotoCredit,traits: null == traits ? _self.traits : traits // ignore: cast_nullable_to_non_nullable
as PhotoTraits,
  ));
}

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCreditCopyWith<$Res> get credit {
  
  return $PhotoCreditCopyWith<$Res>(_self.credit, (value) {
    return _then(_self.copyWith(credit: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoTraitsCopyWith<$Res> get traits {
  
  return $PhotoTraitsCopyWith<$Res>(_self.traits, (value) {
    return _then(_self.copyWith(traits: value));
  });
}
}


/// @nodoc
mixin _$PhotoManifest {

 List<Photo> get photos;
/// Create a copy of PhotoManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoManifestCopyWith<PhotoManifest> get copyWith => _$PhotoManifestCopyWithImpl<PhotoManifest>(this as PhotoManifest, _$identity);

  /// Serializes this PhotoManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhotoManifest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoManifest&&const DeepCollectionEquality().equals(other.photos, _this.photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhotoManifest;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.photos));
}

@override
String toString() {
  final _this = this as PhotoManifest;
  return 'PhotoManifest(photos: ${_this.photos})';
}


}

/// @nodoc
abstract mixin class $PhotoManifestCopyWith<$Res>  {
  factory $PhotoManifestCopyWith(PhotoManifest value, $Res Function(PhotoManifest) _then) = _$PhotoManifestCopyWithImpl;
@useResult
$Res call({
 List<Photo> photos
});




}
/// @nodoc
class _$PhotoManifestCopyWithImpl<$Res>
    implements $PhotoManifestCopyWith<$Res> {
  _$PhotoManifestCopyWithImpl(this._self, this._then);

  final PhotoManifest _self;
  final $Res Function(PhotoManifest) _then;

/// Create a copy of PhotoManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photos = null,}) {
  return _then(PhotoManifest(
photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoManifest].
extension PhotoManifestPatterns on PhotoManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoManifest value)  $default,){
final _that = this;
switch (_that) {
case _PhotoManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoManifest value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Photo> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoManifest() when $default != null:
return $default(_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Photo> photos)  $default,) {final _that = this;
switch (_that) {
case _PhotoManifest():
return $default(_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Photo> photos)?  $default,) {final _that = this;
switch (_that) {
case _PhotoManifest() when $default != null:
return $default(_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoManifest extends PhotoManifest {
  const _PhotoManifest({required  List<Photo> photos}): _photos = photos,super._();
  factory _PhotoManifest.fromJson(Map<String, dynamic> json) => _$PhotoManifestFromJson(json);

 final  List<Photo> _photos;
@override List<Photo> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of PhotoManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoManifestCopyWith<_PhotoManifest> get copyWith => __$PhotoManifestCopyWithImpl<_PhotoManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoManifestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoManifest&&const DeepCollectionEquality().equals(other.photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos));
}

@override
String toString() {
    return 'PhotoManifest(photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$PhotoManifestCopyWith<$Res> implements $PhotoManifestCopyWith<$Res> {
  factory _$PhotoManifestCopyWith(_PhotoManifest value, $Res Function(_PhotoManifest) _then) = __$PhotoManifestCopyWithImpl;
@override @useResult
$Res call({
 List<Photo> photos
});




}
/// @nodoc
class __$PhotoManifestCopyWithImpl<$Res>
    implements _$PhotoManifestCopyWith<$Res> {
  __$PhotoManifestCopyWithImpl(this._self, this._then);

  final _PhotoManifest _self;
  final $Res Function(_PhotoManifest) _then;

/// Create a copy of PhotoManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photos = null,}) {
  return _then(_PhotoManifest(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}


}

// dart format on
