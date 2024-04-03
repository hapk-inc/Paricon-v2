// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyActivityImpl _$$MyActivityImplFromJson(Map<String, dynamic> json) =>
    _$MyActivityImpl(
      lastOpened: json['lastOpened'] == null
          ? null
          : DateTime.parse(json['lastOpened'] as String),
      lastGamePlayed: json['lastGamePlayed'] == null
          ? null
          : DateTime.parse(json['lastGamePlayed'] as String),
      isActive: json['isActive'] as bool?,
      isPlaying: json['isPlaying'],
      appVersion: json['appVersion'] as String?,
      nowTime: DateTime.parse(json['nowTime'] as String),
      isEmulator: json['isEmulator'] as bool? ?? false,
    );

Map<String, dynamic> _$$MyActivityImplToJson(_$MyActivityImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lastOpened', instance.lastOpened?.toIso8601String());
  writeNotNull('lastGamePlayed', instance.lastGamePlayed?.toIso8601String());
  writeNotNull('isActive', instance.isActive);
  writeNotNull('isPlaying', instance.isPlaying);
  writeNotNull('appVersion', instance.appVersion);
  val['nowTime'] = instance.nowTime.toIso8601String();
  val['isEmulator'] = instance.isEmulator;
  return val;
}
