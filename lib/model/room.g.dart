// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      players:
          _$JsonConverterFromJson<Map<dynamic, dynamic>, Map<String, Player>>(
                  json['players'], const PlayerConverter().fromJson) ??
              const {},
      started: json['started'] as bool?,
      code: json['code'] as num?,
      level: $enumDecodeNullable(_$BoardLevelEnumMap, json['level']),
      creator: json['creator'] as String?,
      type: $enumDecodeNullable(_$BoardTypeEnumMap, json['type']),
      count: $enumDecodeNullable(_$PlayerCountEnumMap, json['count']),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'players',
      _$JsonConverterToJson<Map<dynamic, dynamic>, Map<String, Player>>(
          instance.players, const PlayerConverter().toJson));
  writeNotNull('started', instance.started);
  writeNotNull('code', instance.code);
  writeNotNull('level', _$BoardLevelEnumMap[instance.level]);
  writeNotNull('creator', instance.creator);
  writeNotNull('type', _$BoardTypeEnumMap[instance.type]);
  writeNotNull('count', _$PlayerCountEnumMap[instance.count]);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$BoardLevelEnumMap = {
  BoardLevel.easy: 'easy',
  BoardLevel.hard: 'hard',
};

const _$BoardTypeEnumMap = {
  BoardType.normal: 'normal',
  BoardType.closed: 'closed',
  BoardType.orderwise: 'orderwise',
};

const _$PlayerCountEnumMap = {
  PlayerCount.vs: 'vs',
  PlayerCount.trio: 'trio',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
