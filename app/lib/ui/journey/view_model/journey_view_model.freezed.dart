// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journey_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JourneyState {

 PlanConversation get conversation; String get draft;
/// Create a copy of JourneyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JourneyStateCopyWith<JourneyState> get copyWith => _$JourneyStateCopyWithImpl<JourneyState>(this as JourneyState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as JourneyState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JourneyState&&(identical(other.conversation, _this.conversation) || other.conversation == _this.conversation)&&(identical(other.draft, _this.draft) || other.draft == _this.draft));
}


@override
int get hashCode {
  final _this = this as JourneyState;
  return Object.hash(runtimeType,_this.conversation,_this.draft);
}

@override
String toString() {
  final _this = this as JourneyState;
  return 'JourneyState(conversation: ${_this.conversation}, draft: ${_this.draft})';
}


}

/// @nodoc
abstract mixin class $JourneyStateCopyWith<$Res>  {
  factory $JourneyStateCopyWith(JourneyState value, $Res Function(JourneyState) _then) = _$JourneyStateCopyWithImpl;
@useResult
$Res call({
 PlanConversation conversation, String draft
});


$PlanConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$JourneyStateCopyWithImpl<$Res>
    implements $JourneyStateCopyWith<$Res> {
  _$JourneyStateCopyWithImpl(this._self, this._then);

  final JourneyState _self;
  final $Res Function(JourneyState) _then;

/// Create a copy of JourneyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversation = null,Object? draft = null,}) {
  return _then(JourneyState(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as PlanConversation,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of JourneyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanConversationCopyWith<$Res> get conversation {
  
  return $PlanConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [JourneyState].
extension JourneyStatePatterns on JourneyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JourneyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JourneyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JourneyState value)  $default,){
final _that = this;
switch (_that) {
case _JourneyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JourneyState value)?  $default,){
final _that = this;
switch (_that) {
case _JourneyState() when $default != null:
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
case _JourneyState() when $default != null:
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
case _JourneyState():
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
case _JourneyState() when $default != null:
return $default(_that.conversation,_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _JourneyState extends JourneyState {
  const _JourneyState({this.conversation = const PlanConversation(), this.draft = ''}): super._();
  

@override@JsonKey() final  PlanConversation conversation;
@override@JsonKey() final  String draft;

/// Create a copy of JourneyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JourneyStateCopyWith<_JourneyState> get copyWith => __$JourneyStateCopyWithImpl<_JourneyState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JourneyState&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode {
    return Object.hash(runtimeType,conversation,draft);
}

@override
String toString() {
    return 'JourneyState(conversation: $conversation, draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$JourneyStateCopyWith<$Res> implements $JourneyStateCopyWith<$Res> {
  factory _$JourneyStateCopyWith(_JourneyState value, $Res Function(_JourneyState) _then) = __$JourneyStateCopyWithImpl;
@override @useResult
$Res call({
 PlanConversation conversation, String draft
});


@override $PlanConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class __$JourneyStateCopyWithImpl<$Res>
    implements _$JourneyStateCopyWith<$Res> {
  __$JourneyStateCopyWithImpl(this._self, this._then);

  final _JourneyState _self;
  final $Res Function(_JourneyState) _then;

/// Create a copy of JourneyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversation = null,Object? draft = null,}) {
  return _then(_JourneyState(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as PlanConversation,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of JourneyState
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
