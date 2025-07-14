import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_recommendation_model.freezed.dart';
part 'team_recommendation_model.g.dart';

@freezed
class TeamRecommendation with _$TeamRecommendation {
  const factory TeamRecommendation({
    required String teamId,
    required String teamName,
    required double compatibilityScore,
    required String reasoning,
    required List<String> strengths,
    required List<String> weaknesses,
    Map<String, dynamic>? performanceData,
    List<String>? suggestedStrategies,
    @Default(false) bool isAIGenerated,
  }) = _TeamRecommendation;

  factory TeamRecommendation.fromJson(Map<String, dynamic> json) => _$TeamRecommendationFromJson(json);
}

@freezed
class AllianceStrategy with _$AllianceStrategy {
  const factory AllianceStrategy({
    required String strategyId,
    required String title,
    required String description,
    required List<String> teamIds,
    required Map<String, dynamic> gamePlan,
    required double confidenceScore,
    List<String>? risks,
    List<String>? opportunities,
    @Default(false) bool isAIGenerated,
  }) = _AllianceStrategy;

  factory AllianceStrategy.fromJson(Map<String, dynamic> json) => _$AllianceStrategyFromJson(json);
} 