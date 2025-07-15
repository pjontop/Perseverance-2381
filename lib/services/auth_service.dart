import 'package:appwrite/appwrite.dart';
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
      final user = await _account.get();
      // Fetch user document from Appwrite database
      final userDoc = await _databases.getDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'users',
        documentId: user.$id,
      );
      return User.fromJson(userDoc.data);
    } catch (e) {
      // Handle error, e.g. not logged in
      return null;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    try {
      await _account.getSession(sessionId: 'current');
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get user role
  Future<String> getUserRole() async {
    try {
      final user = await getCurrentUser();
      return user?.role ?? 'Member';
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
      await _account.createEmailPasswordSession(email: email, password: password);
      return true;
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
      // Create user account
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: fullName,
      );
      // Create user document in database
      final userData = {
        'userId': user.$id,
        'fullName': fullName,
        'email': email,
        'role': 'Member',
        'teamId': teamCode,
        'photoUrl': null,
        'createdAt': DateTime.now().toIso8601String(),
        'lastActive': DateTime.now().toIso8601String(),
      };
      await _databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'users',
        documentId: user.$id,
        data: userData,
      );
      // Auto-login after registration
      await signInWithEmail(email: email, password: password);
      return true;
    } catch (e) {
      print('Sign up failed: $e');
      return false;
    }
  }

  // Google OAuth (to be implemented if needed)
  Future<bool> signInWithGoogle() async {
    // Not implemented
    return false;
  }

  // Apple OAuth (to be implemented if needed)
  Future<bool> signInWithApple() async {
    // Not implemented
    return false;
  }

  // Password reset
  Future<bool> resetPassword({
    required String email,
  }) async {
    try {
      await _account.createRecovery(
        email: email,
        url: 'https://your-app.com/reset-password', // TODO: Set your app's reset URL
      );
      return true;
    } catch (e) {
      print('Password reset failed: $e');
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
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
      await _databases.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'users',
        documentId: userId,
        data: data,
      );
      return true;
    } catch (e) {
      print('Profile update failed: $e');
      return false;
    }
  }

  // Delete account
  Future<bool> deleteAccount() async {
    try {
      final user = await _account.get();
      await _account.deleteSession(sessionId: 'current');
      await _databases.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'users',
        documentId: user.$id,
      );
      return true;
    } catch (e) {
      print('Account deletion failed: $e');
      return false;
    }
  }
} 