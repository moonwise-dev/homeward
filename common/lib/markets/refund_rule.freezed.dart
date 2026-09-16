// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundRule {

 BuyerPredicate get when; BuyerPredicate get recomputeAs;@PeriodJsonConverter() Period get deadline;@PeriodJsonConverter() Period get claimWindow; String get sourceId;
/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundRuleCopyWith<RefundRule> get copyWith => _$RefundRuleCopyWithImpl<RefundRule>(this as RefundRule, _$identity);

  /// Serializes this RefundRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RefundRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundRule&&(identical(other.when, _this.when) || other.when == _this.when)&&(identical(other.recomputeAs, _this.recomputeAs) || other.recomputeAs == _this.recomputeAs)&&(identical(other.deadline, _this.deadline) || other.deadline == _this.deadline)&&(identical(other.claimWindow, _this.claimWindow) || other.claimWindow == _this.claimWindow)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RefundRule;
  return Object.hash(runtimeType,_this.when,_this.recomputeAs,_this.deadline,_this.claimWindow,_this.sourceId);
}

@override
String toString() {
  final _this = this as RefundRule;
  return 'RefundRule(when: ${_this.when}, recomputeAs: ${_this.recomputeAs}, deadline: ${_this.deadline}, claimWindow: ${_this.claimWindow}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $RefundRuleCopyWith<$Res>  {
  factory $RefundRuleCopyWith(RefundRule value, $Res Function(RefundRule) _then) = _$RefundRuleCopyWithImpl;
@useResult
$Res call({
 BuyerPredicate when, BuyerPredicate recomputeAs,@PeriodJsonConverter() Period deadline,@PeriodJsonConverter() Period claimWindow, String sourceId
});


$BuyerPredicateCopyWith<$Res> get when;$BuyerPredicateCopyWith<$Res> get recomputeAs;

}
/// @nodoc
class _$RefundRuleCopyWithImpl<$Res>
    implements $RefundRuleCopyWith<$Res> {
  _$RefundRuleCopyWithImpl(this._self, this._then);

  final RefundRule _self;
  final $Res Function(RefundRule) _then;

/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? when = null,Object? recomputeAs = null,Object? deadline = null,Object? claimWindow = null,Object? sourceId = null,}) {
  return _then(RefundRule(
when: null == when ? _self.when : when // ignore: cast_nullable_to_non_nullable
as BuyerPredicate,recomputeAs: null == recomputeAs ? _self.recomputeAs : recomputeAs // ignore: cast_nullable_to_non_nullable
as BuyerPredicate,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as Period,claimWindow: null == claimWindow ? _self.claimWindow : claimWindow // ignore: cast_nullable_to_non_nullable
as Period,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res> get when {
  
  return $BuyerPredicateCopyWith<$Res>(_self.when, (value) {
    return _then(_self.copyWith(when: value));
  });
}/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res> get recomputeAs {
  
  return $BuyerPredicateCopyWith<$Res>(_self.recomputeAs, (value) {
    return _then(_self.copyWith(recomputeAs: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefundRule].
extension RefundRulePatterns on RefundRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundRule value)  $default,){
final _that = this;
switch (_that) {
case _RefundRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundRule value)?  $default,){
final _that = this;
switch (_that) {
case _RefundRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BuyerPredicate when,  BuyerPredicate recomputeAs, @PeriodJsonConverter()  Period deadline, @PeriodJsonConverter()  Period claimWindow,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundRule() when $default != null:
return $default(_that.when,_that.recomputeAs,_that.deadline,_that.claimWindow,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BuyerPredicate when,  BuyerPredicate recomputeAs, @PeriodJsonConverter()  Period deadline, @PeriodJsonConverter()  Period claimWindow,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _RefundRule():
return $default(_that.when,_that.recomputeAs,_that.deadline,_that.claimWindow,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BuyerPredicate when,  BuyerPredicate recomputeAs, @PeriodJsonConverter()  Period deadline, @PeriodJsonConverter()  Period claimWindow,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _RefundRule() when $default != null:
return $default(_that.when,_that.recomputeAs,_that.deadline,_that.claimWindow,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundRule implements RefundRule {
  const _RefundRule({required this.when, required this.recomputeAs, @PeriodJsonConverter() required this.deadline, @PeriodJsonConverter() required this.claimWindow, required this.sourceId});
  factory _RefundRule.fromJson(Map<String, dynamic> json) => _$RefundRuleFromJson(json);

@override final  BuyerPredicate when;
@override final  BuyerPredicate recomputeAs;
@override@PeriodJsonConverter() final  Period deadline;
@override@PeriodJsonConverter() final  Period claimWindow;
@override final  String sourceId;

/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundRuleCopyWith<_RefundRule> get copyWith => __$RefundRuleCopyWithImpl<_RefundRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundRule&&(identical(other.when, when) || other.when == when)&&(identical(other.recomputeAs, recomputeAs) || other.recomputeAs == recomputeAs)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.claimWindow, claimWindow) || other.claimWindow == claimWindow)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,when,recomputeAs,deadline,claimWindow,sourceId);
}

@override
String toString() {
    return 'RefundRule(when: $when, recomputeAs: $recomputeAs, deadline: $deadline, claimWindow: $claimWindow, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$RefundRuleCopyWith<$Res> implements $RefundRuleCopyWith<$Res> {
  factory _$RefundRuleCopyWith(_RefundRule value, $Res Function(_RefundRule) _then) = __$RefundRuleCopyWithImpl;
@override @useResult
$Res call({
 BuyerPredicate when, BuyerPredicate recomputeAs,@PeriodJsonConverter() Period deadline,@PeriodJsonConverter() Period claimWindow, String sourceId
});


@override $BuyerPredicateCopyWith<$Res> get when;@override $BuyerPredicateCopyWith<$Res> get recomputeAs;

}
/// @nodoc
class __$RefundRuleCopyWithImpl<$Res>
    implements _$RefundRuleCopyWith<$Res> {
  __$RefundRuleCopyWithImpl(this._self, this._then);

  final _RefundRule _self;
  final $Res Function(_RefundRule) _then;

/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? when = null,Object? recomputeAs = null,Object? deadline = null,Object? claimWindow = null,Object? sourceId = null,}) {
  return _then(_RefundRule(
when: null == when ? _self.when : when // ignore: cast_nullable_to_non_nullable
as BuyerPredicate,recomputeAs: null == recomputeAs ? _self.recomputeAs : recomputeAs // ignore: cast_nullable_to_non_nullable
as BuyerPredicate,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as Period,claimWindow: null == claimWindow ? _self.claimWindow : claimWindow // ignore: cast_nullable_to_non_nullable
as Period,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res> get when {
  
  return $BuyerPredicateCopyWith<$Res>(_self.when, (value) {
    return _then(_self.copyWith(when: value));
  });
}/// Create a copy of RefundRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerPredicateCopyWith<$Res> get recomputeAs {
  
  return $BuyerPredicateCopyWith<$Res>(_self.recomputeAs, (value) {
    return _then(_self.copyWith(recomputeAs: value));
  });
}
}

// dart format on
