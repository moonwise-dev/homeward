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

 StoryReason? get reason; String? get city; GeoPoint? get cityPoint; TravelMode? get mode; int? get maxMinutes; List<Anchor> get anchors; List<Candidate> get candidates; List<Criterion> get criteria; bool get committed; String? get chosenCandidateId; int? get adults; List<int>? get childAges; HomeType? get homeType; OutdoorSpace? get outdoor; HomeStyle? get style; int? get rooms; List<String> get areaIds; Money? get priceMax; String? get sampleCity; List<AreaOption> get areaOptions; List<HomeNeed> get needs; List<ListingRead> get readings; List<CaseFacet> get answered; int get questions;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Story&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.cityPoint, _this.cityPoint) || other.cityPoint == _this.cityPoint)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.maxMinutes, _this.maxMinutes) || other.maxMinutes == _this.maxMinutes)&&const DeepCollectionEquality().equals(other.anchors, _this.anchors)&&const DeepCollectionEquality().equals(other.candidates, _this.candidates)&&const DeepCollectionEquality().equals(other.criteria, _this.criteria)&&(identical(other.committed, _this.committed) || other.committed == _this.committed)&&(identical(other.chosenCandidateId, _this.chosenCandidateId) || other.chosenCandidateId == _this.chosenCandidateId)&&(identical(other.adults, _this.adults) || other.adults == _this.adults)&&const DeepCollectionEquality().equals(other.childAges, _this.childAges)&&(identical(other.homeType, _this.homeType) || other.homeType == _this.homeType)&&(identical(other.outdoor, _this.outdoor) || other.outdoor == _this.outdoor)&&(identical(other.style, _this.style) || other.style == _this.style)&&(identical(other.rooms, _this.rooms) || other.rooms == _this.rooms)&&const DeepCollectionEquality().equals(other.areaIds, _this.areaIds)&&(identical(other.priceMax, _this.priceMax) || other.priceMax == _this.priceMax)&&(identical(other.sampleCity, _this.sampleCity) || other.sampleCity == _this.sampleCity)&&const DeepCollectionEquality().equals(other.areaOptions, _this.areaOptions)&&const DeepCollectionEquality().equals(other.needs, _this.needs)&&const DeepCollectionEquality().equals(other.readings, _this.readings)&&const DeepCollectionEquality().equals(other.answered, _this.answered)&&(identical(other.questions, _this.questions) || other.questions == _this.questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Story;
  return Object.hashAll([runtimeType,_this.reason,_this.city,_this.cityPoint,_this.mode,_this.maxMinutes,const DeepCollectionEquality().hash(_this.anchors),const DeepCollectionEquality().hash(_this.candidates),const DeepCollectionEquality().hash(_this.criteria),_this.committed,_this.chosenCandidateId,_this.adults,const DeepCollectionEquality().hash(_this.childAges),_this.homeType,_this.outdoor,_this.style,_this.rooms,const DeepCollectionEquality().hash(_this.areaIds),_this.priceMax,_this.sampleCity,const DeepCollectionEquality().hash(_this.areaOptions),const DeepCollectionEquality().hash(_this.needs),const DeepCollectionEquality().hash(_this.readings),const DeepCollectionEquality().hash(_this.answered),_this.questions]);
}

@override
String toString() {
  final _this = this as Story;
  return 'Story(reason: ${_this.reason}, city: ${_this.city}, cityPoint: ${_this.cityPoint}, mode: ${_this.mode}, maxMinutes: ${_this.maxMinutes}, anchors: ${_this.anchors}, candidates: ${_this.candidates}, criteria: ${_this.criteria}, committed: ${_this.committed}, chosenCandidateId: ${_this.chosenCandidateId}, adults: ${_this.adults}, childAges: ${_this.childAges}, homeType: ${_this.homeType}, outdoor: ${_this.outdoor}, style: ${_this.style}, rooms: ${_this.rooms}, areaIds: ${_this.areaIds}, priceMax: ${_this.priceMax}, sampleCity: ${_this.sampleCity}, areaOptions: ${_this.areaOptions}, needs: ${_this.needs}, readings: ${_this.readings}, answered: ${_this.answered}, questions: ${_this.questions})';
}


}

/// @nodoc
abstract mixin class $StoryCopyWith<$Res>  {
  factory $StoryCopyWith(Story value, $Res Function(Story) _then) = _$StoryCopyWithImpl;
@useResult
$Res call({
 StoryReason? reason, String? city, GeoPoint? cityPoint, TravelMode? mode, int? maxMinutes, List<Anchor> anchors, List<Candidate> candidates, List<Criterion> criteria, bool committed, String? chosenCandidateId, int? adults, List<int>? childAges, HomeType? homeType, OutdoorSpace? outdoor, HomeStyle? style, int? rooms, List<String> areaIds, Money? priceMax, String? sampleCity, List<AreaOption> areaOptions, List<HomeNeed> needs, List<ListingRead> readings, List<CaseFacet> answered, int questions
});


$GeoPointCopyWith<$Res>? get cityPoint;$MoneyCopyWith<$Res>? get priceMax;

}
/// @nodoc
class _$StoryCopyWithImpl<$Res>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._self, this._then);

  final Story _self;
  final $Res Function(Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = freezed,Object? city = freezed,Object? cityPoint = freezed,Object? mode = freezed,Object? maxMinutes = freezed,Object? anchors = null,Object? candidates = null,Object? criteria = null,Object? committed = null,Object? chosenCandidateId = freezed,Object? adults = freezed,Object? childAges = freezed,Object? homeType = freezed,Object? outdoor = freezed,Object? style = freezed,Object? rooms = freezed,Object? areaIds = null,Object? priceMax = freezed,Object? sampleCity = freezed,Object? areaOptions = null,Object? needs = null,Object? readings = null,Object? answered = null,Object? questions = null,}) {
  return _then(Story(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as StoryReason?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,cityPoint: freezed == cityPoint ? _self.cityPoint : cityPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode?,maxMinutes: freezed == maxMinutes ? _self.maxMinutes : maxMinutes // ignore: cast_nullable_to_non_nullable
as int?,anchors: null == anchors ? _self.anchors : anchors // ignore: cast_nullable_to_non_nullable
as List<Anchor>,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<Candidate>,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<Criterion>,committed: null == committed ? _self.committed : committed // ignore: cast_nullable_to_non_nullable
as bool,chosenCandidateId: freezed == chosenCandidateId ? _self.chosenCandidateId : chosenCandidateId // ignore: cast_nullable_to_non_nullable
as String?,adults: freezed == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int?,childAges: freezed == childAges ? _self.childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>?,homeType: freezed == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType?,outdoor: freezed == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,areaIds: null == areaIds ? _self.areaIds : areaIds // ignore: cast_nullable_to_non_nullable
as List<String>,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as Money?,sampleCity: freezed == sampleCity ? _self.sampleCity : sampleCity // ignore: cast_nullable_to_non_nullable
as String?,areaOptions: null == areaOptions ? _self.areaOptions : areaOptions // ignore: cast_nullable_to_non_nullable
as List<AreaOption>,needs: null == needs ? _self.needs : needs // ignore: cast_nullable_to_non_nullable
as List<HomeNeed>,readings: null == readings ? _self.readings : readings // ignore: cast_nullable_to_non_nullable
as List<ListingRead>,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as List<CaseFacet>,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get cityPoint {
    if (_self.cityPoint == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.cityPoint!, (value) {
    return _then(_self.copyWith(cityPoint: value));
  });
}/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get priceMax {
    if (_self.priceMax == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.priceMax!, (value) {
    return _then(_self.copyWith(priceMax: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoryReason? reason,  String? city,  GeoPoint? cityPoint,  TravelMode? mode,  int? maxMinutes,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId,  int? adults,  List<int>? childAges,  HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  int? rooms,  List<String> areaIds,  Money? priceMax,  String? sampleCity,  List<AreaOption> areaOptions,  List<HomeNeed> needs,  List<ListingRead> readings,  List<CaseFacet> answered,  int questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.reason,_that.city,_that.cityPoint,_that.mode,_that.maxMinutes,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId,_that.adults,_that.childAges,_that.homeType,_that.outdoor,_that.style,_that.rooms,_that.areaIds,_that.priceMax,_that.sampleCity,_that.areaOptions,_that.needs,_that.readings,_that.answered,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoryReason? reason,  String? city,  GeoPoint? cityPoint,  TravelMode? mode,  int? maxMinutes,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId,  int? adults,  List<int>? childAges,  HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  int? rooms,  List<String> areaIds,  Money? priceMax,  String? sampleCity,  List<AreaOption> areaOptions,  List<HomeNeed> needs,  List<ListingRead> readings,  List<CaseFacet> answered,  int questions)  $default,) {final _that = this;
switch (_that) {
case _Story():
return $default(_that.reason,_that.city,_that.cityPoint,_that.mode,_that.maxMinutes,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId,_that.adults,_that.childAges,_that.homeType,_that.outdoor,_that.style,_that.rooms,_that.areaIds,_that.priceMax,_that.sampleCity,_that.areaOptions,_that.needs,_that.readings,_that.answered,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoryReason? reason,  String? city,  GeoPoint? cityPoint,  TravelMode? mode,  int? maxMinutes,  List<Anchor> anchors,  List<Candidate> candidates,  List<Criterion> criteria,  bool committed,  String? chosenCandidateId,  int? adults,  List<int>? childAges,  HomeType? homeType,  OutdoorSpace? outdoor,  HomeStyle? style,  int? rooms,  List<String> areaIds,  Money? priceMax,  String? sampleCity,  List<AreaOption> areaOptions,  List<HomeNeed> needs,  List<ListingRead> readings,  List<CaseFacet> answered,  int questions)?  $default,) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.reason,_that.city,_that.cityPoint,_that.mode,_that.maxMinutes,_that.anchors,_that.candidates,_that.criteria,_that.committed,_that.chosenCandidateId,_that.adults,_that.childAges,_that.homeType,_that.outdoor,_that.style,_that.rooms,_that.areaIds,_that.priceMax,_that.sampleCity,_that.areaOptions,_that.needs,_that.readings,_that.answered,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Story extends Story {
  const _Story({this.reason, this.city, this.cityPoint, this.mode, this.maxMinutes,  List<Anchor> anchors = const [],  List<Candidate> candidates = const [],  List<Criterion> criteria = const [], this.committed = false, this.chosenCandidateId, this.adults,  List<int>? childAges, this.homeType, this.outdoor, this.style, this.rooms,  List<String> areaIds = const [], this.priceMax, this.sampleCity,  List<AreaOption> areaOptions = const [],  List<HomeNeed> needs = const [],  List<ListingRead> readings = const [],  List<CaseFacet> answered = const [], this.questions = 0}): _anchors = anchors,_candidates = candidates,_criteria = criteria,_childAges = childAges,_areaIds = areaIds,_areaOptions = areaOptions,_needs = needs,_readings = readings,_answered = answered,super._();
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

@override final  StoryReason? reason;
@override final  String? city;
@override final  GeoPoint? cityPoint;
@override final  TravelMode? mode;
@override final  int? maxMinutes;
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
@override final  int? adults;
 final  List<int>? _childAges;
@override List<int>? get childAges {
  final value = _childAges;
  if (value == null) return null;
  if (_childAges is EqualUnmodifiableListView) return _childAges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  HomeType? homeType;
@override final  OutdoorSpace? outdoor;
@override final  HomeStyle? style;
@override final  int? rooms;
 final  List<String> _areaIds;
@override@JsonKey() List<String> get areaIds {
  if (_areaIds is EqualUnmodifiableListView) return _areaIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areaIds);
}

@override final  Money? priceMax;
@override final  String? sampleCity;
 final  List<AreaOption> _areaOptions;
@override@JsonKey() List<AreaOption> get areaOptions {
  if (_areaOptions is EqualUnmodifiableListView) return _areaOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areaOptions);
}

 final  List<HomeNeed> _needs;
@override@JsonKey() List<HomeNeed> get needs {
  if (_needs is EqualUnmodifiableListView) return _needs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_needs);
}

 final  List<ListingRead> _readings;
@override@JsonKey() List<ListingRead> get readings {
  if (_readings is EqualUnmodifiableListView) return _readings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readings);
}

 final  List<CaseFacet> _answered;
@override@JsonKey() List<CaseFacet> get answered {
  if (_answered is EqualUnmodifiableListView) return _answered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answered);
}

@override@JsonKey() final  int questions;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Story&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.city, city) || other.city == city)&&(identical(other.cityPoint, cityPoint) || other.cityPoint == cityPoint)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.maxMinutes, maxMinutes) || other.maxMinutes == maxMinutes)&&const DeepCollectionEquality().equals(other.anchors, _anchors)&&const DeepCollectionEquality().equals(other.candidates, _candidates)&&const DeepCollectionEquality().equals(other.criteria, _criteria)&&(identical(other.committed, committed) || other.committed == committed)&&(identical(other.chosenCandidateId, chosenCandidateId) || other.chosenCandidateId == chosenCandidateId)&&(identical(other.adults, adults) || other.adults == adults)&&const DeepCollectionEquality().equals(other.childAges, _childAges)&&(identical(other.homeType, homeType) || other.homeType == homeType)&&(identical(other.outdoor, outdoor) || other.outdoor == outdoor)&&(identical(other.style, style) || other.style == style)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&const DeepCollectionEquality().equals(other.areaIds, _areaIds)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.sampleCity, sampleCity) || other.sampleCity == sampleCity)&&const DeepCollectionEquality().equals(other.areaOptions, _areaOptions)&&const DeepCollectionEquality().equals(other.needs, _needs)&&const DeepCollectionEquality().equals(other.readings, _readings)&&const DeepCollectionEquality().equals(other.answered, _answered)&&(identical(other.questions, questions) || other.questions == questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,reason,city,cityPoint,mode,maxMinutes,const DeepCollectionEquality().hash(_anchors),const DeepCollectionEquality().hash(_candidates),const DeepCollectionEquality().hash(_criteria),committed,chosenCandidateId,adults,const DeepCollectionEquality().hash(_childAges),homeType,outdoor,style,rooms,const DeepCollectionEquality().hash(_areaIds),priceMax,sampleCity,const DeepCollectionEquality().hash(_areaOptions),const DeepCollectionEquality().hash(_needs),const DeepCollectionEquality().hash(_readings),const DeepCollectionEquality().hash(_answered),questions]);
}

@override
String toString() {
    return 'Story(reason: $reason, city: $city, cityPoint: $cityPoint, mode: $mode, maxMinutes: $maxMinutes, anchors: $anchors, candidates: $candidates, criteria: $criteria, committed: $committed, chosenCandidateId: $chosenCandidateId, adults: $adults, childAges: $childAges, homeType: $homeType, outdoor: $outdoor, style: $style, rooms: $rooms, areaIds: $areaIds, priceMax: $priceMax, sampleCity: $sampleCity, areaOptions: $areaOptions, needs: $needs, readings: $readings, answered: $answered, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) _then) = __$StoryCopyWithImpl;
@override @useResult
$Res call({
 StoryReason? reason, String? city, GeoPoint? cityPoint, TravelMode? mode, int? maxMinutes, List<Anchor> anchors, List<Candidate> candidates, List<Criterion> criteria, bool committed, String? chosenCandidateId, int? adults, List<int>? childAges, HomeType? homeType, OutdoorSpace? outdoor, HomeStyle? style, int? rooms, List<String> areaIds, Money? priceMax, String? sampleCity, List<AreaOption> areaOptions, List<HomeNeed> needs, List<ListingRead> readings, List<CaseFacet> answered, int questions
});


@override $GeoPointCopyWith<$Res>? get cityPoint;@override $MoneyCopyWith<$Res>? get priceMax;

}
/// @nodoc
class __$StoryCopyWithImpl<$Res>
    implements _$StoryCopyWith<$Res> {
  __$StoryCopyWithImpl(this._self, this._then);

  final _Story _self;
  final $Res Function(_Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,Object? city = freezed,Object? cityPoint = freezed,Object? mode = freezed,Object? maxMinutes = freezed,Object? anchors = null,Object? candidates = null,Object? criteria = null,Object? committed = null,Object? chosenCandidateId = freezed,Object? adults = freezed,Object? childAges = freezed,Object? homeType = freezed,Object? outdoor = freezed,Object? style = freezed,Object? rooms = freezed,Object? areaIds = null,Object? priceMax = freezed,Object? sampleCity = freezed,Object? areaOptions = null,Object? needs = null,Object? readings = null,Object? answered = null,Object? questions = null,}) {
  return _then(_Story(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as StoryReason?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,cityPoint: freezed == cityPoint ? _self.cityPoint : cityPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TravelMode?,maxMinutes: freezed == maxMinutes ? _self.maxMinutes : maxMinutes // ignore: cast_nullable_to_non_nullable
as int?,anchors: null == anchors ? _self._anchors : anchors // ignore: cast_nullable_to_non_nullable
as List<Anchor>,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<Candidate>,criteria: null == criteria ? _self._criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<Criterion>,committed: null == committed ? _self.committed : committed // ignore: cast_nullable_to_non_nullable
as bool,chosenCandidateId: freezed == chosenCandidateId ? _self.chosenCandidateId : chosenCandidateId // ignore: cast_nullable_to_non_nullable
as String?,adults: freezed == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int?,childAges: freezed == childAges ? _self._childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>?,homeType: freezed == homeType ? _self.homeType : homeType // ignore: cast_nullable_to_non_nullable
as HomeType?,outdoor: freezed == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorSpace?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as HomeStyle?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int?,areaIds: null == areaIds ? _self._areaIds : areaIds // ignore: cast_nullable_to_non_nullable
as List<String>,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as Money?,sampleCity: freezed == sampleCity ? _self.sampleCity : sampleCity // ignore: cast_nullable_to_non_nullable
as String?,areaOptions: null == areaOptions ? _self._areaOptions : areaOptions // ignore: cast_nullable_to_non_nullable
as List<AreaOption>,needs: null == needs ? _self._needs : needs // ignore: cast_nullable_to_non_nullable
as List<HomeNeed>,readings: null == readings ? _self._readings : readings // ignore: cast_nullable_to_non_nullable
as List<ListingRead>,answered: null == answered ? _self._answered : answered // ignore: cast_nullable_to_non_nullable
as List<CaseFacet>,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get cityPoint {
    if (_self.cityPoint == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.cityPoint!, (value) {
    return _then(_self.copyWith(cityPoint: value));
  });
}/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get priceMax {
    if (_self.priceMax == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.priceMax!, (value) {
    return _then(_self.copyWith(priceMax: value));
  });
}
}

// dart format on
