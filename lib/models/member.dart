import 'package:flutter/material.dart';

/// Member Status Enum
enum MemberStatus { present, absent, late; }

/// Member Role Enum
enum MemberRole { captain, driver, programmer, builder, documenter, strategist, other; }

class Member {
  final String id;
  final String name;
  final MemberRole role;
  final String avatarUrl; // Placeholder for now
  final MemberStatus status;
  final double hoursLogged;

  const Member({
    required this.id,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.status,
    required this.hoursLogged,
  });

  String get roleDisplay {
    switch (role) {
      case MemberRole.captain:
        return 'Captain';
      case MemberRole.driver:
        return 'Driver';
      case MemberRole.programmer:
        return 'Programmer';
      case MemberRole.builder:
        return 'Builder';
      case MemberRole.documenter:
        return 'Documenter';
      case MemberRole.strategist:
        return 'Strategist';
      case MemberRole.other:
        return 'Other';
    }
  }

  Color get statusColor {
    switch (status) {
      case MemberStatus.present:
        return Colors.green;
      case MemberStatus.absent:
        return Colors.red;
      case MemberStatus.late:
        return Colors.orange;
    }
  }

  String get statusText {
    switch (status) {
      case MemberStatus.present:
        return 'Present';
      case MemberStatus.absent:
        return 'Absent';
      case MemberStatus.late:
        return 'Late';
    }
  }
} 