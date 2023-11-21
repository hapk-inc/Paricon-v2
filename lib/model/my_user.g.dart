// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      name: json['name'] as String,
      rName: json['rName'] as String? ?? "",
      id: json['id'] as num,
      avatar: json['avatar'] as String?,
      avatarCode: json['avatarCode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      avatarArr: (json['avatarArr'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friendArr: (json['friendArr'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rName': instance.rName,
      'id': instance.id,
      'avatar': instance.avatar,
      'avatarCode': instance.avatarCode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'avatarArr': instance.avatarArr,
      'friendArr': instance.friendArr,
    };
