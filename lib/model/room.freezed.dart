// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  Map<String, Player> get players => throw _privateConstructorUsedError;
  bool? get started => throw _privateConstructorUsedError;
  num get code => throw _privateConstructorUsedError;
  BoardLevel get level => throw _privateConstructorUsedError;
  String get creator => throw _privateConstructorUsedError;
  BoardType get type => throw _privateConstructorUsedError;
  PlayerCount get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {Map<String, Player> players,
      bool? started,
      num code,
      BoardLevel level,
      String creator,
      BoardType type,
      PlayerCount count});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? started = freezed,
    Object? code = null,
    Object? level = null,
    Object? creator = null,
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Player>,
      started: freezed == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as num,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as BoardLevel,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BoardType,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as PlayerCount,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Player> players,
      bool? started,
      num code,
      BoardLevel level,
      String creator,
      BoardType type,
      PlayerCount count});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? started = freezed,
    Object? code = null,
    Object? level = null,
    Object? creator = null,
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_$RoomImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, Player>,
      started: freezed == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as num,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as BoardLevel,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BoardType,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as PlayerCount,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {final Map<String, Player> players = const {},
      this.started,
      required this.code,
      required this.level,
      required this.creator,
      required this.type,
      required this.count})
      : _players = players;

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  final Map<String, Player> _players;
  @override
  @JsonKey()
  Map<String, Player> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  @override
  final bool? started;
  @override
  final num code;
  @override
  final BoardLevel level;
  @override
  final String creator;
  @override
  final BoardType type;
  @override
  final PlayerCount count;

  @override
  String toString() {
    return 'Room(players: $players, started: $started, code: $code, level: $level, creator: $creator, type: $type, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.started, started) || other.started == started) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_players),
      started,
      code,
      level,
      creator,
      type,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {final Map<String, Player> players,
      final bool? started,
      required final num code,
      required final BoardLevel level,
      required final String creator,
      required final BoardType type,
      required final PlayerCount count}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  Map<String, Player> get players;
  @override
  bool? get started;
  @override
  num get code;
  @override
  BoardLevel get level;
  @override
  String get creator;
  @override
  BoardType get type;
  @override
  PlayerCount get count;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
