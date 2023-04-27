// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TScore _$$_TScoreFromJson(Map<String, dynamic> json) => _$_TScore(
      userId: json['userId'] as String?,
      playedAt: json['playedAt'] == null
          ? null
          : DateTime.parse(json['playedAt'] as String),
      tDuration: json['tDuration'] == null
          ? null
          : Duration(microseconds: json['tDuration'] as int),
    );

Map<String, dynamic> _$$_TScoreToJson(_$_TScore instance) => <String, dynamic>{
      'userId': instance.userId,
      'playedAt': instance.playedAt?.toIso8601String(),
      'tDuration': instance.tDuration?.inMicroseconds,
    };
