// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scout_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoutReport _$ScoutReportFromJson(Map<String, dynamic> json) {
  return _ScoutReport.fromJson(json);
}

/// @nodoc
mixin _$ScoutReport {
  String get id => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  ScoutReportType get type => throw _privateConstructorUsedError;
  String get scoutId => throw _privateConstructorUsedError;
  Map<String, dynamic> get autonomousData => throw _privateConstructorUsedError;
  Map<String, dynamic> get driverControlledData =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get endgameData => throw _privateConstructorUsedError;
  Map<String, int> get scores => throw _privateConstructorUsedError;
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get weaknesses => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<String>? get photoUrls => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ScoutReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoutReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoutReportCopyWith<ScoutReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoutReportCopyWith<$Res> {
  factory $ScoutReportCopyWith(
          ScoutReport value, $Res Function(ScoutReport) then) =
      _$ScoutReportCopyWithImpl<$Res, ScoutReport>;
  @useResult
  $Res call(
      {String id,
      String teamId,
      String matchId,
      ScoutReportType type,
      String scoutId,
      Map<String, dynamic> autonomousData,
      Map<String, dynamic> driverControlledData,
      Map<String, dynamic> endgameData,
      Map<String, int> scores,
      List<String> strengths,
      List<String> weaknesses,
      String notes,
      List<String>? photoUrls,
      Map<String, dynamic>? additionalData,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ScoutReportCopyWithImpl<$Res, $Val extends ScoutReport>
    implements $ScoutReportCopyWith<$Res> {
  _$ScoutReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoutReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? matchId = null,
    Object? type = null,
    Object? scoutId = null,
    Object? autonomousData = null,
    Object? driverControlledData = null,
    Object? endgameData = null,
    Object? scores = null,
    Object? strengths = null,
    Object? weaknesses = null,
    Object? notes = null,
    Object? photoUrls = freezed,
    Object? additionalData = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScoutReportType,
      scoutId: null == scoutId
          ? _value.scoutId
          : scoutId // ignore: cast_nullable_to_non_nullable
              as String,
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
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      strengths: null == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value.weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrls: freezed == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
abstract class _$$ScoutReportImplCopyWith<$Res>
    implements $ScoutReportCopyWith<$Res> {
  factory _$$ScoutReportImplCopyWith(
          _$ScoutReportImpl value, $Res Function(_$ScoutReportImpl) then) =
      __$$ScoutReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String teamId,
      String matchId,
      ScoutReportType type,
      String scoutId,
      Map<String, dynamic> autonomousData,
      Map<String, dynamic> driverControlledData,
      Map<String, dynamic> endgameData,
      Map<String, int> scores,
      List<String> strengths,
      List<String> weaknesses,
      String notes,
      List<String>? photoUrls,
      Map<String, dynamic>? additionalData,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ScoutReportImplCopyWithImpl<$Res>
    extends _$ScoutReportCopyWithImpl<$Res, _$ScoutReportImpl>
    implements _$$ScoutReportImplCopyWith<$Res> {
  __$$ScoutReportImplCopyWithImpl(
      _$ScoutReportImpl _value, $Res Function(_$ScoutReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoutReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? matchId = null,
    Object? type = null,
    Object? scoutId = null,
    Object? autonomousData = null,
    Object? driverControlledData = null,
    Object? endgameData = null,
    Object? scores = null,
    Object? strengths = null,
    Object? weaknesses = null,
    Object? notes = null,
    Object? photoUrls = freezed,
    Object? additionalData = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ScoutReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScoutReportType,
      scoutId: null == scoutId
          ? _value.scoutId
          : scoutId // ignore: cast_nullable_to_non_nullable
              as String,
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
      scores: null == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      strengths: null == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value._weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrls: freezed == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$ScoutReportImpl implements _ScoutReport {
  const _$ScoutReportImpl(
      {required this.id,
      required this.teamId,
      required this.matchId,
      required this.type,
      required this.scoutId,
      required final Map<String, dynamic> autonomousData,
      required final Map<String, dynamic> driverControlledData,
      required final Map<String, dynamic> endgameData,
      required final Map<String, int> scores,
      required final List<String> strengths,
      required final List<String> weaknesses,
      required this.notes,
      final List<String>? photoUrls,
      final Map<String, dynamic>? additionalData,
      this.createdAt,
      this.updatedAt})
      : _autonomousData = autonomousData,
        _driverControlledData = driverControlledData,
        _endgameData = endgameData,
        _scores = scores,
        _strengths = strengths,
        _weaknesses = weaknesses,
        _photoUrls = photoUrls,
        _additionalData = additionalData;

  factory _$ScoutReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoutReportImplFromJson(json);

  @override
  final String id;
  @override
  final String teamId;
  @override
  final String matchId;
  @override
  final ScoutReportType type;
  @override
  final String scoutId;
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

  final Map<String, int> _scores;
  @override
  Map<String, int> get scores {
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_scores);
  }

  final List<String> _strengths;
  @override
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _weaknesses;
  @override
  List<String> get weaknesses {
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weaknesses);
  }

  @override
  final String notes;
  final List<String>? _photoUrls;
  @override
  List<String>? get photoUrls {
    final value = _photoUrls;
    if (value == null) return null;
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ScoutReport(id: $id, teamId: $teamId, matchId: $matchId, type: $type, scoutId: $scoutId, autonomousData: $autonomousData, driverControlledData: $driverControlledData, endgameData: $endgameData, scores: $scores, strengths: $strengths, weaknesses: $weaknesses, notes: $notes, photoUrls: $photoUrls, additionalData: $additionalData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoutReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scoutId, scoutId) || other.scoutId == scoutId) &&
            const DeepCollectionEquality()
                .equals(other._autonomousData, _autonomousData) &&
            const DeepCollectionEquality()
                .equals(other._driverControlledData, _driverControlledData) &&
            const DeepCollectionEquality()
                .equals(other._endgameData, _endgameData) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._weaknesses, _weaknesses) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData) &&
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
      teamId,
      matchId,
      type,
      scoutId,
      const DeepCollectionEquality().hash(_autonomousData),
      const DeepCollectionEquality().hash(_driverControlledData),
      const DeepCollectionEquality().hash(_endgameData),
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_weaknesses),
      notes,
      const DeepCollectionEquality().hash(_photoUrls),
      const DeepCollectionEquality().hash(_additionalData),
      createdAt,
      updatedAt);

  /// Create a copy of ScoutReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoutReportImplCopyWith<_$ScoutReportImpl> get copyWith =>
      __$$ScoutReportImplCopyWithImpl<_$ScoutReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoutReportImplToJson(
      this,
    );
  }
}

abstract class _ScoutReport implements ScoutReport {
  const factory _ScoutReport(
      {required final String id,
      required final String teamId,
      required final String matchId,
      required final ScoutReportType type,
      required final String scoutId,
      required final Map<String, dynamic> autonomousData,
      required final Map<String, dynamic> driverControlledData,
      required final Map<String, dynamic> endgameData,
      required final Map<String, int> scores,
      required final List<String> strengths,
      required final List<String> weaknesses,
      required final String notes,
      final List<String>? photoUrls,
      final Map<String, dynamic>? additionalData,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ScoutReportImpl;

  factory _ScoutReport.fromJson(Map<String, dynamic> json) =
      _$ScoutReportImpl.fromJson;

  @override
  String get id;
  @override
  String get teamId;
  @override
  String get matchId;
  @override
  ScoutReportType get type;
  @override
  String get scoutId;
  @override
  Map<String, dynamic> get autonomousData;
  @override
  Map<String, dynamic> get driverControlledData;
  @override
  Map<String, dynamic> get endgameData;
  @override
  Map<String, int> get scores;
  @override
  List<String> get strengths;
  @override
  List<String> get weaknesses;
  @override
  String get notes;
  @override
  List<String>? get photoUrls;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ScoutReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoutReportImplCopyWith<_$ScoutReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
