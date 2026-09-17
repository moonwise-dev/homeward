// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogGalleryState {

 List<GalleryEntry> get entries;
/// Create a copy of CatalogGalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogGalleryStateCopyWith<CatalogGalleryState> get copyWith => _$CatalogGalleryStateCopyWithImpl<CatalogGalleryState>(this as CatalogGalleryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatalogGalleryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogGalleryState&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as CatalogGalleryState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as CatalogGalleryState;
  return 'CatalogGalleryState(entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $CatalogGalleryStateCopyWith<$Res>  {
  factory $CatalogGalleryStateCopyWith(CatalogGalleryState value, $Res Function(CatalogGalleryState) _then) = _$CatalogGalleryStateCopyWithImpl;
@useResult
$Res call({
 List<GalleryEntry> entries
});




}
/// @nodoc
class _$CatalogGalleryStateCopyWithImpl<$Res>
    implements $CatalogGalleryStateCopyWith<$Res> {
  _$CatalogGalleryStateCopyWithImpl(this._self, this._then);

  final CatalogGalleryState _self;
  final $Res Function(CatalogGalleryState) _then;

/// Create a copy of CatalogGalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,}) {
  return _then(CatalogGalleryState(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<GalleryEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogGalleryState].
extension CatalogGalleryStatePatterns on CatalogGalleryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogGalleryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogGalleryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogGalleryState value)  $default,){
final _that = this;
switch (_that) {
case _CatalogGalleryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogGalleryState value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogGalleryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GalleryEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogGalleryState() when $default != null:
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GalleryEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _CatalogGalleryState():
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GalleryEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _CatalogGalleryState() when $default != null:
return $default(_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogGalleryState implements CatalogGalleryState {
  const _CatalogGalleryState({required  List<GalleryEntry> entries}): _entries = entries;
  

 final  List<GalleryEntry> _entries;
@override List<GalleryEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of CatalogGalleryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogGalleryStateCopyWith<_CatalogGalleryState> get copyWith => __$CatalogGalleryStateCopyWithImpl<_CatalogGalleryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogGalleryState&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'CatalogGalleryState(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$CatalogGalleryStateCopyWith<$Res> implements $CatalogGalleryStateCopyWith<$Res> {
  factory _$CatalogGalleryStateCopyWith(_CatalogGalleryState value, $Res Function(_CatalogGalleryState) _then) = __$CatalogGalleryStateCopyWithImpl;
@override @useResult
$Res call({
 List<GalleryEntry> entries
});




}
/// @nodoc
class __$CatalogGalleryStateCopyWithImpl<$Res>
    implements _$CatalogGalleryStateCopyWith<$Res> {
  __$CatalogGalleryStateCopyWithImpl(this._self, this._then);

  final _CatalogGalleryState _self;
  final $Res Function(_CatalogGalleryState) _then;

/// Create a copy of CatalogGalleryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_CatalogGalleryState(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<GalleryEntry>,
  ));
}


}

// dart format on
