// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
      id: json['id'] as String,
      teamNumber: json['teamNumber'] as String,
      name: json['name'] as String,
      region: $enumDecode(_$TeamRegionEnumMap, json['region']),
      school: json['school'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      website: json['website'] as String?,
      logoUrl: json['logoUrl'] as String?,
      performanceMetrics: json['performanceMetrics'] as Map<String, dynamic>?,
      strengths: (json['strengths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      preferredAlliancePartners:
          (json['preferredAlliancePartners'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      compatibilityScores:
          (json['compatibilityScores'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamNumber': instance.teamNumber,
      'name': instance.name,
      'region': _$TeamRegionEnumMap[instance.region]!,
      'school': instance.school,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'website': instance.website,
      'logoUrl': instance.logoUrl,
      'performanceMetrics': instance.performanceMetrics,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'preferredAlliancePartners': instance.preferredAlliancePartners,
      'compatibilityScores': instance.compatibilityScores,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$TeamRegionEnumMap = {
  TeamRegion.northAmerica: 'northAmerica',
  TeamRegion.europe: 'europe',
  TeamRegion.asia: 'asia',
  TeamRegion.other: 'other',
};
