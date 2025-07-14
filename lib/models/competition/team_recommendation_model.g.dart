// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamRecommendationImpl _$$TeamRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamRecommendationImpl(
      teamId: json['teamId'] as String,
      teamName: json['teamName'] as String,
      compatibilityScore: (json['compatibilityScore'] as num).toDouble(),
      reasoning: json['reasoning'] as String,
      strengths:
          (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      performanceData: json['performanceData'] as Map<String, dynamic>?,
      suggestedStrategies: (json['suggestedStrategies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$TeamRecommendationImplToJson(
        _$TeamRecommendationImpl instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'teamName': instance.teamName,
      'compatibilityScore': instance.compatibilityScore,
      'reasoning': instance.reasoning,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'performanceData': instance.performanceData,
      'suggestedStrategies': instance.suggestedStrategies,
      'isAIGenerated': instance.isAIGenerated,
    };

_$AllianceStrategyImpl _$$AllianceStrategyImplFromJson(
        Map<String, dynamic> json) =>
    _$AllianceStrategyImpl(
      strategyId: json['strategyId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      teamIds:
          (json['teamIds'] as List<dynamic>).map((e) => e as String).toList(),
      gamePlan: json['gamePlan'] as Map<String, dynamic>,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      risks:
          (json['risks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      opportunities: (json['opportunities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$AllianceStrategyImplToJson(
        _$AllianceStrategyImpl instance) =>
    <String, dynamic>{
      'strategyId': instance.strategyId,
      'title': instance.title,
      'description': instance.description,
      'teamIds': instance.teamIds,
      'gamePlan': instance.gamePlan,
      'confidenceScore': instance.confidenceScore,
      'risks': instance.risks,
      'opportunities': instance.opportunities,
      'isAIGenerated': instance.isAIGenerated,
    };
