// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a2a_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
A2aPart _$A2aPartFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'text':
          return A2aTextPart.fromJson(
            json
          );
                case 'data':
          return A2aDataPart.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'A2aPart',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$A2aPart {

 Map<String, Object?>? get metadata;
/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aPartCopyWith<A2aPart> get copyWith => _$A2aPartCopyWithImpl<A2aPart>(this as A2aPart, _$identity);

  /// Serializes this A2aPart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as A2aPart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aPart&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as A2aPart;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as A2aPart;
  return 'A2aPart(metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $A2aPartCopyWith<$Res>  {
  factory $A2aPartCopyWith(A2aPart value, $Res Function(A2aPart) _then) = _$A2aPartCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?>? metadata
});




}
/// @nodoc
class _$A2aPartCopyWithImpl<$Res>
    implements $A2aPartCopyWith<$Res> {
  _$A2aPartCopyWithImpl(this._self, this._then);

  final A2aPart _self;
  final $Res Function(A2aPart) _then;

/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = freezed,}) {
  return _then(_self.copyWith(
metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [A2aPart].
extension A2aPartPatterns on A2aPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( A2aTextPart value)?  text,TResult Function( A2aDataPart value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case A2aTextPart() when text != null:
return text(_that);case A2aDataPart() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( A2aTextPart value)  text,required TResult Function( A2aDataPart value)  data,}){
final _that = this;
switch (_that) {
case A2aTextPart():
return text(_that);case A2aDataPart():
return data(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( A2aTextPart value)?  text,TResult? Function( A2aDataPart value)?  data,}){
final _that = this;
switch (_that) {
case A2aTextPart() when text != null:
return text(_that);case A2aDataPart() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  Map<String, Object?>? metadata)?  text,TResult Function( Map<String, Object?> data,  Map<String, Object?>? metadata)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case A2aTextPart() when text != null:
return text(_that.text,_that.metadata);case A2aDataPart() when data != null:
return data(_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  Map<String, Object?>? metadata)  text,required TResult Function( Map<String, Object?> data,  Map<String, Object?>? metadata)  data,}) {final _that = this;
switch (_that) {
case A2aTextPart():
return text(_that.text,_that.metadata);case A2aDataPart():
return data(_that.data,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  Map<String, Object?>? metadata)?  text,TResult? Function( Map<String, Object?> data,  Map<String, Object?>? metadata)?  data,}) {final _that = this;
switch (_that) {
case A2aTextPart() when text != null:
return text(_that.text,_that.metadata);case A2aDataPart() when data != null:
return data(_that.data,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class A2aTextPart implements A2aPart {
  const A2aTextPart({required this.text,  Map<String, Object?>? metadata,  String? $type}): _metadata = metadata,$type = $type ?? 'text';
  factory A2aTextPart.fromJson(Map<String, dynamic> json) => _$A2aTextPartFromJson(json);

 final  String text;
 final  Map<String, Object?>? _metadata;
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@JsonKey(name: 'kind')
final String $type;


/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aTextPartCopyWith<A2aTextPart> get copyWith => _$A2aTextPartCopyWithImpl<A2aTextPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$A2aTextPartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aTextPart&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'A2aPart.text(text: $text, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $A2aTextPartCopyWith<$Res> implements $A2aPartCopyWith<$Res> {
  factory $A2aTextPartCopyWith(A2aTextPart value, $Res Function(A2aTextPart) _then) = _$A2aTextPartCopyWithImpl;
@override @useResult
$Res call({
 String text, Map<String, Object?>? metadata
});




}
/// @nodoc
class _$A2aTextPartCopyWithImpl<$Res>
    implements $A2aTextPartCopyWith<$Res> {
  _$A2aTextPartCopyWithImpl(this._self, this._then);

  final A2aTextPart _self;
  final $Res Function(A2aTextPart) _then;

/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? metadata = freezed,}) {
  return _then(A2aTextPart(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class A2aDataPart implements A2aPart {
  const A2aDataPart({required  Map<String, Object?> data,  Map<String, Object?>? metadata,  String? $type}): _data = data,_metadata = metadata,$type = $type ?? 'data';
  factory A2aDataPart.fromJson(Map<String, dynamic> json) => _$A2aDataPartFromJson(json);

 final  Map<String, Object?> _data;
 Map<String, Object?> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

 final  Map<String, Object?>? _metadata;
@override Map<String, Object?>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@JsonKey(name: 'kind')
final String $type;


/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2aDataPartCopyWith<A2aDataPart> get copyWith => _$A2aDataPartCopyWithImpl<A2aDataPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$A2aDataPartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is A2aDataPart&&const DeepCollectionEquality().equals(other.data, _data)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'A2aPart.data(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $A2aDataPartCopyWith<$Res> implements $A2aPartCopyWith<$Res> {
  factory $A2aDataPartCopyWith(A2aDataPart value, $Res Function(A2aDataPart) _then) = _$A2aDataPartCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Object?> data, Map<String, Object?>? metadata
});




}
/// @nodoc
class _$A2aDataPartCopyWithImpl<$Res>
    implements $A2aDataPartCopyWith<$Res> {
  _$A2aDataPartCopyWithImpl(this._self, this._then);

  final A2aDataPart _self;
  final $Res Function(A2aDataPart) _then;

/// Create a copy of A2aPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? metadata = freezed,}) {
  return _then(A2aDataPart(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}

// dart format on
