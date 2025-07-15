import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/storage_service.dart';
import '../services/haptic_service.dart';
import '../models/user.dart';
import '../models/competition/live_match_state.dart';
import '../models/competition/alliance_recommendations_state.dart';
import '../models/appwrite/match_model.dart';
import '../config/appwrite_config.dart';

// Lazy service providers - only initialize when needed
final authServiceProvider = Provider<AuthService>((ref) {
  // Only create if Appwrite is configured
  if (!AppwriteConfig.isConfigured) {
    throw Exception('Appwrite not configured. Please check your .env file.');
  }
  return AuthService();
});

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  if (!AppwriteConfig.isConfigured) {
    throw Exception('Appwrite not configured. Please check your .env file.');
  }
  return DatabaseService();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  if (!AppwriteConfig.isConfigured) {
    throw Exception('Appwrite not configured. Please check your .env file.');
  }
  return StorageService();
});

final hapticServiceProvider = Provider<HapticService>((ref) => HapticService());

// Connectivity provider with error handling
final connectivityProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  try {
    return Connectivity().onConnectivityChanged;
  } catch (e) {
    // Return empty stream if connectivity fails
    return Stream.value([]);
  }
});

// Authentication state provider with optimized initialization
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService? _authService;

  AuthNotifier(this._authService) : super(const AsyncValue.loading()) {
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    try {
      if (_authService == null) {
        state = const AsyncValue.data(null);
        return;
      }
      
      final isLoggedIn = await _authService!.isLoggedIn();
      if (isLoggedIn) {
        final user = await _authService!.getCurrentUser();
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
      if (_authService == null) return false;
      
      state = const AsyncValue.loading();
      final success = await _authService!.signInWithEmail(
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
      if (_authService == null) return false;
      
      state = const AsyncValue.loading();
      final success = await _authService!.signUpWithEmail(
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
      if (_authService != null) {
        await _authService!.logout();
      }
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<String> getUserRole() async {
    try {
      if (_authService == null) return 'Member';
      return await _authService!.getUserRole();
    } catch (e) {
      return 'Member';
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  try {
    final authService = ref.watch(authServiceProvider);
    return AuthNotifier(authService);
  } catch (e) {
    return AuthNotifier(null);
  }
});

// Optimized database state provider
class DatabaseNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final DatabaseService? _databaseService;

  DatabaseNotifier(this._databaseService) : super(const AsyncValue.loading());

  Future<void> loadData(String collectionId) async {
    try {
      if (_databaseService == null) {
        state = const AsyncValue.data({'data': []});
        return;
      }
      
      state = const AsyncValue.loading();
      final data = await _databaseService!.listDocuments(collectionId: collectionId);
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
      if (_databaseService == null) return false;
      
      await _databaseService!.createDocument(
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
      if (_databaseService == null) return false;
      
      await _databaseService!.updateDocument(
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
      if (_databaseService == null) return false;
      
      await _databaseService!.deleteDocument(
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
  try {
    final databaseService = ref.watch(databaseServiceProvider);
    return DatabaseNotifier(databaseService);
  } catch (e) {
    return DatabaseNotifier(null);
  }
});

// Optimized team database state provider
class TeamDatabaseNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final DatabaseService? _databaseService;
  String _searchQuery = '';

  TeamDatabaseNotifier(this._databaseService) : super(const AsyncValue.loading());

  String get searchQuery => _searchQuery;

  Future<void> loadTeams() async {
    try {
      if (_databaseService == null) {
        state = const AsyncValue.data([]);
        return;
      }
      
      state = const AsyncValue.loading();
      final teams = await _databaseService!.listDocuments(collectionId: 'teams');
      state = AsyncValue.data(teams);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> searchTeams(String query) async {
    try {
      if (_databaseService == null) {
        state = const AsyncValue.data([]);
        return;
      }
      
      _searchQuery = query;
      state = const AsyncValue.loading();
      final teams = await _databaseService!.searchDocuments(
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
  try {
    final databaseService = ref.watch(databaseServiceProvider);
    return TeamDatabaseNotifier(databaseService);
  } catch (e) {
    return TeamDatabaseNotifier(null);
  }
});

// Optimized alliance recommendations state provider
class AllianceRecommendationsNotifier extends StateNotifier<AllianceRecommendationsState> {
  final DatabaseService? _databaseService;

  AllianceRecommendationsNotifier(this._databaseService)
      : super(const AllianceRecommendationsState(recommendations: [], isLoading: false));

  Future<void> loadRecommendations() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      // Simulate API call with shorter delay
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(recommendations: [], isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> generateRecommendations(String selectedTeamId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      // Simulate API call with shorter delay
      await Future.delayed(const Duration(milliseconds: 1000));
      state = state.copyWith(recommendations: [], isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final allianceRecommendationsProvider = StateNotifierProvider<AllianceRecommendationsNotifier, AllianceRecommendationsState>((ref) {
  try {
    final databaseService = ref.watch(databaseServiceProvider);
    return AllianceRecommendationsNotifier(databaseService);
  } catch (e) {
    return AllianceRecommendationsNotifier(null);
  }
});

// Lightweight app state provider
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

// Optimized provider for team collection
FutureProvider<List<dynamic>> teamCollectionProvider(String collection, String teamId) {
  return FutureProvider<List<dynamic>>((ref) async {
    try {
      final db = ref.watch(databaseServiceProvider);
      if (teamId.isEmpty) return [];
      final docs = await db.listDocuments(collectionId: collection, queries: [
        // Add a query to filter by teamId if needed
      ]);
      return docs;
    } catch (e) {
      return [];
    }
  });
} 

// Optimized Live Match State Notifier
class LiveMatchNotifier extends StateNotifier<LiveMatchState> {
  final DatabaseService? _databaseService;

  LiveMatchNotifier(this._databaseService)
      : super(const LiveMatchState(
          currentMatch: null,
          isLive: false,
          matchData: {},
          isLoading: false,
        ));

  Future<void> startLiveMatch(String matchId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      // Simulate API call with shorter delay
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(
        isLive: true,
        isLoading: false,
        currentMatch: matchId,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateMatchData(Map<String, dynamic> data) async {
    try {
      state = state.copyWith(
        matchData: {...state.matchData, ...data},
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> endLiveMatch() async {
    try {
      state = state.copyWith(
        isLive: false,
        currentMatch: null,
        matchData: {},
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

final liveMatchProvider = StateNotifierProvider<LiveMatchNotifier, LiveMatchState>((ref) {
  try {
    final databaseService = ref.watch(databaseServiceProvider);
    return LiveMatchNotifier(databaseService);
  } catch (e) {
    return LiveMatchNotifier(null);
  }
});

// Teams provider with caching
final teamsProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, searchQuery) async {
  try {
    final databaseService = ref.watch(databaseServiceProvider);
    if (searchQuery.isEmpty) {
      return await databaseService.listDocuments(collectionId: 'teams');
    } else {
      return await databaseService.searchDocuments(
        collectionId: 'teams',
        searchTerm: searchQuery,
      );
    }
  } catch (e) {
    return [];
  }
}); 