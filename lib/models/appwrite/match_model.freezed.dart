// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  String get matchNumber => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  AllianceColor get allianceColor => throw _privateConstructorUsedError;
  List<String> get teamIds => throw _privateConstructorUsedError;
  Map<String, int> get scores => throw _privateConstructorUsedError;
  Map<String, dynamic> get autonomousData => throw _privateConstructorUsedError;
  Map<String, dynamic> get driverControlledData =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get endgameData => throw _privateConstructorUsedError;
  MatchPhase get currentPhase => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get scoutId => throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Match to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String id,
      String matchNumber,
      String eventId,
      AllianceColor allianceColor,
      List<String> teamIds,
      Map<String, int> scores,
      Map<String, dynamic> autonomousData,
      Map<String, dynamic> driverControlledData,
      Map<String, dynamic> endgameData,
      MatchPhase currentPhase,
      DateTime startTime,
      DateTime? endTime,
      String? notes,
      String? scoutId,
      bool? isLive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchNumber = null,
    Object? eventId = null,
    Object? allianceColor = null,
    Object? teamIds = null,
    Object? scores = null,
    Object? autonomousData = null,
    Object? driverControlledData = null,
    Object? endgameData = null,
    Object? currentPhase = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? notes = freezed,
    Object? scoutId = freezed,
    Object? isLive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchNumber: null == matchNumber
          ? _value.matchNumber
          : matchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      allianceColor: null == allianceColor
          ? _value.allianceColor
          : allianceColor // ignore: cast_nullable_to_non_nullable
              as AllianceColor,
      teamIds: null == teamIds
          ? _value.teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      autonomousData: null == autonomousData
          ? _value.autonomousData
          : autonomousData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      driverControlledData: null == driverControlledData
          ? _value.driverControlledData
          : driverControlledData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      endgameData: null == endgameData
          ? _value.endgameData
          : endgameData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      currentPhase: null == currentPhase
          ? _value.currentPhase
          : currentPhase // ignore: cast_nullable_to_non_nullable
              as MatchPhase,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      scoutId: freezed == scoutId
          ? _value.scoutId
          : scoutId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchImplCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$MatchImplCopyWith(
          _$MatchImpl value, $Res Function(_$MatchImpl) then) =
      __$$MatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String matchNumber,
      String eventId,
      AllianceColor allianceColor,
      List<String> teamIds,
      Map<String, int> scores,
      Map<String, dynamic> autonomousData,
      Map<String, dynamic> driverControlledData,
      Map<String, dynamic> endgameData,
      MatchPhase currentPhase,
      DateTime startTime,
      DateTime? endTime,
      String? notes,
      String? scoutId,
      bool? isLive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$MatchImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchImpl>
    implements _$$MatchImplCopyWith<$Res> {
  __$$MatchImplCopyWithImpl(
      _$MatchImpl _value, $Res Function(_$MatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchNumber = null,
    Object? eventId = null,
    Object? allianceColor = null,
    Object? teamIds = null,
    Object? scores = null,
    Object? autonomousData = null,
    Object? driverControlledData = null,
    Object? endgameData = null,
    Object? currentPhase = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? notes = freezed,
    Object? scoutId = freezed,
    Object? isLive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchNumber: null == matchNumber
          ? _value.matchNumber
          : matchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      allianceColor: null == allianceColor
          ? _value.allianceColor
          : allianceColor // ignore: cast_nullable_to_non_nullable
              as AllianceColor,
      teamIds: null == teamIds
          ? _value._teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scores: null == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      autonomousData: null == autonomousData
          ? _value._autonomousData
          : autonomousData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      driverControlledData: null == driverControlledData
          ? _value._driverControlledData
          : driverControlledData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      endgameData: null == endgameData
          ? _value._endgameData
          : endgameData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      currentPhase: null == currentPhase
          ? _value.currentPhase
          : currentPhase // ignore: cast_nullable_to_non_nullable
              as MatchPhase,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      scoutId: freezed == scoutId
          ? _value.scoutId
          : scoutId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImpl implements _Match {
  const _$MatchImpl(
      {required this.id,
      required this.matchNumber,
      required this.eventId,
      required this.allianceColor,
      required final List<String> teamIds,
      required final Map<String, int> scores,
      required final Map<String, dynamic> autonomousData,
      required final Map<String, dynamic> driverControlledData,
      required final Map<String, dynamic> endgameData,
      required this.currentPhase,
      required this.startTime,
      this.endTime,
      this.notes,
      this.scoutId,
      this.isLive,
      this.createdAt,
      this.updatedAt})
      : _teamIds = teamIds,
        _scores = scores,
        _autonomousData = autonomousData,
        _driverControlledData = driverControlledData,
        _endgameData = endgameData;

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

  @override
  final String id;
  @override
  final String matchNumber;
  @override
  final String eventId;
  @override
  final AllianceColor allianceColor;
  final List<String> _teamIds;
  @override
  List<String> get teamIds {
    if (_teamIds is EqualUnmodifiableListView) return _teamIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamIds);
  }

  final Map<String, int> _scores;
  @override
  Map<String, int> get scores {
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_scores);
  }

  final Map<String, dynamic> _autonomousData;
  @override
  Map<String, dynamic> get autonomousData {
    if (_autonomousData is EqualUnmodifiableMapView) return _autonomousData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_autonomousData);
  }

  final Map<String, dynamic> _driverControlledData;
  @override
  Map<String, dynamic> get driverControlledData {
    if (_driverControlledData is EqualUnmodifiableMapView)
      return _driverControlledData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_driverControlledData);
  }

  final Map<String, dynamic> _endgameData;
  @override
  Map<String, dynamic> get endgameData {
    if (_endgameData is EqualUnmodifiableMapView) return _endgameData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_endgameData);
  }

  @override
  final MatchPhase currentPhase;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final String? notes;
  @override
  final String? scoutId;
  @override
  final bool? isLive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Match(id: $id, matchNumber: $matchNumber, eventId: $eventId, allianceColor: $allianceColor, teamIds: $teamIds, scores: $scores, autonomousData: $autonomousData, driverControlledData: $driverControlledData, endgameData: $endgameData, currentPhase: $currentPhase, startTime: $startTime, endTime: $endTime, notes: $notes, scoutId: $scoutId, isLive: $isLive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchNumber, matchNumber) ||
                other.matchNumber == matchNumber) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.allianceColor, allianceColor) ||
                other.allianceColor == allianceColor) &&
            const DeepCollectionEquality().equals(other._teamIds, _teamIds) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality()
                .equals(other._autonomousData, _autonomousData) &&
            const DeepCollectionEquality()
                .equals(other._driverControlledData, _driverControlledData) &&
            const DeepCollectionEquality()
                .equals(other._endgameData, _endgameData) &&
            (identical(other.currentPhase, currentPhase) ||
                other.currentPhase == currentPhase) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.scoutId, scoutId) || other.scoutId == scoutId) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      matchNumber,
      eventId,
      allianceColor,
      const DeepCollectionEquality().hash(_teamIds),
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_autonomousData),
      const DeepCollectionEquality().hash(_driverControlledData),
      const DeepCollectionEquality().hash(_endgameData),
      currentPhase,
      startTime,
      endTime,
      notes,
      scoutId,
      isLive,
      createdAt,
      updatedAt);

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      __$$MatchImplCopyWithImpl<_$MatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImplToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String id,
      required final String matchNumber,
      required final String eventId,
      required final AllianceColor allianceColor,
      required final List<String> teamIds,
      required final Map<String, int> scores,
      required final Map<String, dynamic> autonomousData,
      required final Map<String, dynamic> driverControlledData,
      required final Map<String, dynamic> endgameData,
      required final MatchPhase currentPhase,
      required final DateTime startTime,
      final DateTime? endTime,
      final String? notes,
      final String? scoutId,
      final bool? isLive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  String get id;
  @override
  String get matchNumber;
  @override
  String get eventId;
  @override
  AllianceColor get allianceColor;
  @override
  List<String> get teamIds;
  @override
  Map<String, int> get scores;
  @override
  Map<String, dynamic> get autonomousData;
  @override
  Map<String, dynamic> get driverControlledData;
  @override
  Map<String, dynamic> get endgameData;
  @override
  MatchPhase get currentPhase;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  String? get notes;
  @override
  String? get scoutId;
  @override
  bool? get isLive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Match
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
