import 'package:freezed_annotation/freezed_annotation.dart';

part 'scout_report_model.freezed.dart';
part 'scout_report_model.g.dart';

enum ScoutReportType {
  match,
  practice,
  qualification,
  elimination;

  String get displayName {
    switch (this) {
      case ScoutReportType.match:
        return 'Match';
      case ScoutReportType.practice:
        return 'Practice';
      case ScoutReportType.qualification:
        return 'Qualification';
      case ScoutReportType.elimination:
        return 'Elimination';
    }
  }
}

@freezed
class ScoutReport with _$ScoutReport {
  const factory ScoutReport({
    required String id,
    required String teamId,
    required String matchId,
    required ScoutReportType type,
    required String scoutId,
    required Map<String, dynamic> autonomousData,
    required Map<String, dynamic> driverControlledData,
    required Map<String, dynamic> endgameData,
    required Map<String, int> scores,
    required List<String> strengths,
    required List<String> weaknesses,
    required String notes,
    List<String>? photoUrls,
    Map<String, dynamic>? additionalData,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ScoutReport;

  factory ScoutReport.fromJson(Map<String, dynamic> json) => _$ScoutReportFromJson(json);
} 