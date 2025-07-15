// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_match_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveMatchStateImpl _$$LiveMatchStateImplFromJson(Map<String, dynamic> json) =>
    _$LiveMatchStateImpl(
      currentMatch: json['currentMatch'] as String?,
      isLive: json['isLive'] as bool? ?? false,
      matchData: json['matchData'] as Map<String, dynamic>? ?? const {},
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$LiveMatchStateImplToJson(
        _$LiveMatchStateImpl instance) =>
    <String, dynamic>{
      'currentMatch': instance.currentMatch,
      'isLive': instance.isLive,
      'matchData': instance.matchData,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
