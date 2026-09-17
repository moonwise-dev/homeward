// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a2a_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$A2aMessage {

 A2aRole get role; List<A2aPart> get parts; String get messageId; String? get contextId; String? get taskId; List<String>? get referenceTaskIds; Map<String, Object?>? get metadata; List<String>? get extensions; String get kind;
/// Create a copy of A2aMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aMessageCopyWith<A2aMessage> get copyWith => _$A2aMessageCopyWithImpl<A2aMessage>(this as A2aMessage, _$identity);

  /// Serializes this A2aMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as A2aMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aMessage&&(identical(other.role, _this.role) || other.role == _this.role)&&const DeepCollectionEquality().equals(other.parts, _this.parts)&&(identical(other.messageId, _this.messageId) || other.messageId == _this.messageId)&&(identical(other.contextId, _this.contextId) || other.contextId == _this.contextId)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&const DeepCollectionEquality().equals(other.referenceTaskIds, _this.referenceTaskIds)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&const DeepCollectionEquality().equals(other.extensions, _this.extensions)&&(identical(other.kind, _this.kind) || other.kind == _this.kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as A2aMessage;
  return Object.hash(runtimeType,_this.role,const DeepCollectionEquality().hash(_this.parts),_this.messageId,_this.contextId,_this.taskId,const DeepCollectionEquality().hash(_this.referenceTaskIds),const DeepCollectionEquality().hash(_this.metadata),const DeepCollectionEquality().hash(_this.extensions),_this.kind);
}

@override
String toString() {
  final _this = this as A2aMessage;
  return 'A2aMessage(role: ${_this.role}, parts: ${_this.parts}, messageId: ${_this.messageId}, contextId: ${_this.contextId}, taskId: ${_this.taskId}, referenceTaskIds: ${_this.referenceTaskIds}, metadata: ${_this.metadata}, extensions: ${_this.extensions}, kind: ${_this.kind})';
}


}

/// @nodoc
abstract mixin class $A2aMessageCopyWith<$Res>  {
  factory $A2aMessageCopyWith(A2aMessage value, $Res Function(A2aMessage) _then) = _$A2aMessageCopyWithImpl;
@useResult
$Res call({
 A2aRole role, List<A2aPart> parts, String messageId, String? contextId, String? taskId, List<String>? referenceTaskIds, Map<String, Object?>? metadata, List<String>? extensions, String kind
});




}
/// @nodoc
class _$A2aMessageCopyWithImpl<$Res>
    implements $A2aMessageCopyWith<$Res> {
  _$A2aMessageCopyWithImpl(this._self, this._then);

  final A2aMessage _self;
  final $Res Function(A2aMessage) _then;

/// Create a copy of A2aMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? parts = null,Object? messageId = null,Object? contextId = freezed,Object? taskId = freezed,Object? referenceTaskIds = freezed,Object? metadata = freezed,Object? extensions = freezed,Object? kind = null,}) {
  return _then(A2aMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as A2aRole,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<A2aPart>,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,referenceTaskIds: freezed == referenceTaskIds ? _self.referenceTaskIds : referenceTaskIds // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,extensions: freezed == extensions ? _self.extensions : extensions // ignore: cast_nullable_to_non_nullable
as List<String>?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [A2aMessage].
extension A2aMessagePatterns on A2aMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _A2aMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _A2aMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _A2aMessage value)  $default,){
final _that = this;
switch (_that) {
case _A2aMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _A2aMessage value)?  $default,){
final _that = this;
switch (_that) {
case _A2aMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( A2aRole role,  List<A2aPart> parts,  String messageId,  String? contextId,  String? taskId,  List<String>? referenceTaskIds,  Map<String, Object?>? metadata,  List<String>? extensions,  String kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _A2aMessage() when $default != null:
return $default(_that.role,_that.parts,_that.messageId,_that.contextId,_that.taskId,_that.referenceTaskIds,_that.metadata,_that.extensions,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( A2aRole role,  List<A2aPart> parts,  String messageId,  String? contextId,  String? taskId,  List<String>? referenceTaskIds,  Map<String, Object?>? metadata,  List<String>? extensions,  String kind)  $default,) {final _that = this;
switch (_that) {
case _A2aMessage():
return $default(_that.role,_that.parts,_that.messageId,_that.contextId,_that.taskId,_that.referenceTaskIds,_that.metadata,_that.extensions,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( A2aRole role,  List<A2aPart> parts,  String messageId,  String? contextId,  String? taskId,  List<String>? referenceTaskIds,  Map<String, Object?>? metadata,  List<String>? extensions,  String kind)?  $default,) {final _that = this;
switch (_that) {
case _A2aMessage() when $default != null:
return $default(_that.role,_that.parts,_that.messageId,_that.contextId,_that.taskId,_that.referenceTaskIds,_that.metadata,_that.extensions,_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _A2aMessage implements A2aMessage {
  const _A2aMessage({required this.role, required  List<A2aPart> parts, required this.messageId, this.contextId, this.taskId,  List<String>? referenceTaskIds,  Map<String, Object?>? metadata,  List<String>? extensions, this.kind = 'message'}): _parts = parts,_referenceTaskIds = referenceTaskIds,_metadata = metadata,_extensions = extensions;
  factory _A2aMessage.fromJson(Map<String, dynamic> json) => _$A2aMessageFromJson(json);

@override final  A2aRole role;
 final  List<A2aPart> _parts;
@override List<A2aPart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

@override final  String messageId;
@override final  String? contextId;
@override final  String? taskId;
 final  List<String>? _referenceTaskIds;
@override List<String>? get referenceTaskIds {
  final value = _referenceTaskIds;
  if (value == null) return null;
  if (_referenceTaskIds is EqualUnmodifiableListView) return _referenceTaskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, Object?>? _metadata;
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String>? _extensions;
@override List<String>? get extensions {
  final value = _extensions;
  if (value == null) return null;
  if (_extensions is EqualUnmodifiableListView) return _extensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String kind;

/// Create a copy of A2aMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$A2aMessageCopyWith<_A2aMessage> get copyWith => __$A2aMessageCopyWithImpl<_A2aMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$A2aMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _A2aMessage&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.parts, _parts)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&const DeepCollectionEquality().equals(other.referenceTaskIds, _referenceTaskIds)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&const DeepCollectionEquality().equals(other.extensions, _extensions)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,role,const DeepCollectionEquality().hash(_parts),messageId,contextId,taskId,const DeepCollectionEquality().hash(_referenceTaskIds),const DeepCollectionEquality().hash(_metadata),const DeepCollectionEquality().hash(_extensions),kind);
}

@override
String toString() {
    return 'A2aMessage(role: $role, parts: $parts, messageId: $messageId, contextId: $contextId, taskId: $taskId, referenceTaskIds: $referenceTaskIds, metadata: $metadata, extensions: $extensions, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$A2aMessageCopyWith<$Res> implements $A2aMessageCopyWith<$Res> {
  factory _$A2aMessageCopyWith(_A2aMessage value, $Res Function(_A2aMessage) _then) = __$A2aMessageCopyWithImpl;
@override @useResult
$Res call({
 A2aRole role, List<A2aPart> parts, String messageId, String? contextId, String? taskId, List<String>? referenceTaskIds, Map<String, Object?>? metadata, List<String>? extensions, String kind
});




}
/// @nodoc
class __$A2aMessageCopyWithImpl<$Res>
    implements _$A2aMessageCopyWith<$Res> {
  __$A2aMessageCopyWithImpl(this._self, this._then);

  final _A2aMessage _self;
  final $Res Function(_A2aMessage) _then;

/// Create a copy of A2aMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? parts = null,Object? messageId = null,Object? contextId = freezed,Object? taskId = freezed,Object? referenceTaskIds = freezed,Object? metadata = freezed,Object? extensions = freezed,Object? kind = null,}) {
  return _then(_A2aMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as A2aRole,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<A2aPart>,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,referenceTaskIds: freezed == referenceTaskIds ? _self._referenceTaskIds : referenceTaskIds // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,extensions: freezed == extensions ? _self._extensions : extensions // ignore: cast_nullable_to_non_nullable
as List<String>?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
