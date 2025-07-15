// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alliance_recommendations_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllianceRecommendationsStateImpl _$$AllianceRecommendationsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AllianceRecommendationsStateImpl(
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$AllianceRecommendationsStateImplToJson(
        _$AllianceRecommendationsStateImpl instance) =>
    <String, dynamic>{
      'recommendations': instance.recommendations,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
