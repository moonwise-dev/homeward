// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_send_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageSendParams {

 A2aMessage get message; Map<String, Object?>? get configuration; Map<String, Object?>? get metadata;
/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageSendParamsCopyWith<MessageSendParams> get copyWith => _$MessageSendParamsCopyWithImpl<MessageSendParams>(this as MessageSendParams, _$identity);

  /// Serializes this MessageSendParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MessageSendParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageSendParams&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.configuration, _this.configuration)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MessageSendParams;
  return Object.hash(runtimeType,_this.message,const DeepCollectionEquality().hash(_this.configuration),const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as MessageSendParams;
  return 'MessageSendParams(message: ${_this.message}, configuration: ${_this.configuration}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $MessageSendParamsCopyWith<$Res>  {
  factory $MessageSendParamsCopyWith(MessageSendParams value, $Res Function(MessageSendParams) _then) = _$MessageSendParamsCopyWithImpl;
@useResult
$Res call({
 A2aMessage message, Map<String, Object?>? configuration, Map<String, Object?>? metadata
});


$A2aMessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageSendParamsCopyWithImpl<$Res>
    implements $MessageSendParamsCopyWith<$Res> {
  _$MessageSendParamsCopyWithImpl(this._self, this._then);

  final MessageSendParams _self;
  final $Res Function(MessageSendParams) _then;

/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? configuration = freezed,Object? metadata = freezed,}) {
  return _then(MessageSendParams(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as A2aMessage,configuration: freezed == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}
/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$A2aMessageCopyWith<$Res> get message {
  
  return $A2aMessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageSendParams].
extension MessageSendParamsPatterns on MessageSendParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageSendParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageSendParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageSendParams value)  $default,){
final _that = this;
switch (_that) {
case _MessageSendParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageSendParams value)?  $default,){
final _that = this;
switch (_that) {
case _MessageSendParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( A2aMessage message,  Map<String, Object?>? configuration,  Map<String, Object?>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageSendParams() when $default != null:
return $default(_that.message,_that.configuration,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( A2aMessage message,  Map<String, Object?>? configuration,  Map<String, Object?>? metadata)  $default,) {final _that = this;
switch (_that) {
case _MessageSendParams():
return $default(_that.message,_that.configuration,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( A2aMessage message,  Map<String, Object?>? configuration,  Map<String, Object?>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _MessageSendParams() when $default != null:
return $default(_that.message,_that.configuration,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageSendParams implements MessageSendParams {
  const _MessageSendParams({required this.message,  Map<String, Object?>? configuration,  Map<String, Object?>? metadata}): _configuration = configuration,_metadata = metadata;
  factory _MessageSendParams.fromJson(Map<String, dynamic> json) => _$MessageSendParamsFromJson(json);

@override final  A2aMessage message;
 final  Map<String, Object?>? _configuration;
@override Map<String, Object?>? get configuration {
  final value = _configuration;
  if (value == null) return null;
  if (_configuration is EqualUnmodifiableMapView) return _configuration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, Object?>? _metadata;
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageSendParamsCopyWith<_MessageSendParams> get copyWith => __$MessageSendParamsCopyWithImpl<_MessageSendParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageSendParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageSendParams&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.configuration, _configuration)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_configuration),const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'MessageSendParams(message: $message, configuration: $configuration, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MessageSendParamsCopyWith<$Res> implements $MessageSendParamsCopyWith<$Res> {
  factory _$MessageSendParamsCopyWith(_MessageSendParams value, $Res Function(_MessageSendParams) _then) = __$MessageSendParamsCopyWithImpl;
@override @useResult
$Res call({
 A2aMessage message, Map<String, Object?>? configuration, Map<String, Object?>? metadata
});


@override $A2aMessageCopyWith<$Res> get message;

}
/// @nodoc
class __$MessageSendParamsCopyWithImpl<$Res>
    implements _$MessageSendParamsCopyWith<$Res> {
  __$MessageSendParamsCopyWithImpl(this._self, this._then);

  final _MessageSendParams _self;
  final $Res Function(_MessageSendParams) _then;

/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? configuration = freezed,Object? metadata = freezed,}) {
  return _then(_MessageSendParams(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as A2aMessage,configuration: freezed == configuration ? _self._configuration : configuration // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

/// Create a copy of MessageSendParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$A2aMessageCopyWith<$Res> get message {
  
  return $A2aMessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
