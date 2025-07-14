import 'package:flutter/material.dart';
import 'member.dart';

/// Meeting Type Enum
enum MeetingType { team, build, competitionPrep, other; }

class Meeting {
  final String id;
  final String title;
  final DateTime dateTime;
  final String location;
  final List<Member> attendees;
  final MeetingType type;
  final String notes;

  const Meeting({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.location,
    required this.attendees,
    required this.type,
    this.notes = '',
  });

  String get typeDisplay {
    switch (type) {
      case MeetingType.team:
        return 'Team Meeting';
      case MeetingType.build:
        return 'Build Session';
      case MeetingType.competitionPrep:
        return 'Competition Prep';
      case MeetingType.other:
        return 'Other';
    }
  }

  IconData get typeIcon {
    switch (type) {
      case MeetingType.team:
        return Icons.groups;
      case MeetingType.build:
        return Icons.build;
      case MeetingType.competitionPrep:
        return Icons.emoji_events;
      case MeetingType.other:
        return Icons.event;
    }
  }

  String get formattedDate {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }

  String get formattedTime {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
} 