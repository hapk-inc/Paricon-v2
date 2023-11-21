// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassAvatarImpl _$$PassAvatarImplFromJson(Map<String, dynamic> json) =>
    _$PassAvatarImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      from: json['from'] as String,
      id: json['id'] as String? ?? "",
    );

Map<String, dynamic> _$$PassAvatarImplToJson(_$PassAvatarImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'from': instance.from,
      'id': instance.id,
    };
