// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryState {

 List<GalleryComponent> get components; GalleryComponent? get selected; String? get unknown; int get exampleIndex;
/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryStateCopyWith<GalleryState> get copyWith => _$GalleryStateCopyWithImpl<GalleryState>(this as GalleryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GalleryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryState&&const DeepCollectionEquality().equals(other.components, _this.components)&&(identical(other.selected, _this.selected) || other.selected == _this.selected)&&(identical(other.unknown, _this.unknown) || other.unknown == _this.unknown)&&(identical(other.exampleIndex, _this.exampleIndex) || other.exampleIndex == _this.exampleIndex));
}


@override
int get hashCode {
  final _this = this as GalleryState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.components),_this.selected,_this.unknown,_this.exampleIndex);
}

@override
String toString() {
  final _this = this as GalleryState;
  return 'GalleryState(components: ${_this.components}, selected: ${_this.selected}, unknown: ${_this.unknown}, exampleIndex: ${_this.exampleIndex})';
}


}

/// @nodoc
abstract mixin class $GalleryStateCopyWith<$Res>  {
  factory $GalleryStateCopyWith(GalleryState value, $Res Function(GalleryState) _then) = _$GalleryStateCopyWithImpl;
@useResult
$Res call({
 List<GalleryComponent> components, GalleryComponent? selected, String? unknown, int exampleIndex
});


$GalleryComponentCopyWith<$Res>? get selected;

}
/// @nodoc
class _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._self, this._then);

  final GalleryState _self;
  final $Res Function(GalleryState) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? components = null,Object? selected = freezed,Object? unknown = freezed,Object? exampleIndex = null,}) {
  return _then(GalleryState(
components: null == components ? _self.components : components // ignore: cast_nullable_to_non_nullable
as List<GalleryComponent>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as GalleryComponent?,unknown: freezed == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as String?,exampleIndex: null == exampleIndex ? _self.exampleIndex : exampleIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryComponentCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $GalleryComponentCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [GalleryState].
extension GalleryStatePatterns on GalleryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryState value)  $default,){
final _that = this;
switch (_that) {
case _GalleryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryState value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GalleryComponent> components,  GalleryComponent? selected,  String? unknown,  int exampleIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that.components,_that.selected,_that.unknown,_that.exampleIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GalleryComponent> components,  GalleryComponent? selected,  String? unknown,  int exampleIndex)  $default,) {final _that = this;
switch (_that) {
case _GalleryState():
return $default(_that.components,_that.selected,_that.unknown,_that.exampleIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GalleryComponent> components,  GalleryComponent? selected,  String? unknown,  int exampleIndex)?  $default,) {final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that.components,_that.selected,_that.unknown,_that.exampleIndex);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryState extends GalleryState {
  const _GalleryState({required  List<GalleryComponent> components, this.selected, this.unknown, this.exampleIndex = 0}): _components = components,super._();
  

 final  List<GalleryComponent> _components;
@override List<GalleryComponent> get components {
  if (_components is EqualUnmodifiableListView) return _components;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_components);
}

@override final  GalleryComponent? selected;
@override final  String? unknown;
@override@JsonKey() final  int exampleIndex;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryStateCopyWith<_GalleryState> get copyWith => __$GalleryStateCopyWithImpl<_GalleryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryState&&const DeepCollectionEquality().equals(other.components, _components)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.unknown, unknown) || other.unknown == unknown)&&(identical(other.exampleIndex, exampleIndex) || other.exampleIndex == exampleIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_components),selected,unknown,exampleIndex);
}

@override
String toString() {
    return 'GalleryState(components: $components, selected: $selected, unknown: $unknown, exampleIndex: $exampleIndex)';
}


}

/// @nodoc
abstract mixin class _$GalleryStateCopyWith<$Res> implements $GalleryStateCopyWith<$Res> {
  factory _$GalleryStateCopyWith(_GalleryState value, $Res Function(_GalleryState) _then) = __$GalleryStateCopyWithImpl;
@override @useResult
$Res call({
 List<GalleryComponent> components, GalleryComponent? selected, String? unknown, int exampleIndex
});


@override $GalleryComponentCopyWith<$Res>? get selected;

}
/// @nodoc
class __$GalleryStateCopyWithImpl<$Res>
    implements _$GalleryStateCopyWith<$Res> {
  __$GalleryStateCopyWithImpl(this._self, this._then);

  final _GalleryState _self;
  final $Res Function(_GalleryState) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? components = null,Object? selected = freezed,Object? unknown = freezed,Object? exampleIndex = null,}) {
  return _then(_GalleryState(
components: null == components ? _self._components : components // ignore: cast_nullable_to_non_nullable
as List<GalleryComponent>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as GalleryComponent?,unknown: freezed == unknown ? _self.unknown : unknown // ignore: cast_nullable_to_non_nullable
as String?,exampleIndex: null == exampleIndex ? _self.exampleIndex : exampleIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryComponentCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $GalleryComponentCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
