// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Story {

 StoryReason? get reason; String? get city; List<Anchor> get anchors; List<Candidate> get candidates; List<Criterion> get criteria; bool get committed; String? get chosenCandidateId;
/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryCopyWith<Story> get copyWith => _$StoryCopyWithImpl<Story>(this as Story, _$identity);

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Story;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Story&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.city, _this.city) || other.city == _this.city)&&const DeepCollectionEquality().equals(other.anchors, _this.anchors)&&const DeepCollectionEquality().equals(other.candidates, _this.candidates)&&const DeepCollectionEquality().equals(other.criteria, _this.criteria)&&(identical(other.committed, _this.committed) || other.committed == _this.committed)&&(identical(other.chosenCandidateId, _this.chosenCandidateId) || other.chosenCandidateId == _this.chosenCandidateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Story;
  return Object.hash(runtimeType,_this.reason,_this.city,const DeepCollectionEquality().hash(_this.anchors),const DeepCollectionEquality().hash(_this.candidates),const DeepCollectionEquality().hash(_this.criteria),_this.committed,_this.chosenCandidateId);
}

@override
String toString() {
  final _this = this as Story;
  return 'Story(reason: ${_this.reason}, city: ${_this.city}, anchors: ${_this.anchors}, candidates: ${_this.candidates}, criteria: ${_this.criteria}, committed: ${_this.committed}, chosenCandidateId: ${_this.chosenCandidateId})';
}


}

/// @nodoc
abstract mixin class $StoryCopyWith<$Res>  {
  factory $StoryCopyWith(Story value, $Res Function(Story) _then) = _$StoryCopyWithImpl;
@useResult
$Res call({
 StoryReason? reason, String? city, List<Anchor> anchors, List<Candidate> candidates, List<Criterion> criteria, bool committed, String? chosenCandidateId
});




}
/// @nodoc
class _$StoryCopyWithImpl<$Res>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._self, this._then);

  final Story _self;
  final $Res Function(Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = freezed,Object? city = freezed,Object? anchors = null,Object? candidates = null,Object? criteria = null,Object? committed = null,Object? chosenCandidateId = freezed,}) {
  return _then(Story(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as StoryReason?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,anchors: null == anchors ? _self.anchors : anchors // ignore: cast_nullable_to_non_nullable
as List<Anchor>,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<Candidate>,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<Criterion>,committed: null == committed ? _self.committed : committed // ignore: cast_nullable_to_non_nullable
as bool,chosenCandidateId: freezed == chosenCandidateId ? _self.chosenCandidateId : chosenCandidateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Story].
extension StoryPatterns on Story {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Story value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Story() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Story value)  $default,){
final _that = this;
switch (_that) {
case _Story():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Story value)?  $default,){
final _that = this;
switch (_that) {
case _Story() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoryReason? reason,  String? city,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.reason,_that.city,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoryReason? reason,  String? city,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId)  $default,) {final _that = this;
switch (_that) {
case _Story():
return $default(_that.reason,_that.city,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoryReason? reason,  String? city,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId)?  $default,) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.reason,_that.city,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Story extends Story {
  const _Story({this.reason, this.city,  List<Anchor> anchors = const [],  List<Candidate> candidates = const [],  List<Criterion> criteria = const [], this.committed = false, this.chosenCandidateId}): _anchors = anchors,_candidates = candidates,_criteria = criteria,super._();
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

@override final  StoryReason? reason;
@override final  String? city;
 final  List<Anchor> _anchors;
@override@JsonKey() List<Anchor> get anchors {
  if (_anchors is EqualUnmodifiableListView) return _anchors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_anchors);
}

 final  List<Candidate> _candidates;
@override@JsonKey() List<Candidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}

 final  List<Criterion> _criteria;
@override@JsonKey() List<Criterion> get criteria {
  if (_criteria is EqualUnmodifiableListView) return _criteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_criteria);
}

@override@JsonKey() final  bool committed;
@override final  String? chosenCandidateId;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryCopyWith<_Story> get copyWith => __$StoryCopyWithImpl<_Story>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Story&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.anchors, _anchors)&&const DeepCollectionEquality().equals(other.candidates, _candidates)&&const DeepCollectionEquality().equals(other.criteria, _criteria)&&(identical(other.committed, committed) || other.committed == committed)&&(identical(other.chosenCandidateId, chosenCandidateId) || other.chosenCandidateId == chosenCandidateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reason,city,const DeepCollectionEquality().hash(_anchors),const DeepCollectionEquality().hash(_candidates),const DeepCollectionEquality().hash(_criteria),committed,chosenCandidateId);
}

@override
String toString() {
    return 'Story(reason: $reason, city: $city, anchors: $anchors, candidates: $candidates, criteria: $criteria, committed: $committed, chosenCandidateId: $chosenCandidateId)';
}


}

/// @nodoc
abstract mixin class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) _then) = __$StoryCopyWithImpl;
@override @useResult
$Res call({
 StoryReason? reason, String? city, List<Anchor> anchors, List<Candidate> candidates, List<Criterion> criteria, bool committed, String? chosenCandidateId
});




}
/// @nodoc
class __$StoryCopyWithImpl<$Res>
    implements _$StoryCopyWith<$Res> {
  __$StoryCopyWithImpl(this._self, this._then);

  final _Story _self;
  final $Res Function(_Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,Object? city = freezed,Object? anchors = null,Object? candidates = null,Object? criteria = null,Object? committed = null,Object? chosenCandidateId = freezed,}) {
  return _then(_Story(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as StoryReason?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,anchors: null == anchors ? _self._anchors : anchors // ignore: cast_nullable_to_non_nullable
as List<Anchor>,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<Candidate>,criteria: null == criteria ? _self._criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<Criterion>,committed: null == committed ? _self.committed : committed // ignore: cast_nullable_to_non_nullable
as bool,chosenCandidateId: freezed == chosenCandidateId ? _self.chosenCandidateId : chosenCandidateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
