// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      name: json['name'] as String,
      rName: json['rName'] as String? ?? "",
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

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rName': instance.rName,
      'id': instance.id,
      'avatar': instance.avatar,
      'isActive': instance.isActive,
      'playing': instance.playing,
      'isHuman': instance.isHuman,
      'controllerCount': instance.controllerCount,
      'controlledBy': instance.controlledBy,
    };
