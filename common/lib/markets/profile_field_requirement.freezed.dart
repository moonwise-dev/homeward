// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_field_requirement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileFieldRequirement {

 String get id; ProfileField get field; BuyerPredicate? get appliesTo; String get reason;
/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFieldRequirementCopyWith<ProfileFieldRequirement> get copyWith => _$ProfileFieldRequirementCopyWithImpl<ProfileFieldRequirement>(this as ProfileFieldRequirement, _$identity);

  /// Serializes this ProfileFieldRequirement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileFieldRequirement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFieldRequirement&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.field, _this.field) || other.field == _this.field)&&(identical(other.appliesTo, _this.appliesTo) || other.appliesTo == _this.appliesTo)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileFieldRequirement;
  return Object.hash(runtimeType,_this.id,_this.field,_this.appliesTo,_this.reason);
}

@override
String toString() {
  final _this = this as ProfileFieldRequirement;
  return 'ProfileFieldRequirement(id: ${_this.id}, field: ${_this.field}, appliesTo: ${_this.appliesTo}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $ProfileFieldRequirementCopyWith<$Res>  {
  factory $ProfileFieldRequirementCopyWith(ProfileFieldRequirement value, $Res Function(ProfileFieldRequirement) _then) = _$ProfileFieldRequirementCopyWithImpl;
@useResult
$Res call({
 String id, ProfileField field, BuyerPredicate? appliesTo, String reason
});


$BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class _$ProfileFieldRequirementCopyWithImpl<$Res>
    implements $ProfileFieldRequirementCopyWith<$Res> {
  _$ProfileFieldRequirementCopyWithImpl(this._self, this._then);

  final ProfileFieldRequirement _self;
  final $Res Function(ProfileFieldRequirement) _then;

/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? field = null,Object? appliesTo = freezed,Object? reason = null,}) {
  return _then(ProfileFieldRequirement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as ProfileField,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileFieldRequirement].
extension ProfileFieldRequirementPatterns on ProfileFieldRequirement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileFieldRequirement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileFieldRequirement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileFieldRequirement value)  $default,){
final _that = this;
switch (_that) {
case _ProfileFieldRequirement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileFieldRequirement value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileFieldRequirement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProfileField field,  BuyerPredicate? appliesTo,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileFieldRequirement() when $default != null:
return $default(_that.id,_that.field,_that.appliesTo,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProfileField field,  BuyerPredicate? appliesTo,  String reason)  $default,) {final _that = this;
switch (_that) {
case _ProfileFieldRequirement():
return $default(_that.id,_that.field,_that.appliesTo,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProfileField field,  BuyerPredicate? appliesTo,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _ProfileFieldRequirement() when $default != null:
return $default(_that.id,_that.field,_that.appliesTo,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileFieldRequirement implements ProfileFieldRequirement {
  const _ProfileFieldRequirement({required this.id, required this.field, this.appliesTo, required this.reason});
  factory _ProfileFieldRequirement.fromJson(Map<String, dynamic> json) => _$ProfileFieldRequirementFromJson(json);

@override final  String id;
@override final  ProfileField field;
@override final  BuyerPredicate? appliesTo;
@override final  String reason;

/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFieldRequirementCopyWith<_ProfileFieldRequirement> get copyWith => __$ProfileFieldRequirementCopyWithImpl<_ProfileFieldRequirement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileFieldRequirementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFieldRequirement&&(identical(other.id, id) || other.id == id)&&(identical(other.field, field) || other.field == field)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,field,appliesTo,reason);
}

@override
String toString() {
    return 'ProfileFieldRequirement(id: $id, field: $field, appliesTo: $appliesTo, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ProfileFieldRequirementCopyWith<$Res> implements $ProfileFieldRequirementCopyWith<$Res> {
  factory _$ProfileFieldRequirementCopyWith(_ProfileFieldRequirement value, $Res Function(_ProfileFieldRequirement) _then) = __$ProfileFieldRequirementCopyWithImpl;
@override @useResult
$Res call({
 String id, ProfileField field, BuyerPredicate? appliesTo, String reason
});


@override $BuyerPredicateCopyWith<$Res>? get appliesTo;

}
/// @nodoc
class __$ProfileFieldRequirementCopyWithImpl<$Res>
    implements _$ProfileFieldRequirementCopyWith<$Res> {
  __$ProfileFieldRequirementCopyWithImpl(this._self, this._then);

  final _ProfileFieldRequirement _self;
  final $Res Function(_ProfileFieldRequirement) _then;

/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? field = null,Object? appliesTo = freezed,Object? reason = null,}) {
  return _then(_ProfileFieldRequirement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as ProfileField,appliesTo: freezed == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as BuyerPredicate?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProfileFieldRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res>? get appliesTo {
    if (_self.appliesTo == null) {
    return null;
  }

  return $BuyerPredicateCopyWith<$Res>(_self.appliesTo!, (value) {
    return _then(_self.copyWith(appliesTo: value));
  });
}
}

// dart format on
