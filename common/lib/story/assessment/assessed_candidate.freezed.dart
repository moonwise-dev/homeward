// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessed_candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssessedCandidate {

 String get id; String get label; int get rank; int get score; bool get missesMustHave; List<String> get pros; List<String> get cons; List<String> get close; List<Reason> get why; List<Reason> get shortfalls; int? get weeklyMinutes; Listing? get listing;
/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessedCandidateCopyWith<AssessedCandidate> get copyWith => _$AssessedCandidateCopyWithImpl<AssessedCandidate>(this as AssessedCandidate, _$identity);

  /// Serializes this AssessedCandidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssessedCandidate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessedCandidate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.missesMustHave, _this.missesMustHave) || other.missesMustHave == _this.missesMustHave)&&const DeepCollectionEquality().equals(other.pros, _this.pros)&&const DeepCollectionEquality().equals(other.cons, _this.cons)&&const DeepCollectionEquality().equals(other.close, _this.close)&&const DeepCollectionEquality().equals(other.why, _this.why)&&const DeepCollectionEquality().equals(other.shortfalls, _this.shortfalls)&&(identical(other.weeklyMinutes, _this.weeklyMinutes) || other.weeklyMinutes == _this.weeklyMinutes)&&(identical(other.listing, _this.listing) || other.listing == _this.listing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssessedCandidate;
  return Object.hash(runtimeType,_this.id,_this.label,_this.rank,_this.score,_this.missesMustHave,const DeepCollectionEquality().hash(_this.pros),const DeepCollectionEquality().hash(_this.cons),const DeepCollectionEquality().hash(_this.close),const DeepCollectionEquality().hash(_this.why),const DeepCollectionEquality().hash(_this.shortfalls),_this.weeklyMinutes,_this.listing);
}

@override
String toString() {
  final _this = this as AssessedCandidate;
  return 'AssessedCandidate(id: ${_this.id}, label: ${_this.label}, rank: ${_this.rank}, score: ${_this.score}, missesMustHave: ${_this.missesMustHave}, pros: ${_this.pros}, cons: ${_this.cons}, close: ${_this.close}, why: ${_this.why}, shortfalls: ${_this.shortfalls}, weeklyMinutes: ${_this.weeklyMinutes}, listing: ${_this.listing})';
}


}

/// @nodoc
abstract mixin class $AssessedCandidateCopyWith<$Res>  {
  factory $AssessedCandidateCopyWith(AssessedCandidate value, $Res Function(AssessedCandidate) _then) = _$AssessedCandidateCopyWithImpl;
@useResult
$Res call({
 String id, String label, int rank, int score, bool missesMustHave, List<String> pros, List<String> cons, List<String> close, List<Reason> why, List<Reason> shortfalls, int? weeklyMinutes, Listing? listing
});


$ListingCopyWith<$Res>? get listing;

}
/// @nodoc
class _$AssessedCandidateCopyWithImpl<$Res>
    implements $AssessedCandidateCopyWith<$Res> {
  _$AssessedCandidateCopyWithImpl(this._self, this._then);

  final AssessedCandidate _self;
  final $Res Function(AssessedCandidate) _then;

/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? rank = null,Object? score = null,Object? missesMustHave = null,Object? pros = null,Object? cons = null,Object? close = null,Object? why = null,Object? shortfalls = null,Object? weeklyMinutes = freezed,Object? listing = freezed,}) {
  return _then(AssessedCandidate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,missesMustHave: null == missesMustHave ? _self.missesMustHave : missesMustHave // ignore: cast_nullable_to_non_nullable
as bool,pros: null == pros ? _self.pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>,cons: null == cons ? _self.cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as List<String>,why: null == why ? _self.why : why // ignore: cast_nullable_to_non_nullable
as List<Reason>,shortfalls: null == shortfalls ? _self.shortfalls : shortfalls // ignore: cast_nullable_to_non_nullable
as List<Reason>,weeklyMinutes: freezed == weeklyMinutes ? _self.weeklyMinutes : weeklyMinutes // ignore: cast_nullable_to_non_nullable
as int?,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}
/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res>? get listing {
    if (_self.listing == null) {
    return null;
  }

  return $ListingCopyWith<$Res>(_self.listing!, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssessedCandidate].
extension AssessedCandidatePatterns on AssessedCandidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssessedCandidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssessedCandidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssessedCandidate value)  $default,){
final _that = this;
switch (_that) {
case _AssessedCandidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssessedCandidate value)?  $default,){
final _that = this;
switch (_that) {
case _AssessedCandidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  int rank,  int score,  bool missesMustHave,  List<String> pros,  List<String> cons,  List<String> close,  List<Reason> why,  List<Reason> shortfalls,  int? weeklyMinutes,  Listing? listing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssessedCandidate() when $default != null:
return $default(_that.id,_that.label,_that.rank,_that.score,_that.missesMustHave,_that.pros,_that.cons,_that.close,_that.why,_that.shortfalls,_that.weeklyMinutes,_that.listing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  int rank,  int score,  bool missesMustHave,  List<String> pros,  List<String> cons,  List<String> close,  List<Reason> why,  List<Reason> shortfalls,  int? weeklyMinutes,  Listing? listing)  $default,) {final _that = this;
switch (_that) {
case _AssessedCandidate():
return $default(_that.id,_that.label,_that.rank,_that.score,_that.missesMustHave,_that.pros,_that.cons,_that.close,_that.why,_that.shortfalls,_that.weeklyMinutes,_that.listing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  int rank,  int score,  bool missesMustHave,  List<String> pros,  List<String> cons,  List<String> close,  List<Reason> why,  List<Reason> shortfalls,  int? weeklyMinutes,  Listing? listing)?  $default,) {final _that = this;
switch (_that) {
case _AssessedCandidate() when $default != null:
return $default(_that.id,_that.label,_that.rank,_that.score,_that.missesMustHave,_that.pros,_that.cons,_that.close,_that.why,_that.shortfalls,_that.weeklyMinutes,_that.listing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssessedCandidate implements AssessedCandidate {
  const _AssessedCandidate({required this.id, required this.label, required this.rank, required this.score, required this.missesMustHave,  List<String> pros = const [],  List<String> cons = const [],  List<String> close = const [],  List<Reason> why = const [],  List<Reason> shortfalls = const [], this.weeklyMinutes, this.listing}): _pros = pros,_cons = cons,_close = close,_why = why,_shortfalls = shortfalls;
  factory _AssessedCandidate.fromJson(Map<String, dynamic> json) => _$AssessedCandidateFromJson(json);

@override final  String id;
@override final  String label;
@override final  int rank;
@override final  int score;
@override final  bool missesMustHave;
 final  List<String> _pros;
@override@JsonKey() List<String> get pros {
  if (_pros is EqualUnmodifiableListView) return _pros;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pros);
}

 final  List<String> _cons;
@override@JsonKey() List<String> get cons {
  if (_cons is EqualUnmodifiableListView) return _cons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cons);
}

 final  List<String> _close;
@override@JsonKey() List<String> get close {
  if (_close is EqualUnmodifiableListView) return _close;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_close);
}

 final  List<Reason> _why;
@override@JsonKey() List<Reason> get why {
  if (_why is EqualUnmodifiableListView) return _why;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_why);
}

 final  List<Reason> _shortfalls;
@override@JsonKey() List<Reason> get shortfalls {
  if (_shortfalls is EqualUnmodifiableListView) return _shortfalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shortfalls);
}

@override final  int? weeklyMinutes;
@override final  Listing? listing;

/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessedCandidateCopyWith<_AssessedCandidate> get copyWith => __$AssessedCandidateCopyWithImpl<_AssessedCandidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessedCandidateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessedCandidate&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.score, score) || other.score == score)&&(identical(other.missesMustHave, missesMustHave) || other.missesMustHave == missesMustHave)&&const DeepCollectionEquality().equals(other.pros, _pros)&&const DeepCollectionEquality().equals(other.cons, _cons)&&const DeepCollectionEquality().equals(other.close, _close)&&const DeepCollectionEquality().equals(other.why, _why)&&const DeepCollectionEquality().equals(other.shortfalls, _shortfalls)&&(identical(other.weeklyMinutes, weeklyMinutes) || other.weeklyMinutes == weeklyMinutes)&&(identical(other.listing, listing) || other.listing == listing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,rank,score,missesMustHave,const DeepCollectionEquality().hash(_pros),const DeepCollectionEquality().hash(_cons),const DeepCollectionEquality().hash(_close),const DeepCollectionEquality().hash(_why),const DeepCollectionEquality().hash(_shortfalls),weeklyMinutes,listing);
}

@override
String toString() {
    return 'AssessedCandidate(id: $id, label: $label, rank: $rank, score: $score, missesMustHave: $missesMustHave, pros: $pros, cons: $cons, close: $close, why: $why, shortfalls: $shortfalls, weeklyMinutes: $weeklyMinutes, listing: $listing)';
}


}

/// @nodoc
abstract mixin class _$AssessedCandidateCopyWith<$Res> implements $AssessedCandidateCopyWith<$Res> {
  factory _$AssessedCandidateCopyWith(_AssessedCandidate value, $Res Function(_AssessedCandidate) _then) = __$AssessedCandidateCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, int rank, int score, bool missesMustHave, List<String> pros, List<String> cons, List<String> close, List<Reason> why, List<Reason> shortfalls, int? weeklyMinutes, Listing? listing
});


@override $ListingCopyWith<$Res>? get listing;

}
/// @nodoc
class __$AssessedCandidateCopyWithImpl<$Res>
    implements _$AssessedCandidateCopyWith<$Res> {
  __$AssessedCandidateCopyWithImpl(this._self, this._then);

  final _AssessedCandidate _self;
  final $Res Function(_AssessedCandidate) _then;

/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? rank = null,Object? score = null,Object? missesMustHave = null,Object? pros = null,Object? cons = null,Object? close = null,Object? why = null,Object? shortfalls = null,Object? weeklyMinutes = freezed,Object? listing = freezed,}) {
  return _then(_AssessedCandidate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,missesMustHave: null == missesMustHave ? _self.missesMustHave : missesMustHave // ignore: cast_nullable_to_non_nullable
as bool,pros: null == pros ? _self._pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>,cons: null == cons ? _self._cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>,close: null == close ? _self._close : close // ignore: cast_nullable_to_non_nullable
as List<String>,why: null == why ? _self._why : why // ignore: cast_nullable_to_non_nullable
as List<Reason>,shortfalls: null == shortfalls ? _self._shortfalls : shortfalls // ignore: cast_nullable_to_non_nullable
as List<Reason>,weeklyMinutes: freezed == weeklyMinutes ? _self.weeklyMinutes : weeklyMinutes // ignore: cast_nullable_to_non_nullable
as int?,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}

/// Create a copy of AssessedCandidate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingCopyWith<$Res>? get listing {
    if (_self.listing == null) {
    return null;
  }

  return $ListingCopyWith<$Res>(_self.listing!, (value) {
    return _then(_self.copyWith(listing: value));
  });
}
}

// dart format on
