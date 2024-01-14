// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalPlayerImpl _$$LocalPlayerImplFromJson(Map<String, dynamic> json) =>
    _$LocalPlayerImpl(
      name: json['name'] as String,
      color: json['color'] as String,
      avatar: json['avatar'] as String? ?? "",
      pts: json['pts'] as int? ?? 0,
      playerNo: json['playerNo'] as int,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$LocalPlayerImplToJson(_$LocalPlayerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'avatar': instance.avatar,
      'pts': instance.pts,
      'playerNo': instance.playerNo,
      'isActive': instance.isActive,
    };
