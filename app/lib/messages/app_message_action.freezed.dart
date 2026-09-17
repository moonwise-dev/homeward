// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_message_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
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
