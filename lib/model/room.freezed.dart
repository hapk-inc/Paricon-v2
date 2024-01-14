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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  Map<dynamic, dynamic> get players => throw _privateConstructorUsedError;
  bool get isGameStarted => throw _privateConstructorUsedError;
  num get roomCode => throw _privateConstructorUsedError;
  RoomLevel get level => throw _privateConstructorUsedError;
  String get creatorID => throw _privateConstructorUsedError;
  RoomType get type => throw _privateConstructorUsedError;

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
      {Map<dynamic, dynamic> players,
      bool isGameStarted,
      num roomCode,
      RoomLevel level,
      String creatorID,
      RoomType type});
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
    Object? isGameStarted = null,
    Object? roomCode = null,
    Object? level = null,
    Object? creatorID = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      isGameStarted: null == isGameStarted
          ? _value.isGameStarted
          : isGameStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as num,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as RoomLevel,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoomType,
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
      {Map<dynamic, dynamic> players,
      bool isGameStarted,
      num roomCode,
      RoomLevel level,
      String creatorID,
      RoomType type});
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
    Object? isGameStarted = null,
    Object? roomCode = null,
    Object? level = null,
    Object? creatorID = null,
    Object? type = null,
  }) {
    return _then(_$RoomImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      isGameStarted: null == isGameStarted
          ? _value.isGameStarted
          : isGameStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as num,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as RoomLevel,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoomType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {final Map<dynamic, dynamic> players = const {},
      this.isGameStarted = false,
      required this.roomCode,
      required this.level,
      required this.creatorID,
      required this.type})
      : _players = players;

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  final Map<dynamic, dynamic> _players;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  @override
  @JsonKey()
  final bool isGameStarted;
  @override
  final num roomCode;
  @override
  final RoomLevel level;
  @override
  final String creatorID;
  @override
  final RoomType type;

  @override
  String toString() {
    return 'Room(players: $players, isGameStarted: $isGameStarted, roomCode: $roomCode, level: $level, creatorID: $creatorID, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.isGameStarted, isGameStarted) ||
                other.isGameStarted == isGameStarted) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.creatorID, creatorID) ||
                other.creatorID == creatorID) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_players),
      isGameStarted,
      roomCode,
      level,
      creatorID,
      type);

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
      {final Map<dynamic, dynamic> players,
      final bool isGameStarted,
      required final num roomCode,
      required final RoomLevel level,
      required final String creatorID,
      required final RoomType type}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  Map<dynamic, dynamic> get players;
  @override
  bool get isGameStarted;
  @override
  num get roomCode;
  @override
  RoomLevel get level;
  @override
  String get creatorID;
  @override
  RoomType get type;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
