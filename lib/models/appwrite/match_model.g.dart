// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      matchNumber: json['matchNumber'] as String,
      eventId: json['eventId'] as String,
      allianceColor: $enumDecode(_$AllianceColorEnumMap, json['allianceColor']),
      teamIds:
          (json['teamIds'] as List<dynamic>).map((e) => e as String).toList(),
      scores: Map<String, int>.from(json['scores'] as Map),
      autonomousData: json['autonomousData'] as Map<String, dynamic>,
      driverControlledData:
          json['driverControlledData'] as Map<String, dynamic>,
      endgameData: json['endgameData'] as Map<String, dynamic>,
      currentPhase: $enumDecode(_$MatchPhaseEnumMap, json['currentPhase']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      notes: json['notes'] as String?,
      scoutId: json['scoutId'] as String?,
      isLive: json['isLive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchNumber': instance.matchNumber,
      'eventId': instance.eventId,
      'allianceColor': _$AllianceColorEnumMap[instance.allianceColor]!,
      'teamIds': instance.teamIds,
      'scores': instance.scores,
      'autonomousData': instance.autonomousData,
      'driverControlledData': instance.driverControlledData,
      'endgameData': instance.endgameData,
      'currentPhase': _$MatchPhaseEnumMap[instance.currentPhase]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'notes': instance.notes,
      'scoutId': instance.scoutId,
      'isLive': instance.isLive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$AllianceColorEnumMap = {
  AllianceColor.red: 'red',
  AllianceColor.blue: 'blue',
};

const _$MatchPhaseEnumMap = {
  MatchPhase.autonomous: 'autonomous',
  MatchPhase.driverControlled: 'driverControlled',
  MatchPhase.endgame: 'endgame',
};
