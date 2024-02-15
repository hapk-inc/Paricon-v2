// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

/// @nodoc
mixin _$MyUser {
  String get name => throw _privateConstructorUsedError;
  String get rName => throw _privateConstructorUsedError;
  num get id => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get avatarCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<String> get avatarArr => throw _privateConstructorUsedError;
  List<String> get friendArr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyUserCopyWith<MyUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res, MyUser>;
  @useResult
  $Res call(
      {String name,
      String rName,
      num id,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String> avatarArr,
      List<String> friendArr});
}

/// @nodoc
class _$MyUserCopyWithImpl<$Res, $Val extends MyUser>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = null,
    Object? id = null,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = null,
    Object? friendArr = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: null == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
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
      avatarArr: null == avatarArr
          ? _value.avatarArr
          : avatarArr // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendArr: null == friendArr
          ? _value.friendArr
          : friendArr // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUserImplCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$$MyUserImplCopyWith(
          _$MyUserImpl value, $Res Function(_$MyUserImpl) then) =
      __$$MyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String rName,
      num id,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String> avatarArr,
      List<String> friendArr});
}

/// @nodoc
class __$$MyUserImplCopyWithImpl<$Res>
    extends _$MyUserCopyWithImpl<$Res, _$MyUserImpl>
    implements _$$MyUserImplCopyWith<$Res> {
  __$$MyUserImplCopyWithImpl(
      _$MyUserImpl _value, $Res Function(_$MyUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = null,
    Object? id = null,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = null,
    Object? friendArr = null,
  }) {
    return _then(_$MyUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: null == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
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
      avatarArr: null == avatarArr
          ? _value._avatarArr
          : avatarArr // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendArr: null == friendArr
          ? _value._friendArr
          : friendArr // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyUserImpl implements _MyUser {
  const _$MyUserImpl(
      {required this.name,
      this.rName = "",
      required this.id,
      this.avatar,
      this.avatarCode,
      this.createdAt,
      final List<String> avatarArr = const [],
      final List<String> friendArr = const []})
      : _avatarArr = avatarArr,
        _friendArr = friendArr;

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String rName;
  @override
  final num id;
  @override
  final String? avatar;
  @override
  final String? avatarCode;
  @override
  final DateTime? createdAt;
  final List<String> _avatarArr;
  @override
  @JsonKey()
  List<String> get avatarArr {
    if (_avatarArr is EqualUnmodifiableListView) return _avatarArr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avatarArr);
  }

  final List<String> _friendArr;
  @override
  @JsonKey()
  List<String> get friendArr {
    if (_friendArr is EqualUnmodifiableListView) return _friendArr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendArr);
  }

  @override
  String toString() {
    return 'MyUser(name: $name, rName: $rName, id: $id, avatar: $avatar, avatarCode: $avatarCode, createdAt: $createdAt, avatarArr: $avatarArr, friendArr: $friendArr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rName, rName) || other.rName == rName) &&
            (identical(other.id, id) || other.id == id) &&
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
      id,
      avatar,
      avatarCode,
      createdAt,
      const DeepCollectionEquality().hash(_avatarArr),
      const DeepCollectionEquality().hash(_friendArr));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      __$$MyUserImplCopyWithImpl<_$MyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserImplToJson(
      this,
    );
  }
}

abstract class _MyUser implements MyUser {
  const factory _MyUser(
      {required final String name,
      final String rName,
      required final num id,
      final String? avatar,
      final String? avatarCode,
      final DateTime? createdAt,
      final List<String> avatarArr,
      final List<String> friendArr}) = _$MyUserImpl;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  String get name;
  @override
  String get rName;
  @override
  num get id;
  @override
  String? get avatar;
  @override
  String? get avatarCode;
  @override
  DateTime? get createdAt;
  @override
  List<String> get avatarArr;
  @override
  List<String> get friendArr;
  @override
  @JsonKey(ignore: true)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
