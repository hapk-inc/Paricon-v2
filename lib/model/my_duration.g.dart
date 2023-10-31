// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyDurationImpl _$$MyDurationImplFromJson(Map<String, dynamic> json) =>
    _$MyDurationImpl(
      lastOpened: json['lastOpened'] == null
          ? null
          : DateTime.parse(json['lastOpened'] as String),
      lastGamePlayed: json['lastGamePlayed'] == null
          ? null
          : DateTime.parse(json['lastGamePlayed'] as String),
      avatarCode: json['avatarCode'] as String?,
      appVersion: json['appVersion'] as String?,
      currentTime: DateTime.parse(json['currentTime'] as String),
    );

Map<String, dynamic> _$$MyDurationImplToJson(_$MyDurationImpl instance) =>
    <String, dynamic>{
      'lastOpened': instance.lastOpened?.toIso8601String(),
      'lastGamePlayed': instance.lastGamePlayed?.toIso8601String(),
      'avatarCode': instance.avatarCode,
      'appVersion': instance.appVersion,
      'currentTime': instance.currentTime.toIso8601String(),
    };
