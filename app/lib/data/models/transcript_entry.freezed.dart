// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcript_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String text)?  buyer,TResult Function( String id,  String actionName)?  buyerAction,TResult Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  AppError? error)?  agent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that.id,_that.text);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that.id,_that.actionName);case AgentEntry() when agent != null:
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String text)  buyer,required TResult Function( String id,  String actionName)  buyerAction,required TResult Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  AppError? error)  agent,}) {final _that = this;
switch (_that) {
case BuyerEntry():
return buyer(_that.id,_that.text);case BuyerActionEntry():
return buyerAction(_that.id,_that.actionName);case AgentEntry():
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String text)?  buyer,TResult? Function( String id,  String actionName)?  buyerAction,TResult? Function( String id,  TurnRequest request,  AgentTurnStatus status,  String text,  List<String> surfaceIds,  ResearchProgress progress,  AppError? error)?  agent,}) {final _that = this;
switch (_that) {
case BuyerEntry() when buyer != null:
return buyer(_that.id,_that.text);case BuyerActionEntry() when buyerAction != null:
return buyerAction(_that.id,_that.actionName);case AgentEntry() when agent != null:
return agent(_that.id,_that.request,_that.status,_that.text,_that.surfaceIds,_that.progress,_that.error);case _:
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
  const BuyerActionEntry({required this.id, required this.actionName});
  

@override final  String id;
 final  String actionName;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerActionEntryCopyWith<BuyerActionEntry> get copyWith => _$BuyerActionEntryCopyWithImpl<BuyerActionEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerActionEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.actionName, actionName) || other.actionName == actionName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,actionName);
}

@override
String toString() {
    return 'TranscriptEntry.buyerAction(id: $id, actionName: $actionName)';
}


}

/// @nodoc
abstract mixin class $BuyerActionEntryCopyWith<$Res> implements $TranscriptEntryCopyWith<$Res> {
  factory $BuyerActionEntryCopyWith(BuyerActionEntry value, $Res Function(BuyerActionEntry) _then) = _$BuyerActionEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String actionName
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actionName = null,}) {
  return _then(BuyerActionEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionName: null == actionName ? _self.actionName : actionName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AgentEntry implements TranscriptEntry {
  const AgentEntry({required this.id, required this.request, required this.status, this.text = '',  List<String> surfaceIds = const [], this.progress = const ResearchProgress(), this.error}): _surfaceIds = surfaceIds;
  

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
 final  AppError? error;

/// Create a copy of TranscriptEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentEntryCopyWith<AgentEntry> get copyWith => _$AgentEntryCopyWithImpl<AgentEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request)&&(identical(other.status, status) || other.status == status)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.surfaceIds, _surfaceIds)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,request,status,text,const DeepCollectionEquality().hash(_surfaceIds),progress,error);
}

@override
String toString() {
    return 'TranscriptEntry.agent(id: $id, request: $request, status: $status, text: $text, surfaceIds: $surfaceIds, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class $AgentEntryCopyWith<$Res> implements $TranscriptEntryCopyWith<$Res> {
  factory $AgentEntryCopyWith(AgentEntry value, $Res Function(AgentEntry) _then) = _$AgentEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, TurnRequest request, AgentTurnStatus status, String text, List<String> surfaceIds, ResearchProgress progress, AppError? error
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,Object? status = null,Object? text = null,Object? surfaceIds = null,Object? progress = null,Object? error = freezed,}) {
  return _then(AgentEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as TurnRequest,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AgentTurnStatus,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,surfaceIds: null == surfaceIds ? _self._surfaceIds : surfaceIds // ignore: cast_nullable_to_non_nullable
as List<String>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ResearchProgress,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
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

// dart format on
