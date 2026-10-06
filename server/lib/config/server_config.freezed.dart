// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerConfig {

 int get port; LogFormat get logFormat; Uri get publicUrl; String? get projectId; List<String> get turnModels; String get thinkingLevel; Duration get headersDeadline; Duration get firstStepDeadline; Duration get modelCooldown; int get maxCorrections; int get maxFinishingRounds; int get maxOverloadRetries; Duration get overloadWait; List<String> get allowedOrigins; bool get appCheckEnforced; String get promptsDirectory; String get marketsDirectory; SessionStore get sessionStore;
/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerConfigCopyWith<ServerConfig> get copyWith => _$ServerConfigCopyWithImpl<ServerConfig>(this as ServerConfig, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ServerConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerConfig&&(identical(other.port, _this.port) || other.port == _this.port)&&(identical(other.logFormat, _this.logFormat) || other.logFormat == _this.logFormat)&&(identical(other.publicUrl, _this.publicUrl) || other.publicUrl == _this.publicUrl)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&const DeepCollectionEquality().equals(other.turnModels, _this.turnModels)&&(identical(other.thinkingLevel, _this.thinkingLevel) || other.thinkingLevel == _this.thinkingLevel)&&(identical(other.headersDeadline, _this.headersDeadline) || other.headersDeadline == _this.headersDeadline)&&(identical(other.firstStepDeadline, _this.firstStepDeadline) || other.firstStepDeadline == _this.firstStepDeadline)&&(identical(other.modelCooldown, _this.modelCooldown) || other.modelCooldown == _this.modelCooldown)&&(identical(other.maxCorrections, _this.maxCorrections) || other.maxCorrections == _this.maxCorrections)&&(identical(other.maxFinishingRounds, _this.maxFinishingRounds) || other.maxFinishingRounds == _this.maxFinishingRounds)&&(identical(other.maxOverloadRetries, _this.maxOverloadRetries) || other.maxOverloadRetries == _this.maxOverloadRetries)&&(identical(other.overloadWait, _this.overloadWait) || other.overloadWait == _this.overloadWait)&&const DeepCollectionEquality().equals(other.allowedOrigins, _this.allowedOrigins)&&(identical(other.appCheckEnforced, _this.appCheckEnforced) || other.appCheckEnforced == _this.appCheckEnforced)&&(identical(other.promptsDirectory, _this.promptsDirectory) || other.promptsDirectory == _this.promptsDirectory)&&(identical(other.marketsDirectory, _this.marketsDirectory) || other.marketsDirectory == _this.marketsDirectory)&&(identical(other.sessionStore, _this.sessionStore) || other.sessionStore == _this.sessionStore));
}


@override
int get hashCode {
  final _this = this as ServerConfig;
  return Object.hash(runtimeType,_this.port,_this.logFormat,_this.publicUrl,_this.projectId,const DeepCollectionEquality().hash(_this.turnModels),_this.thinkingLevel,_this.headersDeadline,_this.firstStepDeadline,_this.modelCooldown,_this.maxCorrections,_this.maxFinishingRounds,_this.maxOverloadRetries,_this.overloadWait,const DeepCollectionEquality().hash(_this.allowedOrigins),_this.appCheckEnforced,_this.promptsDirectory,_this.marketsDirectory,_this.sessionStore);
}

@override
String toString() {
  final _this = this as ServerConfig;
  return 'ServerConfig(port: ${_this.port}, logFormat: ${_this.logFormat}, publicUrl: ${_this.publicUrl}, projectId: ${_this.projectId}, turnModels: ${_this.turnModels}, thinkingLevel: ${_this.thinkingLevel}, headersDeadline: ${_this.headersDeadline}, firstStepDeadline: ${_this.firstStepDeadline}, modelCooldown: ${_this.modelCooldown}, maxCorrections: ${_this.maxCorrections}, maxFinishingRounds: ${_this.maxFinishingRounds}, maxOverloadRetries: ${_this.maxOverloadRetries}, overloadWait: ${_this.overloadWait}, allowedOrigins: ${_this.allowedOrigins}, appCheckEnforced: ${_this.appCheckEnforced}, promptsDirectory: ${_this.promptsDirectory}, marketsDirectory: ${_this.marketsDirectory}, sessionStore: ${_this.sessionStore})';
}


}

/// @nodoc
abstract mixin class $ServerConfigCopyWith<$Res>  {
  factory $ServerConfigCopyWith(ServerConfig value, $Res Function(ServerConfig) _then) = _$ServerConfigCopyWithImpl;
@useResult
$Res call({
 int port, LogFormat logFormat, Uri publicUrl, String? projectId, List<String> turnModels, String thinkingLevel, Duration headersDeadline, Duration firstStepDeadline, Duration modelCooldown, int maxCorrections, int maxFinishingRounds, int maxOverloadRetries, Duration overloadWait, List<String> allowedOrigins, bool appCheckEnforced, String promptsDirectory, String marketsDirectory, SessionStore sessionStore
});




}
/// @nodoc
class _$ServerConfigCopyWithImpl<$Res>
    implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._self, this._then);

  final ServerConfig _self;
  final $Res Function(ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? port = null,Object? logFormat = null,Object? publicUrl = null,Object? projectId = freezed,Object? turnModels = null,Object? thinkingLevel = null,Object? headersDeadline = null,Object? firstStepDeadline = null,Object? modelCooldown = null,Object? maxCorrections = null,Object? maxFinishingRounds = null,Object? maxOverloadRetries = null,Object? overloadWait = null,Object? allowedOrigins = null,Object? appCheckEnforced = null,Object? promptsDirectory = null,Object? marketsDirectory = null,Object? sessionStore = null,}) {
  return _then(ServerConfig(
port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,logFormat: null == logFormat ? _self.logFormat : logFormat // ignore: cast_nullable_to_non_nullable
as LogFormat,publicUrl: null == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as Uri,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,turnModels: null == turnModels ? _self.turnModels : turnModels // ignore: cast_nullable_to_non_nullable
as List<String>,thinkingLevel: null == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String,headersDeadline: null == headersDeadline ? _self.headersDeadline : headersDeadline // ignore: cast_nullable_to_non_nullable
as Duration,firstStepDeadline: null == firstStepDeadline ? _self.firstStepDeadline : firstStepDeadline // ignore: cast_nullable_to_non_nullable
as Duration,modelCooldown: null == modelCooldown ? _self.modelCooldown : modelCooldown // ignore: cast_nullable_to_non_nullable
as Duration,maxCorrections: null == maxCorrections ? _self.maxCorrections : maxCorrections // ignore: cast_nullable_to_non_nullable
as int,maxFinishingRounds: null == maxFinishingRounds ? _self.maxFinishingRounds : maxFinishingRounds // ignore: cast_nullable_to_non_nullable
as int,maxOverloadRetries: null == maxOverloadRetries ? _self.maxOverloadRetries : maxOverloadRetries // ignore: cast_nullable_to_non_nullable
as int,overloadWait: null == overloadWait ? _self.overloadWait : overloadWait // ignore: cast_nullable_to_non_nullable
as Duration,allowedOrigins: null == allowedOrigins ? _self.allowedOrigins : allowedOrigins // ignore: cast_nullable_to_non_nullable
as List<String>,appCheckEnforced: null == appCheckEnforced ? _self.appCheckEnforced : appCheckEnforced // ignore: cast_nullable_to_non_nullable
as bool,promptsDirectory: null == promptsDirectory ? _self.promptsDirectory : promptsDirectory // ignore: cast_nullable_to_non_nullable
as String,marketsDirectory: null == marketsDirectory ? _self.marketsDirectory : marketsDirectory // ignore: cast_nullable_to_non_nullable
as String,sessionStore: null == sessionStore ? _self.sessionStore : sessionStore // ignore: cast_nullable_to_non_nullable
as SessionStore,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerConfig].
extension ServerConfigPatterns on ServerConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerConfig value)  $default,){
final _that = this;
switch (_that) {
case _ServerConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int port,  LogFormat logFormat,  Uri publicUrl,  String? projectId,  List<String> turnModels,  String thinkingLevel,  Duration headersDeadline,  Duration firstStepDeadline,  Duration modelCooldown,  int maxCorrections,  int maxFinishingRounds,  int maxOverloadRetries,  Duration overloadWait,  List<String> allowedOrigins,  bool appCheckEnforced,  String promptsDirectory,  String marketsDirectory,  SessionStore sessionStore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
return $default(_that.port,_that.logFormat,_that.publicUrl,_that.projectId,_that.turnModels,_that.thinkingLevel,_that.headersDeadline,_that.firstStepDeadline,_that.modelCooldown,_that.maxCorrections,_that.maxFinishingRounds,_that.maxOverloadRetries,_that.overloadWait,_that.allowedOrigins,_that.appCheckEnforced,_that.promptsDirectory,_that.marketsDirectory,_that.sessionStore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int port,  LogFormat logFormat,  Uri publicUrl,  String? projectId,  List<String> turnModels,  String thinkingLevel,  Duration headersDeadline,  Duration firstStepDeadline,  Duration modelCooldown,  int maxCorrections,  int maxFinishingRounds,  int maxOverloadRetries,  Duration overloadWait,  List<String> allowedOrigins,  bool appCheckEnforced,  String promptsDirectory,  String marketsDirectory,  SessionStore sessionStore)  $default,) {final _that = this;
switch (_that) {
case _ServerConfig():
return $default(_that.port,_that.logFormat,_that.publicUrl,_that.projectId,_that.turnModels,_that.thinkingLevel,_that.headersDeadline,_that.firstStepDeadline,_that.modelCooldown,_that.maxCorrections,_that.maxFinishingRounds,_that.maxOverloadRetries,_that.overloadWait,_that.allowedOrigins,_that.appCheckEnforced,_that.promptsDirectory,_that.marketsDirectory,_that.sessionStore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int port,  LogFormat logFormat,  Uri publicUrl,  String? projectId,  List<String> turnModels,  String thinkingLevel,  Duration headersDeadline,  Duration firstStepDeadline,  Duration modelCooldown,  int maxCorrections,  int maxFinishingRounds,  int maxOverloadRetries,  Duration overloadWait,  List<String> allowedOrigins,  bool appCheckEnforced,  String promptsDirectory,  String marketsDirectory,  SessionStore sessionStore)?  $default,) {final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
return $default(_that.port,_that.logFormat,_that.publicUrl,_that.projectId,_that.turnModels,_that.thinkingLevel,_that.headersDeadline,_that.firstStepDeadline,_that.modelCooldown,_that.maxCorrections,_that.maxFinishingRounds,_that.maxOverloadRetries,_that.overloadWait,_that.allowedOrigins,_that.appCheckEnforced,_that.promptsDirectory,_that.marketsDirectory,_that.sessionStore);case _:
  return null;

}
}

}

/// @nodoc


class _ServerConfig implements ServerConfig {
  const _ServerConfig({required this.port, required this.logFormat, required this.publicUrl, this.projectId, required  List<String> turnModels, required this.thinkingLevel, required this.headersDeadline, required this.firstStepDeadline, required this.modelCooldown, required this.maxCorrections, required this.maxFinishingRounds, required this.maxOverloadRetries, required this.overloadWait, required  List<String> allowedOrigins, required this.appCheckEnforced, required this.promptsDirectory, required this.marketsDirectory, required this.sessionStore}): _turnModels = turnModels,_allowedOrigins = allowedOrigins;
  

@override final  int port;
@override final  LogFormat logFormat;
@override final  Uri publicUrl;
@override final  String? projectId;
 final  List<String> _turnModels;
@override List<String> get turnModels {
  if (_turnModels is EqualUnmodifiableListView) return _turnModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turnModels);
}

@override final  String thinkingLevel;
@override final  Duration headersDeadline;
@override final  Duration firstStepDeadline;
@override final  Duration modelCooldown;
@override final  int maxCorrections;
@override final  int maxFinishingRounds;
@override final  int maxOverloadRetries;
@override final  Duration overloadWait;
 final  List<String> _allowedOrigins;
@override List<String> get allowedOrigins {
  if (_allowedOrigins is EqualUnmodifiableListView) return _allowedOrigins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedOrigins);
}

@override final  bool appCheckEnforced;
@override final  String promptsDirectory;
@override final  String marketsDirectory;
@override final  SessionStore sessionStore;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerConfigCopyWith<_ServerConfig> get copyWith => __$ServerConfigCopyWithImpl<_ServerConfig>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerConfig&&(identical(other.port, port) || other.port == port)&&(identical(other.logFormat, logFormat) || other.logFormat == logFormat)&&(identical(other.publicUrl, publicUrl) || other.publicUrl == publicUrl)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&const DeepCollectionEquality().equals(other.turnModels, _turnModels)&&(identical(other.thinkingLevel, thinkingLevel) || other.thinkingLevel == thinkingLevel)&&(identical(other.headersDeadline, headersDeadline) || other.headersDeadline == headersDeadline)&&(identical(other.firstStepDeadline, firstStepDeadline) || other.firstStepDeadline == firstStepDeadline)&&(identical(other.modelCooldown, modelCooldown) || other.modelCooldown == modelCooldown)&&(identical(other.maxCorrections, maxCorrections) || other.maxCorrections == maxCorrections)&&(identical(other.maxFinishingRounds, maxFinishingRounds) || other.maxFinishingRounds == maxFinishingRounds)&&(identical(other.maxOverloadRetries, maxOverloadRetries) || other.maxOverloadRetries == maxOverloadRetries)&&(identical(other.overloadWait, overloadWait) || other.overloadWait == overloadWait)&&const DeepCollectionEquality().equals(other.allowedOrigins, _allowedOrigins)&&(identical(other.appCheckEnforced, appCheckEnforced) || other.appCheckEnforced == appCheckEnforced)&&(identical(other.promptsDirectory, promptsDirectory) || other.promptsDirectory == promptsDirectory)&&(identical(other.marketsDirectory, marketsDirectory) || other.marketsDirectory == marketsDirectory)&&(identical(other.sessionStore, sessionStore) || other.sessionStore == sessionStore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,port,logFormat,publicUrl,projectId,const DeepCollectionEquality().hash(_turnModels),thinkingLevel,headersDeadline,firstStepDeadline,modelCooldown,maxCorrections,maxFinishingRounds,maxOverloadRetries,overloadWait,const DeepCollectionEquality().hash(_allowedOrigins),appCheckEnforced,promptsDirectory,marketsDirectory,sessionStore);
}

@override
String toString() {
    return 'ServerConfig(port: $port, logFormat: $logFormat, publicUrl: $publicUrl, projectId: $projectId, turnModels: $turnModels, thinkingLevel: $thinkingLevel, headersDeadline: $headersDeadline, firstStepDeadline: $firstStepDeadline, modelCooldown: $modelCooldown, maxCorrections: $maxCorrections, maxFinishingRounds: $maxFinishingRounds, maxOverloadRetries: $maxOverloadRetries, overloadWait: $overloadWait, allowedOrigins: $allowedOrigins, appCheckEnforced: $appCheckEnforced, promptsDirectory: $promptsDirectory, marketsDirectory: $marketsDirectory, sessionStore: $sessionStore)';
}


}

/// @nodoc
abstract mixin class _$ServerConfigCopyWith<$Res> implements $ServerConfigCopyWith<$Res> {
  factory _$ServerConfigCopyWith(_ServerConfig value, $Res Function(_ServerConfig) _then) = __$ServerConfigCopyWithImpl;
@override @useResult
$Res call({
 int port, LogFormat logFormat, Uri publicUrl, String? projectId, List<String> turnModels, String thinkingLevel, Duration headersDeadline, Duration firstStepDeadline, Duration modelCooldown, int maxCorrections, int maxFinishingRounds, int maxOverloadRetries, Duration overloadWait, List<String> allowedOrigins, bool appCheckEnforced, String promptsDirectory, String marketsDirectory, SessionStore sessionStore
});




}
/// @nodoc
class __$ServerConfigCopyWithImpl<$Res>
    implements _$ServerConfigCopyWith<$Res> {
  __$ServerConfigCopyWithImpl(this._self, this._then);

  final _ServerConfig _self;
  final $Res Function(_ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? port = null,Object? logFormat = null,Object? publicUrl = null,Object? projectId = freezed,Object? turnModels = null,Object? thinkingLevel = null,Object? headersDeadline = null,Object? firstStepDeadline = null,Object? modelCooldown = null,Object? maxCorrections = null,Object? maxFinishingRounds = null,Object? maxOverloadRetries = null,Object? overloadWait = null,Object? allowedOrigins = null,Object? appCheckEnforced = null,Object? promptsDirectory = null,Object? marketsDirectory = null,Object? sessionStore = null,}) {
  return _then(_ServerConfig(
port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,logFormat: null == logFormat ? _self.logFormat : logFormat // ignore: cast_nullable_to_non_nullable
as LogFormat,publicUrl: null == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as Uri,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,turnModels: null == turnModels ? _self._turnModels : turnModels // ignore: cast_nullable_to_non_nullable
as List<String>,thinkingLevel: null == thinkingLevel ? _self.thinkingLevel : thinkingLevel // ignore: cast_nullable_to_non_nullable
as String,headersDeadline: null == headersDeadline ? _self.headersDeadline : headersDeadline // ignore: cast_nullable_to_non_nullable
as Duration,firstStepDeadline: null == firstStepDeadline ? _self.firstStepDeadline : firstStepDeadline // ignore: cast_nullable_to_non_nullable
as Duration,modelCooldown: null == modelCooldown ? _self.modelCooldown : modelCooldown // ignore: cast_nullable_to_non_nullable
as Duration,maxCorrections: null == maxCorrections ? _self.maxCorrections : maxCorrections // ignore: cast_nullable_to_non_nullable
as int,maxFinishingRounds: null == maxFinishingRounds ? _self.maxFinishingRounds : maxFinishingRounds // ignore: cast_nullable_to_non_nullable
as int,maxOverloadRetries: null == maxOverloadRetries ? _self.maxOverloadRetries : maxOverloadRetries // ignore: cast_nullable_to_non_nullable
as int,overloadWait: null == overloadWait ? _self.overloadWait : overloadWait // ignore: cast_nullable_to_non_nullable
as Duration,allowedOrigins: null == allowedOrigins ? _self._allowedOrigins : allowedOrigins // ignore: cast_nullable_to_non_nullable
as List<String>,appCheckEnforced: null == appCheckEnforced ? _self.appCheckEnforced : appCheckEnforced // ignore: cast_nullable_to_non_nullable
as bool,promptsDirectory: null == promptsDirectory ? _self.promptsDirectory : promptsDirectory // ignore: cast_nullable_to_non_nullable
as String,marketsDirectory: null == marketsDirectory ? _self.marketsDirectory : marketsDirectory // ignore: cast_nullable_to_non_nullable
as String,sessionStore: null == sessionStore ? _self.sessionStore : sessionStore // ignore: cast_nullable_to_non_nullable
as SessionStore,
  ));
}


}

// dart format on
