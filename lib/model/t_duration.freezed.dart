// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 't_duration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TDuration _$TDurationFromJson(Map<String, dynamic> json) {
  return _TDuration.fromJson(json);
}

/// @nodoc
mixin _$TDuration {
  String get userId => throw _privateConstructorUsedError;
  DateTime get playedAt => throw _privateConstructorUsedError;
  Duration get tDuration => throw _privateConstructorUsedError;
  Duration get bestDifference => throw _privateConstructorUsedError;
  bool get firstTime => throw _privateConstructorUsedError;
  String get tourId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TDurationCopyWith<TDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TDurationCopyWith<$Res> {
  factory $TDurationCopyWith(TDuration value, $Res Function(TDuration) then) =
      _$TDurationCopyWithImpl<$Res, TDuration>;
  @useResult
  $Res call(
      {String userId,
      DateTime playedAt,
      Duration tDuration,
      Duration bestDifference,
      bool firstTime,
      String tourId});
}

/// @nodoc
class _$TDurationCopyWithImpl<$Res, $Val extends TDuration>
    implements $TDurationCopyWith<$Res> {
  _$TDurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? playedAt = null,
    Object? tDuration = null,
    Object? bestDifference = null,
    Object? firstTime = null,
    Object? tourId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      playedAt: null == playedAt
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tDuration: null == tDuration
          ? _value.tDuration
          : tDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      bestDifference: null == bestDifference
          ? _value.bestDifference
          : bestDifference // ignore: cast_nullable_to_non_nullable
              as Duration,
      firstTime: null == firstTime
          ? _value.firstTime
          : firstTime // ignore: cast_nullable_to_non_nullable
              as bool,
      tourId: null == tourId
          ? _value.tourId
          : tourId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TDurationImplCopyWith<$Res>
    implements $TDurationCopyWith<$Res> {
  factory _$$TDurationImplCopyWith(
          _$TDurationImpl value, $Res Function(_$TDurationImpl) then) =
      __$$TDurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      DateTime playedAt,
      Duration tDuration,
      Duration bestDifference,
      bool firstTime,
      String tourId});
}

/// @nodoc
class __$$TDurationImplCopyWithImpl<$Res>
    extends _$TDurationCopyWithImpl<$Res, _$TDurationImpl>
    implements _$$TDurationImplCopyWith<$Res> {
  __$$TDurationImplCopyWithImpl(
      _$TDurationImpl _value, $Res Function(_$TDurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? playedAt = null,
    Object? tDuration = null,
    Object? bestDifference = null,
    Object? firstTime = null,
    Object? tourId = null,
  }) {
    return _then(_$TDurationImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      playedAt: null == playedAt
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tDuration: null == tDuration
          ? _value.tDuration
          : tDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      bestDifference: null == bestDifference
          ? _value.bestDifference
          : bestDifference // ignore: cast_nullable_to_non_nullable
              as Duration,
      firstTime: null == firstTime
          ? _value.firstTime
          : firstTime // ignore: cast_nullable_to_non_nullable
              as bool,
      tourId: null == tourId
          ? _value.tourId
          : tourId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TDurationImpl implements _TDuration {
  const _$TDurationImpl(
      {required this.userId,
      required this.playedAt,
      required this.tDuration,
      this.bestDifference = Duration.zero,
      this.firstTime = false,
      this.tourId = "public"});

  factory _$TDurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TDurationImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime playedAt;
  @override
  final Duration tDuration;
  @override
  @JsonKey()
  final Duration bestDifference;
  @override
  @JsonKey()
  final bool firstTime;
  @override
  @JsonKey()
  final String tourId;

  @override
  String toString() {
    return 'TDuration(userId: $userId, playedAt: $playedAt, tDuration: $tDuration, bestDifference: $bestDifference, firstTime: $firstTime, tourId: $tourId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TDurationImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.playedAt, playedAt) ||
                other.playedAt == playedAt) &&
            (identical(other.tDuration, tDuration) ||
                other.tDuration == tDuration) &&
            (identical(other.bestDifference, bestDifference) ||
                other.bestDifference == bestDifference) &&
            (identical(other.firstTime, firstTime) ||
                other.firstTime == firstTime) &&
            (identical(other.tourId, tourId) || other.tourId == tourId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, playedAt, tDuration,
      bestDifference, firstTime, tourId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TDurationImplCopyWith<_$TDurationImpl> get copyWith =>
      __$$TDurationImplCopyWithImpl<_$TDurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TDurationImplToJson(
      this,
    );
  }
}

abstract class _TDuration implements TDuration {
  const factory _TDuration(
      {required final String userId,
      required final DateTime playedAt,
      required final Duration tDuration,
      final Duration bestDifference,
      final bool firstTime,
      final String tourId}) = _$TDurationImpl;

  factory _TDuration.fromJson(Map<String, dynamic> json) =
      _$TDurationImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get playedAt;
  @override
  Duration get tDuration;
  @override
  Duration get bestDifference;
  @override
  bool get firstTime;
  @override
  String get tourId;
  @override
  @JsonKey(ignore: true)
  _$$TDurationImplCopyWith<_$TDurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
