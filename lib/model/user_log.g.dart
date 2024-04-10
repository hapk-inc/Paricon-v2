// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLogImpl _$$UserLogImplFromJson(Map<String, dynamic> json) =>
    _$UserLogImpl(
      id: json['id'] as String,
      when: DateTime.parse(json['when'] as String),
      timeTaken: Duration(microseconds: json['timeTaken'] as int),
      tournament: json['tournament'] as String?,
    );

Map<String, dynamic> _$$UserLogImplToJson(_$UserLogImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'when': instance.when.toIso8601String(),
    'timeTaken': instance.timeTaken.inMicroseconds,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tournament', instance.tournament);
  return val;
}
