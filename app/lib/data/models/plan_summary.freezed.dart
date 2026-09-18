// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanSummary {

 String get id; DateTime get lastActivityAt; String? get title; String? get marketName;
/// Create a copy of PlanSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanSummaryCopyWith<PlanSummary> get copyWith => _$PlanSummaryCopyWithImpl<PlanSummary>(this as PlanSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.lastActivityAt, _this.lastActivityAt) || other.lastActivityAt == _this.lastActivityAt)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.marketName, _this.marketName) || other.marketName == _this.marketName));
}


@override
int get hashCode {
  final _this = this as PlanSummary;
  return Object.hash(runtimeType,_this.id,_this.lastActivityAt,_this.title,_this.marketName);
}

@override
String toString() {
  final _this = this as PlanSummary;
  return 'PlanSummary(id: ${_this.id}, lastActivityAt: ${_this.lastActivityAt}, title: ${_this.title}, marketName: ${_this.marketName})';
}


}

/// @nodoc
abstract mixin class $PlanSummaryCopyWith<$Res>  {
  factory $PlanSummaryCopyWith(PlanSummary value, $Res Function(PlanSummary) _then) = _$PlanSummaryCopyWithImpl;
@useResult
$Res call({
 String id, DateTime lastActivityAt, String? title, String? marketName
});




}
/// @nodoc
class _$PlanSummaryCopyWithImpl<$Res>
    implements $PlanSummaryCopyWith<$Res> {
  _$PlanSummaryCopyWithImpl(this._self, this._then);

  final PlanSummary _self;
  final $Res Function(PlanSummary) _then;

/// Create a copy of PlanSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lastActivityAt = null,Object? title = freezed,Object? marketName = freezed,}) {
  return _then(PlanSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketName: freezed == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanSummary].
extension PlanSummaryPatterns on PlanSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanSummary value)  $default,){
final _that = this;
switch (_that) {
case _PlanSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PlanSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime lastActivityAt,  String? title,  String? marketName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanSummary() when $default != null:
return $default(_that.id,_that.lastActivityAt,_that.title,_that.marketName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime lastActivityAt,  String? title,  String? marketName)  $default,) {final _that = this;
switch (_that) {
case _PlanSummary():
return $default(_that.id,_that.lastActivityAt,_that.title,_that.marketName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime lastActivityAt,  String? title,  String? marketName)?  $default,) {final _that = this;
switch (_that) {
case _PlanSummary() when $default != null:
return $default(_that.id,_that.lastActivityAt,_that.title,_that.marketName);case _:
  return null;

}
}

}

/// @nodoc


class _PlanSummary implements PlanSummary {
  const _PlanSummary({required this.id, required this.lastActivityAt, this.title, this.marketName});
  

@override final  String id;
@override final  DateTime lastActivityAt;
@override final  String? title;
@override final  String? marketName;

/// Create a copy of PlanSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanSummaryCopyWith<_PlanSummary> get copyWith => __$PlanSummaryCopyWithImpl<_PlanSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.marketName, marketName) || other.marketName == marketName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,lastActivityAt,title,marketName);
}

@override
String toString() {
    return 'PlanSummary(id: $id, lastActivityAt: $lastActivityAt, title: $title, marketName: $marketName)';
}


}

/// @nodoc
abstract mixin class _$PlanSummaryCopyWith<$Res> implements $PlanSummaryCopyWith<$Res> {
  factory _$PlanSummaryCopyWith(_PlanSummary value, $Res Function(_PlanSummary) _then) = __$PlanSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime lastActivityAt, String? title, String? marketName
});




}
/// @nodoc
class __$PlanSummaryCopyWithImpl<$Res>
    implements _$PlanSummaryCopyWith<$Res> {
  __$PlanSummaryCopyWithImpl(this._self, this._then);

  final _PlanSummary _self;
  final $Res Function(_PlanSummary) _then;

/// Create a copy of PlanSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lastActivityAt = null,Object? title = freezed,Object? marketName = freezed,}) {
  return _then(_PlanSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,marketName: freezed == marketName ? _self.marketName : marketName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
