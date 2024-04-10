// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRecordImpl _$$UserRecordImplFromJson(Map<String, dynamic> json) =>
    _$UserRecordImpl(
      lastPlayed: DateTime.parse(json['lastPlayed'] as String),
      recordPlayed: DateTime.parse(json['recordPlayed'] as String),
      timeTaken: Duration(microseconds: json['timeTaken'] as int),
      recordTimeTaken: Duration(microseconds: json['recordTimeTaken'] as int),
      mCount: json['mCount'] as int? ?? 1,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserRecordImplToJson(_$UserRecordImpl instance) {
  final val = <String, dynamic>{
    'lastPlayed': instance.lastPlayed.toIso8601String(),
    'recordPlayed': instance.recordPlayed.toIso8601String(),
    'timeTaken': instance.timeTaken.inMicroseconds,
    'recordTimeTaken': instance.recordTimeTaken.inMicroseconds,
    'mCount': instance.mCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
