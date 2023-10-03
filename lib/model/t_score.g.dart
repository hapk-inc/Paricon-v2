// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TScoreImpl _$$TScoreImplFromJson(Map<String, dynamic> json) => _$TScoreImpl(
      userId: json['userId'] as String,
      playedAt: DateTime.parse(json['playedAt'] as String),
      tDuration: Duration(microseconds: json['tDuration'] as int),
    );

Map<String, dynamic> _$$TScoreImplToJson(_$TScoreImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'playedAt': instance.playedAt.toIso8601String(),
      'tDuration': instance.tDuration.inMicroseconds,
    };
