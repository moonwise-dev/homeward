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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProseOutput value)?  prose,TResult Function( A2uiLineOutput value)?  a2uiLine,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that);case A2uiLineOutput() when a2uiLine != null:
return a2uiLine(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProseOutput value)  prose,required TResult Function( A2uiLineOutput value)  a2uiLine,}){
final _that = this;
switch (_that) {
case ProseOutput():
return prose(_that);case A2uiLineOutput():
return a2uiLine(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProseOutput value)?  prose,TResult? Function( A2uiLineOutput value)?  a2uiLine,}){
final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that);case A2uiLineOutput() when a2uiLine != null:
return a2uiLine(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  prose,TResult Function( String line)?  a2uiLine,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that.text);case A2uiLineOutput() when a2uiLine != null:
return a2uiLine(_that.line);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  prose,required TResult Function( String line)  a2uiLine,}) {final _that = this;
switch (_that) {
case ProseOutput():
return prose(_that.text);case A2uiLineOutput():
return a2uiLine(_that.line);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  prose,TResult? Function( String line)?  a2uiLine,}) {final _that = this;
switch (_that) {
case ProseOutput() when prose != null:
return prose(_that.text);case A2uiLineOutput() when a2uiLine != null:
return a2uiLine(_that.line);case _:
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


class A2uiLineOutput implements ParsedOutput {
  const A2uiLineOutput(this.line);
  

 final  String line;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$A2uiLineOutputCopyWith<A2uiLineOutput> get copyWith => _$A2uiLineOutputCopyWithImpl<A2uiLineOutput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is A2uiLineOutput&&(identical(other.line, line) || other.line == line));
}


@override
int get hashCode {
    return Object.hash(runtimeType,line);
}

@override
String toString() {
    return 'ParsedOutput.a2uiLine(line: $line)';
}


}

/// @nodoc
abstract mixin class $A2uiLineOutputCopyWith<$Res> implements $ParsedOutputCopyWith<$Res> {
  factory $A2uiLineOutputCopyWith(A2uiLineOutput value, $Res Function(A2uiLineOutput) _then) = _$A2uiLineOutputCopyWithImpl;
@useResult
$Res call({
 String line
});




}
/// @nodoc
class _$A2uiLineOutputCopyWithImpl<$Res>
    implements $A2uiLineOutputCopyWith<$Res> {
  _$A2uiLineOutputCopyWithImpl(this._self, this._then);

  final A2uiLineOutput _self;
  final $Res Function(A2uiLineOutput) _then;

/// Create a copy of ParsedOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? line = null,}) {
  return _then(A2uiLineOutput(
null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
