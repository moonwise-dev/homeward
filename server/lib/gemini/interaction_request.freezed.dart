// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InteractionRequest {

 InteractionInput get input; String? get systemInstruction; List<FunctionDeclaration> get tools; String? get thinkingLevel; String? get previousInteractionId;
/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InteractionRequestCopyWith<InteractionRequest> get copyWith => _$InteractionRequestCopyWithImpl<InteractionRequest>(this as InteractionRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InteractionRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionRequest&&(identical(other.input, _this.input) || other.input == _this.input)&&(identical(other.systemInstruction, _this.systemInstruction) || other.systemInstruction == _this.systemInstruction)&&const DeepCollectionEquality().equals(other.tools, _this.tools)&&(identical(other.thinkingLevel, _this.thinkingLevel) || other.thinkingLevel == _this.thinkingLevel)&&(identical(other.previousInteractionId, _this.previousInteractionId) || other.previousInteractionId == _this.previousInteractionId));
}


@override
int get hashCode {
  final _this = this as InteractionRequest;
  return Object.hash(runtimeType,_this.input,_this.systemInstruction,const DeepCollectionEquality().hash(_this.tools),_this.thinkingLevel,_this.previousInteractionId);
}

@override
String toString() {
  final _this = this as InteractionRequest;
  return 'InteractionRequest(input: ${_this.input}, systemInstruction: ${_this.systemInstruction}, tools: ${_this.tools}, thinkingLevel: ${_this.thinkingLevel}, previousInteractionId: ${_this.previousInteractionId})';
}


}

/// @nodoc
abstract mixin class $InteractionRequestCopyWith<$Res>  {
  factory $InteractionRequestCopyWith(InteractionRequest value, $Res Function(InteractionRequest) _then) = _$InteractionRequestCopyWithImpl;
@useResult
$Res call({
 InteractionInput input, String? systemInstruction, List<FunctionDeclaration> tools, String? thinkingLevel, String? previousInteractionId
});


$InteractionInputCopyWith<$Res> get input;

}
/// @nodoc
class _$InteractionRequestCopyWithImpl<$Res>
    implements $InteractionRequestCopyWith<$Res> {
  _$InteractionRequestCopyWithImpl(this._self, this._then);

  final InteractionRequest _self;
  final $Res Function(InteractionRequest) _then;

/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? input = null,Object? systemInstruction = freezed,Object? tools = null,Object? thinkingLevel = freezed,Object? previousInteractionId = freezed,}) {
  return _then(InteractionRequest(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InteractionInput,systemInstruction: freezed == systemInstruction ? _self.systemInstruction : systemInstruction // ignore: cast_nullable_to_non_nullable
as String?,tools: null == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<FunctionDeclaration>,thinkingLevel: freezed == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String?,previousInteractionId: freezed == previousInteractionId ? _self.previousInteractionId : previousInteractionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InteractionInputCopyWith<$Res> get input {
  
  return $InteractionInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// Adds pattern-matching-related methods to [InteractionRequest].
extension InteractionRequestPatterns on InteractionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InteractionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InteractionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InteractionRequest value)  $default,){
final _that = this;
switch (_that) {
case _InteractionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InteractionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _InteractionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InteractionInput input,  String? systemInstruction,  List<FunctionDeclaration> tools,  String? thinkingLevel,  String? previousInteractionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InteractionRequest() when $default != null:
return $default(_that.input,_that.systemInstruction,_that.tools,_that.thinkingLevel,_that.previousInteractionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InteractionInput input,  String? systemInstruction,  List<FunctionDeclaration> tools,  String? thinkingLevel,  String? previousInteractionId)  $default,) {final _that = this;
switch (_that) {
case _InteractionRequest():
return $default(_that.input,_that.systemInstruction,_that.tools,_that.thinkingLevel,_that.previousInteractionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InteractionInput input,  String? systemInstruction,  List<FunctionDeclaration> tools,  String? thinkingLevel,  String? previousInteractionId)?  $default,) {final _that = this;
switch (_that) {
case _InteractionRequest() when $default != null:
return $default(_that.input,_that.systemInstruction,_that.tools,_that.thinkingLevel,_that.previousInteractionId);case _:
  return null;

}
}

}

/// @nodoc


class _InteractionRequest extends InteractionRequest {
  const _InteractionRequest({required this.input, this.systemInstruction,  List<FunctionDeclaration> tools = const [], this.thinkingLevel, this.previousInteractionId}): _tools = tools,super._();
  

@override final  InteractionInput input;
@override final  String? systemInstruction;
 final  List<FunctionDeclaration> _tools;
@override@JsonKey() List<FunctionDeclaration> get tools {
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tools);
}

@override final  String? thinkingLevel;
@override final  String? previousInteractionId;

/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InteractionRequestCopyWith<_InteractionRequest> get copyWith => __$InteractionRequestCopyWithImpl<_InteractionRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InteractionRequest&&(identical(other.input, input) || other.input == input)&&(identical(other.systemInstruction, systemInstruction) || other.systemInstruction == systemInstruction)&&const DeepCollectionEquality().equals(other.tools, _tools)&&(identical(other.thinkingLevel, thinkingLevel) || other.thinkingLevel == thinkingLevel)&&(identical(other.previousInteractionId, previousInteractionId) || other.previousInteractionId == previousInteractionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,input,systemInstruction,const DeepCollectionEquality().hash(_tools),thinkingLevel,previousInteractionId);
}

@override
String toString() {
    return 'InteractionRequest(input: $input, systemInstruction: $systemInstruction, tools: $tools, thinkingLevel: $thinkingLevel, previousInteractionId: $previousInteractionId)';
}


}

/// @nodoc
abstract mixin class _$InteractionRequestCopyWith<$Res> implements $InteractionRequestCopyWith<$Res> {
  factory _$InteractionRequestCopyWith(_InteractionRequest value, $Res Function(_InteractionRequest) _then) = __$InteractionRequestCopyWithImpl;
@override @useResult
$Res call({
 InteractionInput input, String? systemInstruction, List<FunctionDeclaration> tools, String? thinkingLevel, String? previousInteractionId
});


@override $InteractionInputCopyWith<$Res> get input;

}
/// @nodoc
class __$InteractionRequestCopyWithImpl<$Res>
    implements _$InteractionRequestCopyWith<$Res> {
  __$InteractionRequestCopyWithImpl(this._self, this._then);

  final _InteractionRequest _self;
  final $Res Function(_InteractionRequest) _then;

/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? input = null,Object? systemInstruction = freezed,Object? tools = null,Object? thinkingLevel = freezed,Object? previousInteractionId = freezed,}) {
  return _then(_InteractionRequest(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as InteractionInput,systemInstruction: freezed == systemInstruction ? _self.systemInstruction : systemInstruction // ignore: cast_nullable_to_non_nullable
as String?,tools: null == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<FunctionDeclaration>,thinkingLevel: freezed == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String?,previousInteractionId: freezed == previousInteractionId ? _self.previousInteractionId : previousInteractionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of InteractionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InteractionInputCopyWith<$Res> get input {
  
  return $InteractionInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}

// dart format on
