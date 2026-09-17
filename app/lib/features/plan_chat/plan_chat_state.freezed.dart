// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanChatState {

 PlanConversation get conversation; String get draft;
/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanChatStateCopyWith<PlanChatState> get copyWith => _$PlanChatStateCopyWithImpl<PlanChatState>(this as PlanChatState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanChatState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanChatState&&(identical(other.conversation, _this.conversation) || other.conversation == _this.conversation)&&(identical(other.draft, _this.draft) || other.draft == _this.draft));
}


@override
int get hashCode {
  final _this = this as PlanChatState;
  return Object.hash(runtimeType,_this.conversation,_this.draft);
}

@override
String toString() {
  final _this = this as PlanChatState;
  return 'PlanChatState(conversation: ${_this.conversation}, draft: ${_this.draft})';
}


}

/// @nodoc
abstract mixin class $PlanChatStateCopyWith<$Res>  {
  factory $PlanChatStateCopyWith(PlanChatState value, $Res Function(PlanChatState) _then) = _$PlanChatStateCopyWithImpl;
@useResult
$Res call({
 PlanConversation conversation, String draft
});


$PlanConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$PlanChatStateCopyWithImpl<$Res>
    implements $PlanChatStateCopyWith<$Res> {
  _$PlanChatStateCopyWithImpl(this._self, this._then);

  final PlanChatState _self;
  final $Res Function(PlanChatState) _then;

/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversation = null,Object? draft = null,}) {
  return _then(PlanChatState(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as PlanConversation,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanConversationCopyWith<$Res> get conversation {
  
  return $PlanConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlanChatState].
extension PlanChatStatePatterns on PlanChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanChatState value)  $default,){
final _that = this;
switch (_that) {
case _PlanChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanChatState value)?  $default,){
final _that = this;
switch (_that) {
case _PlanChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlanConversation conversation,  String draft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanChatState() when $default != null:
return $default(_that.conversation,_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlanConversation conversation,  String draft)  $default,) {final _that = this;
switch (_that) {
case _PlanChatState():
return $default(_that.conversation,_that.draft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlanConversation conversation,  String draft)?  $default,) {final _that = this;
switch (_that) {
case _PlanChatState() when $default != null:
return $default(_that.conversation,_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _PlanChatState implements PlanChatState {
  const _PlanChatState({this.conversation = const PlanConversation(), this.draft = ''});
  

@override@JsonKey() final  PlanConversation conversation;
@override@JsonKey() final  String draft;

/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanChatStateCopyWith<_PlanChatState> get copyWith => __$PlanChatStateCopyWithImpl<_PlanChatState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanChatState&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode {
    return Object.hash(runtimeType,conversation,draft);
}

@override
String toString() {
    return 'PlanChatState(conversation: $conversation, draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$PlanChatStateCopyWith<$Res> implements $PlanChatStateCopyWith<$Res> {
  factory _$PlanChatStateCopyWith(_PlanChatState value, $Res Function(_PlanChatState) _then) = __$PlanChatStateCopyWithImpl;
@override @useResult
$Res call({
 PlanConversation conversation, String draft
});


@override $PlanConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class __$PlanChatStateCopyWithImpl<$Res>
    implements _$PlanChatStateCopyWith<$Res> {
  __$PlanChatStateCopyWithImpl(this._self, this._then);

  final _PlanChatState _self;
  final $Res Function(_PlanChatState) _then;

/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversation = null,Object? draft = null,}) {
  return _then(_PlanChatState(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as PlanConversation,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PlanChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanConversationCopyWith<$Res> get conversation {
  
  return $PlanConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

// dart format on
