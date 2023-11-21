// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserActivityImpl _$$UserActivityImplFromJson(Map<String, dynamic> json) =>
    _$UserActivityImpl(
      lastOpened: json['lastOpened'] == null
          ? null
          : DateTime.parse(json['lastOpened'] as String),
      lastGamePlayed: json['lastGamePlayed'] == null
          ? null
          : DateTime.parse(json['lastGamePlayed'] as String),
      isActive: json['isActive'] as bool? ?? true,
      isPlaying: json['isPlaying'] as bool? ?? false,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      appVersion: json['appVersion'] as String?,
      nowTime: DateTime.parse(json['nowTime'] as String),
    );

Map<String, dynamic> _$$UserActivityImplToJson(_$UserActivityImpl instance) =>
    <String, dynamic>{
      'lastOpened': instance.lastOpened?.toIso8601String(),
      'lastGamePlayed': instance.lastGamePlayed?.toIso8601String(),
      'isActive': instance.isActive,
      'isPlaying': instance.isPlaying,
      'name': instance.name,
      'avatar': instance.avatar,
      'appVersion': instance.appVersion,
      'nowTime': instance.nowTime.toIso8601String(),
    };
