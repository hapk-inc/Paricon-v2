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
      isActive: json['isActive'] as bool? ?? true,
      playing: json['playing'] as String?,
      isHuman: json['isHuman'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      myCards: (json['myCards'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      myFriends: (json['myFriends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bestDuration: json['bestDuration'] == null
          ? null
          : Duration(microseconds: json['bestDuration'] as int),
      tournamentPlayed: json['tournamentPlayed'] as num? ?? 0,
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rName': instance.rName,
      'id': instance.id,
      'avatar': instance.avatar,
      'avatarCode': instance.avatarCode,
      'isActive': instance.isActive,
      'playing': instance.playing,
      'isHuman': instance.isHuman,
      'createdAt': instance.createdAt?.toIso8601String(),
      'myCards': instance.myCards,
      'myFriends': instance.myFriends,
      'bestDuration': instance.bestDuration?.inMicroseconds,
      'tournamentPlayed': instance.tournamentPlayed,
    };
