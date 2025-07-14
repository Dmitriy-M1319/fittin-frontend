// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestResult {

 String get information; List<ScaleResult> get scales; String get uuid;
/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestResultCopyWith<TestResult> get copyWith => _$TestResultCopyWithImpl<TestResult>(this as TestResult, _$identity);

  /// Serializes this TestResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestResult&&(identical(other.information, information) || other.information == information)&&const DeepCollectionEquality().equals(other.scales, scales)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,information,const DeepCollectionEquality().hash(scales),uuid);

@override
String toString() {
  return 'TestResult(information: $information, scales: $scales, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $TestResultCopyWith<$Res>  {
  factory $TestResultCopyWith(TestResult value, $Res Function(TestResult) _then) = _$TestResultCopyWithImpl;
@useResult
$Res call({
 String information, List<ScaleResult> scales, String uuid
});




}
/// @nodoc
class _$TestResultCopyWithImpl<$Res>
    implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._self, this._then);

  final TestResult _self;
  final $Res Function(TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? information = null,Object? scales = null,Object? uuid = null,}) {
  return _then(_self.copyWith(
information: null == information ? _self.information : information // ignore: cast_nullable_to_non_nullable
as String,scales: null == scales ? _self.scales : scales // ignore: cast_nullable_to_non_nullable
as List<ScaleResult>,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TestResult].
extension TestResultPatterns on TestResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestResult value)  $default,){
final _that = this;
switch (_that) {
case _TestResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestResult value)?  $default,){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String information,  List<ScaleResult> scales,  String uuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.information,_that.scales,_that.uuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String information,  List<ScaleResult> scales,  String uuid)  $default,) {final _that = this;
switch (_that) {
case _TestResult():
return $default(_that.information,_that.scales,_that.uuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String information,  List<ScaleResult> scales,  String uuid)?  $default,) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.information,_that.scales,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestResult implements TestResult {
  const _TestResult({required this.information, required final  List<ScaleResult> scales, required this.uuid}): _scales = scales;
  factory _TestResult.fromJson(Map<String, dynamic> json) => _$TestResultFromJson(json);

@override final  String information;
 final  List<ScaleResult> _scales;
@override List<ScaleResult> get scales {
  if (_scales is EqualUnmodifiableListView) return _scales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scales);
}

@override final  String uuid;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestResultCopyWith<_TestResult> get copyWith => __$TestResultCopyWithImpl<_TestResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestResult&&(identical(other.information, information) || other.information == information)&&const DeepCollectionEquality().equals(other._scales, _scales)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,information,const DeepCollectionEquality().hash(_scales),uuid);

@override
String toString() {
  return 'TestResult(information: $information, scales: $scales, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res> implements $TestResultCopyWith<$Res> {
  factory _$TestResultCopyWith(_TestResult value, $Res Function(_TestResult) _then) = __$TestResultCopyWithImpl;
@override @useResult
$Res call({
 String information, List<ScaleResult> scales, String uuid
});




}
/// @nodoc
class __$TestResultCopyWithImpl<$Res>
    implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? information = null,Object? scales = null,Object? uuid = null,}) {
  return _then(_TestResult(
information: null == information ? _self.information : information // ignore: cast_nullable_to_non_nullable
as String,scales: null == scales ? _self._scales : scales // ignore: cast_nullable_to_non_nullable
as List<ScaleResult>,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ScaleResult {

 String get scale; int get value;
/// Create a copy of ScaleResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScaleResultCopyWith<ScaleResult> get copyWith => _$ScaleResultCopyWithImpl<ScaleResult>(this as ScaleResult, _$identity);

  /// Serializes this ScaleResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScaleResult&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scale,value);

@override
String toString() {
  return 'ScaleResult(scale: $scale, value: $value)';
}


}

/// @nodoc
abstract mixin class $ScaleResultCopyWith<$Res>  {
  factory $ScaleResultCopyWith(ScaleResult value, $Res Function(ScaleResult) _then) = _$ScaleResultCopyWithImpl;
@useResult
$Res call({
 String scale, int value
});




}
/// @nodoc
class _$ScaleResultCopyWithImpl<$Res>
    implements $ScaleResultCopyWith<$Res> {
  _$ScaleResultCopyWithImpl(this._self, this._then);

  final ScaleResult _self;
  final $Res Function(ScaleResult) _then;

/// Create a copy of ScaleResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scale = null,Object? value = null,}) {
  return _then(_self.copyWith(
scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScaleResult].
extension ScaleResultPatterns on ScaleResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScaleResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScaleResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScaleResult value)  $default,){
final _that = this;
switch (_that) {
case _ScaleResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScaleResult value)?  $default,){
final _that = this;
switch (_that) {
case _ScaleResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String scale,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScaleResult() when $default != null:
return $default(_that.scale,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String scale,  int value)  $default,) {final _that = this;
switch (_that) {
case _ScaleResult():
return $default(_that.scale,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String scale,  int value)?  $default,) {final _that = this;
switch (_that) {
case _ScaleResult() when $default != null:
return $default(_that.scale,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScaleResult implements ScaleResult {
  const _ScaleResult({required this.scale, required this.value});
  factory _ScaleResult.fromJson(Map<String, dynamic> json) => _$ScaleResultFromJson(json);

@override final  String scale;
@override final  int value;

/// Create a copy of ScaleResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScaleResultCopyWith<_ScaleResult> get copyWith => __$ScaleResultCopyWithImpl<_ScaleResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScaleResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScaleResult&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scale,value);

@override
String toString() {
  return 'ScaleResult(scale: $scale, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ScaleResultCopyWith<$Res> implements $ScaleResultCopyWith<$Res> {
  factory _$ScaleResultCopyWith(_ScaleResult value, $Res Function(_ScaleResult) _then) = __$ScaleResultCopyWithImpl;
@override @useResult
$Res call({
 String scale, int value
});




}
/// @nodoc
class __$ScaleResultCopyWithImpl<$Res>
    implements _$ScaleResultCopyWith<$Res> {
  __$ScaleResultCopyWithImpl(this._self, this._then);

  final _ScaleResult _self;
  final $Res Function(_ScaleResult) _then;

/// Create a copy of ScaleResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scale = null,Object? value = null,}) {
  return _then(_ScaleResult(
scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
