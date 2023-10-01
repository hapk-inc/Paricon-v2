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
      currentTime: DateTime.parse(json['currentTime'] as String),
    );

Map<String, dynamic> _$$MyDurationImplToJson(_$MyDurationImpl instance) =>
    <String, dynamic>{
      'lastOpened': instance.lastOpened?.toIso8601String(),
      'currentTime': instance.currentTime.toIso8601String(),
    };
