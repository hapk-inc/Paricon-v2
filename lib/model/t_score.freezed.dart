// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 't_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TScore _$TScoreFromJson(Map<String, dynamic> json) {
  return _TScore.fromJson(json);
}

/// @nodoc
mixin _$TScore {
  String? get userId => throw _privateConstructorUsedError;
  DateTime? get playedAt => throw _privateConstructorUsedError;
  Duration? get tDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TScoreCopyWith<TScore> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TScoreCopyWith<$Res> {
  factory $TScoreCopyWith(TScore value, $Res Function(TScore) then) =
      _$TScoreCopyWithImpl<$Res, TScore>;
  @useResult
  $Res call({String? userId, DateTime? playedAt, Duration? tDuration});
}

/// @nodoc
class _$TScoreCopyWithImpl<$Res, $Val extends TScore>
    implements $TScoreCopyWith<$Res> {
  _$TScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? playedAt = freezed,
    Object? tDuration = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      playedAt: freezed == playedAt
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tDuration: freezed == tDuration
          ? _value.tDuration
          : tDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TScoreCopyWith<$Res> implements $TScoreCopyWith<$Res> {
  factory _$$_TScoreCopyWith(_$_TScore value, $Res Function(_$_TScore) then) =
      __$$_TScoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, DateTime? playedAt, Duration? tDuration});
}

/// @nodoc
class __$$_TScoreCopyWithImpl<$Res>
    extends _$TScoreCopyWithImpl<$Res, _$_TScore>
    implements _$$_TScoreCopyWith<$Res> {
  __$$_TScoreCopyWithImpl(_$_TScore _value, $Res Function(_$_TScore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? playedAt = freezed,
    Object? tDuration = freezed,
  }) {
    return _then(_$_TScore(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      playedAt: freezed == playedAt
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tDuration: freezed == tDuration
          ? _value.tDuration
          : tDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TScore implements _TScore {
  const _$_TScore({this.userId, this.playedAt, this.tDuration});

  factory _$_TScore.fromJson(Map<String, dynamic> json) =>
      _$$_TScoreFromJson(json);

  @override
  final String? userId;
  @override
  final DateTime? playedAt;
  @override
  final Duration? tDuration;

  @override
  String toString() {
    return 'TScore(userId: $userId, playedAt: $playedAt, tDuration: $tDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TScore &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.playedAt, playedAt) ||
                other.playedAt == playedAt) &&
            (identical(other.tDuration, tDuration) ||
                other.tDuration == tDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, playedAt, tDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TScoreCopyWith<_$_TScore> get copyWith =>
      __$$_TScoreCopyWithImpl<_$_TScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TScoreToJson(
      this,
    );
  }
}

abstract class _TScore implements TScore {
  const factory _TScore(
      {final String? userId,
      final DateTime? playedAt,
      final Duration? tDuration}) = _$_TScore;

  factory _TScore.fromJson(Map<String, dynamic> json) = _$_TScore.fromJson;

  @override
  String? get userId;
  @override
  DateTime? get playedAt;
  @override
  Duration? get tDuration;
  @override
  @JsonKey(ignore: true)
  _$$_TScoreCopyWith<_$_TScore> get copyWith =>
      throw _privateConstructorUsedError;
}
