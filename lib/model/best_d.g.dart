// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BestDImpl _$$BestDImplFromJson(Map<String, dynamic> json) => _$BestDImpl(
      lastPlayed: DateTime.parse(json['lastPlayed'] as String),
      bestD: Duration(microseconds: json['bestD'] as int),
      prevD: json['prevD'] == null
          ? null
          : Duration(microseconds: json['prevD'] as int),
      tCount: json['tCount'] as num? ?? 1,
      prevGame: json['prevGame'] as String? ?? "",
    );

Map<String, dynamic> _$$BestDImplToJson(_$BestDImpl instance) =>
    <String, dynamic>{
      'lastPlayed': instance.lastPlayed.toIso8601String(),
      'bestD': instance.bestD.inMicroseconds,
      'prevD': instance.prevD?.inMicroseconds,
      'tCount': instance.tCount,
      'prevGame': instance.prevGame,
    };
