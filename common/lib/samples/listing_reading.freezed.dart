// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeNeed {

 String get id; String get label; String get meaning;
/// Create a copy of HomeNeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeNeedCopyWith<HomeNeed> get copyWith => _$HomeNeedCopyWithImpl<HomeNeed>(this as HomeNeed, _$identity);

  /// Serializes this HomeNeed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeNeed;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeNeed&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.meaning, _this.meaning) || other.meaning == _this.meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeNeed;
  return Object.hash(runtimeType,_this.id,_this.label,_this.meaning);
}

@override
String toString() {
  final _this = this as HomeNeed;
  return 'HomeNeed(id: ${_this.id}, label: ${_this.label}, meaning: ${_this.meaning})';
}


}

/// @nodoc
abstract mixin class $HomeNeedCopyWith<$Res>  {
  factory $HomeNeedCopyWith(HomeNeed value, $Res Function(HomeNeed) _then) = _$HomeNeedCopyWithImpl;
@useResult
$Res call({
 String id, String label, String meaning
});




}
/// @nodoc
class _$HomeNeedCopyWithImpl<$Res>
    implements $HomeNeedCopyWith<$Res> {
  _$HomeNeedCopyWithImpl(this._self, this._then);

  final HomeNeed _self;
  final $Res Function(HomeNeed) _then;

/// Create a copy of HomeNeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? meaning = null,}) {
  return _then(HomeNeed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeNeed].
extension HomeNeedPatterns on HomeNeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeNeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeNeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeNeed value)  $default,){
final _that = this;
switch (_that) {
case _HomeNeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeNeed value)?  $default,){
final _that = this;
switch (_that) {
case _HomeNeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String meaning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeNeed() when $default != null:
return $default(_that.id,_that.label,_that.meaning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String meaning)  $default,) {final _that = this;
switch (_that) {
case _HomeNeed():
return $default(_that.id,_that.label,_that.meaning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String meaning)?  $default,) {final _that = this;
switch (_that) {
case _HomeNeed() when $default != null:
return $default(_that.id,_that.label,_that.meaning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeNeed implements HomeNeed {
  const _HomeNeed({required this.id, required this.label, required this.meaning});
  factory _HomeNeed.fromJson(Map<String, dynamic> json) => _$HomeNeedFromJson(json);

@override final  String id;
@override final  String label;
@override final  String meaning;

/// Create a copy of HomeNeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeNeedCopyWith<_HomeNeed> get copyWith => __$HomeNeedCopyWithImpl<_HomeNeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeNeedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeNeed&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,meaning);
}

@override
String toString() {
    return 'HomeNeed(id: $id, label: $label, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class _$HomeNeedCopyWith<$Res> implements $HomeNeedCopyWith<$Res> {
  factory _$HomeNeedCopyWith(_HomeNeed value, $Res Function(_HomeNeed) _then) = __$HomeNeedCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String meaning
});




}
/// @nodoc
class __$HomeNeedCopyWithImpl<$Res>
    implements _$HomeNeedCopyWith<$Res> {
  __$HomeNeedCopyWithImpl(this._self, this._then);

  final _HomeNeed _self;
  final $Res Function(_HomeNeed) _then;

/// Create a copy of HomeNeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? meaning = null,}) {
  return _then(_HomeNeed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NeedReading {

 String get needId; String get label; ReadVerdict get verdict; String? get quote;
/// Create a copy of NeedReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeedReadingCopyWith<NeedReading> get copyWith => _$NeedReadingCopyWithImpl<NeedReading>(this as NeedReading, _$identity);

  /// Serializes this NeedReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NeedReading;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeedReading&&(identical(other.needId, _this.needId) || other.needId == _this.needId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.verdict, _this.verdict) || other.verdict == _this.verdict)&&(identical(other.quote, _this.quote) || other.quote == _this.quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NeedReading;
  return Object.hash(runtimeType,_this.needId,_this.label,_this.verdict,_this.quote);
}

@override
String toString() {
  final _this = this as NeedReading;
  return 'NeedReading(needId: ${_this.needId}, label: ${_this.label}, verdict: ${_this.verdict}, quote: ${_this.quote})';
}


}

/// @nodoc
abstract mixin class $NeedReadingCopyWith<$Res>  {
  factory $NeedReadingCopyWith(NeedReading value, $Res Function(NeedReading) _then) = _$NeedReadingCopyWithImpl;
@useResult
$Res call({
 String needId, String label, ReadVerdict verdict, String? quote
});




}
/// @nodoc
class _$NeedReadingCopyWithImpl<$Res>
    implements $NeedReadingCopyWith<$Res> {
  _$NeedReadingCopyWithImpl(this._self, this._then);

  final NeedReading _self;
  final $Res Function(NeedReading) _then;

/// Create a copy of NeedReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needId = null,Object? label = null,Object? verdict = null,Object? quote = freezed,}) {
  return _then(NeedReading(
needId: null == needId ? _self.needId : needId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadVerdict,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NeedReading].
extension NeedReadingPatterns on NeedReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeedReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeedReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeedReading value)  $default,){
final _that = this;
switch (_that) {
case _NeedReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeedReading value)?  $default,){
final _that = this;
switch (_that) {
case _NeedReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String needId,  String label,  ReadVerdict verdict,  String? quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeedReading() when $default != null:
return $default(_that.needId,_that.label,_that.verdict,_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String needId,  String label,  ReadVerdict verdict,  String? quote)  $default,) {final _that = this;
switch (_that) {
case _NeedReading():
return $default(_that.needId,_that.label,_that.verdict,_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String needId,  String label,  ReadVerdict verdict,  String? quote)?  $default,) {final _that = this;
switch (_that) {
case _NeedReading() when $default != null:
return $default(_that.needId,_that.label,_that.verdict,_that.quote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeedReading implements NeedReading {
  const _NeedReading({required this.needId, required this.label, required this.verdict, this.quote});
  factory _NeedReading.fromJson(Map<String, dynamic> json) => _$NeedReadingFromJson(json);

@override final  String needId;
@override final  String label;
@override final  ReadVerdict verdict;
@override final  String? quote;

/// Create a copy of NeedReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeedReadingCopyWith<_NeedReading> get copyWith => __$NeedReadingCopyWithImpl<_NeedReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeedReadingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeedReading&&(identical(other.needId, needId) || other.needId == needId)&&(identical(other.label, label) || other.label == label)&&(identical(other.verdict, verdict) || other.verdict == verdict)&&(identical(other.quote, quote) || other.quote == quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,needId,label,verdict,quote);
}

@override
String toString() {
    return 'NeedReading(needId: $needId, label: $label, verdict: $verdict, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$NeedReadingCopyWith<$Res> implements $NeedReadingCopyWith<$Res> {
  factory _$NeedReadingCopyWith(_NeedReading value, $Res Function(_NeedReading) _then) = __$NeedReadingCopyWithImpl;
@override @useResult
$Res call({
 String needId, String label, ReadVerdict verdict, String? quote
});




}
/// @nodoc
class __$NeedReadingCopyWithImpl<$Res>
    implements _$NeedReadingCopyWith<$Res> {
  __$NeedReadingCopyWithImpl(this._self, this._then);

  final _NeedReading _self;
  final $Res Function(_NeedReading) _then;

/// Create a copy of NeedReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needId = null,Object? label = null,Object? verdict = null,Object? quote = freezed,}) {
  return _then(_NeedReading(
needId: null == needId ? _self.needId : needId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadVerdict,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ListingReading {

 String get homeId; String get homeName; String get description; List<NeedReading> get readings;
/// Create a copy of ListingReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingReadingCopyWith<ListingReading> get copyWith => _$ListingReadingCopyWithImpl<ListingReading>(this as ListingReading, _$identity);

  /// Serializes this ListingReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ListingReading;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingReading&&(identical(other.homeId, _this.homeId) || other.homeId == _this.homeId)&&(identical(other.homeName, _this.homeName) || other.homeName == _this.homeName)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.readings, _this.readings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ListingReading;
  return Object.hash(runtimeType,_this.homeId,_this.homeName,_this.description,const DeepCollectionEquality().hash(_this.readings));
}

@override
String toString() {
  final _this = this as ListingReading;
  return 'ListingReading(homeId: ${_this.homeId}, homeName: ${_this.homeName}, description: ${_this.description}, readings: ${_this.readings})';
}


}

/// @nodoc
abstract mixin class $ListingReadingCopyWith<$Res>  {
  factory $ListingReadingCopyWith(ListingReading value, $Res Function(ListingReading) _then) = _$ListingReadingCopyWithImpl;
@useResult
$Res call({
 String homeId, String homeName, String description, List<NeedReading> readings
});




}
/// @nodoc
class _$ListingReadingCopyWithImpl<$Res>
    implements $ListingReadingCopyWith<$Res> {
  _$ListingReadingCopyWithImpl(this._self, this._then);

  final ListingReading _self;
  final $Res Function(ListingReading) _then;

/// Create a copy of ListingReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeId = null,Object? homeName = null,Object? description = null,Object? readings = null,}) {
  return _then(ListingReading(
homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String,homeName: null == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,readings: null == readings ? _self.readings : readings // ignore: cast_nullable_to_non_nullable
as List<NeedReading>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingReading].
extension ListingReadingPatterns on ListingReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingReading value)  $default,){
final _that = this;
switch (_that) {
case _ListingReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingReading value)?  $default,){
final _that = this;
switch (_that) {
case _ListingReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String homeId,  String homeName,  String description,  List<NeedReading> readings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingReading() when $default != null:
return $default(_that.homeId,_that.homeName,_that.description,_that.readings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String homeId,  String homeName,  String description,  List<NeedReading> readings)  $default,) {final _that = this;
switch (_that) {
case _ListingReading():
return $default(_that.homeId,_that.homeName,_that.description,_that.readings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String homeId,  String homeName,  String description,  List<NeedReading> readings)?  $default,) {final _that = this;
switch (_that) {
case _ListingReading() when $default != null:
return $default(_that.homeId,_that.homeName,_that.description,_that.readings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingReading implements ListingReading {
  const _ListingReading({required this.homeId, required this.homeName, required this.description, required  List<NeedReading> readings}): _readings = readings;
  factory _ListingReading.fromJson(Map<String, dynamic> json) => _$ListingReadingFromJson(json);

@override final  String homeId;
@override final  String homeName;
@override final  String description;
 final  List<NeedReading> _readings;
@override List<NeedReading> get readings {
  if (_readings is EqualUnmodifiableListView) return _readings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readings);
}


/// Create a copy of ListingReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingReadingCopyWith<_ListingReading> get copyWith => __$ListingReadingCopyWithImpl<_ListingReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingReadingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingReading&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.homeName, homeName) || other.homeName == homeName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.readings, _readings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,homeId,homeName,description,const DeepCollectionEquality().hash(_readings));
}

@override
String toString() {
    return 'ListingReading(homeId: $homeId, homeName: $homeName, description: $description, readings: $readings)';
}


}

/// @nodoc
abstract mixin class _$ListingReadingCopyWith<$Res> implements $ListingReadingCopyWith<$Res> {
  factory _$ListingReadingCopyWith(_ListingReading value, $Res Function(_ListingReading) _then) = __$ListingReadingCopyWithImpl;
@override @useResult
$Res call({
 String homeId, String homeName, String description, List<NeedReading> readings
});




}
/// @nodoc
class __$ListingReadingCopyWithImpl<$Res>
    implements _$ListingReadingCopyWith<$Res> {
  __$ListingReadingCopyWithImpl(this._self, this._then);

  final _ListingReading _self;
  final $Res Function(_ListingReading) _then;

/// Create a copy of ListingReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeId = null,Object? homeName = null,Object? description = null,Object? readings = null,}) {
  return _then(_ListingReading(
homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as String,homeName: null == homeName ? _self.homeName : homeName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,readings: null == readings ? _self._readings : readings // ignore: cast_nullable_to_non_nullable
as List<NeedReading>,
  ));
}


}

// dart format on
