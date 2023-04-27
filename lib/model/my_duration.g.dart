// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyDuration _$$_MyDurationFromJson(Map<String, dynamic> json) =>
    _$_MyDuration(
      lastOpened: json['lastOpened'] == null
          ? null
          : DateTime.parse(json['lastOpened'] as String),
      currentTime: DateTime.parse(json['currentTime'] as String),
    );

Map<String, dynamic> _$$_MyDurationToJson(_$_MyDuration instance) =>
    <String, dynamic>{
      'lastOpened': instance.lastOpened?.toIso8601String(),
      'currentTime': instance.currentTime.toIso8601String(),
    };
