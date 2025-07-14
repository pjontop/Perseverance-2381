// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeamRecommendation _$TeamRecommendationFromJson(Map<String, dynamic> json) {
  return _TeamRecommendation.fromJson(json);
}

/// @nodoc
mixin _$TeamRecommendation {
  String get teamId => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  double get compatibilityScore => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get weaknesses => throw _privateConstructorUsedError;
  Map<String, dynamic>? get performanceData =>
      throw _privateConstructorUsedError;
  List<String>? get suggestedStrategies => throw _privateConstructorUsedError;
  bool get isAIGenerated => throw _privateConstructorUsedError;

  /// Serializes this TeamRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeamRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamRecommendationCopyWith<TeamRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamRecommendationCopyWith<$Res> {
  factory $TeamRecommendationCopyWith(
          TeamRecommendation value, $Res Function(TeamRecommendation) then) =
      _$TeamRecommendationCopyWithImpl<$Res, TeamRecommendation>;
  @useResult
  $Res call(
      {String teamId,
      String teamName,
      double compatibilityScore,
      String reasoning,
      List<String> strengths,
      List<String> weaknesses,
      Map<String, dynamic>? performanceData,
      List<String>? suggestedStrategies,
      bool isAIGenerated});
}

/// @nodoc
class _$TeamRecommendationCopyWithImpl<$Res, $Val extends TeamRecommendation>
    implements $TeamRecommendationCopyWith<$Res> {
  _$TeamRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeamRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? teamName = null,
    Object? compatibilityScore = null,
    Object? reasoning = null,
    Object? strengths = null,
    Object? weaknesses = null,
    Object? performanceData = freezed,
    Object? suggestedStrategies = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_value.copyWith(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      compatibilityScore: null == compatibilityScore
          ? _value.compatibilityScore
          : compatibilityScore // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      strengths: null == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value.weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      performanceData: freezed == performanceData
          ? _value.performanceData
          : performanceData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      suggestedStrategies: freezed == suggestedStrategies
          ? _value.suggestedStrategies
          : suggestedStrategies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamRecommendationImplCopyWith<$Res>
    implements $TeamRecommendationCopyWith<$Res> {
  factory _$$TeamRecommendationImplCopyWith(_$TeamRecommendationImpl value,
          $Res Function(_$TeamRecommendationImpl) then) =
      __$$TeamRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teamId,
      String teamName,
      double compatibilityScore,
      String reasoning,
      List<String> strengths,
      List<String> weaknesses,
      Map<String, dynamic>? performanceData,
      List<String>? suggestedStrategies,
      bool isAIGenerated});
}

/// @nodoc
class __$$TeamRecommendationImplCopyWithImpl<$Res>
    extends _$TeamRecommendationCopyWithImpl<$Res, _$TeamRecommendationImpl>
    implements _$$TeamRecommendationImplCopyWith<$Res> {
  __$$TeamRecommendationImplCopyWithImpl(_$TeamRecommendationImpl _value,
      $Res Function(_$TeamRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeamRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? teamName = null,
    Object? compatibilityScore = null,
    Object? reasoning = null,
    Object? strengths = null,
    Object? weaknesses = null,
    Object? performanceData = freezed,
    Object? suggestedStrategies = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_$TeamRecommendationImpl(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      compatibilityScore: null == compatibilityScore
          ? _value.compatibilityScore
          : compatibilityScore // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      strengths: null == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value._weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      performanceData: freezed == performanceData
          ? _value._performanceData
          : performanceData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      suggestedStrategies: freezed == suggestedStrategies
          ? _value._suggestedStrategies
          : suggestedStrategies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamRecommendationImpl implements _TeamRecommendation {
  const _$TeamRecommendationImpl(
      {required this.teamId,
      required this.teamName,
      required this.compatibilityScore,
      required this.reasoning,
      required final List<String> strengths,
      required final List<String> weaknesses,
      final Map<String, dynamic>? performanceData,
      final List<String>? suggestedStrategies,
      this.isAIGenerated = false})
      : _strengths = strengths,
        _weaknesses = weaknesses,
        _performanceData = performanceData,
        _suggestedStrategies = suggestedStrategies;

  factory _$TeamRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamRecommendationImplFromJson(json);

  @override
  final String teamId;
  @override
  final String teamName;
  @override
  final double compatibilityScore;
  @override
  final String reasoning;
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

  final Map<String, dynamic>? _performanceData;
  @override
  Map<String, dynamic>? get performanceData {
    final value = _performanceData;
    if (value == null) return null;
    if (_performanceData is EqualUnmodifiableMapView) return _performanceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _suggestedStrategies;
  @override
  List<String>? get suggestedStrategies {
    final value = _suggestedStrategies;
    if (value == null) return null;
    if (_suggestedStrategies is EqualUnmodifiableListView)
      return _suggestedStrategies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isAIGenerated;

  @override
  String toString() {
    return 'TeamRecommendation(teamId: $teamId, teamName: $teamName, compatibilityScore: $compatibilityScore, reasoning: $reasoning, strengths: $strengths, weaknesses: $weaknesses, performanceData: $performanceData, suggestedStrategies: $suggestedStrategies, isAIGenerated: $isAIGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamRecommendationImpl &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.compatibilityScore, compatibilityScore) ||
                other.compatibilityScore == compatibilityScore) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._weaknesses, _weaknesses) &&
            const DeepCollectionEquality()
                .equals(other._performanceData, _performanceData) &&
            const DeepCollectionEquality()
                .equals(other._suggestedStrategies, _suggestedStrategies) &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      teamId,
      teamName,
      compatibilityScore,
      reasoning,
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_weaknesses),
      const DeepCollectionEquality().hash(_performanceData),
      const DeepCollectionEquality().hash(_suggestedStrategies),
      isAIGenerated);

  /// Create a copy of TeamRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamRecommendationImplCopyWith<_$TeamRecommendationImpl> get copyWith =>
      __$$TeamRecommendationImplCopyWithImpl<_$TeamRecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamRecommendationImplToJson(
      this,
    );
  }
}

abstract class _TeamRecommendation implements TeamRecommendation {
  const factory _TeamRecommendation(
      {required final String teamId,
      required final String teamName,
      required final double compatibilityScore,
      required final String reasoning,
      required final List<String> strengths,
      required final List<String> weaknesses,
      final Map<String, dynamic>? performanceData,
      final List<String>? suggestedStrategies,
      final bool isAIGenerated}) = _$TeamRecommendationImpl;

  factory _TeamRecommendation.fromJson(Map<String, dynamic> json) =
      _$TeamRecommendationImpl.fromJson;

  @override
  String get teamId;
  @override
  String get teamName;
  @override
  double get compatibilityScore;
  @override
  String get reasoning;
  @override
  List<String> get strengths;
  @override
  List<String> get weaknesses;
  @override
  Map<String, dynamic>? get performanceData;
  @override
  List<String>? get suggestedStrategies;
  @override
  bool get isAIGenerated;

  /// Create a copy of TeamRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamRecommendationImplCopyWith<_$TeamRecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllianceStrategy _$AllianceStrategyFromJson(Map<String, dynamic> json) {
  return _AllianceStrategy.fromJson(json);
}

/// @nodoc
mixin _$AllianceStrategy {
  String get strategyId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get teamIds => throw _privateConstructorUsedError;
  Map<String, dynamic> get gamePlan => throw _privateConstructorUsedError;
  double get confidenceScore => throw _privateConstructorUsedError;
  List<String>? get risks => throw _privateConstructorUsedError;
  List<String>? get opportunities => throw _privateConstructorUsedError;
  bool get isAIGenerated => throw _privateConstructorUsedError;

  /// Serializes this AllianceStrategy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllianceStrategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllianceStrategyCopyWith<AllianceStrategy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllianceStrategyCopyWith<$Res> {
  factory $AllianceStrategyCopyWith(
          AllianceStrategy value, $Res Function(AllianceStrategy) then) =
      _$AllianceStrategyCopyWithImpl<$Res, AllianceStrategy>;
  @useResult
  $Res call(
      {String strategyId,
      String title,
      String description,
      List<String> teamIds,
      Map<String, dynamic> gamePlan,
      double confidenceScore,
      List<String>? risks,
      List<String>? opportunities,
      bool isAIGenerated});
}

/// @nodoc
class _$AllianceStrategyCopyWithImpl<$Res, $Val extends AllianceStrategy>
    implements $AllianceStrategyCopyWith<$Res> {
  _$AllianceStrategyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllianceStrategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? title = null,
    Object? description = null,
    Object? teamIds = null,
    Object? gamePlan = null,
    Object? confidenceScore = null,
    Object? risks = freezed,
    Object? opportunities = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_value.copyWith(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      teamIds: null == teamIds
          ? _value.teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gamePlan: null == gamePlan
          ? _value.gamePlan
          : gamePlan // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      risks: freezed == risks
          ? _value.risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opportunities: freezed == opportunities
          ? _value.opportunities
          : opportunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllianceStrategyImplCopyWith<$Res>
    implements $AllianceStrategyCopyWith<$Res> {
  factory _$$AllianceStrategyImplCopyWith(_$AllianceStrategyImpl value,
          $Res Function(_$AllianceStrategyImpl) then) =
      __$$AllianceStrategyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String strategyId,
      String title,
      String description,
      List<String> teamIds,
      Map<String, dynamic> gamePlan,
      double confidenceScore,
      List<String>? risks,
      List<String>? opportunities,
      bool isAIGenerated});
}

/// @nodoc
class __$$AllianceStrategyImplCopyWithImpl<$Res>
    extends _$AllianceStrategyCopyWithImpl<$Res, _$AllianceStrategyImpl>
    implements _$$AllianceStrategyImplCopyWith<$Res> {
  __$$AllianceStrategyImplCopyWithImpl(_$AllianceStrategyImpl _value,
      $Res Function(_$AllianceStrategyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllianceStrategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? title = null,
    Object? description = null,
    Object? teamIds = null,
    Object? gamePlan = null,
    Object? confidenceScore = null,
    Object? risks = freezed,
    Object? opportunities = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_$AllianceStrategyImpl(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      teamIds: null == teamIds
          ? _value._teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gamePlan: null == gamePlan
          ? _value._gamePlan
          : gamePlan // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      risks: freezed == risks
          ? _value._risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opportunities: freezed == opportunities
          ? _value._opportunities
          : opportunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllianceStrategyImpl implements _AllianceStrategy {
  const _$AllianceStrategyImpl(
      {required this.strategyId,
      required this.title,
      required this.description,
      required final List<String> teamIds,
      required final Map<String, dynamic> gamePlan,
      required this.confidenceScore,
      final List<String>? risks,
      final List<String>? opportunities,
      this.isAIGenerated = false})
      : _teamIds = teamIds,
        _gamePlan = gamePlan,
        _risks = risks,
        _opportunities = opportunities;

  factory _$AllianceStrategyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllianceStrategyImplFromJson(json);

  @override
  final String strategyId;
  @override
  final String title;
  @override
  final String description;
  final List<String> _teamIds;
  @override
  List<String> get teamIds {
    if (_teamIds is EqualUnmodifiableListView) return _teamIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamIds);
  }

  final Map<String, dynamic> _gamePlan;
  @override
  Map<String, dynamic> get gamePlan {
    if (_gamePlan is EqualUnmodifiableMapView) return _gamePlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gamePlan);
  }

  @override
  final double confidenceScore;
  final List<String>? _risks;
  @override
  List<String>? get risks {
    final value = _risks;
    if (value == null) return null;
    if (_risks is EqualUnmodifiableListView) return _risks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _opportunities;
  @override
  List<String>? get opportunities {
    final value = _opportunities;
    if (value == null) return null;
    if (_opportunities is EqualUnmodifiableListView) return _opportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isAIGenerated;

  @override
  String toString() {
    return 'AllianceStrategy(strategyId: $strategyId, title: $title, description: $description, teamIds: $teamIds, gamePlan: $gamePlan, confidenceScore: $confidenceScore, risks: $risks, opportunities: $opportunities, isAIGenerated: $isAIGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllianceStrategyImpl &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._teamIds, _teamIds) &&
            const DeepCollectionEquality().equals(other._gamePlan, _gamePlan) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            const DeepCollectionEquality().equals(other._risks, _risks) &&
            const DeepCollectionEquality()
                .equals(other._opportunities, _opportunities) &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      strategyId,
      title,
      description,
      const DeepCollectionEquality().hash(_teamIds),
      const DeepCollectionEquality().hash(_gamePlan),
      confidenceScore,
      const DeepCollectionEquality().hash(_risks),
      const DeepCollectionEquality().hash(_opportunities),
      isAIGenerated);

  /// Create a copy of AllianceStrategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllianceStrategyImplCopyWith<_$AllianceStrategyImpl> get copyWith =>
      __$$AllianceStrategyImplCopyWithImpl<_$AllianceStrategyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllianceStrategyImplToJson(
      this,
    );
  }
}

abstract class _AllianceStrategy implements AllianceStrategy {
  const factory _AllianceStrategy(
      {required final String strategyId,
      required final String title,
      required final String description,
      required final List<String> teamIds,
      required final Map<String, dynamic> gamePlan,
      required final double confidenceScore,
      final List<String>? risks,
      final List<String>? opportunities,
      final bool isAIGenerated}) = _$AllianceStrategyImpl;

  factory _AllianceStrategy.fromJson(Map<String, dynamic> json) =
      _$AllianceStrategyImpl.fromJson;

  @override
  String get strategyId;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get teamIds;
  @override
  Map<String, dynamic> get gamePlan;
  @override
  double get confidenceScore;
  @override
  List<String>? get risks;
  @override
  List<String>? get opportunities;
  @override
  bool get isAIGenerated;

  /// Create a copy of AllianceStrategy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllianceStrategyImplCopyWith<_$AllianceStrategyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
