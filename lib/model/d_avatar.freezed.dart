// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'd_avatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DAvatar _$DAvatarFromJson(Map<String, dynamic> json) {
  return _DAvatar.fromJson(json);
}

/// @nodoc
mixin _$DAvatar {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DAvatarCopyWith<DAvatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DAvatarCopyWith<$Res> {
  factory $DAvatarCopyWith(DAvatar value, $Res Function(DAvatar) then) =
      _$DAvatarCopyWithImpl<$Res, DAvatar>;
  @useResult
  $Res call({DateTime createdAt, String? avatar});
}

/// @nodoc
class _$DAvatarCopyWithImpl<$Res, $Val extends DAvatar>
    implements $DAvatarCopyWith<$Res> {
  _$DAvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? avatar = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DAvatarImplCopyWith<$Res> implements $DAvatarCopyWith<$Res> {
  factory _$$DAvatarImplCopyWith(
          _$DAvatarImpl value, $Res Function(_$DAvatarImpl) then) =
      __$$DAvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, String? avatar});
}

/// @nodoc
class __$$DAvatarImplCopyWithImpl<$Res>
    extends _$DAvatarCopyWithImpl<$Res, _$DAvatarImpl>
    implements _$$DAvatarImplCopyWith<$Res> {
  __$$DAvatarImplCopyWithImpl(
      _$DAvatarImpl _value, $Res Function(_$DAvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? avatar = freezed,
  }) {
    return _then(_$DAvatarImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DAvatarImpl implements _DAvatar {
  const _$DAvatarImpl({required this.createdAt, this.avatar});

  factory _$DAvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$DAvatarImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'DAvatar(createdAt: $createdAt, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DAvatarImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DAvatarImplCopyWith<_$DAvatarImpl> get copyWith =>
      __$$DAvatarImplCopyWithImpl<_$DAvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DAvatarImplToJson(
      this,
    );
  }
}

abstract class _DAvatar implements DAvatar {
  const factory _DAvatar(
      {required final DateTime createdAt,
      final String? avatar}) = _$DAvatarImpl;

  factory _DAvatar.fromJson(Map<String, dynamic> json) = _$DAvatarImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$DAvatarImplCopyWith<_$DAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
