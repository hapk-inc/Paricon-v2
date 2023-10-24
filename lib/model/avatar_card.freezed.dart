// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvatarCard _$AvatarCardFromJson(Map<String, dynamic> json) {
  return _AvatarCard.fromJson(json);
}

/// @nodoc
mixin _$AvatarCard {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCardCopyWith<AvatarCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCardCopyWith<$Res> {
  factory $AvatarCardCopyWith(
          AvatarCard value, $Res Function(AvatarCard) then) =
      _$AvatarCardCopyWithImpl<$Res, AvatarCard>;
  @useResult
  $Res call({DateTime createdAt, String createdBy, String id});
}

/// @nodoc
class _$AvatarCardCopyWithImpl<$Res, $Val extends AvatarCard>
    implements $AvatarCardCopyWith<$Res> {
  _$AvatarCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarCardImplCopyWith<$Res>
    implements $AvatarCardCopyWith<$Res> {
  factory _$$AvatarCardImplCopyWith(
          _$AvatarCardImpl value, $Res Function(_$AvatarCardImpl) then) =
      __$$AvatarCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, String createdBy, String id});
}

/// @nodoc
class __$$AvatarCardImplCopyWithImpl<$Res>
    extends _$AvatarCardCopyWithImpl<$Res, _$AvatarCardImpl>
    implements _$$AvatarCardImplCopyWith<$Res> {
  __$$AvatarCardImplCopyWithImpl(
      _$AvatarCardImpl _value, $Res Function(_$AvatarCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = null,
    Object? id = null,
  }) {
    return _then(_$AvatarCardImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
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
class _$AvatarCardImpl extends _AvatarCard {
  const _$AvatarCardImpl(
      {required this.createdAt, required this.createdBy, this.id = ""})
      : super._();

  factory _$AvatarCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarCardImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String createdBy;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'AvatarCard(createdAt: $createdAt, createdBy: $createdBy, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarCardImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, createdBy, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarCardImplCopyWith<_$AvatarCardImpl> get copyWith =>
      __$$AvatarCardImplCopyWithImpl<_$AvatarCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarCardImplToJson(
      this,
    );
  }
}

abstract class _AvatarCard extends AvatarCard {
  const factory _AvatarCard(
      {required final DateTime createdAt,
      required final String createdBy,
      final String id}) = _$AvatarCardImpl;
  const _AvatarCard._() : super._();

  factory _AvatarCard.fromJson(Map<String, dynamic> json) =
      _$AvatarCardImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$AvatarCardImplCopyWith<_$AvatarCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
