// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  Map<String, LocalPlayer> get players => throw _privateConstructorUsedError;
  Map<String, LocalIcon> get icons => throw _privateConstructorUsedError;
  String get currentID => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get currentIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call(
      {Map<String, LocalPlayer> players,
      Map<String, LocalIcon> icons,
      String currentID,
      String type,
      String? currentIcon});
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? icons = null,
    Object? currentID = null,
    Object? type = null,
    Object? currentIcon = freezed,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalPlayer>,
      icons: null == icons
          ? _value.icons
          : icons // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalIcon>,
      currentID: null == currentID
          ? _value.currentID
          : currentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currentIcon: freezed == currentIcon
          ? _value.currentIcon
          : currentIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardImplCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$BoardImplCopyWith(
          _$BoardImpl value, $Res Function(_$BoardImpl) then) =
      __$$BoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, LocalPlayer> players,
      Map<String, LocalIcon> icons,
      String currentID,
      String type,
      String? currentIcon});
}

/// @nodoc
class __$$BoardImplCopyWithImpl<$Res>
    extends _$BoardCopyWithImpl<$Res, _$BoardImpl>
    implements _$$BoardImplCopyWith<$Res> {
  __$$BoardImplCopyWithImpl(
      _$BoardImpl _value, $Res Function(_$BoardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? icons = null,
    Object? currentID = null,
    Object? type = null,
    Object? currentIcon = freezed,
  }) {
    return _then(_$BoardImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalPlayer>,
      icons: null == icons
          ? _value._icons
          : icons // ignore: cast_nullable_to_non_nullable
              as Map<String, LocalIcon>,
      currentID: null == currentID
          ? _value.currentID
          : currentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currentIcon: freezed == currentIcon
          ? _value.currentIcon
          : currentIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardImpl implements _Board {
  const _$BoardImpl(
      {final Map<String, LocalPlayer> players = const {},
      final Map<String, LocalIcon> icons = const {},
      required this.currentID,
      required this.type,
      this.currentIcon})
      : _players = players,
        _icons = icons;

  factory _$BoardImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardImplFromJson(json);

  final Map<String, LocalPlayer> _players;
  @override
  @JsonKey()
  Map<String, LocalPlayer> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  final Map<String, LocalIcon> _icons;
  @override
  @JsonKey()
  Map<String, LocalIcon> get icons {
    if (_icons is EqualUnmodifiableMapView) return _icons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_icons);
  }

  @override
  final String currentID;
  @override
  final String type;
  @override
  final String? currentIcon;

  @override
  String toString() {
    return 'Board(players: $players, icons: $icons, currentID: $currentID, type: $type, currentIcon: $currentIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardImpl &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._icons, _icons) &&
            (identical(other.currentID, currentID) ||
                other.currentID == currentID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentIcon, currentIcon) ||
                other.currentIcon == currentIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_icons),
      currentID,
      type,
      currentIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      __$$BoardImplCopyWithImpl<_$BoardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardImplToJson(
      this,
    );
  }
}

abstract class _Board implements Board {
  const factory _Board(
      {final Map<String, LocalPlayer> players,
      final Map<String, LocalIcon> icons,
      required final String currentID,
      required final String type,
      final String? currentIcon}) = _$BoardImpl;

  factory _Board.fromJson(Map<String, dynamic> json) = _$BoardImpl.fromJson;

  @override
  Map<String, LocalPlayer> get players;
  @override
  Map<String, LocalIcon> get icons;
  @override
  String get currentID;
  @override
  String get type;
  @override
  String? get currentIcon;
  @override
  @JsonKey(ignore: true)
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
