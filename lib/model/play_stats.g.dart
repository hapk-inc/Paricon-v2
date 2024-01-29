// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayStatsImpl _$$PlayStatsImplFromJson(Map<String, dynamic> json) =>
    _$PlayStatsImpl(
      matches: json['matches'] as int? ?? 0,
      win: json['win'] as int? ?? 0,
      avg: (json['avg'] as num?)?.toDouble() ?? 0.00,
      players: (json['players'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as num),
          ) ??
          const {},
    );

Map<String, dynamic> _$$PlayStatsImplToJson(_$PlayStatsImpl instance) =>
    <String, dynamic>{
      'matches': instance.matches,
      'win': instance.win,
      'avg': instance.avg,
      'players': instance.players,
    };
