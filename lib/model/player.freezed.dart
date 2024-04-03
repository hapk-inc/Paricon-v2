// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get name => throw _privateConstructorUsedError;
  String? get rName => throw _privateConstructorUsedError;
  num? get tag => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get avatarCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<String>? get avatarArr => throw _privateConstructorUsedError;
  List<String>? get friendArr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {String name,
      String? rName,
      num? tag,
      bool? isActive,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String>? avatarArr,
      List<String>? friendArr});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = freezed,
    Object? tag = freezed,
    Object? isActive = freezed,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = freezed,
    Object? friendArr = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: freezed == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as num?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarCode: freezed == avatarCode
          ? _value.avatarCode
          : avatarCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarArr: freezed == avatarArr
          ? _value.avatarArr
          : avatarArr // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendArr: freezed == friendArr
          ? _value.friendArr
          : friendArr // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? rName,
      num? tag,
      bool? isActive,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String>? avatarArr,
      List<String>? friendArr});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = freezed,
    Object? tag = freezed,
    Object? isActive = freezed,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = freezed,
    Object? friendArr = freezed,
  }) {
    return _then(_$PlayerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: freezed == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as num?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarCode: freezed == avatarCode
          ? _value.avatarCode
          : avatarCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarArr: freezed == avatarArr
          ? _value._avatarArr
          : avatarArr // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendArr: freezed == friendArr
          ? _value._friendArr
          : friendArr // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$PlayerImpl extends _Player {
  const _$PlayerImpl(
      {this.name = "User#",
      this.rName,
      this.tag = 0,
      this.isActive,
      this.avatar,
      this.avatarCode,
      this.createdAt,
      final List<String>? avatarArr,
      final List<String>? friendArr})
      : _avatarArr = avatarArr,
        _friendArr = friendArr,
        super._();

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final String? rName;
  @override
  @JsonKey()
  final num? tag;
  @override
  final bool? isActive;
  @override
  final String? avatar;
  @override
  final String? avatarCode;
  @override
  final DateTime? createdAt;
  final List<String>? _avatarArr;
  @override
  List<String>? get avatarArr {
    final value = _avatarArr;
    if (value == null) return null;
    if (_avatarArr is EqualUnmodifiableListView) return _avatarArr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _friendArr;
  @override
  List<String>? get friendArr {
    final value = _friendArr;
    if (value == null) return null;
    if (_friendArr is EqualUnmodifiableListView) return _friendArr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Player(name: $name, rName: $rName, tag: $tag, isActive: $isActive, avatar: $avatar, avatarCode: $avatarCode, createdAt: $createdAt, avatarArr: $avatarArr, friendArr: $friendArr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rName, rName) || other.rName == rName) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.avatarCode, avatarCode) ||
                other.avatarCode == avatarCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._avatarArr, _avatarArr) &&
            const DeepCollectionEquality()
                .equals(other._friendArr, _friendArr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      rName,
      tag,
      isActive,
      avatar,
      avatarCode,
      createdAt,
      const DeepCollectionEquality().hash(_avatarArr),
      const DeepCollectionEquality().hash(_friendArr));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player extends Player {
  const factory _Player(
      {final String name,
      final String? rName,
      final num? tag,
      final bool? isActive,
      final String? avatar,
      final String? avatarCode,
      final DateTime? createdAt,
      final List<String>? avatarArr,
      final List<String>? friendArr}) = _$PlayerImpl;
  const _Player._() : super._();

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get name;
  @override
  String? get rName;
  @override
  num? get tag;
  @override
  bool? get isActive;
  @override
  String? get avatar;
  @override
  String? get avatarCode;
  @override
  DateTime? get createdAt;
  @override
  List<String>? get avatarArr;
  @override
  List<String>? get friendArr;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
