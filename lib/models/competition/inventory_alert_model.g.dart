// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryAlertImpl _$$InventoryAlertImplFromJson(Map<String, dynamic> json) =>
    _$InventoryAlertImpl(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      alertType: $enumDecode(_$AlertTypeEnumMap, json['alertType']),
      message: json['message'] as String,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      suggestedAction: json['suggestedAction'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryAlertImplToJson(
        _$InventoryAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'alertType': _$AlertTypeEnumMap[instance.alertType]!,
      'message': instance.message,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'suggestedAction': instance.suggestedAction,
      'deadline': instance.deadline?.toIso8601String(),
      'metadata': instance.metadata,
      'isAIGenerated': instance.isAIGenerated,
    };

const _$AlertTypeEnumMap = {
  AlertType.lowStock: 'lowStock',
  AlertType.outOfStock: 'outOfStock',
  AlertType.expiring: 'expiring',
  AlertType.critical: 'critical',
  AlertType.maintenance: 'maintenance',
};

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
  Priority.critical: 'critical',
};

_$InventoryPredictionImpl _$$InventoryPredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryPredictionImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      predictedShortageDate:
          DateTime.parse(json['predictedShortageDate'] as String),
      confidence: (json['confidence'] as num).toDouble(),
      reasoning: json['reasoning'] as String,
      recommendedActions: (json['recommendedActions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      usagePatterns: json['usagePatterns'] as Map<String, dynamic>?,
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryPredictionImplToJson(
        _$InventoryPredictionImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'predictedShortageDate': instance.predictedShortageDate.toIso8601String(),
      'confidence': instance.confidence,
      'reasoning': instance.reasoning,
      'recommendedActions': instance.recommendedActions,
      'usagePatterns': instance.usagePatterns,
      'isAIGenerated': instance.isAIGenerated,
    };
