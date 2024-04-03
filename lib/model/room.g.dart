// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      players: (json['players'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Player.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      started: json['started'] as bool?,
      code: json['code'] as num,
      level: $enumDecode(_$BoardLevelEnumMap, json['level']),
      creator: json['creator'] as String,
      type: $enumDecode(_$BoardTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) {
  final val = <String, dynamic>{
    'players': instance.players,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('started', instance.started);
  val['code'] = instance.code;
  val['level'] = _$BoardLevelEnumMap[instance.level]!;
  val['creator'] = instance.creator;
  val['type'] = _$BoardTypeEnumMap[instance.type]!;
  return val;
}

const _$BoardLevelEnumMap = {
  BoardLevel.beginner: 'beginner',
  BoardLevel.expert: 'expert',
};

const _$BoardTypeEnumMap = {
  BoardType.normal: 'normal',
  BoardType.closed: 'closed',
  BoardType.orderwise: 'orderwise',
};
