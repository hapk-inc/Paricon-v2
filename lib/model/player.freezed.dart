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
  num? get no => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get avatarCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<String>? get avatarArr => throw _privateConstructorUsedError;
  List<String>? get friendArr => throw _privateConstructorUsedError; //
  DateTime? get lastOpened => throw _privateConstructorUsedError;
  DateTime? get lastGamePlayed => throw _privateConstructorUsedError;
  dynamic get isPlaying => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  DateTime? get nowTime => throw _privateConstructorUsedError;
  bool get isEmulator => throw _privateConstructorUsedError;
  @JsonKey(toJson: null, includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;

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
      num? no,
      bool? isActive,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String>? avatarArr,
      List<String>? friendArr,
      DateTime? lastOpened,
      DateTime? lastGamePlayed,
      dynamic isPlaying,
      String? appVersion,
      DateTime? nowTime,
      bool isEmulator,
      @JsonKey(toJson: null, includeIfNull: false) String? id});
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
    Object? no = freezed,
    Object? isActive = freezed,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = freezed,
    Object? friendArr = freezed,
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isPlaying = freezed,
    Object? appVersion = freezed,
    Object? nowTime = freezed,
    Object? isEmulator = null,
    Object? id = freezed,
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
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
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
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGamePlayed: freezed == lastGamePlayed
          ? _value.lastGamePlayed
          : lastGamePlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nowTime: freezed == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      num? no,
      bool? isActive,
      String? avatar,
      String? avatarCode,
      DateTime? createdAt,
      List<String>? avatarArr,
      List<String>? friendArr,
      DateTime? lastOpened,
      DateTime? lastGamePlayed,
      dynamic isPlaying,
      String? appVersion,
      DateTime? nowTime,
      bool isEmulator,
      @JsonKey(toJson: null, includeIfNull: false) String? id});
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
    Object? no = freezed,
    Object? isActive = freezed,
    Object? avatar = freezed,
    Object? avatarCode = freezed,
    Object? createdAt = freezed,
    Object? avatarArr = freezed,
    Object? friendArr = freezed,
    Object? lastOpened = freezed,
    Object? lastGamePlayed = freezed,
    Object? isPlaying = freezed,
    Object? appVersion = freezed,
    Object? nowTime = freezed,
    Object? isEmulator = null,
    Object? id = freezed,
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
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
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
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGamePlayed: freezed == lastGamePlayed
          ? _value.lastGamePlayed
          : lastGamePlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPlaying: freezed == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nowTime: freezed == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$PlayerImpl extends _Player {
  const _$PlayerImpl(
      {this.name = "User#",
      this.rName,
      this.no,
      this.isActive,
      this.avatar,
      this.avatarCode,
      this.createdAt,
      final List<String>? avatarArr,
      final List<String>? friendArr,
      this.lastOpened,
      this.lastGamePlayed,
      this.isPlaying,
      this.appVersion,
      this.nowTime,
      this.isEmulator = false,
      @JsonKey(toJson: null, includeIfNull: false) this.id})
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
  final num? no;
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

//
  @override
  final DateTime? lastOpened;
  @override
  final DateTime? lastGamePlayed;
  @override
  final dynamic isPlaying;
  @override
  final String? appVersion;
  @override
  final DateTime? nowTime;
  @override
  @JsonKey()
  final bool isEmulator;
  @override
  @JsonKey(toJson: null, includeIfNull: false)
  final String? id;

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
          final num? no,
          final bool? isActive,
          final String? avatar,
          final String? avatarCode,
          final DateTime? createdAt,
          final List<String>? avatarArr,
          final List<String>? friendArr,
          final DateTime? lastOpened,
          final DateTime? lastGamePlayed,
          final dynamic isPlaying,
          final String? appVersion,
          final DateTime? nowTime,
          final bool isEmulator,
          @JsonKey(toJson: null, includeIfNull: false) final String? id}) =
      _$PlayerImpl;
  const _Player._() : super._();

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get name;
  @override
  String? get rName;
  @override
  num? get no;
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
  @override //
  DateTime? get lastOpened;
  @override
  DateTime? get lastGamePlayed;
  @override
  dynamic get isPlaying;
  @override
  String? get appVersion;
  @override
  DateTime? get nowTime;
  @override
  bool get isEmulator;
  @override
  @JsonKey(toJson: null, includeIfNull: false)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
