// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_rpc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsonRpcRequest {

 String get jsonrpc; Object? get id; String get method; Map<String, Object?>? get params;
/// Create a copy of JsonRpcRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonRpcRequestCopyWith<JsonRpcRequest> get copyWith => _$JsonRpcRequestCopyWithImpl<JsonRpcRequest>(this as JsonRpcRequest, _$identity);

  /// Serializes this JsonRpcRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JsonRpcRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonRpcRequest&&(identical(other.jsonrpc, _this.jsonrpc) || other.jsonrpc == _this.jsonrpc)&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.method, _this.method) || other.method == _this.method)&&const DeepCollectionEquality().equals(other.params, _this.params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JsonRpcRequest;
  return Object.hash(runtimeType,_this.jsonrpc,const DeepCollectionEquality().hash(_this.id),_this.method,const DeepCollectionEquality().hash(_this.params));
}

@override
String toString() {
  final _this = this as JsonRpcRequest;
  return 'JsonRpcRequest(jsonrpc: ${_this.jsonrpc}, id: ${_this.id}, method: ${_this.method}, params: ${_this.params})';
}


}

/// @nodoc
abstract mixin class $JsonRpcRequestCopyWith<$Res>  {
  factory $JsonRpcRequestCopyWith(JsonRpcRequest value, $Res Function(JsonRpcRequest) _then) = _$JsonRpcRequestCopyWithImpl;
@useResult
$Res call({
 String jsonrpc, Object? id, String method, Map<String, Object?>? params
});




}
/// @nodoc
class _$JsonRpcRequestCopyWithImpl<$Res>
    implements $JsonRpcRequestCopyWith<$Res> {
  _$JsonRpcRequestCopyWithImpl(this._self, this._then);

  final JsonRpcRequest _self;
  final $Res Function(JsonRpcRequest) _then;

/// Create a copy of JsonRpcRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonrpc = null,Object? id = freezed,Object? method = null,Object? params = freezed,}) {
  return _then(JsonRpcRequest(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonRpcRequest].
extension JsonRpcRequestPatterns on JsonRpcRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonRpcRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonRpcRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonRpcRequest value)  $default,){
final _that = this;
switch (_that) {
case _JsonRpcRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonRpcRequest value)?  $default,){
final _that = this;
switch (_that) {
case _JsonRpcRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  String method,  Map<String, Object?>? params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonRpcRequest() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.method,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  String method,  Map<String, Object?>? params)  $default,) {final _that = this;
switch (_that) {
case _JsonRpcRequest():
return $default(_that.jsonrpc,_that.id,_that.method,_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jsonrpc,  Object? id,  String method,  Map<String, Object?>? params)?  $default,) {final _that = this;
switch (_that) {
case _JsonRpcRequest() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.method,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonRpcRequest implements JsonRpcRequest {
  const _JsonRpcRequest({required this.jsonrpc, this.id, required this.method,  Map<String, Object?>? params}): _params = params;
  factory _JsonRpcRequest.fromJson(Map<String, dynamic> json) => _$JsonRpcRequestFromJson(json);

@override final  String jsonrpc;
@override final  Object? id;
@override final  String method;
 final  Map<String, Object?>? _params;
@override Map<String, Object?>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of JsonRpcRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonRpcRequestCopyWith<_JsonRpcRequest> get copyWith => __$JsonRpcRequestCopyWithImpl<_JsonRpcRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonRpcRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonRpcRequest&&(identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc)&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.params, _params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,jsonrpc,const DeepCollectionEquality().hash(id),method,const DeepCollectionEquality().hash(_params));
}

@override
String toString() {
    return 'JsonRpcRequest(jsonrpc: $jsonrpc, id: $id, method: $method, params: $params)';
}


}

/// @nodoc
abstract mixin class _$JsonRpcRequestCopyWith<$Res> implements $JsonRpcRequestCopyWith<$Res> {
  factory _$JsonRpcRequestCopyWith(_JsonRpcRequest value, $Res Function(_JsonRpcRequest) _then) = __$JsonRpcRequestCopyWithImpl;
@override @useResult
$Res call({
 String jsonrpc, Object? id, String method, Map<String, Object?>? params
});




}
/// @nodoc
class __$JsonRpcRequestCopyWithImpl<$Res>
    implements _$JsonRpcRequestCopyWith<$Res> {
  __$JsonRpcRequestCopyWithImpl(this._self, this._then);

  final _JsonRpcRequest _self;
  final $Res Function(_JsonRpcRequest) _then;

/// Create a copy of JsonRpcRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonrpc = null,Object? id = freezed,Object? method = null,Object? params = freezed,}) {
  return _then(_JsonRpcRequest(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}


/// @nodoc
mixin _$JsonRpcError {

 int get code; String get message; Map<String, Object?>? get data;
/// Create a copy of JsonRpcError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonRpcErrorCopyWith<JsonRpcError> get copyWith => _$JsonRpcErrorCopyWithImpl<JsonRpcError>(this as JsonRpcError, _$identity);

  /// Serializes this JsonRpcError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JsonRpcError;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonRpcError&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JsonRpcError;
  return Object.hash(runtimeType,_this.code,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as JsonRpcError;
  return 'JsonRpcError(code: ${_this.code}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $JsonRpcErrorCopyWith<$Res>  {
  factory $JsonRpcErrorCopyWith(JsonRpcError value, $Res Function(JsonRpcError) _then) = _$JsonRpcErrorCopyWithImpl;
@useResult
$Res call({
 int code, String message, Map<String, Object?>? data
});




}
/// @nodoc
class _$JsonRpcErrorCopyWithImpl<$Res>
    implements $JsonRpcErrorCopyWith<$Res> {
  _$JsonRpcErrorCopyWithImpl(this._self, this._then);

  final JsonRpcError _self;
  final $Res Function(JsonRpcError) _then;

/// Create a copy of JsonRpcError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? data = freezed,}) {
  return _then(JsonRpcError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonRpcError].
extension JsonRpcErrorPatterns on JsonRpcError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonRpcError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonRpcError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonRpcError value)  $default,){
final _that = this;
switch (_that) {
case _JsonRpcError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonRpcError value)?  $default,){
final _that = this;
switch (_that) {
case _JsonRpcError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String message,  Map<String, Object?>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonRpcError() when $default != null:
return $default(_that.code,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String message,  Map<String, Object?>? data)  $default,) {final _that = this;
switch (_that) {
case _JsonRpcError():
return $default(_that.code,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String message,  Map<String, Object?>? data)?  $default,) {final _that = this;
switch (_that) {
case _JsonRpcError() when $default != null:
return $default(_that.code,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonRpcError implements JsonRpcError {
  const _JsonRpcError({required this.code, required this.message,  Map<String, Object?>? data}): _data = data;
  factory _JsonRpcError.fromJson(Map<String, dynamic> json) => _$JsonRpcErrorFromJson(json);

@override final  int code;
@override final  String message;
 final  Map<String, Object?>? _data;
@override Map<String, Object?>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of JsonRpcError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonRpcErrorCopyWith<_JsonRpcError> get copyWith => __$JsonRpcErrorCopyWithImpl<_JsonRpcError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonRpcErrorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonRpcError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'JsonRpcError(code: $code, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$JsonRpcErrorCopyWith<$Res> implements $JsonRpcErrorCopyWith<$Res> {
  factory _$JsonRpcErrorCopyWith(_JsonRpcError value, $Res Function(_JsonRpcError) _then) = __$JsonRpcErrorCopyWithImpl;
@override @useResult
$Res call({
 int code, String message, Map<String, Object?>? data
});




}
/// @nodoc
class __$JsonRpcErrorCopyWithImpl<$Res>
    implements _$JsonRpcErrorCopyWith<$Res> {
  __$JsonRpcErrorCopyWithImpl(this._self, this._then);

  final _JsonRpcError _self;
  final $Res Function(_JsonRpcError) _then;

/// Create a copy of JsonRpcError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? data = freezed,}) {
  return _then(_JsonRpcError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}


/// @nodoc
mixin _$JsonRpcResult {

 String get jsonrpc; Object? get id; Map<String, Object?> get result;
/// Create a copy of JsonRpcResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonRpcResultCopyWith<JsonRpcResult> get copyWith => _$JsonRpcResultCopyWithImpl<JsonRpcResult>(this as JsonRpcResult, _$identity);

  /// Serializes this JsonRpcResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JsonRpcResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonRpcResult&&(identical(other.jsonrpc, _this.jsonrpc) || other.jsonrpc == _this.jsonrpc)&&const DeepCollectionEquality().equals(other.id, _this.id)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JsonRpcResult;
  return Object.hash(runtimeType,_this.jsonrpc,const DeepCollectionEquality().hash(_this.id),const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as JsonRpcResult;
  return 'JsonRpcResult(jsonrpc: ${_this.jsonrpc}, id: ${_this.id}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $JsonRpcResultCopyWith<$Res>  {
  factory $JsonRpcResultCopyWith(JsonRpcResult value, $Res Function(JsonRpcResult) _then) = _$JsonRpcResultCopyWithImpl;
@useResult
$Res call({
 String jsonrpc, Object? id, Map<String, Object?> result
});




}
/// @nodoc
class _$JsonRpcResultCopyWithImpl<$Res>
    implements $JsonRpcResultCopyWith<$Res> {
  _$JsonRpcResultCopyWithImpl(this._self, this._then);

  final JsonRpcResult _self;
  final $Res Function(JsonRpcResult) _then;

/// Create a copy of JsonRpcResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonrpc = null,Object? id = freezed,Object? result = null,}) {
  return _then(JsonRpcResult(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonRpcResult].
extension JsonRpcResultPatterns on JsonRpcResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonRpcResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonRpcResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonRpcResult value)  $default,){
final _that = this;
switch (_that) {
case _JsonRpcResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonRpcResult value)?  $default,){
final _that = this;
switch (_that) {
case _JsonRpcResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  Map<String, Object?> result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonRpcResult() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  Map<String, Object?> result)  $default,) {final _that = this;
switch (_that) {
case _JsonRpcResult():
return $default(_that.jsonrpc,_that.id,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jsonrpc,  Object? id,  Map<String, Object?> result)?  $default,) {final _that = this;
switch (_that) {
case _JsonRpcResult() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonRpcResult implements JsonRpcResult {
  const _JsonRpcResult({this.jsonrpc = '2.0', this.id, required  Map<String, Object?> result}): _result = result;
  factory _JsonRpcResult.fromJson(Map<String, dynamic> json) => _$JsonRpcResultFromJson(json);

@override@JsonKey() final  String jsonrpc;
@override final  Object? id;
 final  Map<String, Object?> _result;
@override Map<String, Object?> get result {
  if (_result is EqualUnmodifiableMapView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_result);
}


/// Create a copy of JsonRpcResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonRpcResultCopyWith<_JsonRpcResult> get copyWith => __$JsonRpcResultCopyWithImpl<_JsonRpcResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonRpcResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonRpcResult&&(identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc)&&const DeepCollectionEquality().equals(other.id, id)&&const DeepCollectionEquality().equals(other.result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,jsonrpc,const DeepCollectionEquality().hash(id),const DeepCollectionEquality().hash(_result));
}

@override
String toString() {
    return 'JsonRpcResult(jsonrpc: $jsonrpc, id: $id, result: $result)';
}


}

/// @nodoc
abstract mixin class _$JsonRpcResultCopyWith<$Res> implements $JsonRpcResultCopyWith<$Res> {
  factory _$JsonRpcResultCopyWith(_JsonRpcResult value, $Res Function(_JsonRpcResult) _then) = __$JsonRpcResultCopyWithImpl;
@override @useResult
$Res call({
 String jsonrpc, Object? id, Map<String, Object?> result
});




}
/// @nodoc
class __$JsonRpcResultCopyWithImpl<$Res>
    implements _$JsonRpcResultCopyWith<$Res> {
  __$JsonRpcResultCopyWithImpl(this._self, this._then);

  final _JsonRpcResult _self;
  final $Res Function(_JsonRpcResult) _then;

/// Create a copy of JsonRpcResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonrpc = null,Object? id = freezed,Object? result = null,}) {
  return _then(_JsonRpcResult(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$JsonRpcErrorResponse {

 String get jsonrpc; Object? get id; JsonRpcError get error;
/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonRpcErrorResponseCopyWith<JsonRpcErrorResponse> get copyWith => _$JsonRpcErrorResponseCopyWithImpl<JsonRpcErrorResponse>(this as JsonRpcErrorResponse, _$identity);

  /// Serializes this JsonRpcErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JsonRpcErrorResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonRpcErrorResponse&&(identical(other.jsonrpc, _this.jsonrpc) || other.jsonrpc == _this.jsonrpc)&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JsonRpcErrorResponse;
  return Object.hash(runtimeType,_this.jsonrpc,const DeepCollectionEquality().hash(_this.id),_this.error);
}

@override
String toString() {
  final _this = this as JsonRpcErrorResponse;
  return 'JsonRpcErrorResponse(jsonrpc: ${_this.jsonrpc}, id: ${_this.id}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $JsonRpcErrorResponseCopyWith<$Res>  {
  factory $JsonRpcErrorResponseCopyWith(JsonRpcErrorResponse value, $Res Function(JsonRpcErrorResponse) _then) = _$JsonRpcErrorResponseCopyWithImpl;
@useResult
$Res call({
 String jsonrpc, Object? id, JsonRpcError error
});


$JsonRpcErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$JsonRpcErrorResponseCopyWithImpl<$Res>
    implements $JsonRpcErrorResponseCopyWith<$Res> {
  _$JsonRpcErrorResponseCopyWithImpl(this._self, this._then);

  final JsonRpcErrorResponse _self;
  final $Res Function(JsonRpcErrorResponse) _then;

/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonrpc = null,Object? id = freezed,Object? error = null,}) {
  return _then(JsonRpcErrorResponse(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as JsonRpcError,
  ));
}
/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JsonRpcErrorCopyWith<$Res> get error {
  
  return $JsonRpcErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [JsonRpcErrorResponse].
extension JsonRpcErrorResponsePatterns on JsonRpcErrorResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonRpcErrorResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonRpcErrorResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonRpcErrorResponse value)  $default,){
final _that = this;
switch (_that) {
case _JsonRpcErrorResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonRpcErrorResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JsonRpcErrorResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  JsonRpcError error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonRpcErrorResponse() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jsonrpc,  Object? id,  JsonRpcError error)  $default,) {final _that = this;
switch (_that) {
case _JsonRpcErrorResponse():
return $default(_that.jsonrpc,_that.id,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jsonrpc,  Object? id,  JsonRpcError error)?  $default,) {final _that = this;
switch (_that) {
case _JsonRpcErrorResponse() when $default != null:
return $default(_that.jsonrpc,_that.id,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonRpcErrorResponse implements JsonRpcErrorResponse {
  const _JsonRpcErrorResponse({this.jsonrpc = '2.0', this.id, required this.error});
  factory _JsonRpcErrorResponse.fromJson(Map<String, dynamic> json) => _$JsonRpcErrorResponseFromJson(json);

@override@JsonKey() final  String jsonrpc;
@override final  Object? id;
@override final  JsonRpcError error;

/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonRpcErrorResponseCopyWith<_JsonRpcErrorResponse> get copyWith => __$JsonRpcErrorResponseCopyWithImpl<_JsonRpcErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonRpcErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonRpcErrorResponse&&(identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc)&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,jsonrpc,const DeepCollectionEquality().hash(id),error);
}

@override
String toString() {
    return 'JsonRpcErrorResponse(jsonrpc: $jsonrpc, id: $id, error: $error)';
}


}

/// @nodoc
abstract mixin class _$JsonRpcErrorResponseCopyWith<$Res> implements $JsonRpcErrorResponseCopyWith<$Res> {
  factory _$JsonRpcErrorResponseCopyWith(_JsonRpcErrorResponse value, $Res Function(_JsonRpcErrorResponse) _then) = __$JsonRpcErrorResponseCopyWithImpl;
@override @useResult
$Res call({
 String jsonrpc, Object? id, JsonRpcError error
});


@override $JsonRpcErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$JsonRpcErrorResponseCopyWithImpl<$Res>
    implements _$JsonRpcErrorResponseCopyWith<$Res> {
  __$JsonRpcErrorResponseCopyWithImpl(this._self, this._then);

  final _JsonRpcErrorResponse _self;
  final $Res Function(_JsonRpcErrorResponse) _then;

/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonrpc = null,Object? id = freezed,Object? error = null,}) {
  return _then(_JsonRpcErrorResponse(
jsonrpc: null == jsonrpc ? _self.jsonrpc : jsonrpc // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id ,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as JsonRpcError,
  ));
}

/// Create a copy of JsonRpcErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JsonRpcErrorCopyWith<$Res> get error {
  
  return $JsonRpcErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
