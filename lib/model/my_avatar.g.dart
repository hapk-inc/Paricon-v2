// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyAvatarImpl _$$MyAvatarImplFromJson(Map<String, dynamic> json) =>
    _$MyAvatarImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      id: json['id'] as String? ?? "",
    );

Map<String, dynamic> _$$MyAvatarImplToJson(_$MyAvatarImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'id': instance.id,
    };
