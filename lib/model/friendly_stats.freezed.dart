// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendly_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendlyStats _$FriendlyStatsFromJson(Map<String, dynamic> json) {
  return _FriendlyStats.fromJson(json);
}

/// @nodoc
mixin _$FriendlyStats {
  BoardLevel? get level => throw _privateConstructorUsedError;
  BoardType? get type => throw _privateConstructorUsedError;
  PlayerCount? get count => throw _privateConstructorUsedError;
  int get pts => throw _privateConstructorUsedError;
  bool get winner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendlyStatsCopyWith<FriendlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendlyStatsCopyWith<$Res> {
  factory $FriendlyStatsCopyWith(
          FriendlyStats value, $Res Function(FriendlyStats) then) =
      _$FriendlyStatsCopyWithImpl<$Res, FriendlyStats>;
  @useResult
  $Res call(
      {BoardLevel? level,
      BoardType? type,
      PlayerCount? count,
      int pts,
      bool winner});
}

/// @nodoc
class _$FriendlyStatsCopyWithImpl<$Res, $Val extends FriendlyStats>
    implements $FriendlyStatsCopyWith<$Res> {
  _$FriendlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = freezed,
    Object? type = freezed,
    Object? count = freezed,
    Object? pts = null,
    Object? winner = null,
  }) {
    return _then(_value.copyWith(
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as BoardLevel?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BoardType?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as PlayerCount?,
      pts: null == pts
          ? _value.pts
          : pts // ignore: cast_nullable_to_non_nullable
              as int,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendlyStatsImplCopyWith<$Res>
    implements $FriendlyStatsCopyWith<$Res> {
  factory _$$FriendlyStatsImplCopyWith(
          _$FriendlyStatsImpl value, $Res Function(_$FriendlyStatsImpl) then) =
      __$$FriendlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BoardLevel? level,
      BoardType? type,
      PlayerCount? count,
      int pts,
      bool winner});
}

/// @nodoc
class __$$FriendlyStatsImplCopyWithImpl<$Res>
    extends _$FriendlyStatsCopyWithImpl<$Res, _$FriendlyStatsImpl>
    implements _$$FriendlyStatsImplCopyWith<$Res> {
  __$$FriendlyStatsImplCopyWithImpl(
      _$FriendlyStatsImpl _value, $Res Function(_$FriendlyStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = freezed,
    Object? type = freezed,
    Object? count = freezed,
    Object? pts = null,
    Object? winner = null,
  }) {
    return _then(_$FriendlyStatsImpl(
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as BoardLevel?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BoardType?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as PlayerCount?,
      pts: null == pts
          ? _value.pts
          : pts // ignore: cast_nullable_to_non_nullable
              as int,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendlyStatsImpl implements _FriendlyStats {
  const _$FriendlyStatsImpl(
      {this.level = BoardLevel.easy,
      this.type = BoardType.normal,
      this.count = PlayerCount.vs,
      this.pts = 0,
      this.winner = false});

  factory _$FriendlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendlyStatsImplFromJson(json);

  @override
  @JsonKey()
  final BoardLevel? level;
  @override
  @JsonKey()
  final BoardType? type;
  @override
  @JsonKey()
  final PlayerCount? count;
  @override
  @JsonKey()
  final int pts;
  @override
  @JsonKey()
  final bool winner;

  @override
  String toString() {
    return 'FriendlyStats(level: $level, type: $type, count: $count, pts: $pts, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendlyStatsImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pts, pts) || other.pts == pts) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, level, type, count, pts, winner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendlyStatsImplCopyWith<_$FriendlyStatsImpl> get copyWith =>
      __$$FriendlyStatsImplCopyWithImpl<_$FriendlyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendlyStatsImplToJson(
      this,
    );
  }
}

abstract class _FriendlyStats implements FriendlyStats {
  const factory _FriendlyStats(
      {final BoardLevel? level,
      final BoardType? type,
      final PlayerCount? count,
      final int pts,
      final bool winner}) = _$FriendlyStatsImpl;

  factory _FriendlyStats.fromJson(Map<String, dynamic> json) =
      _$FriendlyStatsImpl.fromJson;

  @override
  BoardLevel? get level;
  @override
  BoardType? get type;
  @override
  PlayerCount? get count;
  @override
  int get pts;
  @override
  bool get winner;
  @override
  @JsonKey(ignore: true)
  _$$FriendlyStatsImplCopyWith<_$FriendlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
