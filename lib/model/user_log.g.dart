// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLogImpl _$$UserLogImplFromJson(Map<String, dynamic> json) =>
    _$UserLogImpl(
      id: json['id'] as String?,
      when: DateTime.parse(json['when'] as String),
      timeTaken: Duration(microseconds: json['timeTaken'] as int),
      diff: json['diff'] == null
          ? null
          : Duration(microseconds: json['diff'] as int),
      firstTime: json['firstTime'] as bool? ?? false,
      tournament: json['tournament'] as String?,
    );

Map<String, dynamic> _$$UserLogImplToJson(_$UserLogImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['when'] = instance.when.toIso8601String();
  val['timeTaken'] = instance.timeTaken.inMicroseconds;
  writeNotNull('diff', instance.diff?.inMicroseconds);
  writeNotNull('firstTime', instance.firstTime);
  writeNotNull('tournament', instance.tournament);
  return val;
}
