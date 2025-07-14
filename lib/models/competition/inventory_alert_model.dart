import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_alert_model.freezed.dart';
part 'inventory_alert_model.g.dart';

enum AlertType { lowStock, outOfStock, expiring, critical, maintenance }
enum Priority { low, medium, high, critical }

@freezed
class InventoryAlert with _$InventoryAlert {
  const factory InventoryAlert({
    required String id,
    required String itemId,
    required String itemName,
    required AlertType alertType,
    required String message,
    required Priority priority,
    required String suggestedAction,
    DateTime? deadline,
    Map<String, dynamic>? metadata,
    @Default(false) bool isAIGenerated,
  }) = _InventoryAlert;

  factory InventoryAlert.fromJson(Map<String, dynamic> json) => _$InventoryAlertFromJson(json);
}

@freezed
class InventoryPrediction with _$InventoryPrediction {
  const factory InventoryPrediction({
    required String itemId,
    required String itemName,
    required DateTime predictedShortageDate,
    required double confidence,
    required String reasoning,
    required List<String> recommendedActions,
    Map<String, dynamic>? usagePatterns,
    @Default(false) bool isAIGenerated,
  }) = _InventoryPrediction;

  factory InventoryPrediction.fromJson(Map<String, dynamic> json) => _$InventoryPredictionFromJson(json);
} 