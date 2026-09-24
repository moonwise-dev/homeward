// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Assessment {

 List<AssessedCandidate> get candidates; List<AssessedRow> get rows; List<MapMarker> get markers; List<MapRoute> get routes;
/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentCopyWith<Assessment> get copyWith => _$AssessmentCopyWithImpl<Assessment>(this as Assessment, _$identity);

  /// Serializes this Assessment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Assessment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Assessment&&const DeepCollectionEquality().equals(other.candidates, _this.candidates)&&const DeepCollectionEquality().equals(other.rows, _this.rows)&&const DeepCollectionEquality().equals(other.markers, _this.markers)&&const DeepCollectionEquality().equals(other.routes, _this.routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Assessment;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.candidates),const DeepCollectionEquality().hash(_this.rows),const DeepCollectionEquality().hash(_this.markers),const DeepCollectionEquality().hash(_this.routes));
}

@override
String toString() {
  final _this = this as Assessment;
  return 'Assessment(candidates: ${_this.candidates}, rows: ${_this.rows}, markers: ${_this.markers}, routes: ${_this.routes})';
}


}

/// @nodoc
abstract mixin class $AssessmentCopyWith<$Res>  {
  factory $AssessmentCopyWith(Assessment value, $Res Function(Assessment) _then) = _$AssessmentCopyWithImpl;
@useResult
$Res call({
 List<AssessedCandidate> candidates, List<AssessedRow> rows, List<MapMarker> markers, List<MapRoute> routes
});




}
/// @nodoc
class _$AssessmentCopyWithImpl<$Res>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._self, this._then);

  final Assessment _self;
  final $Res Function(Assessment) _then;

/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidates = null,Object? rows = null,Object? markers = null,Object? routes = null,}) {
  return _then(Assessment(
candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<AssessedCandidate>,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<AssessedRow>,markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as List<MapMarker>,routes: null == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as List<MapRoute>,
  ));
}

}


/// Adds pattern-matching-related methods to [Assessment].
extension AssessmentPatterns on Assessment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Assessment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Assessment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Assessment value)  $default,){
final _that = this;
switch (_that) {
case _Assessment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Assessment value)?  $default,){
final _that = this;
switch (_that) {
case _Assessment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AssessedCandidate> candidates,  List<AssessedRow> rows,  List<MapMarker> markers,  List<MapRoute> routes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Assessment() when $default != null:
return $default(_that.candidates,_that.rows,_that.markers,_that.routes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AssessedCandidate> candidates,  List<AssessedRow> rows,  List<MapMarker> markers,  List<MapRoute> routes)  $default,) {final _that = this;
switch (_that) {
case _Assessment():
return $default(_that.candidates,_that.rows,_that.markers,_that.routes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AssessedCandidate> candidates,  List<AssessedRow> rows,  List<MapMarker> markers,  List<MapRoute> routes)?  $default,) {final _that = this;
switch (_that) {
case _Assessment() when $default != null:
return $default(_that.candidates,_that.rows,_that.markers,_that.routes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Assessment implements Assessment {
  const _Assessment({ List<AssessedCandidate> candidates = const [],  List<AssessedRow> rows = const [],  List<MapMarker> markers = const [],  List<MapRoute> routes = const []}): _candidates = candidates,_rows = rows,_markers = markers,_routes = routes;
  factory _Assessment.fromJson(Map<String, dynamic> json) => _$AssessmentFromJson(json);

 final  List<AssessedCandidate> _candidates;
@override@JsonKey() List<AssessedCandidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}

 final  List<AssessedRow> _rows;
@override@JsonKey() List<AssessedRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

 final  List<MapMarker> _markers;
@override@JsonKey() List<MapMarker> get markers {
  if (_markers is EqualUnmodifiableListView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_markers);
}

 final  List<MapRoute> _routes;
@override@JsonKey() List<MapRoute> get routes {
  if (_routes is EqualUnmodifiableListView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routes);
}


/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentCopyWith<_Assessment> get copyWith => __$AssessmentCopyWithImpl<_Assessment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Assessment&&const DeepCollectionEquality().equals(other.candidates, _candidates)&&const DeepCollectionEquality().equals(other.rows, _rows)&&const DeepCollectionEquality().equals(other.markers, _markers)&&const DeepCollectionEquality().equals(other.routes, _routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_candidates),const DeepCollectionEquality().hash(_rows),const DeepCollectionEquality().hash(_markers),const DeepCollectionEquality().hash(_routes));
}

@override
String toString() {
    return 'Assessment(candidates: $candidates, rows: $rows, markers: $markers, routes: $routes)';
}


}

/// @nodoc
abstract mixin class _$AssessmentCopyWith<$Res> implements $AssessmentCopyWith<$Res> {
  factory _$AssessmentCopyWith(_Assessment value, $Res Function(_Assessment) _then) = __$AssessmentCopyWithImpl;
@override @useResult
$Res call({
 List<AssessedCandidate> candidates, List<AssessedRow> rows, List<MapMarker> markers, List<MapRoute> routes
});




}
/// @nodoc
class __$AssessmentCopyWithImpl<$Res>
    implements _$AssessmentCopyWith<$Res> {
  __$AssessmentCopyWithImpl(this._self, this._then);

  final _Assessment _self;
  final $Res Function(_Assessment) _then;

/// Create a copy of Assessment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidates = null,Object? rows = null,Object? markers = null,Object? routes = null,}) {
  return _then(_Assessment(
candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<AssessedCandidate>,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<AssessedRow>,markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as List<MapMarker>,routes: null == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as List<MapRoute>,
  ));
}


}

// dart format on
