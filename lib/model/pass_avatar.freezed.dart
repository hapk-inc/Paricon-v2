// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_avatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PassAvatar _$PassAvatarFromJson(Map<String, dynamic> json) {
  return _PassAvatar.fromJson(json);
}

/// @nodoc
mixin _$PassAvatar {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassAvatarCopyWith<PassAvatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassAvatarCopyWith<$Res> {
  factory $PassAvatarCopyWith(
          PassAvatar value, $Res Function(PassAvatar) then) =
      _$PassAvatarCopyWithImpl<$Res, PassAvatar>;
  @useResult
  $Res call({DateTime createdAt, String? avatar, String from, String to});
}

/// @nodoc
class _$PassAvatarCopyWithImpl<$Res, $Val extends PassAvatar>
    implements $PassAvatarCopyWith<$Res> {
  _$PassAvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? avatar = freezed,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassAvatarImplCopyWith<$Res>
    implements $PassAvatarCopyWith<$Res> {
  factory _$$PassAvatarImplCopyWith(
          _$PassAvatarImpl value, $Res Function(_$PassAvatarImpl) then) =
      __$$PassAvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, String? avatar, String from, String to});
}

/// @nodoc
class __$$PassAvatarImplCopyWithImpl<$Res>
    extends _$PassAvatarCopyWithImpl<$Res, _$PassAvatarImpl>
    implements _$$PassAvatarImplCopyWith<$Res> {
  __$$PassAvatarImplCopyWithImpl(
      _$PassAvatarImpl _value, $Res Function(_$PassAvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? avatar = freezed,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$PassAvatarImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassAvatarImpl extends _PassAvatar {
  const _$PassAvatarImpl(
      {required this.createdAt,
      this.avatar,
      required this.from,
      required this.to})
      : super._();

  factory _$PassAvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassAvatarImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String? avatar;
  @override
  final String from;
  @override
  final String to;

  @override
  String toString() {
    return 'PassAvatar(createdAt: $createdAt, avatar: $avatar, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassAvatarImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, avatar, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassAvatarImplCopyWith<_$PassAvatarImpl> get copyWith =>
      __$$PassAvatarImplCopyWithImpl<_$PassAvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassAvatarImplToJson(
      this,
    );
  }
}

abstract class _PassAvatar extends PassAvatar {
  const factory _PassAvatar(
      {required final DateTime createdAt,
      final String? avatar,
      required final String from,
      required final String to}) = _$PassAvatarImpl;
  const _PassAvatar._() : super._();

  factory _PassAvatar.fromJson(Map<String, dynamic> json) =
      _$PassAvatarImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String? get avatar;
  @override
  String get from;
  @override
  String get to;
  @override
  @JsonKey(ignore: true)
  _$$PassAvatarImplCopyWith<_$PassAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
