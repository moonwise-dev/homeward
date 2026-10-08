// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanConversation {

 List<TranscriptEntry> get entries; bool get isRunning;
/// Create a copy of PlanConversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanConversationCopyWith<PlanConversation> get copyWith => _$PlanConversationCopyWithImpl<PlanConversation>(this as PlanConversation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanConversation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanConversation&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.isRunning, _this.isRunning) || other.isRunning == _this.isRunning));
}


@override
int get hashCode {
  final _this = this as PlanConversation;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.entries),_this.isRunning);
}

@override
String toString() {
  final _this = this as PlanConversation;
  return 'PlanConversation(entries: ${_this.entries}, isRunning: ${_this.isRunning})';
}


}

/// @nodoc
abstract mixin class $PlanConversationCopyWith<$Res>  {
  factory $PlanConversationCopyWith(PlanConversation value, $Res Function(PlanConversation) _then) = _$PlanConversationCopyWithImpl;
@useResult
$Res call({
 List<TranscriptEntry> entries, bool isRunning
});




}
/// @nodoc
class _$PlanConversationCopyWithImpl<$Res>
    implements $PlanConversationCopyWith<$Res> {
  _$PlanConversationCopyWithImpl(this._self, this._then);

  final PlanConversation _self;
  final $Res Function(PlanConversation) _then;

/// Create a copy of PlanConversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? isRunning = null,}) {
  return _then(PlanConversation(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<TranscriptEntry>,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanConversation].
extension PlanConversationPatterns on PlanConversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanConversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanConversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanConversation value)  $default,){
final _that = this;
switch (_that) {
case _PlanConversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanConversation value)?  $default,){
final _that = this;
switch (_that) {
case _PlanConversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TranscriptEntry> entries,  bool isRunning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanConversation() when $default != null:
return $default(_that.entries,_that.isRunning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TranscriptEntry> entries,  bool isRunning)  $default,) {final _that = this;
switch (_that) {
case _PlanConversation():
return $default(_that.entries,_that.isRunning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TranscriptEntry> entries,  bool isRunning)?  $default,) {final _that = this;
switch (_that) {
case _PlanConversation() when $default != null:
return $default(_that.entries,_that.isRunning);case _:
  return null;

}
}

}

/// @nodoc


class _PlanConversation implements PlanConversation {
  const _PlanConversation({ List<TranscriptEntry> entries = const [], this.isRunning = false}): _entries = entries;
  

 final  List<TranscriptEntry> _entries;
@override@JsonKey() List<TranscriptEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool isRunning;

/// Create a copy of PlanConversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanConversationCopyWith<_PlanConversation> get copyWith => __$PlanConversationCopyWithImpl<_PlanConversation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanConversation&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),isRunning);
}

@override
String toString() {
    return 'PlanConversation(entries: $entries, isRunning: $isRunning)';
}


}

/// @nodoc
abstract mixin class _$PlanConversationCopyWith<$Res> implements $PlanConversationCopyWith<$Res> {
  factory _$PlanConversationCopyWith(_PlanConversation value, $Res Function(_PlanConversation) _then) = __$PlanConversationCopyWithImpl;
@override @useResult
$Res call({
 List<TranscriptEntry> entries, bool isRunning
});




}
/// @nodoc
class __$PlanConversationCopyWithImpl<$Res>
    implements _$PlanConversationCopyWith<$Res> {
  __$PlanConversationCopyWithImpl(this._self, this._then);

  final _PlanConversation _self;
  final $Res Function(_PlanConversation) _then;

/// Create a copy of PlanConversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? isRunning = null,}) {
  return _then(_PlanConversation(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<TranscriptEntry>,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TranscriptEntry {

 String get id;
/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptEntryCopyWith<TranscriptEntry> get copyWith => _$TranscriptEntryCopyWithImpl<TranscriptEntry>(this as TranscriptEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TranscriptEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranscriptEntry&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as TranscriptEntry;
  return Object.hash(runtimeType,_this.id);
}

@override
String toString() {
  final _this = this as TranscriptEntry;
  return 'TranscriptEntry(id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $TranscriptEntryCopyWith<$Res>  {
  factory $TranscriptEntryCopyWith(TranscriptEntry value, $Res Function(TranscriptEntry) _then) = _$TranscriptEntryCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TranscriptEntryCopyWithImpl<$Res>
    implements $TranscriptEntryCopyWith<$Res> {
  _$TranscriptEntryCopyWithImpl(this._self, this._then);

  final TranscriptEntry _self;
  final $Res Function(TranscriptEntry) _then;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TranscriptEntry].
extension TranscriptEntryPatterns on TranscriptEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BuyerEntry value)?  buyer,TResult Function( BuyerActionEntry value)?  buyerAction,TResult Function( AgentEntry value)?  agent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that);case AgentEntry() when agent != null:
return agent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BuyerEntry value)  buyer,required TResult Function( BuyerActionEntry value)  buyerAction,required TResult Function( AgentEntry value)  agent,}){
final _that = this;
switch (_that) {
case BuyerEntry():
return buyer(_that);case BuyerActionEntry():
return buyerAction(_that);case AgentEntry():
return agent(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BuyerEntry value)?  buyer,TResult? Function( BuyerActionEntry value)?  buyerAction,TResult? Function( AgentEntry value)?  agent,}){
final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that);case AgentEntry() when agent != null:
return agent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String text)?  buyer,TResult Function( String id,  String actionName,  String? label)?  buyerAction,TResult Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  List<PlanChange> planChanges,  AppError? error)?  agent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that.id,_that.text);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that.id,_that.actionName,_that.label);case AgentEntry() when agent != null:
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.planChanges,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String text)  buyer,required TResult Function( String id,  String actionName,  String? label)  buyerAction,required TResult Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  List<PlanChange> planChanges,  AppError? error)  agent,}) {final _that = this;
switch (_that) {
case BuyerEntry():
return buyer(_that.id,_that.text);case BuyerActionEntry():
return buyerAction(_that.id,_that.actionName,_that.label);case AgentEntry():
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.planChanges,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String text)?  buyer,TResult? Function( String id,  String actionName,  String? label)?  buyerAction,TResult? Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  List<PlanChange> planChanges,  AppError? error)?  agent,}) {final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that.id,_that.text);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that.id,_that.actionName,_that.label);case AgentEntry() when agent != null:
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.planChanges,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class BuyerEntry implements TranscriptEntry {
  const BuyerEntry({required this.id, required this.text});
  

@override final  String id;
 final  String text;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerEntryCopyWith<BuyerEntry> get copyWith => _$BuyerEntryCopyWithImpl<BuyerEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,text);
}

@override
String toString() {
    return 'TranscriptEntry.buyer(id: $id, text: $text)';
}


}

/// @nodoc
abstract mixin class $BuyerEntryCopyWith<$Res> implements $TranscriptEntryCopyWith<$Res> {
  factory $BuyerEntryCopyWith(BuyerEntry value, $Res Function(BuyerEntry) _then) = _$BuyerEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String text
});




}
/// @nodoc
class _$BuyerEntryCopyWithImpl<$Res>
    implements $BuyerEntryCopyWith<$Res> {
  _$BuyerEntryCopyWithImpl(this._self, this._then);

  final BuyerEntry _self;
  final $Res Function(BuyerEntry) _then;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,}) {
  return _then(BuyerEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BuyerActionEntry implements TranscriptEntry {
  const BuyerActionEntry({required this.id, required this.actionName, this.label});
  

@override final  String id;
 final  String actionName;
 final  String? label;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerActionEntryCopyWith<BuyerActionEntry> get copyWith => _$BuyerActionEntryCopyWithImpl<BuyerActionEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerActionEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.actionName, actionName) || other.actionName == actionName)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,actionName,label);
}

@override
String toString() {
    return 'TranscriptEntry.buyerAction(id: $id, actionName: $actionName, label: $label)';
}


}

/// @nodoc
abstract mixin class $BuyerActionEntryCopyWith<$Res> implements $TranscriptEntryCopyWith<$Res> {
  factory $BuyerActionEntryCopyWith(BuyerActionEntry value, $Res Function(BuyerActionEntry) _then) = _$BuyerActionEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String actionName, String? label
});




}
/// @nodoc
class _$BuyerActionEntryCopyWithImpl<$Res>
    implements $BuyerActionEntryCopyWith<$Res> {
  _$BuyerActionEntryCopyWithImpl(this._self, this._then);

  final BuyerActionEntry _self;
  final $Res Function(BuyerActionEntry) _then;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actionName = null,Object? label = freezed,}) {
  return _then(BuyerActionEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionName: null == actionName ? _self.actionName : actionName // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AgentEntry implements TranscriptEntry {
  const AgentEntry({required this.id, required this.request, required this.status, this.text = '',  List<String> surfaceIds = const [], this.progress = const ResearchProgress(),  List<PlanChange> planChanges = const [], this.error}): _surfaceIds = surfaceIds,_planChanges = planChanges;
  

@override final  String id;
 final  TurnRequest request;
 final  AgentTurnStatus status;
@JsonKey() final  String text;
 final  List<String> _surfaceIds;
@JsonKey() List<String> get surfaceIds {
  if (_surfaceIds is EqualUnmodifiableListView) return _surfaceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surfaceIds);
}

@JsonKey() final  ResearchProgress progress;
 final  List<PlanChange> _planChanges;
@JsonKey() List<PlanChange> get planChanges {
  if (_planChanges is EqualUnmodifiableListView) return _planChanges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_planChanges);
}

 final  AppError? error;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentEntryCopyWith<AgentEntry> get copyWith => _$AgentEntryCopyWithImpl<AgentEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request)&&(identical(other.status, status) || other.status == status)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.surfaceIds, _surfaceIds)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.planChanges, _planChanges)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,request,status,text,const DeepCollectionEquality().hash(_surfaceIds),progress,const DeepCollectionEquality().hash(_planChanges),error);
}

@override
String toString() {
    return 'TranscriptEntry.agent(id: $id, request: $request, status: $status, text: $text, surfaceIds: $surfaceIds, progress: $progress, planChanges: $planChanges, error: $error)';
}


}

/// @nodoc
abstract mixin class $AgentEntryCopyWith<$Res> implements $TranscriptEntryCopyWith<$Res> {
  factory $AgentEntryCopyWith(AgentEntry value, $Res Function(AgentEntry) _then) = _$AgentEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, TurnRequest request, AgentTurnStatus status, String text, List<String> surfaceIds, ResearchProgress progress, List<PlanChange> planChanges, AppError? error
});


$TurnRequestCopyWith<$Res> get request;$ResearchProgressCopyWith<$Res> get progress;$AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$AgentEntryCopyWithImpl<$Res>
    implements $AgentEntryCopyWith<$Res> {
  _$AgentEntryCopyWithImpl(this._self, this._then);

  final AgentEntry _self;
  final $Res Function(AgentEntry) _then;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,Object? status = null,Object? text = null,Object? surfaceIds = null,Object? progress = null,Object? planChanges = null,Object? error = freezed,}) {
  return _then(AgentEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as TurnRequest,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AgentTurnStatus,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,surfaceIds: null == surfaceIds ? _self._surfaceIds : surfaceIds // ignore: cast_nullable_to_non_nullable
as List<String>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ResearchProgress,planChanges: null == planChanges ? _self._planChanges : planChanges // ignore: cast_nullable_to_non_nullable
as List<PlanChange>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TurnRequestCopyWith<$Res> get request {
  
  return $TurnRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResearchProgressCopyWith<$Res> get progress {
  
  return $ResearchProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$PlanChange {

 String get sectionId; String get type; bool get isNew;
/// Create a copy of PlanChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanChangeCopyWith<PlanChange> get copyWith => _$PlanChangeCopyWithImpl<PlanChange>(this as PlanChange, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanChange&&(identical(other.sectionId, _this.sectionId) || other.sectionId == _this.sectionId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.isNew, _this.isNew) || other.isNew == _this.isNew));
}


@override
int get hashCode {
  final _this = this as PlanChange;
  return Object.hash(runtimeType,_this.sectionId,_this.type,_this.isNew);
}

@override
String toString() {
  final _this = this as PlanChange;
  return 'PlanChange(sectionId: ${_this.sectionId}, type: ${_this.type}, isNew: ${_this.isNew})';
}


}

/// @nodoc
abstract mixin class $PlanChangeCopyWith<$Res>  {
  factory $PlanChangeCopyWith(PlanChange value, $Res Function(PlanChange) _then) = _$PlanChangeCopyWithImpl;
@useResult
$Res call({
 String sectionId, String type, bool isNew
});




}
/// @nodoc
class _$PlanChangeCopyWithImpl<$Res>
    implements $PlanChangeCopyWith<$Res> {
  _$PlanChangeCopyWithImpl(this._self, this._then);

  final PlanChange _self;
  final $Res Function(PlanChange) _then;

/// Create a copy of PlanChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sectionId = null,Object? type = null,Object? isNew = null,}) {
  return _then(PlanChange(
sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanChange].
extension PlanChangePatterns on PlanChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanChange value)  $default,){
final _that = this;
switch (_that) {
case _PlanChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanChange value)?  $default,){
final _that = this;
switch (_that) {
case _PlanChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sectionId,  String type,  bool isNew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanChange() when $default != null:
return $default(_that.sectionId,_that.type,_that.isNew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sectionId,  String type,  bool isNew)  $default,) {final _that = this;
switch (_that) {
case _PlanChange():
return $default(_that.sectionId,_that.type,_that.isNew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sectionId,  String type,  bool isNew)?  $default,) {final _that = this;
switch (_that) {
case _PlanChange() when $default != null:
return $default(_that.sectionId,_that.type,_that.isNew);case _:
  return null;

}
}

}

/// @nodoc


class _PlanChange implements PlanChange {
  const _PlanChange({required this.sectionId, required this.type, required this.isNew});
  

@override final  String sectionId;
@override final  String type;
@override final  bool isNew;

/// Create a copy of PlanChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanChangeCopyWith<_PlanChange> get copyWith => __$PlanChangeCopyWithImpl<_PlanChange>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanChange&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.isNew, isNew) || other.isNew == isNew));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sectionId,type,isNew);
}

@override
String toString() {
    return 'PlanChange(sectionId: $sectionId, type: $type, isNew: $isNew)';
}


}

/// @nodoc
abstract mixin class _$PlanChangeCopyWith<$Res> implements $PlanChangeCopyWith<$Res> {
  factory _$PlanChangeCopyWith(_PlanChange value, $Res Function(_PlanChange) _then) = __$PlanChangeCopyWithImpl;
@override @useResult
$Res call({
 String sectionId, String type, bool isNew
});




}
/// @nodoc
class __$PlanChangeCopyWithImpl<$Res>
    implements _$PlanChangeCopyWith<$Res> {
  __$PlanChangeCopyWithImpl(this._self, this._then);

  final _PlanChange _self;
  final $Res Function(_PlanChange) _then;

/// Create a copy of PlanChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sectionId = null,Object? type = null,Object? isNew = null,}) {
  return _then(_PlanChange(
sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TurnFailure {

 String get entryId; AppError get error;
/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnFailureCopyWith<TurnFailure> get copyWith => _$TurnFailureCopyWithImpl<TurnFailure>(this as TurnFailure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TurnFailure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnFailure&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as TurnFailure;
  return Object.hash(runtimeType,_this.entryId,_this.error);
}

@override
String toString() {
  final _this = this as TurnFailure;
  return 'TurnFailure(entryId: ${_this.entryId}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $TurnFailureCopyWith<$Res>  {
  factory $TurnFailureCopyWith(TurnFailure value, $Res Function(TurnFailure) _then) = _$TurnFailureCopyWithImpl;
@useResult
$Res call({
 String entryId, AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$TurnFailureCopyWithImpl<$Res>
    implements $TurnFailureCopyWith<$Res> {
  _$TurnFailureCopyWithImpl(this._self, this._then);

  final TurnFailure _self;
  final $Res Function(TurnFailure) _then;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entryId = null,Object? error = null,}) {
  return _then(TurnFailure(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}
/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [TurnFailure].
extension TurnFailurePatterns on TurnFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurnFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurnFailure value)  $default,){
final _that = this;
switch (_that) {
case _TurnFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurnFailure value)?  $default,){
final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String entryId,  AppError error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
return $default(_that.entryId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String entryId,  AppError error)  $default,) {final _that = this;
switch (_that) {
case _TurnFailure():
return $default(_that.entryId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String entryId,  AppError error)?  $default,) {final _that = this;
switch (_that) {
case _TurnFailure() when $default != null:
return $default(_that.entryId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TurnFailure implements TurnFailure {
  const _TurnFailure({required this.entryId, required this.error});
  

@override final  String entryId;
@override final  AppError error;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnFailureCopyWith<_TurnFailure> get copyWith => __$TurnFailureCopyWithImpl<_TurnFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnFailure&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,entryId,error);
}

@override
String toString() {
    return 'TurnFailure(entryId: $entryId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TurnFailureCopyWith<$Res> implements $TurnFailureCopyWith<$Res> {
  factory _$TurnFailureCopyWith(_TurnFailure value, $Res Function(_TurnFailure) _then) = __$TurnFailureCopyWithImpl;
@override @useResult
$Res call({
 String entryId, AppError error
});


@override $AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$TurnFailureCopyWithImpl<$Res>
    implements _$TurnFailureCopyWith<$Res> {
  __$TurnFailureCopyWithImpl(this._self, this._then);

  final _TurnFailure _self;
  final $Res Function(_TurnFailure) _then;

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryId = null,Object? error = null,}) {
  return _then(_TurnFailure(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of TurnFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
