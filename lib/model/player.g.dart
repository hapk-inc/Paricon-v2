// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      name: json['name'] as String? ?? "User#",
      rName: json['rName'] as String?,
      tag: json['tag'] as num?,
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
  writeNotNull('tag', instance.tag);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('avatarCode', instance.avatarCode);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('avatarArr', instance.avatarArr);
  writeNotNull('friendArr', instance.friendArr);
  return val;
}
