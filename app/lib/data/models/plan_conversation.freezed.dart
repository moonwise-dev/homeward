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

// dart format on
