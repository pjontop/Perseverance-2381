// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveMatchState _$LiveMatchStateFromJson(Map<String, dynamic> json) {
  return _LiveMatchState.fromJson(json);
}

/// @nodoc
mixin _$LiveMatchState {
  String? get currentMatch => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;
  Map<String, dynamic> get matchData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this LiveMatchState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveMatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveMatchStateCopyWith<LiveMatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMatchStateCopyWith<$Res> {
  factory $LiveMatchStateCopyWith(
          LiveMatchState value, $Res Function(LiveMatchState) then) =
      _$LiveMatchStateCopyWithImpl<$Res, LiveMatchState>;
  @useResult
  $Res call(
      {String? currentMatch,
      bool isLive,
      Map<String, dynamic> matchData,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$LiveMatchStateCopyWithImpl<$Res, $Val extends LiveMatchState>
    implements $LiveMatchStateCopyWith<$Res> {
  _$LiveMatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveMatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMatch = freezed,
    Object? isLive = null,
    Object? matchData = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      currentMatch: freezed == currentMatch
          ? _value.currentMatch
          : currentMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      matchData: null == matchData
          ? _value.matchData
          : matchData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveMatchStateImplCopyWith<$Res>
    implements $LiveMatchStateCopyWith<$Res> {
  factory _$$LiveMatchStateImplCopyWith(_$LiveMatchStateImpl value,
          $Res Function(_$LiveMatchStateImpl) then) =
      __$$LiveMatchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currentMatch,
      bool isLive,
      Map<String, dynamic> matchData,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$LiveMatchStateImplCopyWithImpl<$Res>
    extends _$LiveMatchStateCopyWithImpl<$Res, _$LiveMatchStateImpl>
    implements _$$LiveMatchStateImplCopyWith<$Res> {
  __$$LiveMatchStateImplCopyWithImpl(
      _$LiveMatchStateImpl _value, $Res Function(_$LiveMatchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveMatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMatch = freezed,
    Object? isLive = null,
    Object? matchData = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$LiveMatchStateImpl(
      currentMatch: freezed == currentMatch
          ? _value.currentMatch
          : currentMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      matchData: null == matchData
          ? _value._matchData
          : matchData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveMatchStateImpl implements _LiveMatchState {
  const _$LiveMatchStateImpl(
      {this.currentMatch,
      this.isLive = false,
      final Map<String, dynamic> matchData = const {},
      this.isLoading = false,
      this.error})
      : _matchData = matchData;

  factory _$LiveMatchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveMatchStateImplFromJson(json);

  @override
  final String? currentMatch;
  @override
  @JsonKey()
  final bool isLive;
  final Map<String, dynamic> _matchData;
  @override
  @JsonKey()
  Map<String, dynamic> get matchData {
    if (_matchData is EqualUnmodifiableMapView) return _matchData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_matchData);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'LiveMatchState(currentMatch: $currentMatch, isLive: $isLive, matchData: $matchData, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMatchStateImpl &&
            (identical(other.currentMatch, currentMatch) ||
                other.currentMatch == currentMatch) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            const DeepCollectionEquality()
                .equals(other._matchData, _matchData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentMatch, isLive,
      const DeepCollectionEquality().hash(_matchData), isLoading, error);

  /// Create a copy of LiveMatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMatchStateImplCopyWith<_$LiveMatchStateImpl> get copyWith =>
      __$$LiveMatchStateImplCopyWithImpl<_$LiveMatchStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveMatchStateImplToJson(
      this,
    );
  }
}

abstract class _LiveMatchState implements LiveMatchState {
  const factory _LiveMatchState(
      {final String? currentMatch,
      final bool isLive,
      final Map<String, dynamic> matchData,
      final bool isLoading,
      final String? error}) = _$LiveMatchStateImpl;

  factory _LiveMatchState.fromJson(Map<String, dynamic> json) =
      _$LiveMatchStateImpl.fromJson;

  @override
  String? get currentMatch;
  @override
  bool get isLive;
  @override
  Map<String, dynamic> get matchData;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of LiveMatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveMatchStateImplCopyWith<_$LiveMatchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
