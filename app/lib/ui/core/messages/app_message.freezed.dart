// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppMessage implements DiagnosticableTreeMixin {

 String get id; AppMessageType get type; String get message; AppMessageAction? get action;
/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppMessageCopyWith<AppMessage> get copyWith => _$AppMessageCopyWithImpl<AppMessage>(this as AppMessage, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as AppMessage;
  properties
    ..add(DiagnosticsProperty('type', 'AppMessage'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('type', _this.type))..add(DiagnosticsProperty('message', _this.message))..add(DiagnosticsProperty('action', _this.action));
}

@override
bool operator ==(Object other) {
  final _this = this as AppMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.action, _this.action) || other.action == _this.action));
}


@override
int get hashCode {
  final _this = this as AppMessage;
  return Object.hash(runtimeType,_this.id,_this.type,_this.message,_this.action);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as AppMessage;
  return 'AppMessage(id: ${_this.id}, type: ${_this.type}, message: ${_this.message}, action: ${_this.action})';
}


}

/// @nodoc
abstract mixin class $AppMessageCopyWith<$Res>  {
  factory $AppMessageCopyWith(AppMessage value, $Res Function(AppMessage) _then) = _$AppMessageCopyWithImpl;
@useResult
$Res call({
 String id, AppMessageType type, String message, AppMessageAction? action
});


$AppMessageActionCopyWith<$Res>? get action;

}
/// @nodoc
class _$AppMessageCopyWithImpl<$Res>
    implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._self, this._then);

  final AppMessage _self;
  final $Res Function(AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? message = null,Object? action = freezed,}) {
  return _then(AppMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppMessageType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AppMessageAction?,
  ));
}
/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppMessageActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AppMessageActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppMessage].
extension AppMessagePatterns on AppMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppMessage value)  $default,){
final _that = this;
switch (_that) {
case _AppMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppMessage value)?  $default,){
final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AppMessageType type,  String message,  AppMessageAction? action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that.id,_that.type,_that.message,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AppMessageType type,  String message,  AppMessageAction? action)  $default,) {final _that = this;
switch (_that) {
case _AppMessage():
return $default(_that.id,_that.type,_that.message,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AppMessageType type,  String message,  AppMessageAction? action)?  $default,) {final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that.id,_that.type,_that.message,_that.action);case _:
  return null;

}
}

}

/// @nodoc


class _AppMessage with DiagnosticableTreeMixin implements AppMessage {
  const _AppMessage({required this.id, required this.type, required this.message, this.action});
  

@override final  String id;
@override final  AppMessageType type;
@override final  String message;
@override final  AppMessageAction? action;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppMessageCopyWith<_AppMessage> get copyWith => __$AppMessageCopyWithImpl<_AppMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AppMessage'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('action', action));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,type,message,action);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AppMessage(id: $id, type: $type, message: $message, action: $action)';
}


}

/// @nodoc
abstract mixin class _$AppMessageCopyWith<$Res> implements $AppMessageCopyWith<$Res> {
  factory _$AppMessageCopyWith(_AppMessage value, $Res Function(_AppMessage) _then) = __$AppMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, AppMessageType type, String message, AppMessageAction? action
});


@override $AppMessageActionCopyWith<$Res>? get action;

}
/// @nodoc
class __$AppMessageCopyWithImpl<$Res>
    implements _$AppMessageCopyWith<$Res> {
  __$AppMessageCopyWithImpl(this._self, this._then);

  final _AppMessage _self;
  final $Res Function(_AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? message = null,Object? action = freezed,}) {
  return _then(_AppMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppMessageType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AppMessageAction?,
  ));
}

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppMessageActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AppMessageActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc
mixin _$AppMessageAction implements DiagnosticableTreeMixin {

 String get label; VoidCallback get onPressed;
/// Create a copy of AppMessageAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppMessageActionCopyWith<AppMessageAction> get copyWith => _$AppMessageActionCopyWithImpl<AppMessageAction>(this as AppMessageAction, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as AppMessageAction;
  properties
    ..add(DiagnosticsProperty('type', 'AppMessageAction'))
    ..add(DiagnosticsProperty('label', _this.label))..add(DiagnosticsProperty('onPressed', _this.onPressed));
}

@override
bool operator ==(Object other) {
  final _this = this as AppMessageAction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppMessageAction&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.onPressed, _this.onPressed) || other.onPressed == _this.onPressed));
}


@override
int get hashCode {
  final _this = this as AppMessageAction;
  return Object.hash(runtimeType,_this.label,_this.onPressed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as AppMessageAction;
  return 'AppMessageAction(label: ${_this.label}, onPressed: ${_this.onPressed})';
}


}

/// @nodoc
abstract mixin class $AppMessageActionCopyWith<$Res>  {
  factory $AppMessageActionCopyWith(AppMessageAction value, $Res Function(AppMessageAction) _then) = _$AppMessageActionCopyWithImpl;
@useResult
$Res call({
 String label, VoidCallback onPressed
});




}
/// @nodoc
class _$AppMessageActionCopyWithImpl<$Res>
    implements $AppMessageActionCopyWith<$Res> {
  _$AppMessageActionCopyWithImpl(this._self, this._then);

  final AppMessageAction _self;
  final $Res Function(AppMessageAction) _then;

/// Create a copy of AppMessageAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? onPressed = null,}) {
  return _then(AppMessageAction(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,onPressed: null == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

}


/// Adds pattern-matching-related methods to [AppMessageAction].
extension AppMessageActionPatterns on AppMessageAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppMessageAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppMessageAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppMessageAction value)  $default,){
final _that = this;
switch (_that) {
case _AppMessageAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppMessageAction value)?  $default,){
final _that = this;
switch (_that) {
case _AppMessageAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  VoidCallback onPressed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppMessageAction() when $default != null:
return $default(_that.label,_that.onPressed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  VoidCallback onPressed)  $default,) {final _that = this;
switch (_that) {
case _AppMessageAction():
return $default(_that.label,_that.onPressed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  VoidCallback onPressed)?  $default,) {final _that = this;
switch (_that) {
case _AppMessageAction() when $default != null:
return $default(_that.label,_that.onPressed);case _:
  return null;

}
}

}

/// @nodoc


class _AppMessageAction with DiagnosticableTreeMixin implements AppMessageAction {
  const _AppMessageAction({required this.label, required this.onPressed});
  

@override final  String label;
@override final  VoidCallback onPressed;

/// Create a copy of AppMessageAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppMessageActionCopyWith<_AppMessageAction> get copyWith => __$AppMessageActionCopyWithImpl<_AppMessageAction>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AppMessageAction'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('onPressed', onPressed));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppMessageAction&&(identical(other.label, label) || other.label == label)&&(identical(other.onPressed, onPressed) || other.onPressed == onPressed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,onPressed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AppMessageAction(label: $label, onPressed: $onPressed)';
}


}

/// @nodoc
abstract mixin class _$AppMessageActionCopyWith<$Res> implements $AppMessageActionCopyWith<$Res> {
  factory _$AppMessageActionCopyWith(_AppMessageAction value, $Res Function(_AppMessageAction) _then) = __$AppMessageActionCopyWithImpl;
@override @useResult
$Res call({
 String label, VoidCallback onPressed
});




}
/// @nodoc
class __$AppMessageActionCopyWithImpl<$Res>
    implements _$AppMessageActionCopyWith<$Res> {
  __$AppMessageActionCopyWithImpl(this._self, this._then);

  final _AppMessageAction _self;
  final $Res Function(_AppMessageAction) _then;

/// Create a copy of AppMessageAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? onPressed = null,}) {
  return _then(_AppMessageAction(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,onPressed: null == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}


}

// dart format on
