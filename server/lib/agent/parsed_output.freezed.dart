// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedOutput {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedOutput);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ParsedOutput()';
}


}

/// @nodoc
class $ParsedOutputCopyWith<$Res>  {
$ParsedOutputCopyWith(ParsedOutput _, $Res Function(ParsedOutput) __);
}


/// Adds pattern-matching-related methods to [ParsedOutput].
extension ParsedOutputPatterns on ParsedOutput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProseOutput value)?  prose,TResult Function( A2uiMessageOutput value)?  a2uiMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that);case A2uiMessageOutput() when a2uiMessage != null:
return a2uiMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProseOutput value)  prose,required TResult Function( A2uiMessageOutput value)  a2uiMessage,}){
final _that = this;
switch (_that) {
case ProseOutput():
return prose(_that);case A2uiMessageOutput():
return a2uiMessage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProseOutput value)?  prose,TResult? Function( A2uiMessageOutput value)?  a2uiMessage,}){
final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that);case A2uiMessageOutput() when a2uiMessage != null:
return a2uiMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  prose,TResult Function( String source)?  a2uiMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that.text);case A2uiMessageOutput() when a2uiMessage != null:
return a2uiMessage(_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  prose,required TResult Function( String source)  a2uiMessage,}) {final _that = this;
switch (_that) {
case ProseOutput():
return prose(_that.text);case A2uiMessageOutput():
return a2uiMessage(_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  prose,TResult? Function( String source)?  a2uiMessage,}) {final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that.text);case A2uiMessageOutput() when a2uiMessage != null:
return a2uiMessage(_that.source);case _:
  return null;

}
}

}

/// @nodoc


class ProseOutput implements ParsedOutput {
  const ProseOutput(this.text);
  

 final  String text;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProseOutputCopyWith<ProseOutput> get copyWith => _$ProseOutputCopyWithImpl<ProseOutput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProseOutput&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'ParsedOutput.prose(text: $text)';
}


}

/// @nodoc
abstract mixin class $ProseOutputCopyWith<$Res> implements $ParsedOutputCopyWith<$Res> {
  factory $ProseOutputCopyWith(ProseOutput value, $Res Function(ProseOutput) _then) = _$ProseOutputCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ProseOutputCopyWithImpl<$Res>
    implements $ProseOutputCopyWith<$Res> {
  _$ProseOutputCopyWithImpl(this._self, this._then);

  final ProseOutput _self;
  final $Res Function(ProseOutput) _then;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(ProseOutput(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class A2uiMessageOutput implements ParsedOutput {
  const A2uiMessageOutput(this.source);
  

 final  String source;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2uiMessageOutputCopyWith<A2uiMessageOutput> get copyWith => _$A2uiMessageOutputCopyWithImpl<A2uiMessageOutput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is A2uiMessageOutput&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,source);
}

@override
String toString() {
    return 'ParsedOutput.a2uiMessage(source: $source)';
}


}

/// @nodoc
abstract mixin class $A2uiMessageOutputCopyWith<$Res> implements $ParsedOutputCopyWith<$Res> {
  factory $A2uiMessageOutputCopyWith(A2uiMessageOutput value, $Res Function(A2uiMessageOutput) _then) = _$A2uiMessageOutputCopyWithImpl;
@useResult
$Res call({
 String source
});




}
/// @nodoc
class _$A2uiMessageOutputCopyWithImpl<$Res>
    implements $A2uiMessageOutputCopyWith<$Res> {
  _$A2uiMessageOutputCopyWithImpl(this._self, this._then);

  final A2uiMessageOutput _self;
  final $Res Function(A2uiMessageOutput) _then;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(A2uiMessageOutput(
null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
