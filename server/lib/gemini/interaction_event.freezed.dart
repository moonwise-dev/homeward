// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InteractionEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InteractionEvent()';
}


}

/// @nodoc
class $InteractionEventCopyWith<$Res>  {
$InteractionEventCopyWith(InteractionEvent _, $Res Function(InteractionEvent) __);
}


/// Adds pattern-matching-related methods to [InteractionEvent].
extension InteractionEventPatterns on InteractionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InteractionCreated value)?  created,TResult Function( TextDelta value)?  textDelta,TResult Function( FunctionCall value)?  functionCall,TResult Function( InteractionCompleted value)?  completed,TResult Function( ModelFailed value)?  modelFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InteractionCreated() when created != null:
return created(_that);case TextDelta() when textDelta != null:
return textDelta(_that);case FunctionCall() when functionCall != null:
return functionCall(_that);case InteractionCompleted() when completed != null:
return completed(_that);case ModelFailed() when modelFailed != null:
return modelFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InteractionCreated value)  created,required TResult Function( TextDelta value)  textDelta,required TResult Function( FunctionCall value)  functionCall,required TResult Function( InteractionCompleted value)  completed,required TResult Function( ModelFailed value)  modelFailed,}){
final _that = this;
switch (_that) {
case InteractionCreated():
return created(_that);case TextDelta():
return textDelta(_that);case FunctionCall():
return functionCall(_that);case InteractionCompleted():
return completed(_that);case ModelFailed():
return modelFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InteractionCreated value)?  created,TResult? Function( TextDelta value)?  textDelta,TResult? Function( FunctionCall value)?  functionCall,TResult? Function( InteractionCompleted value)?  completed,TResult? Function( ModelFailed value)?  modelFailed,}){
final _that = this;
switch (_that) {
case InteractionCreated() when created != null:
return created(_that);case TextDelta() when textDelta != null:
return textDelta(_that);case FunctionCall() when functionCall != null:
return functionCall(_that);case InteractionCompleted() when completed != null:
return completed(_that);case ModelFailed() when modelFailed != null:
return modelFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String interactionId,  String model)?  created,TResult Function( String text)?  textDelta,TResult Function( String callId,  String name,  Map<String, Object?> arguments)?  functionCall,TResult Function( String interactionId,  String status,  Map<String, Object?>? usage)?  completed,TResult Function( String model,  GeminiException reason)?  modelFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InteractionCreated() when created != null:
return created(_that.interactionId,_that.model);case TextDelta() when textDelta != null:
return textDelta(_that.text);case FunctionCall() when functionCall != null:
return functionCall(_that.callId,_that.name,_that.arguments);case InteractionCompleted() when completed != null:
return completed(_that.interactionId,_that.status,_that.usage);case ModelFailed() when modelFailed != null:
return modelFailed(_that.model,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String interactionId,  String model)  created,required TResult Function( String text)  textDelta,required TResult Function( String callId,  String name,  Map<String, Object?> arguments)  functionCall,required TResult Function( String interactionId,  String status,  Map<String, Object?>? usage)  completed,required TResult Function( String model,  GeminiException reason)  modelFailed,}) {final _that = this;
switch (_that) {
case InteractionCreated():
return created(_that.interactionId,_that.model);case TextDelta():
return textDelta(_that.text);case FunctionCall():
return functionCall(_that.callId,_that.name,_that.arguments);case InteractionCompleted():
return completed(_that.interactionId,_that.status,_that.usage);case ModelFailed():
return modelFailed(_that.model,_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String interactionId,  String model)?  created,TResult? Function( String text)?  textDelta,TResult? Function( String callId,  String name,  Map<String, Object?> arguments)?  functionCall,TResult? Function( String interactionId,  String status,  Map<String, Object?>? usage)?  completed,TResult? Function( String model,  GeminiException reason)?  modelFailed,}) {final _that = this;
switch (_that) {
case InteractionCreated() when created != null:
return created(_that.interactionId,_that.model);case TextDelta() when textDelta != null:
return textDelta(_that.text);case FunctionCall() when functionCall != null:
return functionCall(_that.callId,_that.name,_that.arguments);case InteractionCompleted() when completed != null:
return completed(_that.interactionId,_that.status,_that.usage);case ModelFailed() when modelFailed != null:
return modelFailed(_that.model,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class InteractionCreated implements InteractionEvent {
  const InteractionCreated({required this.interactionId, required this.model});
  

 final  String interactionId;
 final  String model;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InteractionCreatedCopyWith<InteractionCreated> get copyWith => _$InteractionCreatedCopyWithImpl<InteractionCreated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionCreated&&(identical(other.interactionId, interactionId) || other.interactionId == interactionId)&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode {
    return Object.hash(runtimeType,interactionId,model);
}

@override
String toString() {
    return 'InteractionEvent.created(interactionId: $interactionId, model: $model)';
}


}

/// @nodoc
abstract mixin class $InteractionCreatedCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $InteractionCreatedCopyWith(InteractionCreated value, $Res Function(InteractionCreated) _then) = _$InteractionCreatedCopyWithImpl;
@useResult
$Res call({
 String interactionId, String model
});




}
/// @nodoc
class _$InteractionCreatedCopyWithImpl<$Res>
    implements $InteractionCreatedCopyWith<$Res> {
  _$InteractionCreatedCopyWithImpl(this._self, this._then);

  final InteractionCreated _self;
  final $Res Function(InteractionCreated) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interactionId = null,Object? model = null,}) {
  return _then(InteractionCreated(
interactionId: null == interactionId ? _self.interactionId : interactionId // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TextDelta implements InteractionEvent {
  const TextDelta(this.text);
  

 final  String text;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextDeltaCopyWith<TextDelta> get copyWith => _$TextDeltaCopyWithImpl<TextDelta>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TextDelta&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'InteractionEvent.textDelta(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextDeltaCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $TextDeltaCopyWith(TextDelta value, $Res Function(TextDelta) _then) = _$TextDeltaCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextDeltaCopyWithImpl<$Res>
    implements $TextDeltaCopyWith<$Res> {
  _$TextDeltaCopyWithImpl(this._self, this._then);

  final TextDelta _self;
  final $Res Function(TextDelta) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextDelta(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FunctionCall implements InteractionEvent {
  const FunctionCall({required this.callId, required this.name, required  Map<String, Object?> arguments}): _arguments = arguments;
  

 final  String callId;
 final  String name;
 final  Map<String, Object?> _arguments;
 Map<String, Object?> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionCallCopyWith<FunctionCall> get copyWith => _$FunctionCallCopyWithImpl<FunctionCall>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionCall&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.arguments, _arguments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,callId,name,const DeepCollectionEquality().hash(_arguments));
}

@override
String toString() {
    return 'InteractionEvent.functionCall(callId: $callId, name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $FunctionCallCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $FunctionCallCopyWith(FunctionCall value, $Res Function(FunctionCall) _then) = _$FunctionCallCopyWithImpl;
@useResult
$Res call({
 String callId, String name, Map<String, Object?> arguments
});




}
/// @nodoc
class _$FunctionCallCopyWithImpl<$Res>
    implements $FunctionCallCopyWith<$Res> {
  _$FunctionCallCopyWithImpl(this._self, this._then);

  final FunctionCall _self;
  final $Res Function(FunctionCall) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? callId = null,Object? name = null,Object? arguments = null,}) {
  return _then(FunctionCall(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc


class InteractionCompleted implements InteractionEvent {
  const InteractionCompleted({required this.interactionId, required this.status,  Map<String, Object?>? usage}): _usage = usage;
  

 final  String interactionId;
 final  String status;
 final  Map<String, Object?>? _usage;
 Map<String, Object?>? get usage {
  final value = _usage;
  if (value == null) return null;
  if (_usage is EqualUnmodifiableMapView) return _usage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InteractionCompletedCopyWith<InteractionCompleted> get copyWith => _$InteractionCompletedCopyWithImpl<InteractionCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionCompleted&&(identical(other.interactionId, interactionId) || other.interactionId == interactionId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.usage, _usage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,interactionId,status,const DeepCollectionEquality().hash(_usage));
}

@override
String toString() {
    return 'InteractionEvent.completed(interactionId: $interactionId, status: $status, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $InteractionCompletedCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $InteractionCompletedCopyWith(InteractionCompleted value, $Res Function(InteractionCompleted) _then) = _$InteractionCompletedCopyWithImpl;
@useResult
$Res call({
 String interactionId, String status, Map<String, Object?>? usage
});




}
/// @nodoc
class _$InteractionCompletedCopyWithImpl<$Res>
    implements $InteractionCompletedCopyWith<$Res> {
  _$InteractionCompletedCopyWithImpl(this._self, this._then);

  final InteractionCompleted _self;
  final $Res Function(InteractionCompleted) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interactionId = null,Object? status = null,Object? usage = freezed,}) {
  return _then(InteractionCompleted(
interactionId: null == interactionId ? _self.interactionId : interactionId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,usage: freezed == usage ? _self._usage : usage // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

/// @nodoc


class ModelFailed implements InteractionEvent {
  const ModelFailed({required this.model, required this.reason});
  

 final  String model;
 final  GeminiException reason;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelFailedCopyWith<ModelFailed> get copyWith => _$ModelFailedCopyWithImpl<ModelFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelFailed&&(identical(other.model, model) || other.model == model)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,model,reason);
}

@override
String toString() {
    return 'InteractionEvent.modelFailed(model: $model, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $ModelFailedCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $ModelFailedCopyWith(ModelFailed value, $Res Function(ModelFailed) _then) = _$ModelFailedCopyWithImpl;
@useResult
$Res call({
 String model, GeminiException reason
});




}
/// @nodoc
class _$ModelFailedCopyWithImpl<$Res>
    implements $ModelFailedCopyWith<$Res> {
  _$ModelFailedCopyWithImpl(this._self, this._then);

  final ModelFailed _self;
  final $Res Function(ModelFailed) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = null,Object? reason = null,}) {
  return _then(ModelFailed(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as GeminiException,
  ));
}


}

// dart format on
