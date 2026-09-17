// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgentCard {

 String get protocolVersion; String get name; String get description; String get url; String get version; AgentCapabilities get capabilities; Map<String, Map<String, Object?>> get securitySchemes; List<Map<String, List<String>>> get security; List<String> get defaultInputModes; List<String> get defaultOutputModes; List<AgentSkill> get skills;
/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentCardCopyWith<AgentCard> get copyWith => _$AgentCardCopyWithImpl<AgentCard>(this as AgentCard, _$identity);

  /// Serializes this AgentCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AgentCard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentCard&&(identical(other.protocolVersion, _this.protocolVersion) || other.protocolVersion == _this.protocolVersion)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.capabilities, _this.capabilities) || other.capabilities == _this.capabilities)&&const DeepCollectionEquality().equals(other.securitySchemes, _this.securitySchemes)&&const DeepCollectionEquality().equals(other.security, _this.security)&&const DeepCollectionEquality().equals(other.defaultInputModes, _this.defaultInputModes)&&const DeepCollectionEquality().equals(other.defaultOutputModes, _this.defaultOutputModes)&&const DeepCollectionEquality().equals(other.skills, _this.skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AgentCard;
  return Object.hash(runtimeType,_this.protocolVersion,_this.name,_this.description,_this.url,_this.version,_this.capabilities,const DeepCollectionEquality().hash(_this.securitySchemes),const DeepCollectionEquality().hash(_this.security),const DeepCollectionEquality().hash(_this.defaultInputModes),const DeepCollectionEquality().hash(_this.defaultOutputModes),const DeepCollectionEquality().hash(_this.skills));
}

@override
String toString() {
  final _this = this as AgentCard;
  return 'AgentCard(protocolVersion: ${_this.protocolVersion}, name: ${_this.name}, description: ${_this.description}, url: ${_this.url}, version: ${_this.version}, capabilities: ${_this.capabilities}, securitySchemes: ${_this.securitySchemes}, security: ${_this.security}, defaultInputModes: ${_this.defaultInputModes}, defaultOutputModes: ${_this.defaultOutputModes}, skills: ${_this.skills})';
}


}

/// @nodoc
abstract mixin class $AgentCardCopyWith<$Res>  {
  factory $AgentCardCopyWith(AgentCard value, $Res Function(AgentCard) _then) = _$AgentCardCopyWithImpl;
@useResult
$Res call({
 String protocolVersion, String name, String description, String url, String version, AgentCapabilities capabilities, Map<String, Map<String, Object?>> securitySchemes, List<Map<String, List<String>>> security, List<String> defaultInputModes, List<String> defaultOutputModes, List<AgentSkill> skills
});


$AgentCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class _$AgentCardCopyWithImpl<$Res>
    implements $AgentCardCopyWith<$Res> {
  _$AgentCardCopyWithImpl(this._self, this._then);

  final AgentCard _self;
  final $Res Function(AgentCard) _then;

/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? protocolVersion = null,Object? name = null,Object? description = null,Object? url = null,Object? version = null,Object? capabilities = null,Object? securitySchemes = null,Object? security = null,Object? defaultInputModes = null,Object? defaultOutputModes = null,Object? skills = null,}) {
  return _then(AgentCard(
protocolVersion: null == protocolVersion ? _self.protocolVersion : protocolVersion // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as AgentCapabilities,securitySchemes: null == securitySchemes ? _self.securitySchemes : securitySchemes // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,security: null == security ? _self.security : security // ignore: cast_nullable_to_non_nullable
as List<Map<String, List<String>>>,defaultInputModes: null == defaultInputModes ? _self.defaultInputModes : defaultInputModes // ignore: cast_nullable_to_non_nullable
as List<String>,defaultOutputModes: null == defaultOutputModes ? _self.defaultOutputModes : defaultOutputModes // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<AgentSkill>,
  ));
}
/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgentCapabilitiesCopyWith<$Res> get capabilities {
  
  return $AgentCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// Adds pattern-matching-related methods to [AgentCard].
extension AgentCardPatterns on AgentCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentCard value)  $default,){
final _that = this;
switch (_that) {
case _AgentCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentCard value)?  $default,){
final _that = this;
switch (_that) {
case _AgentCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String protocolVersion,  String name,  String description,  String url,  String version,  AgentCapabilities capabilities,  Map<String, Map<String, Object?>> securitySchemes,  List<Map<String, List<String>>> security,  List<String> defaultInputModes,  List<String> defaultOutputModes,  List<AgentSkill> skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentCard() when $default != null:
return $default(_that.protocolVersion,_that.name,_that.description,_that.url,_that.version,_that.capabilities,_that.securitySchemes,_that.security,_that.defaultInputModes,_that.defaultOutputModes,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String protocolVersion,  String name,  String description,  String url,  String version,  AgentCapabilities capabilities,  Map<String, Map<String, Object?>> securitySchemes,  List<Map<String, List<String>>> security,  List<String> defaultInputModes,  List<String> defaultOutputModes,  List<AgentSkill> skills)  $default,) {final _that = this;
switch (_that) {
case _AgentCard():
return $default(_that.protocolVersion,_that.name,_that.description,_that.url,_that.version,_that.capabilities,_that.securitySchemes,_that.security,_that.defaultInputModes,_that.defaultOutputModes,_that.skills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String protocolVersion,  String name,  String description,  String url,  String version,  AgentCapabilities capabilities,  Map<String, Map<String, Object?>> securitySchemes,  List<Map<String, List<String>>> security,  List<String> defaultInputModes,  List<String> defaultOutputModes,  List<AgentSkill> skills)?  $default,) {final _that = this;
switch (_that) {
case _AgentCard() when $default != null:
return $default(_that.protocolVersion,_that.name,_that.description,_that.url,_that.version,_that.capabilities,_that.securitySchemes,_that.security,_that.defaultInputModes,_that.defaultOutputModes,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentCard implements AgentCard {
  const _AgentCard({required this.protocolVersion, required this.name, required this.description, required this.url, required this.version, required this.capabilities, required  Map<String, Map<String, Object?>> securitySchemes, required  List<Map<String, List<String>>> security, required  List<String> defaultInputModes, required  List<String> defaultOutputModes, required  List<AgentSkill> skills}): _securitySchemes = securitySchemes,_security = security,_defaultInputModes = defaultInputModes,_defaultOutputModes = defaultOutputModes,_skills = skills;
  factory _AgentCard.fromJson(Map<String, dynamic> json) => _$AgentCardFromJson(json);

@override final  String protocolVersion;
@override final  String name;
@override final  String description;
@override final  String url;
@override final  String version;
@override final  AgentCapabilities capabilities;
 final  Map<String, Map<String, Object?>> _securitySchemes;
@override Map<String, Map<String, Object?>> get securitySchemes {
  if (_securitySchemes is EqualUnmodifiableMapView) return _securitySchemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_securitySchemes);
}

 final  List<Map<String, List<String>>> _security;
@override List<Map<String, List<String>>> get security {
  if (_security is EqualUnmodifiableListView) return _security;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_security);
}

 final  List<String> _defaultInputModes;
@override List<String> get defaultInputModes {
  if (_defaultInputModes is EqualUnmodifiableListView) return _defaultInputModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_defaultInputModes);
}

 final  List<String> _defaultOutputModes;
@override List<String> get defaultOutputModes {
  if (_defaultOutputModes is EqualUnmodifiableListView) return _defaultOutputModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_defaultOutputModes);
}

 final  List<AgentSkill> _skills;
@override List<AgentSkill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}


/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentCardCopyWith<_AgentCard> get copyWith => __$AgentCardCopyWithImpl<_AgentCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentCardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentCard&&(identical(other.protocolVersion, protocolVersion) || other.protocolVersion == protocolVersion)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities)&&const DeepCollectionEquality().equals(other.securitySchemes, _securitySchemes)&&const DeepCollectionEquality().equals(other.security, _security)&&const DeepCollectionEquality().equals(other.defaultInputModes, _defaultInputModes)&&const DeepCollectionEquality().equals(other.defaultOutputModes, _defaultOutputModes)&&const DeepCollectionEquality().equals(other.skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,protocolVersion,name,description,url,version,capabilities,const DeepCollectionEquality().hash(_securitySchemes),const DeepCollectionEquality().hash(_security),const DeepCollectionEquality().hash(_defaultInputModes),const DeepCollectionEquality().hash(_defaultOutputModes),const DeepCollectionEquality().hash(_skills));
}

@override
String toString() {
    return 'AgentCard(protocolVersion: $protocolVersion, name: $name, description: $description, url: $url, version: $version, capabilities: $capabilities, securitySchemes: $securitySchemes, security: $security, defaultInputModes: $defaultInputModes, defaultOutputModes: $defaultOutputModes, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$AgentCardCopyWith<$Res> implements $AgentCardCopyWith<$Res> {
  factory _$AgentCardCopyWith(_AgentCard value, $Res Function(_AgentCard) _then) = __$AgentCardCopyWithImpl;
@override @useResult
$Res call({
 String protocolVersion, String name, String description, String url, String version, AgentCapabilities capabilities, Map<String, Map<String, Object?>> securitySchemes, List<Map<String, List<String>>> security, List<String> defaultInputModes, List<String> defaultOutputModes, List<AgentSkill> skills
});


@override $AgentCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class __$AgentCardCopyWithImpl<$Res>
    implements _$AgentCardCopyWith<$Res> {
  __$AgentCardCopyWithImpl(this._self, this._then);

  final _AgentCard _self;
  final $Res Function(_AgentCard) _then;

/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? protocolVersion = null,Object? name = null,Object? description = null,Object? url = null,Object? version = null,Object? capabilities = null,Object? securitySchemes = null,Object? security = null,Object? defaultInputModes = null,Object? defaultOutputModes = null,Object? skills = null,}) {
  return _then(_AgentCard(
protocolVersion: null == protocolVersion ? _self.protocolVersion : protocolVersion // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as AgentCapabilities,securitySchemes: null == securitySchemes ? _self._securitySchemes : securitySchemes // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,security: null == security ? _self._security : security // ignore: cast_nullable_to_non_nullable
as List<Map<String, List<String>>>,defaultInputModes: null == defaultInputModes ? _self._defaultInputModes : defaultInputModes // ignore: cast_nullable_to_non_nullable
as List<String>,defaultOutputModes: null == defaultOutputModes ? _self._defaultOutputModes : defaultOutputModes // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<AgentSkill>,
  ));
}

/// Create a copy of AgentCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgentCapabilitiesCopyWith<$Res> get capabilities {
  
  return $AgentCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// @nodoc
mixin _$AgentCapabilities {

 bool get streaming; List<AgentExtension> get extensions;
/// Create a copy of AgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentCapabilitiesCopyWith<AgentCapabilities> get copyWith => _$AgentCapabilitiesCopyWithImpl<AgentCapabilities>(this as AgentCapabilities, _$identity);

  /// Serializes this AgentCapabilities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AgentCapabilities;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentCapabilities&&(identical(other.streaming, _this.streaming) || other.streaming == _this.streaming)&&const DeepCollectionEquality().equals(other.extensions, _this.extensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AgentCapabilities;
  return Object.hash(runtimeType,_this.streaming,const DeepCollectionEquality().hash(_this.extensions));
}

@override
String toString() {
  final _this = this as AgentCapabilities;
  return 'AgentCapabilities(streaming: ${_this.streaming}, extensions: ${_this.extensions})';
}


}

/// @nodoc
abstract mixin class $AgentCapabilitiesCopyWith<$Res>  {
  factory $AgentCapabilitiesCopyWith(AgentCapabilities value, $Res Function(AgentCapabilities) _then) = _$AgentCapabilitiesCopyWithImpl;
@useResult
$Res call({
 bool streaming, List<AgentExtension> extensions
});




}
/// @nodoc
class _$AgentCapabilitiesCopyWithImpl<$Res>
    implements $AgentCapabilitiesCopyWith<$Res> {
  _$AgentCapabilitiesCopyWithImpl(this._self, this._then);

  final AgentCapabilities _self;
  final $Res Function(AgentCapabilities) _then;

/// Create a copy of AgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streaming = null,Object? extensions = null,}) {
  return _then(AgentCapabilities(
streaming: null == streaming ? _self.streaming : streaming // ignore: cast_nullable_to_non_nullable
as bool,extensions: null == extensions ? _self.extensions : extensions // ignore: cast_nullable_to_non_nullable
as List<AgentExtension>,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentCapabilities].
extension AgentCapabilitiesPatterns on AgentCapabilities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentCapabilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentCapabilities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentCapabilities value)  $default,){
final _that = this;
switch (_that) {
case _AgentCapabilities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentCapabilities value)?  $default,){
final _that = this;
switch (_that) {
case _AgentCapabilities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool streaming,  List<AgentExtension> extensions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentCapabilities() when $default != null:
return $default(_that.streaming,_that.extensions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool streaming,  List<AgentExtension> extensions)  $default,) {final _that = this;
switch (_that) {
case _AgentCapabilities():
return $default(_that.streaming,_that.extensions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool streaming,  List<AgentExtension> extensions)?  $default,) {final _that = this;
switch (_that) {
case _AgentCapabilities() when $default != null:
return $default(_that.streaming,_that.extensions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentCapabilities implements AgentCapabilities {
  const _AgentCapabilities({required this.streaming, required  List<AgentExtension> extensions}): _extensions = extensions;
  factory _AgentCapabilities.fromJson(Map<String, dynamic> json) => _$AgentCapabilitiesFromJson(json);

@override final  bool streaming;
 final  List<AgentExtension> _extensions;
@override List<AgentExtension> get extensions {
  if (_extensions is EqualUnmodifiableListView) return _extensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extensions);
}


/// Create a copy of AgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentCapabilitiesCopyWith<_AgentCapabilities> get copyWith => __$AgentCapabilitiesCopyWithImpl<_AgentCapabilities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentCapabilitiesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentCapabilities&&(identical(other.streaming, streaming) || other.streaming == streaming)&&const DeepCollectionEquality().equals(other.extensions, _extensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,streaming,const DeepCollectionEquality().hash(_extensions));
}

@override
String toString() {
    return 'AgentCapabilities(streaming: $streaming, extensions: $extensions)';
}


}

/// @nodoc
abstract mixin class _$AgentCapabilitiesCopyWith<$Res> implements $AgentCapabilitiesCopyWith<$Res> {
  factory _$AgentCapabilitiesCopyWith(_AgentCapabilities value, $Res Function(_AgentCapabilities) _then) = __$AgentCapabilitiesCopyWithImpl;
@override @useResult
$Res call({
 bool streaming, List<AgentExtension> extensions
});




}
/// @nodoc
class __$AgentCapabilitiesCopyWithImpl<$Res>
    implements _$AgentCapabilitiesCopyWith<$Res> {
  __$AgentCapabilitiesCopyWithImpl(this._self, this._then);

  final _AgentCapabilities _self;
  final $Res Function(_AgentCapabilities) _then;

/// Create a copy of AgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streaming = null,Object? extensions = null,}) {
  return _then(_AgentCapabilities(
streaming: null == streaming ? _self.streaming : streaming // ignore: cast_nullable_to_non_nullable
as bool,extensions: null == extensions ? _self._extensions : extensions // ignore: cast_nullable_to_non_nullable
as List<AgentExtension>,
  ));
}


}


/// @nodoc
mixin _$AgentExtension {

 String get uri; bool get required; Map<String, Object?>? get params;
/// Create a copy of AgentExtension
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentExtensionCopyWith<AgentExtension> get copyWith => _$AgentExtensionCopyWithImpl<AgentExtension>(this as AgentExtension, _$identity);

  /// Serializes this AgentExtension to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AgentExtension;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentExtension&&(identical(other.uri, _this.uri) || other.uri == _this.uri)&&(identical(other.required, _this.required) || other.required == _this.required)&&const DeepCollectionEquality().equals(other.params, _this.params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AgentExtension;
  return Object.hash(runtimeType,_this.uri,_this.required,const DeepCollectionEquality().hash(_this.params));
}

@override
String toString() {
  final _this = this as AgentExtension;
  return 'AgentExtension(uri: ${_this.uri}, required: ${_this.required}, params: ${_this.params})';
}


}

/// @nodoc
abstract mixin class $AgentExtensionCopyWith<$Res>  {
  factory $AgentExtensionCopyWith(AgentExtension value, $Res Function(AgentExtension) _then) = _$AgentExtensionCopyWithImpl;
@useResult
$Res call({
 String uri, bool required, Map<String, Object?>? params
});




}
/// @nodoc
class _$AgentExtensionCopyWithImpl<$Res>
    implements $AgentExtensionCopyWith<$Res> {
  _$AgentExtensionCopyWithImpl(this._self, this._then);

  final AgentExtension _self;
  final $Res Function(AgentExtension) _then;

/// Create a copy of AgentExtension
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? required = null,Object? params = freezed,}) {
  return _then(AgentExtension(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentExtension].
extension AgentExtensionPatterns on AgentExtension {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentExtension value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentExtension() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentExtension value)  $default,){
final _that = this;
switch (_that) {
case _AgentExtension():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentExtension value)?  $default,){
final _that = this;
switch (_that) {
case _AgentExtension() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uri,  bool required,  Map<String, Object?>? params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentExtension() when $default != null:
return $default(_that.uri,_that.required,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uri,  bool required,  Map<String, Object?>? params)  $default,) {final _that = this;
switch (_that) {
case _AgentExtension():
return $default(_that.uri,_that.required,_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uri,  bool required,  Map<String, Object?>? params)?  $default,) {final _that = this;
switch (_that) {
case _AgentExtension() when $default != null:
return $default(_that.uri,_that.required,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentExtension implements AgentExtension {
  const _AgentExtension({required this.uri, required this.required,  Map<String, Object?>? params}): _params = params;
  factory _AgentExtension.fromJson(Map<String, dynamic> json) => _$AgentExtensionFromJson(json);

@override final  String uri;
@override final  bool required;
 final  Map<String, Object?>? _params;
@override Map<String, Object?>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AgentExtension
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentExtensionCopyWith<_AgentExtension> get copyWith => __$AgentExtensionCopyWithImpl<_AgentExtension>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentExtensionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentExtension&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other.params, _params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uri,required,const DeepCollectionEquality().hash(_params));
}

@override
String toString() {
    return 'AgentExtension(uri: $uri, required: $required, params: $params)';
}


}

/// @nodoc
abstract mixin class _$AgentExtensionCopyWith<$Res> implements $AgentExtensionCopyWith<$Res> {
  factory _$AgentExtensionCopyWith(_AgentExtension value, $Res Function(_AgentExtension) _then) = __$AgentExtensionCopyWithImpl;
@override @useResult
$Res call({
 String uri, bool required, Map<String, Object?>? params
});




}
/// @nodoc
class __$AgentExtensionCopyWithImpl<$Res>
    implements _$AgentExtensionCopyWith<$Res> {
  __$AgentExtensionCopyWithImpl(this._self, this._then);

  final _AgentExtension _self;
  final $Res Function(_AgentExtension) _then;

/// Create a copy of AgentExtension
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? required = null,Object? params = freezed,}) {
  return _then(_AgentExtension(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>?,
  ));
}


}


/// @nodoc
mixin _$AgentSkill {

 String get id; String get name; String get description; List<String> get tags;
/// Create a copy of AgentSkill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentSkillCopyWith<AgentSkill> get copyWith => _$AgentSkillCopyWithImpl<AgentSkill>(this as AgentSkill, _$identity);

  /// Serializes this AgentSkill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AgentSkill;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentSkill&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.tags, _this.tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AgentSkill;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,const DeepCollectionEquality().hash(_this.tags));
}

@override
String toString() {
  final _this = this as AgentSkill;
  return 'AgentSkill(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, tags: ${_this.tags})';
}


}

/// @nodoc
abstract mixin class $AgentSkillCopyWith<$Res>  {
  factory $AgentSkillCopyWith(AgentSkill value, $Res Function(AgentSkill) _then) = _$AgentSkillCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, List<String> tags
});




}
/// @nodoc
class _$AgentSkillCopyWithImpl<$Res>
    implements $AgentSkillCopyWith<$Res> {
  _$AgentSkillCopyWithImpl(this._self, this._then);

  final AgentSkill _self;
  final $Res Function(AgentSkill) _then;

/// Create a copy of AgentSkill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? tags = null,}) {
  return _then(AgentSkill(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentSkill].
extension AgentSkillPatterns on AgentSkill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentSkill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentSkill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentSkill value)  $default,){
final _that = this;
switch (_that) {
case _AgentSkill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentSkill value)?  $default,){
final _that = this;
switch (_that) {
case _AgentSkill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentSkill() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _AgentSkill():
return $default(_that.id,_that.name,_that.description,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _AgentSkill() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentSkill implements AgentSkill {
  const _AgentSkill({required this.id, required this.name, required this.description, required  List<String> tags}): _tags = tags;
  factory _AgentSkill.fromJson(Map<String, dynamic> json) => _$AgentSkillFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of AgentSkill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentSkillCopyWith<_AgentSkill> get copyWith => __$AgentSkillCopyWithImpl<_AgentSkill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentSkillToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentSkill&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_tags));
}

@override
String toString() {
    return 'AgentSkill(id: $id, name: $name, description: $description, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$AgentSkillCopyWith<$Res> implements $AgentSkillCopyWith<$Res> {
  factory _$AgentSkillCopyWith(_AgentSkill value, $Res Function(_AgentSkill) _then) = __$AgentSkillCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, List<String> tags
});




}
/// @nodoc
class __$AgentSkillCopyWithImpl<$Res>
    implements _$AgentSkillCopyWith<$Res> {
  __$AgentSkillCopyWithImpl(this._self, this._then);

  final _AgentSkill _self;
  final $Res Function(_AgentSkill) _then;

/// Create a copy of AgentSkill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? tags = null,}) {
  return _then(_AgentSkill(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
