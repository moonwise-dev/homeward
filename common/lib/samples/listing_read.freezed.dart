// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_read.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingRead {

 String get listingId; HomeNeed get need; ReadVerdict get verdict; String? get quote;
/// Create a copy of ListingRead
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingReadCopyWith<ListingRead> get copyWith => _$ListingReadCopyWithImpl<ListingRead>(this as ListingRead, _$identity);

  /// Serializes this ListingRead to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ListingRead;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingRead&&(identical(other.listingId, _this.listingId) || other.listingId == _this.listingId)&&(identical(other.need, _this.need) || other.need == _this.need)&&(identical(other.verdict, _this.verdict) || other.verdict == _this.verdict)&&(identical(other.quote, _this.quote) || other.quote == _this.quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ListingRead;
  return Object.hash(runtimeType,_this.listingId,_this.need,_this.verdict,_this.quote);
}

@override
String toString() {
  final _this = this as ListingRead;
  return 'ListingRead(listingId: ${_this.listingId}, need: ${_this.need}, verdict: ${_this.verdict}, quote: ${_this.quote})';
}


}

/// @nodoc
abstract mixin class $ListingReadCopyWith<$Res>  {
  factory $ListingReadCopyWith(ListingRead value, $Res Function(ListingRead) _then) = _$ListingReadCopyWithImpl;
@useResult
$Res call({
 String listingId, HomeNeed need, ReadVerdict verdict, String? quote
});




}
/// @nodoc
class _$ListingReadCopyWithImpl<$Res>
    implements $ListingReadCopyWith<$Res> {
  _$ListingReadCopyWithImpl(this._self, this._then);

  final ListingRead _self;
  final $Res Function(ListingRead) _then;

/// Create a copy of ListingRead
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listingId = null,Object? need = null,Object? verdict = null,Object? quote = freezed,}) {
  return _then(ListingRead(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as HomeNeed,verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadVerdict,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingRead].
extension ListingReadPatterns on ListingRead {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingRead value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingRead() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingRead value)  $default,){
final _that = this;
switch (_that) {
case _ListingRead():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingRead value)?  $default,){
final _that = this;
switch (_that) {
case _ListingRead() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String listingId,  HomeNeed need,  ReadVerdict verdict,  String? quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingRead() when $default != null:
return $default(_that.listingId,_that.need,_that.verdict,_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String listingId,  HomeNeed need,  ReadVerdict verdict,  String? quote)  $default,) {final _that = this;
switch (_that) {
case _ListingRead():
return $default(_that.listingId,_that.need,_that.verdict,_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String listingId,  HomeNeed need,  ReadVerdict verdict,  String? quote)?  $default,) {final _that = this;
switch (_that) {
case _ListingRead() when $default != null:
return $default(_that.listingId,_that.need,_that.verdict,_that.quote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingRead implements ListingRead {
  const _ListingRead({required this.listingId, required this.need, required this.verdict, this.quote});
  factory _ListingRead.fromJson(Map<String, dynamic> json) => _$ListingReadFromJson(json);

@override final  String listingId;
@override final  HomeNeed need;
@override final  ReadVerdict verdict;
@override final  String? quote;

/// Create a copy of ListingRead
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingReadCopyWith<_ListingRead> get copyWith => __$ListingReadCopyWithImpl<_ListingRead>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingReadToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingRead&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.need, need) || other.need == need)&&(identical(other.verdict, verdict) || other.verdict == verdict)&&(identical(other.quote, quote) || other.quote == quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,listingId,need,verdict,quote);
}

@override
String toString() {
    return 'ListingRead(listingId: $listingId, need: $need, verdict: $verdict, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$ListingReadCopyWith<$Res> implements $ListingReadCopyWith<$Res> {
  factory _$ListingReadCopyWith(_ListingRead value, $Res Function(_ListingRead) _then) = __$ListingReadCopyWithImpl;
@override @useResult
$Res call({
 String listingId, HomeNeed need, ReadVerdict verdict, String? quote
});




}
/// @nodoc
class __$ListingReadCopyWithImpl<$Res>
    implements _$ListingReadCopyWith<$Res> {
  __$ListingReadCopyWithImpl(this._self, this._then);

  final _ListingRead _self;
  final $Res Function(_ListingRead) _then;

/// Create a copy of ListingRead
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listingId = null,Object? need = null,Object? verdict = null,Object? quote = freezed,}) {
  return _then(_ListingRead(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as HomeNeed,verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadVerdict,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
