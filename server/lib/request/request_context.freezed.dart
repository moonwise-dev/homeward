// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestContext {

 String get requestId; String? get traceId; String? get spanId;
/// Create a copy of RequestContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestContextCopyWith<RequestContext> get copyWith => _$RequestContextCopyWithImpl<RequestContext>(this as RequestContext, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RequestContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestContext&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.traceId, _this.traceId) || other.traceId == _this.traceId)&&(identical(other.spanId, _this.spanId) || other.spanId == _this.spanId));
}


@override
int get hashCode {
  final _this = this as RequestContext;
  return Object.hash(runtimeType,_this.requestId,_this.traceId,_this.spanId);
}

@override
String toString() {
  final _this = this as RequestContext;
  return 'RequestContext(requestId: ${_this.requestId}, traceId: ${_this.traceId}, spanId: ${_this.spanId})';
}


}

/// @nodoc
abstract mixin class $RequestContextCopyWith<$Res>  {
  factory $RequestContextCopyWith(RequestContext value, $Res Function(RequestContext) _then) = _$RequestContextCopyWithImpl;
@useResult
$Res call({
 String requestId, String? traceId, String? spanId
});




}
/// @nodoc
class _$RequestContextCopyWithImpl<$Res>
    implements $RequestContextCopyWith<$Res> {
  _$RequestContextCopyWithImpl(this._self, this._then);

  final RequestContext _self;
  final $Res Function(RequestContext) _then;

/// Create a copy of RequestContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? traceId = freezed,Object? spanId = freezed,}) {
  return _then(RequestContext(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,traceId: freezed == traceId ? _self.traceId : traceId // ignore: cast_nullable_to_non_nullable
as String?,spanId: freezed == spanId ? _self.spanId : spanId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestContext].
extension RequestContextPatterns on RequestContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestContext value)  $default,){
final _that = this;
switch (_that) {
case _RequestContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestContext value)?  $default,){
final _that = this;
switch (_that) {
case _RequestContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String? traceId,  String? spanId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestContext() when $default != null:
return $default(_that.requestId,_that.traceId,_that.spanId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String? traceId,  String? spanId)  $default,) {final _that = this;
switch (_that) {
case _RequestContext():
return $default(_that.requestId,_that.traceId,_that.spanId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String? traceId,  String? spanId)?  $default,) {final _that = this;
switch (_that) {
case _RequestContext() when $default != null:
return $default(_that.requestId,_that.traceId,_that.spanId);case _:
  return null;

}
}

}

/// @nodoc


class _RequestContext implements RequestContext {
  const _RequestContext({required this.requestId, this.traceId, this.spanId});
  

@override final  String requestId;
@override final  String? traceId;
@override final  String? spanId;

/// Create a copy of RequestContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestContextCopyWith<_RequestContext> get copyWith => __$RequestContextCopyWithImpl<_RequestContext>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestContext&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.traceId, traceId) || other.traceId == traceId)&&(identical(other.spanId, spanId) || other.spanId == spanId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,requestId,traceId,spanId);
}

@override
String toString() {
    return 'RequestContext(requestId: $requestId, traceId: $traceId, spanId: $spanId)';
}


}

/// @nodoc
abstract mixin class _$RequestContextCopyWith<$Res> implements $RequestContextCopyWith<$Res> {
  factory _$RequestContextCopyWith(_RequestContext value, $Res Function(_RequestContext) _then) = __$RequestContextCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String? traceId, String? spanId
});




}
/// @nodoc
class __$RequestContextCopyWithImpl<$Res>
    implements _$RequestContextCopyWith<$Res> {
  __$RequestContextCopyWithImpl(this._self, this._then);

  final _RequestContext _self;
  final $Res Function(_RequestContext) _then;

/// Create a copy of RequestContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? traceId = freezed,Object? spanId = freezed,}) {
  return _then(_RequestContext(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,traceId: freezed == traceId ? _self.traceId : traceId // ignore: cast_nullable_to_non_nullable
as String?,spanId: freezed == spanId ? _self.spanId : spanId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
