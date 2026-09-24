// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AgentEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AgentEvent()';
}


}

/// @nodoc
class $AgentEventCopyWith<$Res>  {
$AgentEventCopyWith(AgentEvent _, $Res Function(AgentEvent) __);
}


/// Adds pattern-matching-related methods to [AgentEvent].
extension AgentEventPatterns on AgentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AgentStarted value)?  started,TResult Function( AgentText value)?  text,TResult Function( AgentA2ui value)?  a2ui,TResult Function( AgentProgress value)?  progress,TResult Function( AgentCompleted value)?  completed,TResult Function( AgentCanceled value)?  canceled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AgentStarted() when started != null:
return started(_that);case AgentText() when text != null:
return text(_that);case AgentA2ui() when a2ui != null:
return a2ui(_that);case AgentProgress() when progress != null:
return progress(_that);case AgentCompleted() when completed != null:
return completed(_that);case AgentCanceled() when canceled != null:
return canceled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AgentStarted value)  started,required TResult Function( AgentText value)  text,required TResult Function( AgentA2ui value)  a2ui,required TResult Function( AgentProgress value)  progress,required TResult Function( AgentCompleted value)  completed,required TResult Function( AgentCanceled value)  canceled,}){
final _that = this;
switch (_that) {
case AgentStarted():
return started(_that);case AgentText():
return text(_that);case AgentA2ui():
return a2ui(_that);case AgentProgress():
return progress(_that);case AgentCompleted():
return completed(_that);case AgentCanceled():
return canceled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AgentStarted value)?  started,TResult? Function( AgentText value)?  text,TResult? Function( AgentA2ui value)?  a2ui,TResult? Function( AgentProgress value)?  progress,TResult? Function( AgentCompleted value)?  completed,TResult? Function( AgentCanceled value)?  canceled,}){
final _that = this;
switch (_that) {
case AgentStarted() when started != null:
return started(_that);case AgentText() when text != null:
return text(_that);case AgentA2ui() when a2ui != null:
return a2ui(_that);case AgentProgress() when progress != null:
return progress(_that);case AgentCompleted() when completed != null:
return completed(_that);case AgentCanceled() when canceled != null:
return canceled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String taskId)?  started,TResult Function( String text)?  text,TResult Function( Map<String, Object?> message)?  a2ui,TResult Function( ResearchProgress progress)?  progress,TResult Function( String text)?  completed,TResult Function()?  canceled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AgentStarted() when started != null:
return started(_that.taskId);case AgentText() when text != null:
return text(_that.text);case AgentA2ui() when a2ui != null:
return a2ui(_that.message);case AgentProgress() when progress != null:
return progress(_that.progress);case AgentCompleted() when completed != null:
return completed(_that.text);case AgentCanceled() when canceled != null:
return canceled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String taskId)  started,required TResult Function( String text)  text,required TResult Function( Map<String, Object?> message)  a2ui,required TResult Function( ResearchProgress progress)  progress,required TResult Function( String text)  completed,required TResult Function()  canceled,}) {final _that = this;
switch (_that) {
case AgentStarted():
return started(_that.taskId);case AgentText():
return text(_that.text);case AgentA2ui():
return a2ui(_that.message);case AgentProgress():
return progress(_that.progress);case AgentCompleted():
return completed(_that.text);case AgentCanceled():
return canceled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String taskId)?  started,TResult? Function( String text)?  text,TResult? Function( Map<String, Object?> message)?  a2ui,TResult? Function( ResearchProgress progress)?  progress,TResult? Function( String text)?  completed,TResult? Function()?  canceled,}) {final _that = this;
switch (_that) {
case AgentStarted() when started != null:
return started(_that.taskId);case AgentText() when text != null:
return text(_that.text);case AgentA2ui() when a2ui != null:
return a2ui(_that.message);case AgentProgress() when progress != null:
return progress(_that.progress);case AgentCompleted() when completed != null:
return completed(_that.text);case AgentCanceled() when canceled != null:
return canceled();case _:
  return null;

}
}

}

/// @nodoc


class AgentStarted implements AgentEvent {
  const AgentStarted({required this.taskId});
  

 final  String taskId;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentStartedCopyWith<AgentStarted> get copyWith => _$AgentStartedCopyWithImpl<AgentStarted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentStarted&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,taskId);
}

@override
String toString() {
    return 'AgentEvent.started(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $AgentStartedCopyWith<$Res> implements $AgentEventCopyWith<$Res> {
  factory $AgentStartedCopyWith(AgentStarted value, $Res Function(AgentStarted) _then) = _$AgentStartedCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$AgentStartedCopyWithImpl<$Res>
    implements $AgentStartedCopyWith<$Res> {
  _$AgentStartedCopyWithImpl(this._self, this._then);

  final AgentStarted _self;
  final $Res Function(AgentStarted) _then;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(AgentStarted(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AgentText implements AgentEvent {
  const AgentText(this.text);
  

 final  String text;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentTextCopyWith<AgentText> get copyWith => _$AgentTextCopyWithImpl<AgentText>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentText&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'AgentEvent.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $AgentTextCopyWith<$Res> implements $AgentEventCopyWith<$Res> {
  factory $AgentTextCopyWith(AgentText value, $Res Function(AgentText) _then) = _$AgentTextCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$AgentTextCopyWithImpl<$Res>
    implements $AgentTextCopyWith<$Res> {
  _$AgentTextCopyWithImpl(this._self, this._then);

  final AgentText _self;
  final $Res Function(AgentText) _then;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(AgentText(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AgentA2ui implements AgentEvent {
  const AgentA2ui( Map<String, Object?> message): _message = message;
  

 final  Map<String, Object?> _message;
 Map<String, Object?> get message {
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_message);
}


/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentA2uiCopyWith<AgentA2ui> get copyWith => _$AgentA2uiCopyWithImpl<AgentA2ui>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentA2ui&&const DeepCollectionEquality().equals(other.message, _message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_message));
}

@override
String toString() {
    return 'AgentEvent.a2ui(message: $message)';
}


}

/// @nodoc
abstract mixin class $AgentA2uiCopyWith<$Res> implements $AgentEventCopyWith<$Res> {
  factory $AgentA2uiCopyWith(AgentA2ui value, $Res Function(AgentA2ui) _then) = _$AgentA2uiCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> message
});




}
/// @nodoc
class _$AgentA2uiCopyWithImpl<$Res>
    implements $AgentA2uiCopyWith<$Res> {
  _$AgentA2uiCopyWithImpl(this._self, this._then);

  final AgentA2ui _self;
  final $Res Function(AgentA2ui) _then;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AgentA2ui(
null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc


class AgentProgress implements AgentEvent {
  const AgentProgress(this.progress);
  

 final  ResearchProgress progress;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentProgressCopyWith<AgentProgress> get copyWith => _$AgentProgressCopyWithImpl<AgentProgress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentProgress&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode {
    return Object.hash(runtimeType,progress);
}

@override
String toString() {
    return 'AgentEvent.progress(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $AgentProgressCopyWith<$Res> implements $AgentEventCopyWith<$Res> {
  factory $AgentProgressCopyWith(AgentProgress value, $Res Function(AgentProgress) _then) = _$AgentProgressCopyWithImpl;
@useResult
$Res call({
 ResearchProgress progress
});


$ResearchProgressCopyWith<$Res> get progress;

}
/// @nodoc
class _$AgentProgressCopyWithImpl<$Res>
    implements $AgentProgressCopyWith<$Res> {
  _$AgentProgressCopyWithImpl(this._self, this._then);

  final AgentProgress _self;
  final $Res Function(AgentProgress) _then;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(AgentProgress(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ResearchProgress,
  ));
}

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResearchProgressCopyWith<$Res> get progress {
  
  return $ResearchProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc


class AgentCompleted implements AgentEvent {
  const AgentCompleted(this.text);
  

 final  String text;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentCompletedCopyWith<AgentCompleted> get copyWith => _$AgentCompletedCopyWithImpl<AgentCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentCompleted&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'AgentEvent.completed(text: $text)';
}


}

/// @nodoc
abstract mixin class $AgentCompletedCopyWith<$Res> implements $AgentEventCopyWith<$Res> {
  factory $AgentCompletedCopyWith(AgentCompleted value, $Res Function(AgentCompleted) _then) = _$AgentCompletedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$AgentCompletedCopyWithImpl<$Res>
    implements $AgentCompletedCopyWith<$Res> {
  _$AgentCompletedCopyWithImpl(this._self, this._then);

  final AgentCompleted _self;
  final $Res Function(AgentCompleted) _then;

/// Create a copy of AgentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(AgentCompleted(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AgentCanceled implements AgentEvent {
  const AgentCanceled();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentCanceled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AgentEvent.canceled()';
}


}




// dart format on
