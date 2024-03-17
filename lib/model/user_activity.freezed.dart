// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) {
  return _UserActivity.fromJson(json);
}

/// @nodoc
mixin _$UserActivity {
  DateTime? get lastOpened => throw _privateConstructorUsedError;
  DateTime? get lastGamePlayed => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  dynamic get isPlaying => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  DateTime get nowTime => throw _privateConstructorUsedError;
  bool get isEmulator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActivityCopyWith<UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityCopyWith<$Res> {
  factory $UserActivityCopyWith(
          UserActivity value, $Res Function(UserActivity) then) =
      _$UserActivityCopyWithImpl<$Res, UserActivity>;
  @useResult
  $Res call(
      {DateTime? lastOpened,
      DateTime? lastGamePlayed,
      bool isActive,
      dynamic isPlaying,
      String? name,
      String? avatar,
      String? appVersion,
      DateTime nowTime,
      bool isEmulator});
}

/// @nodoc
class _$UserActivityCopyWithImpl<$Res, $Val extends UserActivity>
    implements $UserActivityCopyWith<$Res> {
  _$UserActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isActive = null,
    Object? isPlaying = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? appVersion = freezed,
    Object? nowTime = null,
    Object? isEmulator = null,
  }) {
    return _then(_value.copyWith(
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGamePlayed: freezed == lastGamePlayed
          ? _value.lastGamePlayed
          : lastGamePlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nowTime: null == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserActivityImplCopyWith<$Res>
    implements $UserActivityCopyWith<$Res> {
  factory _$$UserActivityImplCopyWith(
          _$UserActivityImpl value, $Res Function(_$UserActivityImpl) then) =
      __$$UserActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? lastOpened,
      DateTime? lastGamePlayed,
      bool isActive,
      dynamic isPlaying,
      String? name,
      String? avatar,
      String? appVersion,
      DateTime nowTime,
      bool isEmulator});
}

/// @nodoc
class __$$UserActivityImplCopyWithImpl<$Res>
    extends _$UserActivityCopyWithImpl<$Res, _$UserActivityImpl>
    implements _$$UserActivityImplCopyWith<$Res> {
  __$$UserActivityImplCopyWithImpl(
      _$UserActivityImpl _value, $Res Function(_$UserActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isActive = null,
    Object? isPlaying = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? appVersion = freezed,
    Object? nowTime = null,
    Object? isEmulator = null,
  }) {
    return _then(_$UserActivityImpl(
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGamePlayed: freezed == lastGamePlayed
          ? _value.lastGamePlayed
          : lastGamePlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nowTime: null == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserActivityImpl extends _UserActivity {
  const _$UserActivityImpl(
      {this.lastOpened,
      this.lastGamePlayed,
      this.isActive = true,
      this.isPlaying = false,
      this.name,
      this.avatar,
      this.appVersion,
      required this.nowTime,
      this.isEmulator = false})
      : super._();

  factory _$UserActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivityImplFromJson(json);

  @override
  final DateTime? lastOpened;
  @override
  final DateTime? lastGamePlayed;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final dynamic isPlaying;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? appVersion;
  @override
  final DateTime nowTime;
  @override
  @JsonKey()
  final bool isEmulator;

  @override
  String toString() {
    return 'UserActivity(lastOpened: $lastOpened, lastGamePlayed: $lastGamePlayed, isActive: $isActive, isPlaying: $isPlaying, name: $name, avatar: $avatar, appVersion: $appVersion, nowTime: $nowTime, isEmulator: $isEmulator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivityImpl &&
            (identical(other.lastOpened, lastOpened) ||
                other.lastOpened == lastOpened) &&
            (identical(other.lastGamePlayed, lastGamePlayed) ||
                other.lastGamePlayed == lastGamePlayed) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.nowTime, nowTime) || other.nowTime == nowTime) &&
            (identical(other.isEmulator, isEmulator) ||
                other.isEmulator == isEmulator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastOpened,
      lastGamePlayed,
      isActive,
      const DeepCollectionEquality().hash(isPlaying),
      name,
      avatar,
      appVersion,
      nowTime,
      isEmulator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivityImplCopyWith<_$UserActivityImpl> get copyWith =>
      __$$UserActivityImplCopyWithImpl<_$UserActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivityImplToJson(
      this,
    );
  }
}

abstract class _UserActivity extends UserActivity {
  const factory _UserActivity(
      {final DateTime? lastOpened,
      final DateTime? lastGamePlayed,
      final bool isActive,
      final dynamic isPlaying,
      final String? name,
      final String? avatar,
      final String? appVersion,
      required final DateTime nowTime,
      final bool isEmulator}) = _$UserActivityImpl;
  const _UserActivity._() : super._();

  factory _UserActivity.fromJson(Map<String, dynamic> json) =
      _$UserActivityImpl.fromJson;

  @override
  DateTime? get lastOpened;
  @override
  DateTime? get lastGamePlayed;
  @override
  bool get isActive;
  @override
  dynamic get isPlaying;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  String? get appVersion;
  @override
  DateTime get nowTime;
  @override
  bool get isEmulator;
  @override
  @JsonKey(ignore: true)
  _$$UserActivityImplCopyWith<_$UserActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
