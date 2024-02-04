// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassAvatarImpl _$$PassAvatarImplFromJson(Map<String, dynamic> json) =>
    _$PassAvatarImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      avatar: json['avatar'] as String?,
      from: json['from'] as String,
      to: json['to'] as String,
    );

Map<String, dynamic> _$$PassAvatarImplToJson(_$PassAvatarImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'avatar': instance.avatar,
      'from': instance.from,
      'to': instance.to,
    };
