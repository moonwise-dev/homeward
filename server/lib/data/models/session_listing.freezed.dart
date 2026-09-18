// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionListing {

 String get id; int get turnCount; String? get title; String? get marketId; DateTime? get updatedAt;
/// Create a copy of SessionListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionListingCopyWith<SessionListing> get copyWith => _$SessionListingCopyWithImpl<SessionListing>(this as SessionListing, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionListing;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionListing&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.turnCount, _this.turnCount) || other.turnCount == _this.turnCount)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.marketId, _this.marketId) || other.marketId == _this.marketId)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as SessionListing;
  return Object.hash(runtimeType,_this.id,_this.turnCount,_this.title,_this.marketId,_this.updatedAt);
}

@override
String toString() {
  final _this = this as SessionListing;
  return 'SessionListing(id: ${_this.id}, turnCount: ${_this.turnCount}, title: ${_this.title}, marketId: ${_this.marketId}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $SessionListingCopyWith<$Res>  {
  factory $SessionListingCopyWith(SessionListing value, $Res Function(SessionListing) _then) = _$SessionListingCopyWithImpl;
@useResult
$Res call({
 String id, int turnCount, String? title, String? marketId, DateTime? updatedAt
});




}
/// @nodoc
class _$SessionListingCopyWithImpl<$Res>
    implements $SessionListingCopyWith<$Res> {
  _$SessionListingCopyWithImpl(this._self, this._then);

  final SessionListing _self;
  final $Res Function(SessionListing) _then;

/// Create a copy of SessionListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? turnCount = null,Object? title = freezed,Object? marketId = freezed,Object? updatedAt = freezed,}) {
  return _then(SessionListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionListing].
extension SessionListingPatterns on SessionListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionListing value)  $default,){
final _that = this;
switch (_that) {
case _SessionListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionListing value)?  $default,){
final _that = this;
switch (_that) {
case _SessionListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int turnCount,  String? title,  String? marketId,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionListing() when $default != null:
return $default(_that.id,_that.turnCount,_that.title,_that.marketId,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int turnCount,  String? title,  String? marketId,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SessionListing():
return $default(_that.id,_that.turnCount,_that.title,_that.marketId,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int turnCount,  String? title,  String? marketId,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionListing() when $default != null:
return $default(_that.id,_that.turnCount,_that.title,_that.marketId,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SessionListing implements SessionListing {
  const _SessionListing({required this.id, this.turnCount = 0, this.title, this.marketId, this.updatedAt});
  

@override final  String id;
@override@JsonKey() final  int turnCount;
@override final  String? title;
@override final  String? marketId;
@override final  DateTime? updatedAt;

/// Create a copy of SessionListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionListingCopyWith<_SessionListing> get copyWith => __$SessionListingCopyWithImpl<_SessionListing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionListing&&(identical(other.id, id) || other.id == id)&&(identical(other.turnCount, turnCount) || other.turnCount == turnCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.marketId, marketId) || other.marketId == marketId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,turnCount,title,marketId,updatedAt);
}

@override
String toString() {
    return 'SessionListing(id: $id, turnCount: $turnCount, title: $title, marketId: $marketId, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SessionListingCopyWith<$Res> implements $SessionListingCopyWith<$Res> {
  factory _$SessionListingCopyWith(_SessionListing value, $Res Function(_SessionListing) _then) = __$SessionListingCopyWithImpl;
@override @useResult
$Res call({
 String id, int turnCount, String? title, String? marketId, DateTime? updatedAt
});




}
/// @nodoc
class __$SessionListingCopyWithImpl<$Res>
    implements _$SessionListingCopyWith<$Res> {
  __$SessionListingCopyWithImpl(this._self, this._then);

  final _SessionListing _self;
  final $Res Function(_SessionListing) _then;

/// Create a copy of SessionListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? turnCount = null,Object? title = freezed,Object? marketId = freezed,Object? updatedAt = freezed,}) {
  return _then(_SessionListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketId: freezed == marketId ? _self.marketId : marketId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
