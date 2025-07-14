import 'package:flutter/material.dart';

/// Event Model
/// 
/// Represents an event, competition, or meeting for the VEX Robotics team.
class Event {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final EventType type;
  final String? imageUrl;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.type,
    this.imageUrl,
  });

  /// Days until the event
  int get daysUntil {
    final now = DateTime.now();
    final difference = dateTime.difference(now);
    return difference.inDays;
  }

  /// Formatted date string
  String get formattedDate {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }

  /// Formatted time string
  String get formattedTime {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  /// Status based on days until event
  String get status {
    if (daysUntil < 0) return 'Past';
    if (daysUntil == 0) return 'Today';
    if (daysUntil == 1) return 'Tomorrow';
    if (daysUntil <= 7) return 'This Week';
    return 'Upcoming';
  }
}

/// Event Type Enum
enum EventType {
  competition,
  meeting,
  practice,
  workshop,
  other;

  String get displayName {
    switch (this) {
      case EventType.competition:
        return 'Competition';
      case EventType.meeting:
        return 'Meeting';
      case EventType.practice:
        return 'Practice';
      case EventType.workshop:
        return 'Workshop';
      case EventType.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case EventType.competition:
        return Icons.emoji_events;
      case EventType.meeting:
        return Icons.meeting_room;
      case EventType.practice:
        return Icons.sports_esports;
      case EventType.workshop:
        return Icons.school;
      case EventType.other:
        return Icons.event;
    }
  }
} 