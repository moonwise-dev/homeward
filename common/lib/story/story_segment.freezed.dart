// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorySegment {

 StorySegmentType get type; String? get text; CriterionKind? get kind; String? get id; String? get label; bool get assumed;
/// Create a copy of StorySegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorySegmentCopyWith<StorySegment> get copyWith => _$StorySegmentCopyWithImpl<StorySegment>(this as StorySegment, _$identity);

  /// Serializes this StorySegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StorySegment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorySegment&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.assumed, _this.assumed) || other.assumed == _this.assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StorySegment;
  return Object.hash(runtimeType,_this.type,_this.text,_this.kind,_this.id,_this.label,_this.assumed);
}

@override
String toString() {
  final _this = this as StorySegment;
  return 'StorySegment(type: ${_this.type}, text: ${_this.text}, kind: ${_this.kind}, id: ${_this.id}, label: ${_this.label}, assumed: ${_this.assumed})';
}


}

/// @nodoc
abstract mixin class $StorySegmentCopyWith<$Res>  {
  factory $StorySegmentCopyWith(StorySegment value, $Res Function(StorySegment) _then) = _$StorySegmentCopyWithImpl;
@useResult
$Res call({
 StorySegmentType type, String? text, CriterionKind? kind, String? id, String? label, bool assumed
});




}
/// @nodoc
class _$StorySegmentCopyWithImpl<$Res>
    implements $StorySegmentCopyWith<$Res> {
  _$StorySegmentCopyWithImpl(this._self, this._then);

  final StorySegment _self;
  final $Res Function(StorySegment) _then;

/// Create a copy of StorySegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = freezed,Object? kind = freezed,Object? id = freezed,Object? label = freezed,Object? assumed = null,}) {
  return _then(StorySegment(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StorySegmentType,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CriterionKind?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,assumed: null == assumed ? _self.assumed : assumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StorySegment].
extension StorySegmentPatterns on StorySegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorySegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorySegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorySegment value)  $default,){
final _that = this;
switch (_that) {
case _StorySegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorySegment value)?  $default,){
final _that = this;
switch (_that) {
case _StorySegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StorySegmentType type,  String? text,  CriterionKind? kind,  String? id,  String? label,  bool assumed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorySegment() when $default != null:
return $default(_that.type,_that.text,_that.kind,_that.id,_that.label,_that.assumed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StorySegmentType type,  String? text,  CriterionKind? kind,  String? id,  String? label,  bool assumed)  $default,) {final _that = this;
switch (_that) {
case _StorySegment():
return $default(_that.type,_that.text,_that.kind,_that.id,_that.label,_that.assumed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StorySegmentType type,  String? text,  CriterionKind? kind,  String? id,  String? label,  bool assumed)?  $default,) {final _that = this;
switch (_that) {
case _StorySegment() when $default != null:
return $default(_that.type,_that.text,_that.kind,_that.id,_that.label,_that.assumed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorySegment implements StorySegment {
  const _StorySegment({required this.type, this.text, this.kind, this.id, this.label, this.assumed = false});
  factory _StorySegment.fromJson(Map<String, dynamic> json) => _$StorySegmentFromJson(json);

@override final  StorySegmentType type;
@override final  String? text;
@override final  CriterionKind? kind;
@override final  String? id;
@override final  String? label;
@override@JsonKey() final  bool assumed;

/// Create a copy of StorySegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorySegmentCopyWith<_StorySegment> get copyWith => __$StorySegmentCopyWithImpl<_StorySegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorySegmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorySegment&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.assumed, assumed) || other.assumed == assumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,text,kind,id,label,assumed);
}

@override
String toString() {
    return 'StorySegment(type: $type, text: $text, kind: $kind, id: $id, label: $label, assumed: $assumed)';
}


}

/// @nodoc
abstract mixin class _$StorySegmentCopyWith<$Res> implements $StorySegmentCopyWith<$Res> {
  factory _$StorySegmentCopyWith(_StorySegment value, $Res Function(_StorySegment) _then) = __$StorySegmentCopyWithImpl;
@override @useResult
$Res call({
 StorySegmentType type, String? text, CriterionKind? kind, String? id, String? label, bool assumed
});




}
/// @nodoc
class __$StorySegmentCopyWithImpl<$Res>
    implements _$StorySegmentCopyWith<$Res> {
  __$StorySegmentCopyWithImpl(this._self, this._then);

  final _StorySegment _self;
  final $Res Function(_StorySegment) _then;

/// Create a copy of StorySegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = freezed,Object? kind = freezed,Object? id = freezed,Object? label = freezed,Object? assumed = null,}) {
  return _then(_StorySegment(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StorySegmentType,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CriterionKind?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,assumed: null == assumed ? _self.assumed : assumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
