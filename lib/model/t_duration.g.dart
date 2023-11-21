// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TDurationImpl _$$TDurationImplFromJson(Map<String, dynamic> json) =>
    _$TDurationImpl(
      userId: json['userId'] as String,
      playedAt: DateTime.parse(json['playedAt'] as String),
      tDuration: Duration(microseconds: json['tDuration'] as int),
      firstTime: json['firstTime'] as bool? ?? false,
      tourId: json['tourId'] as String? ?? "public",
    );

Map<String, dynamic> _$$TDurationImplToJson(_$TDurationImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'playedAt': instance.playedAt.toIso8601String(),
      'tDuration': instance.tDuration.inMicroseconds,
      'firstTime': instance.firstTime,
      'tourId': instance.tourId,
    };
