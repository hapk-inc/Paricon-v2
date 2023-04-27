// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyUser _$$_MyUserFromJson(Map<String, dynamic> json) => _$_MyUser(
      name: json['name'] as String,
      id: json['id'] as num,
      avatar: json['avatar'] as String,
      isActive: json['isActive'] as bool,
      playing: json['playing'] as String?,
      isHuman: json['isHuman'] as bool,
      controllerCount: json['controllerCount'] as num?,
      controlledBy: (json['controlledBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_MyUserToJson(_$_MyUser instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'avatar': instance.avatar,
      'isActive': instance.isActive,
      'playing': instance.playing,
      'isHuman': instance.isHuman,
      'controllerCount': instance.controllerCount,
      'controlledBy': instance.controlledBy,
    };
