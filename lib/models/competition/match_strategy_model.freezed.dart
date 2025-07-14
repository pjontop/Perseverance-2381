// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_strategy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchStrategy _$MatchStrategyFromJson(Map<String, dynamic> json) {
  return _MatchStrategy.fromJson(json);
}

/// @nodoc
mixin _$MatchStrategy {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  StrategyType get type => throw _privateConstructorUsedError;
  PhaseFocus get primaryFocus => throw _privateConstructorUsedError;
  Map<String, dynamic> get gamePlan => throw _privateConstructorUsedError;
  double get confidenceScore => throw _privateConstructorUsedError;
  List<String> get keyActions => throw _privateConstructorUsedError;
  List<String>? get risks => throw _privateConstructorUsedError;
  List<String>? get opportunities => throw _privateConstructorUsedError;
  Map<String, dynamic>? get opponentAnalysis =>
      throw _privateConstructorUsedError;
  bool get isAIGenerated => throw _privateConstructorUsedError;

  /// Serializes this MatchStrategy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchStrategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchStrategyCopyWith<MatchStrategy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchStrategyCopyWith<$Res> {
  factory $MatchStrategyCopyWith(
          MatchStrategy value, $Res Function(MatchStrategy) then) =
      _$MatchStrategyCopyWithImpl<$Res, MatchStrategy>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      StrategyType type,
      PhaseFocus primaryFocus,
      Map<String, dynamic> gamePlan,
      double confidenceScore,
      List<String> keyActions,
      List<String>? risks,
      List<String>? opportunities,
      Map<String, dynamic>? opponentAnalysis,
      bool isAIGenerated});
}

/// @nodoc
class _$MatchStrategyCopyWithImpl<$Res, $Val extends MatchStrategy>
    implements $MatchStrategyCopyWith<$Res> {
  _$MatchStrategyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchStrategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? primaryFocus = null,
    Object? gamePlan = null,
    Object? confidenceScore = null,
    Object? keyActions = null,
    Object? risks = freezed,
    Object? opportunities = freezed,
    Object? opponentAnalysis = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StrategyType,
      primaryFocus: null == primaryFocus
          ? _value.primaryFocus
          : primaryFocus // ignore: cast_nullable_to_non_nullable
              as PhaseFocus,
      gamePlan: null == gamePlan
          ? _value.gamePlan
          : gamePlan // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      keyActions: null == keyActions
          ? _value.keyActions
          : keyActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      risks: freezed == risks
          ? _value.risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opportunities: freezed == opportunities
          ? _value.opportunities
          : opportunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opponentAnalysis: freezed == opponentAnalysis
          ? _value.opponentAnalysis
          : opponentAnalysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchStrategyImplCopyWith<$Res>
    implements $MatchStrategyCopyWith<$Res> {
  factory _$$MatchStrategyImplCopyWith(
          _$MatchStrategyImpl value, $Res Function(_$MatchStrategyImpl) then) =
      __$$MatchStrategyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      StrategyType type,
      PhaseFocus primaryFocus,
      Map<String, dynamic> gamePlan,
      double confidenceScore,
      List<String> keyActions,
      List<String>? risks,
      List<String>? opportunities,
      Map<String, dynamic>? opponentAnalysis,
      bool isAIGenerated});
}

/// @nodoc
class __$$MatchStrategyImplCopyWithImpl<$Res>
    extends _$MatchStrategyCopyWithImpl<$Res, _$MatchStrategyImpl>
    implements _$$MatchStrategyImplCopyWith<$Res> {
  __$$MatchStrategyImplCopyWithImpl(
      _$MatchStrategyImpl _value, $Res Function(_$MatchStrategyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchStrategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? primaryFocus = null,
    Object? gamePlan = null,
    Object? confidenceScore = null,
    Object? keyActions = null,
    Object? risks = freezed,
    Object? opportunities = freezed,
    Object? opponentAnalysis = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_$MatchStrategyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StrategyType,
      primaryFocus: null == primaryFocus
          ? _value.primaryFocus
          : primaryFocus // ignore: cast_nullable_to_non_nullable
              as PhaseFocus,
      gamePlan: null == gamePlan
          ? _value._gamePlan
          : gamePlan // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      keyActions: null == keyActions
          ? _value._keyActions
          : keyActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      risks: freezed == risks
          ? _value._risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opportunities: freezed == opportunities
          ? _value._opportunities
          : opportunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      opponentAnalysis: freezed == opponentAnalysis
          ? _value._opponentAnalysis
          : opponentAnalysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchStrategyImpl implements _MatchStrategy {
  const _$MatchStrategyImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.primaryFocus,
      required final Map<String, dynamic> gamePlan,
      required this.confidenceScore,
      required final List<String> keyActions,
      final List<String>? risks,
      final List<String>? opportunities,
      final Map<String, dynamic>? opponentAnalysis,
      this.isAIGenerated = false})
      : _gamePlan = gamePlan,
        _keyActions = keyActions,
        _risks = risks,
        _opportunities = opportunities,
        _opponentAnalysis = opponentAnalysis;

  factory _$MatchStrategyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchStrategyImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final StrategyType type;
  @override
  final PhaseFocus primaryFocus;
  final Map<String, dynamic> _gamePlan;
  @override
  Map<String, dynamic> get gamePlan {
    if (_gamePlan is EqualUnmodifiableMapView) return _gamePlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gamePlan);
  }

  @override
  final double confidenceScore;
  final List<String> _keyActions;
  @override
  List<String> get keyActions {
    if (_keyActions is EqualUnmodifiableListView) return _keyActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyActions);
  }

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

  final Map<String, dynamic>? _opponentAnalysis;
  @override
  Map<String, dynamic>? get opponentAnalysis {
    final value = _opponentAnalysis;
    if (value == null) return null;
    if (_opponentAnalysis is EqualUnmodifiableMapView) return _opponentAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isAIGenerated;

  @override
  String toString() {
    return 'MatchStrategy(id: $id, title: $title, description: $description, type: $type, primaryFocus: $primaryFocus, gamePlan: $gamePlan, confidenceScore: $confidenceScore, keyActions: $keyActions, risks: $risks, opportunities: $opportunities, opponentAnalysis: $opponentAnalysis, isAIGenerated: $isAIGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchStrategyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.primaryFocus, primaryFocus) ||
                other.primaryFocus == primaryFocus) &&
            const DeepCollectionEquality().equals(other._gamePlan, _gamePlan) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            const DeepCollectionEquality()
                .equals(other._keyActions, _keyActions) &&
            const DeepCollectionEquality().equals(other._risks, _risks) &&
            const DeepCollectionEquality()
                .equals(other._opportunities, _opportunities) &&
            const DeepCollectionEquality()
                .equals(other._opponentAnalysis, _opponentAnalysis) &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      primaryFocus,
      const DeepCollectionEquality().hash(_gamePlan),
      confidenceScore,
      const DeepCollectionEquality().hash(_keyActions),
      const DeepCollectionEquality().hash(_risks),
      const DeepCollectionEquality().hash(_opportunities),
      const DeepCollectionEquality().hash(_opponentAnalysis),
      isAIGenerated);

  /// Create a copy of MatchStrategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchStrategyImplCopyWith<_$MatchStrategyImpl> get copyWith =>
      __$$MatchStrategyImplCopyWithImpl<_$MatchStrategyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchStrategyImplToJson(
      this,
    );
  }
}

abstract class _MatchStrategy implements MatchStrategy {
  const factory _MatchStrategy(
      {required final String id,
      required final String title,
      required final String description,
      required final StrategyType type,
      required final PhaseFocus primaryFocus,
      required final Map<String, dynamic> gamePlan,
      required final double confidenceScore,
      required final List<String> keyActions,
      final List<String>? risks,
      final List<String>? opportunities,
      final Map<String, dynamic>? opponentAnalysis,
      final bool isAIGenerated}) = _$MatchStrategyImpl;

  factory _MatchStrategy.fromJson(Map<String, dynamic> json) =
      _$MatchStrategyImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  StrategyType get type;
  @override
  PhaseFocus get primaryFocus;
  @override
  Map<String, dynamic> get gamePlan;
  @override
  double get confidenceScore;
  @override
  List<String> get keyActions;
  @override
  List<String>? get risks;
  @override
  List<String>? get opportunities;
  @override
  Map<String, dynamic>? get opponentAnalysis;
  @override
  bool get isAIGenerated;

  /// Create a copy of MatchStrategy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchStrategyImplCopyWith<_$MatchStrategyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GamePlan _$GamePlanFromJson(Map<String, dynamic> json) {
  return _GamePlan.fromJson(json);
}

/// @nodoc
mixin _$GamePlan {
  Map<String, dynamic> get autonomous => throw _privateConstructorUsedError;
  Map<String, dynamic> get driverControlled =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get endgame => throw _privateConstructorUsedError;
  List<String> get priorities => throw _privateConstructorUsedError;
  Map<String, dynamic> get contingencies => throw _privateConstructorUsedError;

  /// Serializes this GamePlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GamePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GamePlanCopyWith<GamePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePlanCopyWith<$Res> {
  factory $GamePlanCopyWith(GamePlan value, $Res Function(GamePlan) then) =
      _$GamePlanCopyWithImpl<$Res, GamePlan>;
  @useResult
  $Res call(
      {Map<String, dynamic> autonomous,
      Map<String, dynamic> driverControlled,
      Map<String, dynamic> endgame,
      List<String> priorities,
      Map<String, dynamic> contingencies});
}

/// @nodoc
class _$GamePlanCopyWithImpl<$Res, $Val extends GamePlan>
    implements $GamePlanCopyWith<$Res> {
  _$GamePlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GamePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autonomous = null,
    Object? driverControlled = null,
    Object? endgame = null,
    Object? priorities = null,
    Object? contingencies = null,
  }) {
    return _then(_value.copyWith(
      autonomous: null == autonomous
          ? _value.autonomous
          : autonomous // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      driverControlled: null == driverControlled
          ? _value.driverControlled
          : driverControlled // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      endgame: null == endgame
          ? _value.endgame
          : endgame // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      priorities: null == priorities
          ? _value.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contingencies: null == contingencies
          ? _value.contingencies
          : contingencies // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GamePlanImplCopyWith<$Res>
    implements $GamePlanCopyWith<$Res> {
  factory _$$GamePlanImplCopyWith(
          _$GamePlanImpl value, $Res Function(_$GamePlanImpl) then) =
      __$$GamePlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> autonomous,
      Map<String, dynamic> driverControlled,
      Map<String, dynamic> endgame,
      List<String> priorities,
      Map<String, dynamic> contingencies});
}

/// @nodoc
class __$$GamePlanImplCopyWithImpl<$Res>
    extends _$GamePlanCopyWithImpl<$Res, _$GamePlanImpl>
    implements _$$GamePlanImplCopyWith<$Res> {
  __$$GamePlanImplCopyWithImpl(
      _$GamePlanImpl _value, $Res Function(_$GamePlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of GamePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autonomous = null,
    Object? driverControlled = null,
    Object? endgame = null,
    Object? priorities = null,
    Object? contingencies = null,
  }) {
    return _then(_$GamePlanImpl(
      autonomous: null == autonomous
          ? _value._autonomous
          : autonomous // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      driverControlled: null == driverControlled
          ? _value._driverControlled
          : driverControlled // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      endgame: null == endgame
          ? _value._endgame
          : endgame // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      priorities: null == priorities
          ? _value._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contingencies: null == contingencies
          ? _value._contingencies
          : contingencies // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GamePlanImpl implements _GamePlan {
  const _$GamePlanImpl(
      {required final Map<String, dynamic> autonomous,
      required final Map<String, dynamic> driverControlled,
      required final Map<String, dynamic> endgame,
      required final List<String> priorities,
      required final Map<String, dynamic> contingencies})
      : _autonomous = autonomous,
        _driverControlled = driverControlled,
        _endgame = endgame,
        _priorities = priorities,
        _contingencies = contingencies;

  factory _$GamePlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamePlanImplFromJson(json);

  final Map<String, dynamic> _autonomous;
  @override
  Map<String, dynamic> get autonomous {
    if (_autonomous is EqualUnmodifiableMapView) return _autonomous;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_autonomous);
  }

  final Map<String, dynamic> _driverControlled;
  @override
  Map<String, dynamic> get driverControlled {
    if (_driverControlled is EqualUnmodifiableMapView) return _driverControlled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_driverControlled);
  }

  final Map<String, dynamic> _endgame;
  @override
  Map<String, dynamic> get endgame {
    if (_endgame is EqualUnmodifiableMapView) return _endgame;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_endgame);
  }

  final List<String> _priorities;
  @override
  List<String> get priorities {
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priorities);
  }

  final Map<String, dynamic> _contingencies;
  @override
  Map<String, dynamic> get contingencies {
    if (_contingencies is EqualUnmodifiableMapView) return _contingencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_contingencies);
  }

  @override
  String toString() {
    return 'GamePlan(autonomous: $autonomous, driverControlled: $driverControlled, endgame: $endgame, priorities: $priorities, contingencies: $contingencies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamePlanImpl &&
            const DeepCollectionEquality()
                .equals(other._autonomous, _autonomous) &&
            const DeepCollectionEquality()
                .equals(other._driverControlled, _driverControlled) &&
            const DeepCollectionEquality().equals(other._endgame, _endgame) &&
            const DeepCollectionEquality()
                .equals(other._priorities, _priorities) &&
            const DeepCollectionEquality()
                .equals(other._contingencies, _contingencies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_autonomous),
      const DeepCollectionEquality().hash(_driverControlled),
      const DeepCollectionEquality().hash(_endgame),
      const DeepCollectionEquality().hash(_priorities),
      const DeepCollectionEquality().hash(_contingencies));

  /// Create a copy of GamePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GamePlanImplCopyWith<_$GamePlanImpl> get copyWith =>
      __$$GamePlanImplCopyWithImpl<_$GamePlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GamePlanImplToJson(
      this,
    );
  }
}

abstract class _GamePlan implements GamePlan {
  const factory _GamePlan(
      {required final Map<String, dynamic> autonomous,
      required final Map<String, dynamic> driverControlled,
      required final Map<String, dynamic> endgame,
      required final List<String> priorities,
      required final Map<String, dynamic> contingencies}) = _$GamePlanImpl;

  factory _GamePlan.fromJson(Map<String, dynamic> json) =
      _$GamePlanImpl.fromJson;

  @override
  Map<String, dynamic> get autonomous;
  @override
  Map<String, dynamic> get driverControlled;
  @override
  Map<String, dynamic> get endgame;
  @override
  List<String> get priorities;
  @override
  Map<String, dynamic> get contingencies;

  /// Create a copy of GamePlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GamePlanImplCopyWith<_$GamePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
