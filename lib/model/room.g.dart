// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      players: json['players'] as Map? ?? const {},
      isGameStarted: json['isGameStarted'] as bool? ?? false,
      roomCode: json['roomCode'] as num,
      level: $enumDecode(_$RoomLevelEnumMap, json['level']),
      creatorID: json['creatorID'] as String,
      type: $enumDecode(_$RoomTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'players': instance.players,
      'isGameStarted': instance.isGameStarted,
      'roomCode': instance.roomCode,
      'level': _$RoomLevelEnumMap[instance.level]!,
      'creatorID': instance.creatorID,
      'type': _$RoomTypeEnumMap[instance.type]!,
    };

const _$RoomLevelEnumMap = {
  RoomLevel.easy: 'easy',
  RoomLevel.medium: 'medium',
  RoomLevel.hard: 'hard',
};

const _$RoomTypeEnumMap = {
  RoomType.normal: 'normal',
  RoomType.closed: 'closed',
  RoomType.orderwise: 'orderwise',
};
