import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

enum MatchPhase {
  autonomous,
  driverControlled,
  endgame;

  String get displayName {
    switch (this) {
      case MatchPhase.autonomous:
        return 'Autonomous';
      case MatchPhase.driverControlled:
        return 'Driver Controlled';
      case MatchPhase.endgame:
        return 'Endgame';
    }
  }
}

enum AllianceColor {
  red,
  blue;

  String get displayName {
    switch (this) {
      case AllianceColor.red:
        return 'Red';
      case AllianceColor.blue:
        return 'Blue';
    }
  }
}

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    required String matchNumber,
    required String eventId,
    required AllianceColor allianceColor,
    required List<String> teamIds,
    required Map<String, int> scores,
    required Map<String, dynamic> autonomousData,
    required Map<String, dynamic> driverControlledData,
    required Map<String, dynamic> endgameData,
    required MatchPhase currentPhase,
    required DateTime startTime,
    DateTime? endTime,
    String? notes,
    String? scoutId,
    bool? isLive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
} 