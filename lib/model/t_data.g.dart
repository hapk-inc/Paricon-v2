// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TDataImpl _$$TDataImplFromJson(Map<String, dynamic> json) => _$TDataImpl(
      name: json['name'] as String?,
      tCode: json['tCode'] as String?,
      expected: json['expected'] as int? ?? 0,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$TDataImplToJson(_$TDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tCode': instance.tCode,
      'expected': instance.expected,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
