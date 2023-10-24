// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvatarCardImpl _$$AvatarCardImplFromJson(Map<String, dynamic> json) =>
    _$AvatarCardImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      id: json['id'] as String? ?? "",
    );

Map<String, dynamic> _$$AvatarCardImplToJson(_$AvatarCardImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'id': instance.id,
    };
