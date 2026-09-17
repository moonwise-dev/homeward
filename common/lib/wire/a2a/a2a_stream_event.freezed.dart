// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a2a_stream_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
A2aStreamEvent _$A2aStreamEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'task':
          return A2aTask.fromJson(
            json
          );
                case 'status-update':
          return TaskStatusUpdate.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'A2aStreamEvent',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$A2aStreamEvent {

 String get contextId; TaskStatus get status;
/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aStreamEventCopyWith<A2aStreamEvent> get copyWith => _$A2aStreamEventCopyWithImpl<A2aStreamEvent>(this as A2aStreamEvent, _$identity);

  /// Serializes this A2aStreamEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as A2aStreamEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aStreamEvent&&(identical(other.contextId, _this.contextId) || other.contextId == _this.contextId)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as A2aStreamEvent;
  return Object.hash(runtimeType,_this.contextId,_this.status);
}

@override
String toString() {
  final _this = this as A2aStreamEvent;
  return 'A2aStreamEvent(contextId: ${_this.contextId}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $A2aStreamEventCopyWith<$Res>  {
  factory $A2aStreamEventCopyWith(A2aStreamEvent value, $Res Function(A2aStreamEvent) _then) = _$A2aStreamEventCopyWithImpl;
@useResult
$Res call({
 String contextId, TaskStatus status
});


$TaskStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$A2aStreamEventCopyWithImpl<$Res>
    implements $A2aStreamEventCopyWith<$Res> {
  _$A2aStreamEventCopyWithImpl(this._self, this._then);

  final A2aStreamEvent _self;
  final $Res Function(A2aStreamEvent) _then;

/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contextId = null,Object? status = null,}) {
  return _then(_self.copyWith(
contextId: null == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,
  ));
}
/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskStatusCopyWith<$Res> get status {
  
  return $TaskStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [A2aStreamEvent].
extension A2aStreamEventPatterns on A2aStreamEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( A2aTask value)?  task,TResult Function( TaskStatusUpdate value)?  statusUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case A2aTask() when task != null:
return task(_that);case TaskStatusUpdate() when statusUpdate != null:
return statusUpdate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( A2aTask value)  task,required TResult Function( TaskStatusUpdate value)  statusUpdate,}){
final _that = this;
switch (_that) {
case A2aTask():
return task(_that);case TaskStatusUpdate():
return statusUpdate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( A2aTask value)?  task,TResult? Function( TaskStatusUpdate value)?  statusUpdate,}){
final _that = this;
switch (_that) {
case A2aTask() when task != null:
return task(_that);case TaskStatusUpdate() when statusUpdate != null:
return statusUpdate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String contextId,  TaskStatus status)?  task,TResult Function( String taskId,  String contextId,  TaskStatus status, @JsonKey(name: 'final')  bool isFinal)?  statusUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case A2aTask() when task != null:
return task(_that.id,_that.contextId,_that.status);case TaskStatusUpdate() when statusUpdate != null:
return statusUpdate(_that.taskId,_that.contextId,_that.status,_that.isFinal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String contextId,  TaskStatus status)  task,required TResult Function( String taskId,  String contextId,  TaskStatus status, @JsonKey(name: 'final')  bool isFinal)  statusUpdate,}) {final _that = this;
switch (_that) {
case A2aTask():
return task(_that.id,_that.contextId,_that.status);case TaskStatusUpdate():
return statusUpdate(_that.taskId,_that.contextId,_that.status,_that.isFinal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String contextId,  TaskStatus status)?  task,TResult? Function( String taskId,  String contextId,  TaskStatus status, @JsonKey(name: 'final')  bool isFinal)?  statusUpdate,}) {final _that = this;
switch (_that) {
case A2aTask() when task != null:
return task(_that.id,_that.contextId,_that.status);case TaskStatusUpdate() when statusUpdate != null:
return statusUpdate(_that.taskId,_that.contextId,_that.status,_that.isFinal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class A2aTask implements A2aStreamEvent {
  const A2aTask({required this.id, required this.contextId, required this.status,  String? $type}): $type = $type ?? 'task';
  factory A2aTask.fromJson(Map<String, dynamic> json) => _$A2aTaskFromJson(json);

 final  String id;
@override final  String contextId;
@override final  TaskStatus status;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aTaskCopyWith<A2aTask> get copyWith => _$A2aTaskCopyWithImpl<A2aTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$A2aTaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aTask&&(identical(other.id, id) || other.id == id)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,contextId,status);
}

@override
String toString() {
    return 'A2aStreamEvent.task(id: $id, contextId: $contextId, status: $status)';
}


}

/// @nodoc
abstract mixin class $A2aTaskCopyWith<$Res> implements $A2aStreamEventCopyWith<$Res> {
  factory $A2aTaskCopyWith(A2aTask value, $Res Function(A2aTask) _then) = _$A2aTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String contextId, TaskStatus status
});


@override $TaskStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$A2aTaskCopyWithImpl<$Res>
    implements $A2aTaskCopyWith<$Res> {
  _$A2aTaskCopyWithImpl(this._self, this._then);

  final A2aTask _self;
  final $Res Function(A2aTask) _then;

/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contextId = null,Object? status = null,}) {
  return _then(A2aTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contextId: null == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,
  ));
}

/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskStatusCopyWith<$Res> get status {
  
  return $TaskStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TaskStatusUpdate implements A2aStreamEvent {
  const TaskStatusUpdate({required this.taskId, required this.contextId, required this.status, @JsonKey(name: 'final') this.isFinal = false,  String? $type}): $type = $type ?? 'status-update';
  factory TaskStatusUpdate.fromJson(Map<String, dynamic> json) => _$TaskStatusUpdateFromJson(json);

 final  String taskId;
@override final  String contextId;
@override final  TaskStatus status;
@JsonKey(name: 'final') final  bool isFinal;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStatusUpdateCopyWith<TaskStatusUpdate> get copyWith => _$TaskStatusUpdateCopyWithImpl<TaskStatusUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskStatusUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskStatusUpdate&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,taskId,contextId,status,isFinal);
}

@override
String toString() {
    return 'A2aStreamEvent.statusUpdate(taskId: $taskId, contextId: $contextId, status: $status, isFinal: $isFinal)';
}


}

/// @nodoc
abstract mixin class $TaskStatusUpdateCopyWith<$Res> implements $A2aStreamEventCopyWith<$Res> {
  factory $TaskStatusUpdateCopyWith(TaskStatusUpdate value, $Res Function(TaskStatusUpdate) _then) = _$TaskStatusUpdateCopyWithImpl;
@override @useResult
$Res call({
 String taskId, String contextId, TaskStatus status,@JsonKey(name: 'final') bool isFinal
});


@override $TaskStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$TaskStatusUpdateCopyWithImpl<$Res>
    implements $TaskStatusUpdateCopyWith<$Res> {
  _$TaskStatusUpdateCopyWithImpl(this._self, this._then);

  final TaskStatusUpdate _self;
  final $Res Function(TaskStatusUpdate) _then;

/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? contextId = null,Object? status = null,Object? isFinal = null,}) {
  return _then(TaskStatusUpdate(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,contextId: null == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of A2aStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskStatusCopyWith<$Res> get status {
  
  return $TaskStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
