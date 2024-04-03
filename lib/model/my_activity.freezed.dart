// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyActivity _$MyActivityFromJson(Map<String, dynamic> json) {
  return _MyActivity.fromJson(json);
}

/// @nodoc
mixin _$MyActivity {
  DateTime? get lastOpened => throw _privateConstructorUsedError;
  DateTime? get lastGamePlayed => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  dynamic get isPlaying => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  DateTime get nowTime => throw _privateConstructorUsedError;
  bool get isEmulator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyActivityCopyWith<MyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyActivityCopyWith<$Res> {
  factory $MyActivityCopyWith(
          MyActivity value, $Res Function(MyActivity) then) =
      _$MyActivityCopyWithImpl<$Res, MyActivity>;
  @useResult
  $Res call(
      {DateTime? lastOpened,
      DateTime? lastGamePlayed,
      bool? isActive,
      dynamic isPlaying,
      String? appVersion,
      DateTime nowTime,
      bool isEmulator});
}

/// @nodoc
class _$MyActivityCopyWithImpl<$Res, $Val extends MyActivity>
    implements $MyActivityCopyWith<$Res> {
  _$MyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isActive = freezed,
    Object? isPlaying = freezed,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$MyActivityImplCopyWith<$Res>
    implements $MyActivityCopyWith<$Res> {
  factory _$$MyActivityImplCopyWith(
          _$MyActivityImpl value, $Res Function(_$MyActivityImpl) then) =
      __$$MyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? lastOpened,
      DateTime? lastGamePlayed,
      bool? isActive,
      dynamic isPlaying,
      String? appVersion,
      DateTime nowTime,
      bool isEmulator});
}

/// @nodoc
class __$$MyActivityImplCopyWithImpl<$Res>
    extends _$MyActivityCopyWithImpl<$Res, _$MyActivityImpl>
    implements _$$MyActivityImplCopyWith<$Res> {
  __$$MyActivityImplCopyWithImpl(
      _$MyActivityImpl _value, $Res Function(_$MyActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isActive = freezed,
    Object? isPlaying = freezed,
    Object? appVersion = freezed,
    Object? nowTime = null,
    Object? isEmulator = null,
  }) {
    return _then(_$MyActivityImpl(
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGamePlayed: freezed == lastGamePlayed
          ? _value.lastGamePlayed
          : lastGamePlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

@JsonSerializable(includeIfNull: false)
class _$MyActivityImpl extends _MyActivity {
  const _$MyActivityImpl(
      {this.lastOpened,
      this.lastGamePlayed,
      this.isActive,
      this.isPlaying,
      this.appVersion,
      required this.nowTime,
      this.isEmulator = false})
      : super._();

  factory _$MyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyActivityImplFromJson(json);

  @override
  final DateTime? lastOpened;
  @override
  final DateTime? lastGamePlayed;
  @override
  final bool? isActive;
  @override
  final dynamic isPlaying;
  @override
  final String? appVersion;
  @override
  final DateTime nowTime;
  @override
  @JsonKey()
  final bool isEmulator;

  @override
  String toString() {
    return 'MyActivity(lastOpened: $lastOpened, lastGamePlayed: $lastGamePlayed, isActive: $isActive, isPlaying: $isPlaying, appVersion: $appVersion, nowTime: $nowTime, isEmulator: $isEmulator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyActivityImpl &&
            (identical(other.lastOpened, lastOpened) ||
                other.lastOpened == lastOpened) &&
            (identical(other.lastGamePlayed, lastGamePlayed) ||
                other.lastGamePlayed == lastGamePlayed) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
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
      appVersion,
      nowTime,
      isEmulator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyActivityImplCopyWith<_$MyActivityImpl> get copyWith =>
      __$$MyActivityImplCopyWithImpl<_$MyActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyActivityImplToJson(
      this,
    );
  }
}

abstract class _MyActivity extends MyActivity {
  const factory _MyActivity(
      {final DateTime? lastOpened,
      final DateTime? lastGamePlayed,
      final bool? isActive,
      final dynamic isPlaying,
      final String? appVersion,
      required final DateTime nowTime,
      final bool isEmulator}) = _$MyActivityImpl;
  const _MyActivity._() : super._();

  factory _MyActivity.fromJson(Map<String, dynamic> json) =
      _$MyActivityImpl.fromJson;

  @override
  DateTime? get lastOpened;
  @override
  DateTime? get lastGamePlayed;
  @override
  bool? get isActive;
  @override
  dynamic get isPlaying;
  @override
  String? get appVersion;
  @override
  DateTime get nowTime;
  @override
  bool get isEmulator;
  @override
  @JsonKey(ignore: true)
  _$$MyActivityImplCopyWith<_$MyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
