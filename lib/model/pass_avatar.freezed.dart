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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PassAvatar _$PassAvatarFromJson(Map<String, dynamic> json) {
  return _PassAvatar.fromJson(json);
}

/// @nodoc
mixin _$PassAvatar {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

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
  $Res call({DateTime createdAt, String from, String id});
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
    Object? from = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
  $Res call({DateTime createdAt, String from, String id});
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
    Object? from = null,
    Object? id = null,
  }) {
    return _then(_$PassAvatarImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassAvatarImpl implements _PassAvatar {
  const _$PassAvatarImpl(
      {required this.createdAt, required this.from, this.id = ""});

  factory _$PassAvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassAvatarImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String from;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'PassAvatar(createdAt: $createdAt, from: $from, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassAvatarImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, from, id);

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

abstract class _PassAvatar implements PassAvatar {
  const factory _PassAvatar(
      {required final DateTime createdAt,
      required final String from,
      final String id}) = _$PassAvatarImpl;

  factory _PassAvatar.fromJson(Map<String, dynamic> json) =
      _$PassAvatarImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get from;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$PassAvatarImplCopyWith<_$PassAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
