// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Applicability {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Applicability);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Applicability()';
}


}

/// @nodoc
class $ApplicabilityCopyWith<$Res>  {
$ApplicabilityCopyWith(Applicability _, $Res Function(Applicability) __);
}


/// Adds pattern-matching-related methods to [Applicability].
extension ApplicabilityPatterns on Applicability {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Applies value)?  applies,TResult Function( DoesNotApply value)?  doesNotApply,TResult Function( Pending value)?  pending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Applies() when applies != null:
return applies(_that);case DoesNotApply() when doesNotApply != null:
return doesNotApply(_that);case Pending() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Applies value)  applies,required TResult Function( DoesNotApply value)  doesNotApply,required TResult Function( Pending value)  pending,}){
final _that = this;
switch (_that) {
case Applies():
return applies(_that);case DoesNotApply():
return doesNotApply(_that);case Pending():
return pending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Applies value)?  applies,TResult? Function( DoesNotApply value)?  doesNotApply,TResult? Function( Pending value)?  pending,}){
final _that = this;
switch (_that) {
case Applies() when applies != null:
return applies(_that);case DoesNotApply() when doesNotApply != null:
return doesNotApply(_that);case Pending() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  applies,TResult Function()?  doesNotApply,TResult Function( Set<ProfileField> missing)?  pending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Applies() when applies != null:
return applies();case DoesNotApply() when doesNotApply != null:
return doesNotApply();case Pending() when pending != null:
return pending(_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  applies,required TResult Function()  doesNotApply,required TResult Function( Set<ProfileField> missing)  pending,}) {final _that = this;
switch (_that) {
case Applies():
return applies();case DoesNotApply():
return doesNotApply();case Pending():
return pending(_that.missing);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  applies,TResult? Function()?  doesNotApply,TResult? Function( Set<ProfileField> missing)?  pending,}) {final _that = this;
switch (_that) {
case Applies() when applies != null:
return applies();case DoesNotApply() when doesNotApply != null:
return doesNotApply();case Pending() when pending != null:
return pending(_that.missing);case _:
  return null;

}
}

}

/// @nodoc


class Applies implements Applicability {
  const Applies();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Applies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Applicability.applies()';
}


}




/// @nodoc


class DoesNotApply implements Applicability {
  const DoesNotApply();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DoesNotApply);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Applicability.doesNotApply()';
}


}




/// @nodoc


class Pending implements Applicability {
  const Pending( Set<ProfileField> missing): _missing = missing;
  

 final  Set<ProfileField> _missing;
 Set<ProfileField> get missing {
  if (_missing is EqualUnmodifiableSetView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missing);
}


/// Create a copy of Applicability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingCopyWith<Pending> get copyWith => _$PendingCopyWithImpl<Pending>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Pending&&const DeepCollectionEquality().equals(other.missing, _missing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_missing));
}

@override
String toString() {
    return 'Applicability.pending(missing: $missing)';
}


}

/// @nodoc
abstract mixin class $PendingCopyWith<$Res> implements $ApplicabilityCopyWith<$Res> {
  factory $PendingCopyWith(Pending value, $Res Function(Pending) _then) = _$PendingCopyWithImpl;
@useResult
$Res call({
 Set<ProfileField> missing
});




}
/// @nodoc
class _$PendingCopyWithImpl<$Res>
    implements $PendingCopyWith<$Res> {
  _$PendingCopyWithImpl(this._self, this._then);

  final Pending _self;
  final $Res Function(Pending) _then;

/// Create a copy of Applicability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? missing = null,}) {
  return _then(Pending(
null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as Set<ProfileField>,
  ));
}


}

// dart format on
