// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientAction {

 String get name; String get surfaceId; String get sourceComponentId; String? get timestamp; Map<String, Object?> get context;
/// Create a copy of ClientAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientActionCopyWith<ClientAction> get copyWith => _$ClientActionCopyWithImpl<ClientAction>(this as ClientAction, _$identity);

  /// Serializes this ClientAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClientAction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientAction&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.surfaceId, _this.surfaceId) || other.surfaceId == _this.surfaceId)&&(identical(other.sourceComponentId, _this.sourceComponentId) || other.sourceComponentId == _this.sourceComponentId)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&const DeepCollectionEquality().equals(other.context, _this.context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClientAction;
  return Object.hash(runtimeType,_this.name,_this.surfaceId,_this.sourceComponentId,_this.timestamp,const DeepCollectionEquality().hash(_this.context));
}

@override
String toString() {
  final _this = this as ClientAction;
  return 'ClientAction(name: ${_this.name}, surfaceId: ${_this.surfaceId}, sourceComponentId: ${_this.sourceComponentId}, timestamp: ${_this.timestamp}, context: ${_this.context})';
}


}

/// @nodoc
abstract mixin class $ClientActionCopyWith<$Res>  {
  factory $ClientActionCopyWith(ClientAction value, $Res Function(ClientAction) _then) = _$ClientActionCopyWithImpl;
@useResult
$Res call({
 String name, String surfaceId, String sourceComponentId, String? timestamp, Map<String, Object?> context
});




}
/// @nodoc
class _$ClientActionCopyWithImpl<$Res>
    implements $ClientActionCopyWith<$Res> {
  _$ClientActionCopyWithImpl(this._self, this._then);

  final ClientAction _self;
  final $Res Function(ClientAction) _then;

/// Create a copy of ClientAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? surfaceId = null,Object? sourceComponentId = null,Object? timestamp = freezed,Object? context = null,}) {
  return _then(ClientAction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,sourceComponentId: null == sourceComponentId ? _self.sourceComponentId : sourceComponentId // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientAction].
extension ClientActionPatterns on ClientAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientAction value)  $default,){
final _that = this;
switch (_that) {
case _ClientAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientAction value)?  $default,){
final _that = this;
switch (_that) {
case _ClientAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String surfaceId,  String sourceComponentId,  String? timestamp,  Map<String, Object?> context)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientAction() when $default != null:
return $default(_that.name,_that.surfaceId,_that.sourceComponentId,_that.timestamp,_that.context);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String surfaceId,  String sourceComponentId,  String? timestamp,  Map<String, Object?> context)  $default,) {final _that = this;
switch (_that) {
case _ClientAction():
return $default(_that.name,_that.surfaceId,_that.sourceComponentId,_that.timestamp,_that.context);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String surfaceId,  String sourceComponentId,  String? timestamp,  Map<String, Object?> context)?  $default,) {final _that = this;
switch (_that) {
case _ClientAction() when $default != null:
return $default(_that.name,_that.surfaceId,_that.sourceComponentId,_that.timestamp,_that.context);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientAction implements ClientAction {
  const _ClientAction({required this.name, required this.surfaceId, required this.sourceComponentId, this.timestamp,  Map<String, Object?> context = const {}}): _context = context;
  factory _ClientAction.fromJson(Map<String, dynamic> json) => _$ClientActionFromJson(json);

@override final  String name;
@override final  String surfaceId;
@override final  String sourceComponentId;
@override final  String? timestamp;
 final  Map<String, Object?> _context;
@override@JsonKey() Map<String, Object?> get context {
  if (_context is EqualUnmodifiableMapView) return _context;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_context);
}


/// Create a copy of ClientAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientActionCopyWith<_ClientAction> get copyWith => __$ClientActionCopyWithImpl<_ClientAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientActionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientAction&&(identical(other.name, name) || other.name == name)&&(identical(other.surfaceId, surfaceId) || other.surfaceId == surfaceId)&&(identical(other.sourceComponentId, sourceComponentId) || other.sourceComponentId == sourceComponentId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.context, _context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,surfaceId,sourceComponentId,timestamp,const DeepCollectionEquality().hash(_context));
}

@override
String toString() {
    return 'ClientAction(name: $name, surfaceId: $surfaceId, sourceComponentId: $sourceComponentId, timestamp: $timestamp, context: $context)';
}


}

/// @nodoc
abstract mixin class _$ClientActionCopyWith<$Res> implements $ClientActionCopyWith<$Res> {
  factory _$ClientActionCopyWith(_ClientAction value, $Res Function(_ClientAction) _then) = __$ClientActionCopyWithImpl;
@override @useResult
$Res call({
 String name, String surfaceId, String sourceComponentId, String? timestamp, Map<String, Object?> context
});




}
/// @nodoc
class __$ClientActionCopyWithImpl<$Res>
    implements _$ClientActionCopyWith<$Res> {
  __$ClientActionCopyWithImpl(this._self, this._then);

  final _ClientAction _self;
  final $Res Function(_ClientAction) _then;

/// Create a copy of ClientAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? surfaceId = null,Object? sourceComponentId = null,Object? timestamp = freezed,Object? context = null,}) {
  return _then(_ClientAction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surfaceId: null == surfaceId ? _self.surfaceId : surfaceId // ignore: cast_nullable_to_non_nullable
as String,sourceComponentId: null == sourceComponentId ? _self.sourceComponentId : sourceComponentId // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,context: null == context ? _self._context : context // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
