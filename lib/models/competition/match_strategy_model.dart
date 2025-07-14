import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_strategy_model.freezed.dart';
part 'match_strategy_model.g.dart';

enum StrategyType { offensive, defensive, balanced, counter }
enum PhaseFocus { autonomous, driverControlled, endgame, all }

@freezed
class MatchStrategy with _$MatchStrategy {
  const factory MatchStrategy({
    required String id,
    required String title,
    required String description,
    required StrategyType type,
    required PhaseFocus primaryFocus,
    required Map<String, dynamic> gamePlan,
    required double confidenceScore,
    required List<String> keyActions,
    List<String>? risks,
    List<String>? opportunities,
    Map<String, dynamic>? opponentAnalysis,
    @Default(false) bool isAIGenerated,
  }) = _MatchStrategy;

  factory MatchStrategy.fromJson(Map<String, dynamic> json) => _$MatchStrategyFromJson(json);
}

@freezed
class GamePlan with _$GamePlan {
  const factory GamePlan({
    required Map<String, dynamic> autonomous,
    required Map<String, dynamic> driverControlled,
    required Map<String, dynamic> endgame,
    required List<String> priorities,
    required Map<String, dynamic> contingencies,
  }) = _GamePlan;

  factory GamePlan.fromJson(Map<String, dynamic> json) => _$GamePlanFromJson(json);
} 