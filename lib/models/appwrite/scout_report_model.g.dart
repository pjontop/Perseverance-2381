// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scout_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoutReportImpl _$$ScoutReportImplFromJson(Map<String, dynamic> json) =>
    _$ScoutReportImpl(
      id: json['id'] as String,
      teamId: json['teamId'] as String,
      matchId: json['matchId'] as String,
      type: $enumDecode(_$ScoutReportTypeEnumMap, json['type']),
      scoutId: json['scoutId'] as String,
      autonomousData: json['autonomousData'] as Map<String, dynamic>,
      driverControlledData:
          json['driverControlledData'] as Map<String, dynamic>,
      endgameData: json['endgameData'] as Map<String, dynamic>,
      scores: Map<String, int>.from(json['scores'] as Map),
      strengths:
          (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notes: json['notes'] as String,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ScoutReportImplToJson(_$ScoutReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'matchId': instance.matchId,
      'type': _$ScoutReportTypeEnumMap[instance.type]!,
      'scoutId': instance.scoutId,
      'autonomousData': instance.autonomousData,
      'driverControlledData': instance.driverControlledData,
      'endgameData': instance.endgameData,
      'scores': instance.scores,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'notes': instance.notes,
      'photoUrls': instance.photoUrls,
      'additionalData': instance.additionalData,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ScoutReportTypeEnumMap = {
  ScoutReportType.match: 'match',
  ScoutReportType.practice: 'practice',
  ScoutReportType.qualification: 'qualification',
  ScoutReportType.elimination: 'elimination',
};
