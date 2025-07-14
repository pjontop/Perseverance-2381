import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole {
  coach,
  captain,
  member;

  String get displayName {
    switch (this) {
      case UserRole.coach:
        return 'Coach';
      case UserRole.captain:
        return 'Captain';
      case UserRole.member:
        return 'Member';
    }
  }
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    required String teamId,
    String? avatarUrl,
    DateTime? lastActive,
    bool? isOnline,
    Map<String, dynamic>? preferences,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
} 