import 'package:flutter/material.dart';

/// Tool Status Enum
enum ToolStatus {
  available,
  checkedOut,
  maintenance;

  String get displayName {
    switch (this) {
      case ToolStatus.available:
        return 'Available';
      case ToolStatus.checkedOut:
        return 'Checked Out';
      case ToolStatus.maintenance:
        return 'Maintenance';
    }
  }

  Color get color {
    switch (this) {
      case ToolStatus.available:
        return Colors.green;
      case ToolStatus.checkedOut:
        return Colors.orange;
      case ToolStatus.maintenance:
        return Colors.red;
    }
  }
}

class Tool {
  final String id;
  final String name;
  final String description;
  final ToolStatus status;
  final String? checkedOutBy;
  final DateTime? checkedOutAt;
  final DateTime? dueBackAt;
  final String? location;
  final String? notes;
  final DateTime? lastMaintenance;

  const Tool({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    this.checkedOutBy,
    this.checkedOutAt,
    this.dueBackAt,
    this.location,
    this.notes,
    this.lastMaintenance,
  });

  bool get isOverdue {
    if (dueBackAt == null) return false;
    return DateTime.now().isAfter(dueBackAt!);
  }

  bool get isAvailable {
    return status == ToolStatus.available;
  }

  bool get isCheckedOut {
    return status == ToolStatus.checkedOut;
  }

  bool get needsMaintenance {
    return status == ToolStatus.maintenance;
  }

  String get formattedDueDate {
    if (dueBackAt == null) return 'N/A';
    return '${dueBackAt!.month}/${dueBackAt!.day}/${dueBackAt!.year}';
  }

  String get formattedCheckoutDate {
    if (checkedOutAt == null) return 'N/A';
    return '${checkedOutAt!.month}/${checkedOutAt!.day}/${checkedOutAt!.year}';
  }

  String get formattedLastMaintenance {
    if (lastMaintenance == null) return 'Never';
    return '${lastMaintenance!.month}/${lastMaintenance!.day}/${lastMaintenance!.year}';
  }

  int? get daysUntilDue {
    if (dueBackAt == null) return null;
    final now = DateTime.now();
    final difference = dueBackAt!.difference(now);
    return difference.inDays;
  }

  String get overdueStatus {
    if (!isCheckedOut) return '';
    if (isOverdue) {
      final days = daysUntilDue!;
      return 'Overdue by ${days.abs()} days';
    } else {
      final days = daysUntilDue!;
      return 'Due in $days days';
    }
  }
} 