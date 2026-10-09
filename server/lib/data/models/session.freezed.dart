// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Session {

 String get id; int get turnCount; String? get lastInteractionId; List<TurnRecord> get turns; Map<String, Map<String, Object?>> get handedCards; Map<String, String> get cardNotes;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Session;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.turnCount, _this.turnCount) || other.turnCount == _this.turnCount)&&(identical(other.lastInteractionId, _this.lastInteractionId) || other.lastInteractionId == _this.lastInteractionId)&&const DeepCollectionEquality().equals(other.turns, _this.turns)&&const DeepCollectionEquality().equals(other.handedCards, _this.handedCards)&&const DeepCollectionEquality().equals(other.cardNotes, _this.cardNotes));
}


@override
int get hashCode {
  final _this = this as Session;
  return Object.hash(runtimeType,_this.id,_this.turnCount,_this.lastInteractionId,const DeepCollectionEquality().hash(_this.turns),const DeepCollectionEquality().hash(_this.handedCards),const DeepCollectionEquality().hash(_this.cardNotes));
}

@override
String toString() {
  final _this = this as Session;
  return 'Session(id: ${_this.id}, turnCount: ${_this.turnCount}, lastInteractionId: ${_this.lastInteractionId}, turns: ${_this.turns}, handedCards: ${_this.handedCards}, cardNotes: ${_this.cardNotes})';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String id, int turnCount, String? lastInteractionId, List<TurnRecord> turns, Map<String, Map<String, Object?>> handedCards, Map<String, String> cardNotes
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? turnCount = null,Object? lastInteractionId = freezed,Object? turns = null,Object? handedCards = null,Object? cardNotes = null,}) {
  return _then(Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,lastInteractionId: freezed == lastInteractionId ? _self.lastInteractionId : lastInteractionId // ignore: cast_nullable_to_non_nullable
as String?,turns: null == turns ? _self.turns : turns // ignore: cast_nullable_to_non_nullable
as List<TurnRecord>,handedCards: null == handedCards ? _self.handedCards : handedCards // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,cardNotes: null == cardNotes ? _self.cardNotes : cardNotes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int turnCount,  String? lastInteractionId,  List<TurnRecord> turns,  Map<String, Map<String, Object?>> handedCards,  Map<String, String> cardNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.turnCount,_that.lastInteractionId,_that.turns,_that.handedCards,_that.cardNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int turnCount,  String? lastInteractionId,  List<TurnRecord> turns,  Map<String, Map<String, Object?>> handedCards,  Map<String, String> cardNotes)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.id,_that.turnCount,_that.lastInteractionId,_that.turns,_that.handedCards,_that.cardNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int turnCount,  String? lastInteractionId,  List<TurnRecord> turns,  Map<String, Map<String, Object?>> handedCards,  Map<String, String> cardNotes)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.turnCount,_that.lastInteractionId,_that.turns,_that.handedCards,_that.cardNotes);case _:
  return null;

}
}

}

/// @nodoc


class _Session extends Session {
  const _Session({required this.id, this.turnCount = 0, this.lastInteractionId,  List<TurnRecord> turns = const [],  Map<String, Map<String, Object?>> handedCards = const {},  Map<String, String> cardNotes = const {}}): _turns = turns,_handedCards = handedCards,_cardNotes = cardNotes,super._();
  

@override final  String id;
@override@JsonKey() final  int turnCount;
@override final  String? lastInteractionId;
 final  List<TurnRecord> _turns;
@override@JsonKey() List<TurnRecord> get turns {
  if (_turns is EqualUnmodifiableListView) return _turns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turns);
}

 final  Map<String, Map<String, Object?>> _handedCards;
@override@JsonKey() Map<String, Map<String, Object?>> get handedCards {
  if (_handedCards is EqualUnmodifiableMapView) return _handedCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_handedCards);
}

 final  Map<String, String> _cardNotes;
@override@JsonKey() Map<String, String> get cardNotes {
  if (_cardNotes is EqualUnmodifiableMapView) return _cardNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cardNotes);
}


/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.id, id) || other.id == id)&&(identical(other.turnCount, turnCount) || other.turnCount == turnCount)&&(identical(other.lastInteractionId, lastInteractionId) || other.lastInteractionId == lastInteractionId)&&const DeepCollectionEquality().equals(other.turns, _turns)&&const DeepCollectionEquality().equals(other.handedCards, _handedCards)&&const DeepCollectionEquality().equals(other.cardNotes, _cardNotes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,turnCount,lastInteractionId,const DeepCollectionEquality().hash(_turns),const DeepCollectionEquality().hash(_handedCards),const DeepCollectionEquality().hash(_cardNotes));
}

@override
String toString() {
    return 'Session(id: $id, turnCount: $turnCount, lastInteractionId: $lastInteractionId, turns: $turns, handedCards: $handedCards, cardNotes: $cardNotes)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String id, int turnCount, String? lastInteractionId, List<TurnRecord> turns, Map<String, Map<String, Object?>> handedCards, Map<String, String> cardNotes
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? turnCount = null,Object? lastInteractionId = freezed,Object? turns = null,Object? handedCards = null,Object? cardNotes = null,}) {
  return _then(_Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,turnCount: null == turnCount ? _self.turnCount : turnCount // ignore: cast_nullable_to_non_nullable
as int,lastInteractionId: freezed == lastInteractionId ? _self.lastInteractionId : lastInteractionId // ignore: cast_nullable_to_non_nullable
as String?,turns: null == turns ? _self._turns : turns // ignore: cast_nullable_to_non_nullable
as List<TurnRecord>,handedCards: null == handedCards ? _self._handedCards : handedCards // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,cardNotes: null == cardNotes ? _self._cardNotes : cardNotes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
