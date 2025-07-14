import 'package:flutter/material.dart';

/// Task Category Enum
enum TaskCategory { design, build, programming, documentation, other; }

/// Task Priority Enum
enum TaskPriority {
  low,
  medium,
  high;

  String get displayName {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  Color get color {
    switch (this) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.high:
        return Colors.red;
    }
  }
}

/// Task Status Enum
enum TaskStatus {
  notStarted,
  inProgress,
  review,
  completed;

  String get displayName {
    switch (this) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.review:
        return 'Review';
      case TaskStatus.completed:
        return 'Completed';
    }
  }
}

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final String assignedTo;
  final TaskCategory category;
  final DateTime? completedAt;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.assignedTo,
    required this.category,
    this.completedAt,
  });

  int get daysUntilDue {
    final now = DateTime.now();
    final difference = dueDate.difference(now);
    return difference.inDays;
  }

  bool get isOverdue {
    return daysUntilDue < 0 && status != TaskStatus.completed;
  }

  String get formattedDueDate {
    return '${dueDate.month}/${dueDate.day}/${dueDate.year}';
  }
} 