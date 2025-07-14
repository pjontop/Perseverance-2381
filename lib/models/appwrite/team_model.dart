import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

enum TeamRegion {
  northAmerica,
  europe,
  asia,
  other;

  String get displayName {
    switch (this) {
      case TeamRegion.northAmerica:
        return 'North America';
      case TeamRegion.europe:
        return 'Europe';
      case TeamRegion.asia:
        return 'Asia';
      case TeamRegion.other:
        return 'Other';
    }
  }
}

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String teamNumber,
    required String name,
    required TeamRegion region,
    String? school,
    String? city,
    String? state,
    String? country,
    String? website,
    String? logoUrl,
    Map<String, dynamic>? performanceMetrics,
    List<String>? strengths,
    List<String>? weaknesses,
    List<String>? preferredAlliancePartners,
    Map<String, double>? compatibilityScores,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
} 