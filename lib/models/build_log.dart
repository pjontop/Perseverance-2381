import 'package:flutter/material.dart';

/// Build Status Enum
enum BuildStatus {
  inProgress,
  completed,
  testing,
  onHold;

  String get displayName {
    switch (this) {
      case BuildStatus.inProgress:
        return 'In Progress';
      case BuildStatus.completed:
        return 'Completed';
      case BuildStatus.testing:
        return 'Testing';
      case BuildStatus.onHold:
        return 'On Hold';
    }
  }

  Color get color {
    switch (this) {
      case BuildStatus.inProgress:
        return Colors.blue;
      case BuildStatus.completed:
        return Colors.green;
      case BuildStatus.testing:
        return Colors.orange;
      case BuildStatus.onHold:
        return Colors.grey;
    }
  }
}

class BuildLog {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final BuildStatus status;
  final double progress; // 0.0 to 1.0
  final String author;
  final List<String> tags;
  final List<String> photoUrls; // Placeholder for photo URLs
  final Map<String, dynamic> changes; // Key-value pairs of changes made
  final Map<String, double> performanceMetrics; // Performance improvements
  final String robotVersion; // V1, V2, V3, etc.

  const BuildLog({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    required this.progress,
    required this.author,
    required this.tags,
    this.photoUrls = const [],
    this.changes = const {},
    this.performanceMetrics = const {},
    required this.robotVersion,
  });

  String get formattedDate {
    return '${date.month}/${date.day}/${date.year}';
  }

  String get progressPercentage {
    return '${(progress * 100).toInt()}%';
  }

  bool get isCompleted {
    return status == BuildStatus.completed;
  }

  static BuildLog fromJson(Map<String, dynamic> json) => BuildLog(
    id: json['\$id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
    status: json['status'] ?? '',
    progress: (json['progress'] is int) ? json['progress'] : int.tryParse(json['progress']?.toString() ?? '0') ?? 0,
    author: json['author'] ?? '',
    tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],
    robotVersion: json['robotVersion'] ?? '',
  );
} 