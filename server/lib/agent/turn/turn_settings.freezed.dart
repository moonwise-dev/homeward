// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurnSettings {

 int get maxCorrections; int get maxToolRounds; String get thinkingLevel; bool get deal;
/// Create a copy of TurnSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnSettingsCopyWith<TurnSettings> get copyWith => _$TurnSettingsCopyWithImpl<TurnSettings>(this as TurnSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TurnSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnSettings&&(identical(other.maxCorrections, _this.maxCorrections) || other.maxCorrections == _this.maxCorrections)&&(identical(other.maxToolRounds, _this.maxToolRounds) || other.maxToolRounds == _this.maxToolRounds)&&(identical(other.thinkingLevel, _this.thinkingLevel) || other.thinkingLevel == _this.thinkingLevel)&&(identical(other.deal, _this.deal) || other.deal == _this.deal));
}


@override
int get hashCode {
  final _this = this as TurnSettings;
  return Object.hash(runtimeType,_this.maxCorrections,_this.maxToolRounds,_this.thinkingLevel,_this.deal);
}

@override
String toString() {
  final _this = this as TurnSettings;
  return 'TurnSettings(maxCorrections: ${_this.maxCorrections}, maxToolRounds: ${_this.maxToolRounds}, thinkingLevel: ${_this.thinkingLevel}, deal: ${_this.deal})';
}


}

/// @nodoc
abstract mixin class $TurnSettingsCopyWith<$Res>  {
  factory $TurnSettingsCopyWith(TurnSettings value, $Res Function(TurnSettings) _then) = _$TurnSettingsCopyWithImpl;
@useResult
$Res call({
 int maxCorrections, int maxToolRounds, String thinkingLevel, bool deal
});




}
/// @nodoc
class _$TurnSettingsCopyWithImpl<$Res>
    implements $TurnSettingsCopyWith<$Res> {
  _$TurnSettingsCopyWithImpl(this._self, this._then);

  final TurnSettings _self;
  final $Res Function(TurnSettings) _then;

/// Create a copy of TurnSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxCorrections = null,Object? maxToolRounds = null,Object? thinkingLevel = null,Object? deal = null,}) {
  return _then(TurnSettings(
maxCorrections: null == maxCorrections ? _self.maxCorrections : maxCorrections // ignore: cast_nullable_to_non_nullable
as int,maxToolRounds: null == maxToolRounds ? _self.maxToolRounds : maxToolRounds // ignore: cast_nullable_to_non_nullable
as int,thinkingLevel: null == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String,deal: null == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TurnSettings].
extension TurnSettingsPatterns on TurnSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurnSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurnSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurnSettings value)  $default,){
final _that = this;
switch (_that) {
case _TurnSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurnSettings value)?  $default,){
final _that = this;
switch (_that) {
case _TurnSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxCorrections,  int maxToolRounds,  String thinkingLevel,  bool deal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurnSettings() when $default != null:
return $default(_that.maxCorrections,_that.maxToolRounds,_that.thinkingLevel,_that.deal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxCorrections,  int maxToolRounds,  String thinkingLevel,  bool deal)  $default,) {final _that = this;
switch (_that) {
case _TurnSettings():
return $default(_that.maxCorrections,_that.maxToolRounds,_that.thinkingLevel,_that.deal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxCorrections,  int maxToolRounds,  String thinkingLevel,  bool deal)?  $default,) {final _that = this;
switch (_that) {
case _TurnSettings() when $default != null:
return $default(_that.maxCorrections,_that.maxToolRounds,_that.thinkingLevel,_that.deal);case _:
  return null;

}
}

}

/// @nodoc


class _TurnSettings implements TurnSettings {
  const _TurnSettings({this.maxCorrections = 2, this.maxToolRounds = 3, this.thinkingLevel = 'low', this.deal = true});
  

@override@JsonKey() final  int maxCorrections;
@override@JsonKey() final  int maxToolRounds;
@override@JsonKey() final  String thinkingLevel;
@override@JsonKey() final  bool deal;

/// Create a copy of TurnSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnSettingsCopyWith<_TurnSettings> get copyWith => __$TurnSettingsCopyWithImpl<_TurnSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnSettings&&(identical(other.maxCorrections, maxCorrections) || other.maxCorrections == maxCorrections)&&(identical(other.maxToolRounds, maxToolRounds) || other.maxToolRounds == maxToolRounds)&&(identical(other.thinkingLevel, thinkingLevel) || other.thinkingLevel == thinkingLevel)&&(identical(other.deal, deal) || other.deal == deal));
}


@override
int get hashCode {
    return Object.hash(runtimeType,maxCorrections,maxToolRounds,thinkingLevel,deal);
}

@override
String toString() {
    return 'TurnSettings(maxCorrections: $maxCorrections, maxToolRounds: $maxToolRounds, thinkingLevel: $thinkingLevel, deal: $deal)';
}


}

/// @nodoc
abstract mixin class _$TurnSettingsCopyWith<$Res> implements $TurnSettingsCopyWith<$Res> {
  factory _$TurnSettingsCopyWith(_TurnSettings value, $Res Function(_TurnSettings) _then) = __$TurnSettingsCopyWithImpl;
@override @useResult
$Res call({
 int maxCorrections, int maxToolRounds, String thinkingLevel, bool deal
});




}
/// @nodoc
class __$TurnSettingsCopyWithImpl<$Res>
    implements _$TurnSettingsCopyWith<$Res> {
  __$TurnSettingsCopyWithImpl(this._self, this._then);

  final _TurnSettings _self;
  final $Res Function(_TurnSettings) _then;

/// Create a copy of TurnSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxCorrections = null,Object? maxToolRounds = null,Object? thinkingLevel = null,Object? deal = null,}) {
  return _then(_TurnSettings(
maxCorrections: null == maxCorrections ? _self.maxCorrections : maxCorrections // ignore: cast_nullable_to_non_nullable
as int,maxToolRounds: null == maxToolRounds ? _self.maxToolRounds : maxToolRounds // ignore: cast_nullable_to_non_nullable
as int,thinkingLevel: null == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String,deal: null == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
