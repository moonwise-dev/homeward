// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessed_cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssessedCell {

 String get candidateId; FitStatus get status; String get text; String? get detail;
/// Create a copy of AssessedCell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessedCellCopyWith<AssessedCell> get copyWith => _$AssessedCellCopyWithImpl<AssessedCell>(this as AssessedCell, _$identity);

  /// Serializes this AssessedCell to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssessedCell;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessedCell&&(identical(other.candidateId, _this.candidateId) || other.candidateId == _this.candidateId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.detail, _this.detail) || other.detail == _this.detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssessedCell;
  return Object.hash(runtimeType,_this.candidateId,_this.status,_this.text,_this.detail);
}

@override
String toString() {
  final _this = this as AssessedCell;
  return 'AssessedCell(candidateId: ${_this.candidateId}, status: ${_this.status}, text: ${_this.text}, detail: ${_this.detail})';
}


}

/// @nodoc
abstract mixin class $AssessedCellCopyWith<$Res>  {
  factory $AssessedCellCopyWith(AssessedCell value, $Res Function(AssessedCell) _then) = _$AssessedCellCopyWithImpl;
@useResult
$Res call({
 String candidateId, FitStatus status, String text, String? detail
});




}
/// @nodoc
class _$AssessedCellCopyWithImpl<$Res>
    implements $AssessedCellCopyWith<$Res> {
  _$AssessedCellCopyWithImpl(this._self, this._then);

  final AssessedCell _self;
  final $Res Function(AssessedCell) _then;

/// Create a copy of AssessedCell
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidateId = null,Object? status = null,Object? text = null,Object? detail = freezed,}) {
  return _then(AssessedCell(
candidateId: null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FitStatus,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssessedCell].
extension AssessedCellPatterns on AssessedCell {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssessedCell value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssessedCell() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssessedCell value)  $default,){
final _that = this;
switch (_that) {
case _AssessedCell():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssessedCell value)?  $default,){
final _that = this;
switch (_that) {
case _AssessedCell() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String candidateId,  FitStatus status,  String text,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssessedCell() when $default != null:
return $default(_that.candidateId,_that.status,_that.text,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String candidateId,  FitStatus status,  String text,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _AssessedCell():
return $default(_that.candidateId,_that.status,_that.text,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String candidateId,  FitStatus status,  String text,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _AssessedCell() when $default != null:
return $default(_that.candidateId,_that.status,_that.text,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssessedCell implements AssessedCell {
  const _AssessedCell({required this.candidateId, required this.status, required this.text, this.detail});
  factory _AssessedCell.fromJson(Map<String, dynamic> json) => _$AssessedCellFromJson(json);

@override final  String candidateId;
@override final  FitStatus status;
@override final  String text;
@override final  String? detail;

/// Create a copy of AssessedCell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessedCellCopyWith<_AssessedCell> get copyWith => __$AssessedCellCopyWithImpl<_AssessedCell>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessedCellToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessedCell&&(identical(other.candidateId, candidateId) || other.candidateId == candidateId)&&(identical(other.status, status) || other.status == status)&&(identical(other.text, text) || other.text == text)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,candidateId,status,text,detail);
}

@override
String toString() {
    return 'AssessedCell(candidateId: $candidateId, status: $status, text: $text, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$AssessedCellCopyWith<$Res> implements $AssessedCellCopyWith<$Res> {
  factory _$AssessedCellCopyWith(_AssessedCell value, $Res Function(_AssessedCell) _then) = __$AssessedCellCopyWithImpl;
@override @useResult
$Res call({
 String candidateId, FitStatus status, String text, String? detail
});




}
/// @nodoc
class __$AssessedCellCopyWithImpl<$Res>
    implements _$AssessedCellCopyWith<$Res> {
  __$AssessedCellCopyWithImpl(this._self, this._then);

  final _AssessedCell _self;
  final $Res Function(_AssessedCell) _then;

/// Create a copy of AssessedCell
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidateId = null,Object? status = null,Object? text = null,Object? detail = freezed,}) {
  return _then(_AssessedCell(
candidateId: null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FitStatus,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
