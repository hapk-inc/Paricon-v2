// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      name: json['name'] as String? ?? "User#",
      rName: json['rName'] as String?,
      no: json['no'] as num?,
      isActive: json['isActive'] as bool?,
      avatar: json['avatar'] as String?,
      avatarCode: json['avatarCode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      avatarArr: (json['avatarArr'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      friendArr: (json['friendArr'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastOpened: json['lastOpened'] == null
          ? null
          : DateTime.parse(json['lastOpened'] as String),
      lastGamePlayed: json['lastGamePlayed'] == null
          ? null
          : DateTime.parse(json['lastGamePlayed'] as String),
      isPlaying: json['isPlaying'],
      appVersion: json['appVersion'] as String?,
      nowTime: json['nowTime'] == null
          ? null
          : DateTime.parse(json['nowTime'] as String),
      isEmulator: json['isEmulator'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rName', instance.rName);
  writeNotNull('no', instance.no);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('avatarCode', instance.avatarCode);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('avatarArr', instance.avatarArr);
  writeNotNull('friendArr', instance.friendArr);
  writeNotNull('lastOpened', instance.lastOpened?.toIso8601String());
  writeNotNull('lastGamePlayed', instance.lastGamePlayed?.toIso8601String());
  writeNotNull('isPlaying', instance.isPlaying);
  writeNotNull('appVersion', instance.appVersion);
  writeNotNull('nowTime', instance.nowTime?.toIso8601String());
  writeNotNull('isEmulator', instance.isEmulator);
  writeNotNull('id', instance.id);
  return val;
}
