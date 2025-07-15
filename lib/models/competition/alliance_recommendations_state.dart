import 'package:freezed_annotation/freezed_annotation.dart';

part 'alliance_recommendations_state.freezed.dart';
part 'alliance_recommendations_state.g.dart';

@freezed
class AllianceRecommendationsState with _$AllianceRecommendationsState {
  const factory AllianceRecommendationsState({
    required List<Map<String, dynamic>> recommendations,
    @Default(false) bool isLoading,
    String? error,
  }) = _AllianceRecommendationsState;

  factory AllianceRecommendationsState.fromJson(Map<String, dynamic> json) => _$AllianceRecommendationsStateFromJson(json);
} 