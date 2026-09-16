// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'function_declaration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FunctionDeclaration {

 String get name; String get description; Map<String, Object?> get parameters;
/// Create a copy of FunctionDeclaration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionDeclarationCopyWith<FunctionDeclaration> get copyWith => _$FunctionDeclarationCopyWithImpl<FunctionDeclaration>(this as FunctionDeclaration, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FunctionDeclaration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionDeclaration&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.parameters, _this.parameters));
}


@override
int get hashCode {
  final _this = this as FunctionDeclaration;
  return Object.hash(runtimeType,_this.name,_this.description,const DeepCollectionEquality().hash(_this.parameters));
}

@override
String toString() {
  final _this = this as FunctionDeclaration;
  return 'FunctionDeclaration(name: ${_this.name}, description: ${_this.description}, parameters: ${_this.parameters})';
}


}

/// @nodoc
abstract mixin class $FunctionDeclarationCopyWith<$Res>  {
  factory $FunctionDeclarationCopyWith(FunctionDeclaration value, $Res Function(FunctionDeclaration) _then) = _$FunctionDeclarationCopyWithImpl;
@useResult
$Res call({
 String name, String description, Map<String, Object?> parameters
});




}
/// @nodoc
class _$FunctionDeclarationCopyWithImpl<$Res>
    implements $FunctionDeclarationCopyWith<$Res> {
  _$FunctionDeclarationCopyWithImpl(this._self, this._then);

  final FunctionDeclaration _self;
  final $Res Function(FunctionDeclaration) _then;

/// Create a copy of FunctionDeclaration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(FunctionDeclaration(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [FunctionDeclaration].
extension FunctionDeclarationPatterns on FunctionDeclaration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FunctionDeclaration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FunctionDeclaration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FunctionDeclaration value)  $default,){
final _that = this;
switch (_that) {
case _FunctionDeclaration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FunctionDeclaration value)?  $default,){
final _that = this;
switch (_that) {
case _FunctionDeclaration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  Map<String, Object?> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FunctionDeclaration() when $default != null:
return $default(_that.name,_that.description,_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  Map<String, Object?> parameters)  $default,) {final _that = this;
switch (_that) {
case _FunctionDeclaration():
return $default(_that.name,_that.description,_that.parameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  Map<String, Object?> parameters)?  $default,) {final _that = this;
switch (_that) {
case _FunctionDeclaration() when $default != null:
return $default(_that.name,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc


class _FunctionDeclaration extends FunctionDeclaration {
  const _FunctionDeclaration({required this.name, required this.description, required  Map<String, Object?> parameters}): _parameters = parameters,super._();
  

@override final  String name;
@override final  String description;
 final  Map<String, Object?> _parameters;
@override Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of FunctionDeclaration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FunctionDeclarationCopyWith<_FunctionDeclaration> get copyWith => __$FunctionDeclarationCopyWithImpl<_FunctionDeclaration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FunctionDeclaration&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, _parameters));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_parameters));
}

@override
String toString() {
    return 'FunctionDeclaration(name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$FunctionDeclarationCopyWith<$Res> implements $FunctionDeclarationCopyWith<$Res> {
  factory _$FunctionDeclarationCopyWith(_FunctionDeclaration value, $Res Function(_FunctionDeclaration) _then) = __$FunctionDeclarationCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, Map<String, Object?> parameters
});




}
/// @nodoc
class __$FunctionDeclarationCopyWithImpl<$Res>
    implements _$FunctionDeclarationCopyWith<$Res> {
  __$FunctionDeclarationCopyWithImpl(this._self, this._then);

  final _FunctionDeclaration _self;
  final $Res Function(_FunctionDeclaration) _then;

/// Create a copy of FunctionDeclaration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_FunctionDeclaration(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
