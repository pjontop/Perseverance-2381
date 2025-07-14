import 'package:appwrite/appwrite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/appwrite_config.dart';
import '../models/user.dart';

class AuthService {
  late final Client _client;
  late final Account _account;
  late final Databases _databases;
  
  AuthService() {
    _client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: true);
    
    _account = Account(_client);
    _databases = Databases(_client);
  }

  // Get current user session
  Future<User?> getCurrentUser() async {
    try {
      // Mock implementation for now
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId != null) {
        return User(
          id: userId,
          fullName: prefs.getString('fullName') ?? 'User',
          email: prefs.getString('email') ?? 'user@example.com',
          role: prefs.getString('role') ?? 'Member',
          teamId: prefs.getString('teamId'),
          photoUrl: prefs.getString('photoUrl'),
          createdAt: DateTime.now(),
          lastActive: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('userId') != null;
    } catch (e) {
      return false;
    }
  }

  // Get user role
  Future<String> getUserRole() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('role') ?? 'Member';
    } catch (e) {
      return 'Member';
    }
  }

  // Email/Password authentication
  Future<bool> signInWithEmail({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      // Mock implementation
      if (email == 'test@example.com' && password == 'password') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', 'user123');
        await prefs.setString('fullName', 'Test User');
        await prefs.setString('email', email);
        await prefs.setString('role', 'Member');
        await prefs.setBool('rememberMe', rememberMe);
        return true;
      }
      return false;
    } catch (e) {
      print('Sign in failed: $e');
      return false;
    }
  }

  // Email/Password registration
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
    String? teamCode,
  }) async {
    try {
      // Mock implementation
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', 'user${DateTime.now().millisecondsSinceEpoch}');
      await prefs.setString('fullName', fullName);
      await prefs.setString('email', email);
      await prefs.setString('role', 'Member');
      return true;
    } catch (e) {
      print('Sign up failed: $e');
      return false;
    }
  }

  // Google OAuth
  Future<bool> signInWithGoogle() async {
    try {
      // Mock implementation
      return false;
    } catch (e) {
      print('Google sign in failed: $e');
      return false;
    }
  }

  // Apple OAuth
  Future<bool> signInWithApple() async {
    try {
      // Mock implementation
      return false;
    } catch (e) {
      print('Apple sign in failed: $e');
      return false;
    }
  }

  // Password reset
  Future<bool> resetPassword({
    required String email,
  }) async {
    try {
      // Mock implementation
      return true;
    } catch (e) {
      print('Password reset failed: $e');
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      print('Logout failed: $e');
    }
  }

  // Update user profile
  Future<bool> updateProfile({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      // Mock implementation
      return true;
    } catch (e) {
      print('Profile update failed: $e');
      return false;
    }
  }

  // Delete account
  Future<bool> deleteAccount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      print('Account deletion failed: $e');
      return false;
    }
  }
} 