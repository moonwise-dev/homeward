// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryExample {

 String get surfaceId; String get name; List<Map<String, Object?>> get components; Map<String, Object?> get dataModel;
/// Create a copy of GalleryExample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryExampleCopyWith<GalleryExample> get copyWith => _$GalleryExampleCopyWithImpl<GalleryExample>(this as GalleryExample, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GalleryExample;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryExample&&(identical(other.surfaceId, _this.surfaceId) || other.surfaceId == _this.surfaceId)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.components, _this.components)&&const DeepCollectionEquality().equals(other.dataModel, _this.dataModel));
}


@override
int get hashCode {
  final _this = this as GalleryExample;
  return Object.hash(runtimeType,_this.surfaceId,_this.name,const DeepCollectionEquality().hash(_this.components),const DeepCollectionEquality().hash(_this.dataModel));
}

@override
String toString() {
  final _this = this as GalleryExample;
  return 'GalleryExample(surfaceId: ${_this.surfaceId}, name: ${_this.name}, components: ${_this.components}, dataModel: ${_this.dataModel})';
}


}

/// @nodoc
abstract mixin class $GalleryExampleCopyWith<$Res>  {
  factory $GalleryExampleCopyWith(GalleryExample value, $Res Function(GalleryExample) _then) = _$GalleryExampleCopyWithImpl;
@useResult
$Res call({
 String surfaceId, String name, List<Map<String, Object?>> components, Map<String, Object?> dataModel
});




}
/// @nodoc
class _$GalleryExampleCopyWithImpl<$Res>
    implements $GalleryExampleCopyWith<$Res> {
  _$GalleryExampleCopyWithImpl(this._self, this._then);

  final GalleryExample _self;
  final $Res Function(GalleryExample) _then;

/// Create a copy of GalleryExample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surfaceId = null,Object? name = null,Object? components = null,Object? dataModel = null,}) {
  return _then(GalleryExample(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,components: null == components ? _self.components : components // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,dataModel: null == dataModel ? _self.dataModel : dataModel // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryExample].
extension GalleryExamplePatterns on GalleryExample {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryExample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryExample() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryExample value)  $default,){
final _that = this;
switch (_that) {
case _GalleryExample():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryExample value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryExample() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String surfaceId,  String name,  List<Map<String, Object?>> components,  Map<String, Object?> dataModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryExample() when $default != null:
return $default(_that.surfaceId,_that.name,_that.components,_that.dataModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String surfaceId,  String name,  List<Map<String, Object?>> components,  Map<String, Object?> dataModel)  $default,) {final _that = this;
switch (_that) {
case _GalleryExample():
return $default(_that.surfaceId,_that.name,_that.components,_that.dataModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String surfaceId,  String name,  List<Map<String, Object?>> components,  Map<String, Object?> dataModel)?  $default,) {final _that = this;
switch (_that) {
case _GalleryExample() when $default != null:
return $default(_that.surfaceId,_that.name,_that.components,_that.dataModel);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryExample implements GalleryExample {
  const _GalleryExample({required this.surfaceId, required this.name, required  List<Map<String, Object?>> components, required  Map<String, Object?> dataModel}): _components = components,_dataModel = dataModel;
  

@override final  String surfaceId;
@override final  String name;
 final  List<Map<String, Object?>> _components;
@override List<Map<String, Object?>> get components {
  if (_components is EqualUnmodifiableListView) return _components;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_components);
}

 final  Map<String, Object?> _dataModel;
@override Map<String, Object?> get dataModel {
  if (_dataModel is EqualUnmodifiableMapView) return _dataModel;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_dataModel);
}


/// Create a copy of GalleryExample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryExampleCopyWith<_GalleryExample> get copyWith => __$GalleryExampleCopyWithImpl<_GalleryExample>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryExample&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.components, _components)&&const DeepCollectionEquality().equals(other.dataModel, _dataModel));
}


@override
int get hashCode {
    return Object.hash(runtimeType,surfaceId,name,const DeepCollectionEquality().hash(_components),const DeepCollectionEquality().hash(_dataModel));
}

@override
String toString() {
    return 'GalleryExample(surfaceId: $surfaceId, name: $name, components: $components, dataModel: $dataModel)';
}


}

/// @nodoc
abstract mixin class _$GalleryExampleCopyWith<$Res> implements $GalleryExampleCopyWith<$Res> {
  factory _$GalleryExampleCopyWith(_GalleryExample value, $Res Function(_GalleryExample) _then) = __$GalleryExampleCopyWithImpl;
@override @useResult
$Res call({
 String surfaceId, String name, List<Map<String, Object?>> components, Map<String, Object?> dataModel
});




}
/// @nodoc
class __$GalleryExampleCopyWithImpl<$Res>
    implements _$GalleryExampleCopyWith<$Res> {
  __$GalleryExampleCopyWithImpl(this._self, this._then);

  final _GalleryExample _self;
  final $Res Function(_GalleryExample) _then;

/// Create a copy of GalleryExample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surfaceId = null,Object? name = null,Object? components = null,Object? dataModel = null,}) {
  return _then(_GalleryExample(
surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,components: null == components ? _self._components : components // ignore: cast_nullable_to_non_nullable
as List<Map<String, Object?>>,dataModel: null == dataModel ? _self._dataModel : dataModel // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc
mixin _$GalleryComponent {

 String get name; CatalogFamily get family; String get description; List<ComponentParameter> get parameters; List<GalleryExample> get examples;
/// Create a copy of GalleryComponent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryComponentCopyWith<GalleryComponent> get copyWith => _$GalleryComponentCopyWithImpl<GalleryComponent>(this as GalleryComponent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GalleryComponent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryComponent&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.family, _this.family) || other.family == _this.family)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.parameters, _this.parameters)&&const DeepCollectionEquality().equals(other.examples, _this.examples));
}


@override
int get hashCode {
  final _this = this as GalleryComponent;
  return Object.hash(runtimeType,_this.name,_this.family,_this.description,const DeepCollectionEquality().hash(_this.parameters),const DeepCollectionEquality().hash(_this.examples));
}

@override
String toString() {
  final _this = this as GalleryComponent;
  return 'GalleryComponent(name: ${_this.name}, family: ${_this.family}, description: ${_this.description}, parameters: ${_this.parameters}, examples: ${_this.examples})';
}


}

/// @nodoc
abstract mixin class $GalleryComponentCopyWith<$Res>  {
  factory $GalleryComponentCopyWith(GalleryComponent value, $Res Function(GalleryComponent) _then) = _$GalleryComponentCopyWithImpl;
@useResult
$Res call({
 String name, CatalogFamily family, String description, List<ComponentParameter> parameters, List<GalleryExample> examples
});




}
/// @nodoc
class _$GalleryComponentCopyWithImpl<$Res>
    implements $GalleryComponentCopyWith<$Res> {
  _$GalleryComponentCopyWithImpl(this._self, this._then);

  final GalleryComponent _self;
  final $Res Function(GalleryComponent) _then;

/// Create a copy of GalleryComponent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? family = null,Object? description = null,Object? parameters = null,Object? examples = null,}) {
  return _then(GalleryComponent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as CatalogFamily,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<ComponentParameter>,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<GalleryExample>,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryComponent].
extension GalleryComponentPatterns on GalleryComponent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryComponent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryComponent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryComponent value)  $default,){
final _that = this;
switch (_that) {
case _GalleryComponent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryComponent value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryComponent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  CatalogFamily family,  String description,  List<ComponentParameter> parameters,  List<GalleryExample> examples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryComponent() when $default != null:
return $default(_that.name,_that.family,_that.description,_that.parameters,_that.examples);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  CatalogFamily family,  String description,  List<ComponentParameter> parameters,  List<GalleryExample> examples)  $default,) {final _that = this;
switch (_that) {
case _GalleryComponent():
return $default(_that.name,_that.family,_that.description,_that.parameters,_that.examples);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  CatalogFamily family,  String description,  List<ComponentParameter> parameters,  List<GalleryExample> examples)?  $default,) {final _that = this;
switch (_that) {
case _GalleryComponent() when $default != null:
return $default(_that.name,_that.family,_that.description,_that.parameters,_that.examples);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryComponent implements GalleryComponent {
  const _GalleryComponent({required this.name, required this.family, required this.description, required  List<ComponentParameter> parameters, required  List<GalleryExample> examples}): _parameters = parameters,_examples = examples;
  

@override final  String name;
@override final  CatalogFamily family;
@override final  String description;
 final  List<ComponentParameter> _parameters;
@override List<ComponentParameter> get parameters {
  if (_parameters is EqualUnmodifiableListView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parameters);
}

 final  List<GalleryExample> _examples;
@override List<GalleryExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}


/// Create a copy of GalleryComponent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryComponentCopyWith<_GalleryComponent> get copyWith => __$GalleryComponentCopyWithImpl<_GalleryComponent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryComponent&&(identical(other.name, name) || other.name == name)&&(identical(other.family, family) || other.family == family)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, _parameters)&&const DeepCollectionEquality().equals(other.examples, _examples));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,family,description,const DeepCollectionEquality().hash(_parameters),const DeepCollectionEquality().hash(_examples));
}

@override
String toString() {
    return 'GalleryComponent(name: $name, family: $family, description: $description, parameters: $parameters, examples: $examples)';
}


}

/// @nodoc
abstract mixin class _$GalleryComponentCopyWith<$Res> implements $GalleryComponentCopyWith<$Res> {
  factory _$GalleryComponentCopyWith(_GalleryComponent value, $Res Function(_GalleryComponent) _then) = __$GalleryComponentCopyWithImpl;
@override @useResult
$Res call({
 String name, CatalogFamily family, String description, List<ComponentParameter> parameters, List<GalleryExample> examples
});




}
/// @nodoc
class __$GalleryComponentCopyWithImpl<$Res>
    implements _$GalleryComponentCopyWith<$Res> {
  __$GalleryComponentCopyWithImpl(this._self, this._then);

  final _GalleryComponent _self;
  final $Res Function(_GalleryComponent) _then;

/// Create a copy of GalleryComponent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? family = null,Object? description = null,Object? parameters = null,Object? examples = null,}) {
  return _then(_GalleryComponent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as CatalogFamily,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<ComponentParameter>,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<GalleryExample>,
  ));
}


}

// dart format on
