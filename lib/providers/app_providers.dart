import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/storage_service.dart';
import '../services/haptic_service.dart';
import '../models/user.dart';

// Service providers
final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService());
final storageServiceProvider = Provider<StorageService>((ref) => StorageService());
final hapticServiceProvider = Provider<HapticService>((ref) => HapticService());

// Connectivity provider
final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  return Connectivity().onConnectivityChanged;
});

// Authentication state provider
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AsyncValue.loading()) {
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    try {
      final isLoggedIn = await _authService.isLoggedIn();
      if (isLoggedIn) {
        final user = await _authService.getCurrentUser();
        state = AsyncValue.data(user);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      state = const AsyncValue.loading();
      final success = await _authService.signInWithEmail(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      
      if (success) {
        await _checkAuthState();
      }
      
      return success;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
    String? teamCode,
  }) async {
    try {
      state = const AsyncValue.loading();
      final success = await _authService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        teamCode: teamCode,
      );
      
      if (success) {
        await _checkAuthState();
      }
      
      return success;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<String> getUserRole() async {
    try {
      return await _authService.getUserRole();
    } catch (e) {
      return 'Member';
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

// Database state provider
class DatabaseNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final DatabaseService _databaseService;

  DatabaseNotifier(this._databaseService) : super(const AsyncValue.loading());

  Future<void> loadData(String collectionId) async {
    try {
      state = const AsyncValue.loading();
      final data = await _databaseService.listDocuments(collectionId: collectionId);
      state = AsyncValue.data({'data': data});
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<bool> createDocument({
    required String collectionId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _databaseService.createDocument(
        collectionId: collectionId,
        data: data,
      );
      await loadData(collectionId);
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> updateDocument({
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _databaseService.updateDocument(
        collectionId: collectionId,
        documentId: documentId,
        data: data,
      );
      await loadData(collectionId);
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> deleteDocument({
    required String collectionId,
    required String documentId,
  }) async {
    try {
      await _databaseService.deleteDocument(
        collectionId: collectionId,
        documentId: documentId,
      );
      await loadData(collectionId);
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }
}

final databaseProvider = StateNotifierProvider<DatabaseNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return DatabaseNotifier(databaseService);
});

// Team database state provider
class TeamDatabaseNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final DatabaseService _databaseService;

  TeamDatabaseNotifier(this._databaseService) : super(const AsyncValue.loading());

  Future<void> loadTeams() async {
    try {
      state = const AsyncValue.loading();
      final teams = await _databaseService.listDocuments(collectionId: 'teams');
      state = AsyncValue.data(teams);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> searchTeams(String query) async {
    try {
      state = const AsyncValue.loading();
      final teams = await _databaseService.searchDocuments(
        collectionId: 'teams',
        searchTerm: query,
      );
      state = AsyncValue.data(teams);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final teamDatabaseProvider = StateNotifierProvider<TeamDatabaseNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return TeamDatabaseNotifier(databaseService);
});

// Alliance recommendations state provider
class AllianceRecommendationsNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final DatabaseService _databaseService;

  AllianceRecommendationsNotifier(this._databaseService) : super(const AsyncValue.loading());

  Future<void> loadRecommendations() async {
    try {
      state = const AsyncValue.loading();
      // Placeholder recommendations
      final recommendations = [
        {
          'teamId': 'team1',
          'teamName': 'Team Alpha',
          'compatibilityScore': 85,
          'strengths': ['Autonomous', 'Endgame'],
          'weaknesses': ['Defense'],
          'recommendedStrategy': 'Focus on autonomous and endgame scoring',
        },
        {
          'teamId': 'team2',
          'teamName': 'Team Beta',
          'compatibilityScore': 72,
          'strengths': ['Defense', 'Driver Control'],
          'weaknesses': ['Autonomous'],
          'recommendedStrategy': 'Strong defensive alliance with good driver control',
        },
      ];
      state = AsyncValue.data(recommendations);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> generateRecommendations(String selectedTeamId) async {
    try {
      state = const AsyncValue.loading();
      // Simulate AI-powered recommendations
      await Future.delayed(const Duration(seconds: 1));
      await loadRecommendations();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final allianceRecommendationsProvider = StateNotifierProvider<AllianceRecommendationsNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return AllianceRecommendationsNotifier(databaseService);
});

// App state provider
class AppStateNotifier extends StateNotifier<Map<String, dynamic>> {
  AppStateNotifier() : super({});

  void updateState(String key, dynamic value) {
    state = {...state, key: value};
  }

  void clearState() {
    state = {};
  }
}

final appStateProvider = StateNotifierProvider<AppStateNotifier, Map<String, dynamic>>((ref) {
  return AppStateNotifier();
}); 