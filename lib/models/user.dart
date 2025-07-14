import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User Model
/// 
/// Represents a user in the Team Perseverance app.
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String fullName,
    required String email,
    required String role,
    String? teamId,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// User Role Enum
enum UserRole {
  @JsonValue('Coach')
  coach,
  @JsonValue('Captain')
  captain,
  @JsonValue('Member')
  member,
} 