import 'package:flutter/material.dart';

/// Inventory Category Enum
enum InventoryCategory {
  motors,
  sensors,
  structure,
  hardware,
  electronics,
  pneumatics,
  other;

  String get displayName {
    switch (this) {
      case InventoryCategory.motors:
        return 'Motors';
      case InventoryCategory.sensors:
        return 'Sensors';
      case InventoryCategory.structure:
        return 'Structure';
      case InventoryCategory.hardware:
        return 'Hardware';
      case InventoryCategory.electronics:
        return 'Electronics';
      case InventoryCategory.pneumatics:
        return 'Pneumatics';
      case InventoryCategory.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case InventoryCategory.motors:
        return Icons.settings;
      case InventoryCategory.sensors:
        return Icons.radar;
      case InventoryCategory.structure:
        return Icons.build;
      case InventoryCategory.hardware:
        return Icons.hardware;
      case InventoryCategory.electronics:
        return Icons.electric_bolt;
      case InventoryCategory.pneumatics:
        return Icons.air;
      case InventoryCategory.other:
        return Icons.inventory;
    }
  }
}

class InventoryItem {
  final String id;
  final String name;
  final String description;
  final InventoryCategory category;
  final int quantity;
  final int minimumStock;
  final String location; // Shelf, bin number, etc.
  final String partNumber;
  final String? supplier;
  final double? cost;
  final DateTime? lastUpdated;

  const InventoryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.minimumStock,
    required this.location,
    required this.partNumber,
    this.supplier,
    this.cost,
    this.lastUpdated,
  });

  bool get isLowStock {
    return quantity <= minimumStock;
  }

  bool get isOutOfStock {
    return quantity == 0;
  }

  Color get stockStatusColor {
    if (isOutOfStock) {
      return Colors.red;
    } else if (isLowStock) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  String get stockStatusText {
    if (isOutOfStock) {
      return 'Out of Stock';
    } else if (isLowStock) {
      return 'Low Stock';
    } else {
      return 'In Stock';
    }
  }

  String get formattedCost {
    if (cost == null) return 'N/A';
    return '\$${cost!.toStringAsFixed(2)}';
  }

  String get formattedLastUpdated {
    if (lastUpdated == null) return 'Never';
    return '${lastUpdated!.month}/${lastUpdated!.day}/${lastUpdated!.year}';
  }

  static InventoryItem fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'] ?? json['\$id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: InventoryCategory.values.firstWhere(
        (e) => e.name == (json['category']?.toString()?.toLowerCase() ?? ''),
        orElse: () => InventoryCategory.other,
      ),
      quantity: json['quantity'] is int ? json['quantity'] : int.tryParse(json['quantity']?.toString() ?? '') ?? 0,
      minimumStock: json['minimumStock'] is int ? json['minimumStock'] : int.tryParse(json['minimumStock']?.toString() ?? '') ?? 0,
      location: json['location'] ?? '',
      partNumber: json['partNumber'] ?? '',
      supplier: json['supplier'],
      cost: json['cost'] is num ? (json['cost'] as num).toDouble() : double.tryParse(json['cost']?.toString() ?? ''),
      lastUpdated: json['lastUpdated'] != null ? DateTime.tryParse(json['lastUpdated']) : null,
    );
  }
} 