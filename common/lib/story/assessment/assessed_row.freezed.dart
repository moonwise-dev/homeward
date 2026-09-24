// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessed_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssessedRow {

 String get id; String get label; String get group; bool get mustHave; List<AssessedCell> get cells;
/// Create a copy of AssessedRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessedRowCopyWith<AssessedRow> get copyWith => _$AssessedRowCopyWithImpl<AssessedRow>(this as AssessedRow, _$identity);

  /// Serializes this AssessedRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssessedRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessedRow&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.group, _this.group) || other.group == _this.group)&&(identical(other.mustHave, _this.mustHave) || other.mustHave == _this.mustHave)&&const DeepCollectionEquality().equals(other.cells, _this.cells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssessedRow;
  return Object.hash(runtimeType,_this.id,_this.label,_this.group,_this.mustHave,const DeepCollectionEquality().hash(_this.cells));
}

@override
String toString() {
  final _this = this as AssessedRow;
  return 'AssessedRow(id: ${_this.id}, label: ${_this.label}, group: ${_this.group}, mustHave: ${_this.mustHave}, cells: ${_this.cells})';
}


}

/// @nodoc
abstract mixin class $AssessedRowCopyWith<$Res>  {
  factory $AssessedRowCopyWith(AssessedRow value, $Res Function(AssessedRow) _then) = _$AssessedRowCopyWithImpl;
@useResult
$Res call({
 String id, String label, String group, bool mustHave, List<AssessedCell> cells
});




}
/// @nodoc
class _$AssessedRowCopyWithImpl<$Res>
    implements $AssessedRowCopyWith<$Res> {
  _$AssessedRowCopyWithImpl(this._self, this._then);

  final AssessedRow _self;
  final $Res Function(AssessedRow) _then;

/// Create a copy of AssessedRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? group = null,Object? mustHave = null,Object? cells = null,}) {
  return _then(AssessedRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,mustHave: null == mustHave ? _self.mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as bool,cells: null == cells ? _self.cells : cells // ignore: cast_nullable_to_non_nullable
as List<AssessedCell>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssessedRow].
extension AssessedRowPatterns on AssessedRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssessedRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssessedRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssessedRow value)  $default,){
final _that = this;
switch (_that) {
case _AssessedRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssessedRow value)?  $default,){
final _that = this;
switch (_that) {
case _AssessedRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String group,  bool mustHave,  List<AssessedCell> cells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssessedRow() when $default != null:
return $default(_that.id,_that.label,_that.group,_that.mustHave,_that.cells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String group,  bool mustHave,  List<AssessedCell> cells)  $default,) {final _that = this;
switch (_that) {
case _AssessedRow():
return $default(_that.id,_that.label,_that.group,_that.mustHave,_that.cells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String group,  bool mustHave,  List<AssessedCell> cells)?  $default,) {final _that = this;
switch (_that) {
case _AssessedRow() when $default != null:
return $default(_that.id,_that.label,_that.group,_that.mustHave,_that.cells);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssessedRow implements AssessedRow {
  const _AssessedRow({required this.id, required this.label, required this.group, required this.mustHave, required  List<AssessedCell> cells}): _cells = cells;
  factory _AssessedRow.fromJson(Map<String, dynamic> json) => _$AssessedRowFromJson(json);

@override final  String id;
@override final  String label;
@override final  String group;
@override final  bool mustHave;
 final  List<AssessedCell> _cells;
@override List<AssessedCell> get cells {
  if (_cells is EqualUnmodifiableListView) return _cells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cells);
}


/// Create a copy of AssessedRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessedRowCopyWith<_AssessedRow> get copyWith => __$AssessedRowCopyWithImpl<_AssessedRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessedRowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessedRow&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.group, group) || other.group == group)&&(identical(other.mustHave, mustHave) || other.mustHave == mustHave)&&const DeepCollectionEquality().equals(other.cells, _cells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,group,mustHave,const DeepCollectionEquality().hash(_cells));
}

@override
String toString() {
    return 'AssessedRow(id: $id, label: $label, group: $group, mustHave: $mustHave, cells: $cells)';
}


}

/// @nodoc
abstract mixin class _$AssessedRowCopyWith<$Res> implements $AssessedRowCopyWith<$Res> {
  factory _$AssessedRowCopyWith(_AssessedRow value, $Res Function(_AssessedRow) _then) = __$AssessedRowCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String group, bool mustHave, List<AssessedCell> cells
});




}
/// @nodoc
class __$AssessedRowCopyWithImpl<$Res>
    implements _$AssessedRowCopyWith<$Res> {
  __$AssessedRowCopyWithImpl(this._self, this._then);

  final _AssessedRow _self;
  final $Res Function(_AssessedRow) _then;

/// Create a copy of AssessedRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? group = null,Object? mustHave = null,Object? cells = null,}) {
  return _then(_AssessedRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,mustHave: null == mustHave ? _self.mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as bool,cells: null == cells ? _self._cells : cells // ignore: cast_nullable_to_non_nullable
as List<AssessedCell>,
  ));
}


}

// dart format on
