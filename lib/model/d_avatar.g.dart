// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'd_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DAvatarImpl _$$DAvatarImplFromJson(Map<String, dynamic> json) =>
    _$DAvatarImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$DAvatarImplToJson(_$DAvatarImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'avatar': instance.avatar,
    };
