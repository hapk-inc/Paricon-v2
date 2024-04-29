// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendly_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendlyStatsImpl _$$FriendlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$FriendlyStatsImpl(
      level: $enumDecodeNullable(_$BoardLevelEnumMap, json['level']) ??
          BoardLevel.easy,
      type: $enumDecodeNullable(_$BoardTypeEnumMap, json['type']) ??
          BoardType.normal,
      count: $enumDecodeNullable(_$PlayerCountEnumMap, json['count']) ??
          PlayerCount.vs,
      pts: json['pts'] as int? ?? 0,
      winner: json['winner'] as bool? ?? false,
    );

Map<String, dynamic> _$$FriendlyStatsImplToJson(_$FriendlyStatsImpl instance) =>
    <String, dynamic>{
      'level': _$BoardLevelEnumMap[instance.level],
      'type': _$BoardTypeEnumMap[instance.type],
      'count': _$PlayerCountEnumMap[instance.count],
      'pts': instance.pts,
      'winner': instance.winner,
    };

const _$BoardLevelEnumMap = {
  BoardLevel.easy: 'easy',
  BoardLevel.hard: 'hard',
};

const _$BoardTypeEnumMap = {
  BoardType.normal: 'normal',
  BoardType.closed: 'closed',
};

const _$PlayerCountEnumMap = {
  PlayerCount.vs: 'vs',
  PlayerCount.trio: 'trio',
};
