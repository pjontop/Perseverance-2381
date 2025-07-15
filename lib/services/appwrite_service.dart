import 'package:appwrite/appwrite.dart';
import '../config/appwrite_config.dart';

class AppwriteService {
  late final Client _client;
  late final Account _account;
  late final Databases _databases;
  late final Storage _storage;
  late final Realtime _realtime;

  AppwriteService() {
    _client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId);
    _account = Account(_client);
    _databases = Databases(_client);
    _storage = Storage(_client);
    _realtime = Realtime(_client);
  }

  // Authentication
  Future<Session> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _account.createEmailPasswordSession(email: email, password: password);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  Future<Account> getCurrentUser() async {
    try {
      return await _account.get();
    } catch (e) {
      throw Exception('Get current user failed: $e');
    }
  }

  // Database Operations - Teams
  Future<List<Map<String, dynamic>>> getTeams({String? search}) async {
    try {
      final response = await _databases.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'teams',
        queries: search != null ? [Query.search('name', search)] : null,
      );
      return response.documents.map((doc) => doc.data).toList();
    } catch (e) {
      throw Exception('Get teams failed: $e');
    }
  }

  Future<Map<String, dynamic>> createTeam(Map<String, dynamic> teamData) async {
    try {
      final doc = await _databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'teams',
        documentId: ID.unique(),
        data: teamData,
      );
      return doc.data;
    } catch (e) {
      throw Exception('Create team failed: $e');
    }
  }

  Future<Map<String, dynamic>> updateTeam(String teamId, Map<String, dynamic> teamData) async {
    try {
      final doc = await _databases.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'teams',
        documentId: teamId,
        data: teamData,
      );
      return doc.data;
    } catch (e) {
      throw Exception('Update team failed: $e');
    }
  }

  // Database Operations - Matches
  Future<List<Map<String, dynamic>>> getMatches({String? eventId}) async {
    try {
      final queries = <String>[];
      if (eventId != null) {
        queries.add(Query.equal('eventId', eventId));
      }
      final response = await _databases.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'matches',
        queries: queries.isNotEmpty ? queries : null,
      );
      return response.documents.map((doc) => doc.data).toList();
    } catch (e) {
      throw Exception('Get matches failed: $e');
    }
  }

  Future<Map<String, dynamic>> createMatch(Map<String, dynamic> matchData) async {
    try {
      final doc = await _databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'matches',
        documentId: ID.unique(),
        data: matchData,
      );
      return doc.data;
    } catch (e) {
      throw Exception('Create match failed: $e');
    }
  }

  Future<Map<String, dynamic>> updateMatch(String matchId, Map<String, dynamic> matchData) async {
    try {
      final doc = await _databases.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'matches',
        documentId: matchId,
        data: matchData,
      );
      return doc.data;
    } catch (e) {
      throw Exception('Update match failed: $e');
    }
  }

  // Database Operations - Scout Reports
  Future<List<Map<String, dynamic>>> getScoutReports({
    String? teamId,
    String? matchId,
  }) async {
    try {
      final queries = <String>[];
      if (teamId != null) queries.add(Query.equal('teamId', teamId));
      if (matchId != null) queries.add(Query.equal('matchId', matchId));
      final response = await _databases.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'scout_reports',
        queries: queries.isNotEmpty ? queries : null,
      );
      return response.documents.map((doc) => doc.data).toList();
    } catch (e) {
      throw Exception('Get scout reports failed: $e');
    }
  }

  Future<Map<String, dynamic>> createScoutReport(Map<String, dynamic> reportData) async {
    try {
      final doc = await _databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: 'scout_reports',
        documentId: ID.unique(),
        data: reportData,
      );
      return doc.data;
    } catch (e) {
      throw Exception('Create scout report failed: $e');
    }
  }

  // File Storage
  Future<String> uploadFile(String filePath, String bucketId) async {
    try {
      final file = await _storage.createFile(
        bucketId: bucketId,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: filePath),
      );
      return file.$id;
    } catch (e) {
      throw Exception('Upload file failed: $e');
    }
  }

  Future<void> deleteFile(String fileId, String bucketId) async {
    try {
      await _storage.deleteFile(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Delete file failed: $e');
    }
  }

  // Real-time subscriptions
  RealtimeSubscription subscribeToTeams(Function(Map<String, dynamic>) onUpdate) {
    final subscription = _realtime.subscribe([
      'databases.${AppwriteConfig.databaseId}.collections.teams.documents'
    ]);
    subscription.stream.listen((event) {
      onUpdate(event.payload as Map<String, dynamic>);
    });
    return subscription;
  }

  RealtimeSubscription subscribeToMatches(Function(Map<String, dynamic>) onUpdate) {
    final subscription = _realtime.subscribe([
      'databases.${AppwriteConfig.databaseId}.collections.matches.documents'
    ]);
    subscription.stream.listen((event) {
      onUpdate(event.payload as Map<String, dynamic>);
    });
    return subscription;
  }

  void unsubscribe(RealtimeSubscription subscription) {
    subscription.close();
  }

  // Functions
  Future<Map<String, dynamic>> callFunction(String functionId, Map<String, dynamic> data) async {
    try {
      // This assumes you have Appwrite Functions set up
      // You may need to use the Functions API if available
      throw UnimplementedError('Appwrite Functions integration not implemented.');
    } catch (e) {
      throw Exception('Function call failed: $e');
    }
  }
} 