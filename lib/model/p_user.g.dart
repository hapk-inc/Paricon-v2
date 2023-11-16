// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PUserImpl _$$PUserImplFromJson(Map<String, dynamic> json) => _$PUserImpl(
      name: json['name'] as String,
      rName: json['rName'] as String? ?? "",
      id: json['id'] as num,
      avatar: json['avatar'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      playing: json['playing'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      bestDuration: json['bestDuration'] == null
          ? null
          : Duration(microseconds: json['bestDuration'] as int),
      currentTime: json['currentTime'] == null
          ? null
          : DateTime.parse(json['currentTime'] as String),
      tournamentPlayed: json['tournamentPlayed'] as num? ?? 0,
      myFriends: (json['myFriends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PUserImplToJson(_$PUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rName': instance.rName,
      'id': instance.id,
      'avatar': instance.avatar,
      'isActive': instance.isActive,
      'playing': instance.playing,
      'createdAt': instance.createdAt?.toIso8601String(),
      'bestDuration': instance.bestDuration?.inMicroseconds,
      'currentTime': instance.currentTime?.toIso8601String(),
      'tournamentPlayed': instance.tournamentPlayed,
      'myFriends': instance.myFriends,
    };
