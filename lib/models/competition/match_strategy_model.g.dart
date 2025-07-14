// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_strategy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchStrategyImpl _$$MatchStrategyImplFromJson(Map<String, dynamic> json) =>
    _$MatchStrategyImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$StrategyTypeEnumMap, json['type']),
      primaryFocus: $enumDecode(_$PhaseFocusEnumMap, json['primaryFocus']),
      gamePlan: json['gamePlan'] as Map<String, dynamic>,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      keyActions: (json['keyActions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      risks:
          (json['risks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      opportunities: (json['opportunities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      opponentAnalysis: json['opponentAnalysis'] as Map<String, dynamic>?,
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$MatchStrategyImplToJson(_$MatchStrategyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$StrategyTypeEnumMap[instance.type]!,
      'primaryFocus': _$PhaseFocusEnumMap[instance.primaryFocus]!,
      'gamePlan': instance.gamePlan,
      'confidenceScore': instance.confidenceScore,
      'keyActions': instance.keyActions,
      'risks': instance.risks,
      'opportunities': instance.opportunities,
      'opponentAnalysis': instance.opponentAnalysis,
      'isAIGenerated': instance.isAIGenerated,
    };

const _$StrategyTypeEnumMap = {
  StrategyType.offensive: 'offensive',
  StrategyType.defensive: 'defensive',
  StrategyType.balanced: 'balanced',
  StrategyType.counter: 'counter',
};

const _$PhaseFocusEnumMap = {
  PhaseFocus.autonomous: 'autonomous',
  PhaseFocus.driverControlled: 'driverControlled',
  PhaseFocus.endgame: 'endgame',
  PhaseFocus.all: 'all',
};

_$GamePlanImpl _$$GamePlanImplFromJson(Map<String, dynamic> json) =>
    _$GamePlanImpl(
      autonomous: json['autonomous'] as Map<String, dynamic>,
      driverControlled: json['driverControlled'] as Map<String, dynamic>,
      endgame: json['endgame'] as Map<String, dynamic>,
      priorities: (json['priorities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      contingencies: json['contingencies'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$GamePlanImplToJson(_$GamePlanImpl instance) =>
    <String, dynamic>{
      'autonomous': instance.autonomous,
      'driverControlled': instance.driverControlled,
      'endgame': instance.endgame,
      'priorities': instance.priorities,
      'contingencies': instance.contingencies,
    };
