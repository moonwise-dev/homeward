// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryEntry {

 String get surfaceId; String get title; String get subtitle;
/// Create a copy of GalleryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryEntryCopyWith<GalleryEntry> get copyWith => _$GalleryEntryCopyWithImpl<GalleryEntry>(this as GalleryEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GalleryEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryEntry&&(identical(other.surfaceId, _this.surfaceId) || other.surfaceId == _this.surfaceId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle));
}


@override
int get hashCode {
  final _this = this as GalleryEntry;
  return Object.hash(runtimeType,_this.surfaceId,_this.title,_this.subtitle);
}

@override
String toString() {
  final _this = this as GalleryEntry;
  return 'GalleryEntry(surfaceId: ${_this.surfaceId}, title: ${_this.title}, subtitle: ${_this.subtitle})';
}


}

/// @nodoc
abstract mixin class $GalleryEntryCopyWith<$Res>  {
  factory $GalleryEntryCopyWith(GalleryEntry value, $Res Function(GalleryEntry) _then) = _$GalleryEntryCopyWithImpl;
@useResult
$Res call({
 String surfaceId, String title, String subtitle
});




}
/// @nodoc
class _$GalleryEntryCopyWithImpl<$Res>
    implements $GalleryEntryCopyWith<$Res> {
  _$GalleryEntryCopyWithImpl(this._self, this._then);

  final GalleryEntry _self;
  final $Res Function(GalleryEntry) _then;

/// Create a copy of GalleryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surfaceId = null,Object? title = null,Object? subtitle = null,}) {
  return _then(GalleryEntry(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryEntry].
extension GalleryEntryPatterns on GalleryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryEntry value)  $default,){
final _that = this;
switch (_that) {
case _GalleryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String surfaceId,  String title,  String subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryEntry() when $default != null:
return $default(_that.surfaceId,_that.title,_that.subtitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String surfaceId,  String title,  String subtitle)  $default,) {final _that = this;
switch (_that) {
case _GalleryEntry():
return $default(_that.surfaceId,_that.title,_that.subtitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String surfaceId,  String title,  String subtitle)?  $default,) {final _that = this;
switch (_that) {
case _GalleryEntry() when $default != null:
return $default(_that.surfaceId,_that.title,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryEntry implements GalleryEntry {
  const _GalleryEntry({required this.surfaceId, required this.title, required this.subtitle});
  

@override final  String surfaceId;
@override final  String title;
@override final  String subtitle;

/// Create a copy of GalleryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryEntryCopyWith<_GalleryEntry> get copyWith => __$GalleryEntryCopyWithImpl<_GalleryEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryEntry&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}


@override
int get hashCode {
    return Object.hash(runtimeType,surfaceId,title,subtitle);
}

@override
String toString() {
    return 'GalleryEntry(surfaceId: $surfaceId, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$GalleryEntryCopyWith<$Res> implements $GalleryEntryCopyWith<$Res> {
  factory _$GalleryEntryCopyWith(_GalleryEntry value, $Res Function(_GalleryEntry) _then) = __$GalleryEntryCopyWithImpl;
@override @useResult
$Res call({
 String surfaceId, String title, String subtitle
});




}
/// @nodoc
class __$GalleryEntryCopyWithImpl<$Res>
    implements _$GalleryEntryCopyWith<$Res> {
  __$GalleryEntryCopyWithImpl(this._self, this._then);

  final _GalleryEntry _self;
  final $Res Function(_GalleryEntry) _then;

/// Create a copy of GalleryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surfaceId = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_GalleryEntry(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
