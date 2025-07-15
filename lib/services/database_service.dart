import 'package:appwrite/appwrite.dart';
import 'dart:async';
import '../config/appwrite_config.dart';

class DatabaseService {
  late final Client _client;
  late final Databases _databases;
  late final Realtime _realtime;
  
  DatabaseService() {
    _client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: true);
    
    _databases = Databases(_client);
    _realtime = Realtime(_client);
  }

  // Generic CRUD operations with timeout and error handling
  Future<Map<String, dynamic>> createDocument({
    required String collectionId,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      final doc = await _databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        documentId: documentId ?? ID.unique(),
        data: data,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Request timed out'),
      );
      return doc.data;
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to create document: $e');
      }
      throw Exception('Failed to create document: $e');
    }
  }

  Future<Map<String, dynamic>> getDocument({
    required String collectionId,
    required String documentId,
  }) async {
    try {
      final doc = await _databases.getDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        documentId: documentId,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Request timed out'),
      );
      return doc.data;
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to get document: $e');
      }
      throw Exception('Failed to get document: $e');
    }
  }

  Future<List<Map<String, dynamic>>> listDocuments({
    required String collectionId,
    List<String>? queries,
  }) async {
    try {
      final response = await _databases.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        queries: queries,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Request timed out'),
      );
      return response.documents.map((doc) => doc.data).toList();
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to list documents: $e');
      }
      throw Exception('Failed to list documents: $e');
    }
  }

  Future<Map<String, dynamic>> updateDocument({
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final doc = await _databases.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: data,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Request timed out'),
      );
      return doc.data;
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to update document: $e');
      }
      throw Exception('Failed to update document: $e');
    }
  }

  Future<void> deleteDocument({
    required String collectionId,
    required String documentId,
  }) async {
    try {
      await _databases.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        documentId: documentId,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Request timed out'),
      );
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to delete document: $e');
      }
      throw Exception('Failed to delete document: $e');
    }
  }

  // Real-time subscriptions with error handling
  Stream<Map<String, dynamic>> subscribeToCollection({
    required String collectionId,
    required Function(Map<String, dynamic>) callback,
  }) {
    final controller = StreamController<Map<String, dynamic>>();
    
    try {
      final subscription = _realtime.subscribe([
        'databases.${AppwriteConfig.databaseId}.collections.$collectionId.documents'
      ]);
      
      subscription.stream.listen(
        (event) {
          try {
            final data = event.payload as Map<String, dynamic>;
            callback(data);
            controller.add(data);
          } catch (e) {
            if (AppwriteConfig.enableDebugLogs) {
              print('Error processing real-time event: $e');
            }
          }
        },
        onError: (error) {
          if (AppwriteConfig.enableDebugLogs) {
            print('Real-time subscription error: $error');
          }
          controller.addError(error);
        },
      );
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to create real-time subscription: $e');
      }
      controller.addError(e);
    }
    
    return controller.stream;
  }

  Stream<Map<String, dynamic>> subscribeToDocument({
    required String collectionId,
    required String documentId,
    required Function(Map<String, dynamic>) callback,
  }) {
    final controller = StreamController<Map<String, dynamic>>();
    
    try {
      final subscription = _realtime.subscribe([
        'databases.${AppwriteConfig.databaseId}.collections.$collectionId.documents.$documentId'
      ]);
      
      subscription.stream.listen(
        (event) {
          try {
            final data = event.payload as Map<String, dynamic>;
            callback(data);
            controller.add(data);
          } catch (e) {
            if (AppwriteConfig.enableDebugLogs) {
              print('Error processing real-time event: $e');
            }
          }
        },
        onError: (error) {
          if (AppwriteConfig.enableDebugLogs) {
            print('Real-time subscription error: $error');
          }
          controller.addError(error);
        },
      );
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to create real-time subscription: $e');
      }
      controller.addError(e);
    }
    
    return controller.stream;
  }

  // Team-specific operations
  Future<List<Map<String, dynamic>>> getTeams() async {
    return await listDocuments(
      collectionId: 'teams',
      queries: [
        Query.orderAsc('name'),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getTeamMembers(String teamId) async {
    return await listDocuments(
      collectionId: 'users',
      queries: [
        Query.equal('teamId', teamId),
        Query.orderAsc('name'),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getTeamTasks(String teamId) async {
    return await listDocuments(
      collectionId: 'tasks',
      queries: [
        Query.equal('teamId', teamId),
        Query.orderAsc('dueDate'),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getTeamBuildLogs(String teamId) async {
    return await listDocuments(
      collectionId: 'build_logs',
      queries: [
        Query.equal('teamId', teamId),
        Query.orderDesc('createdAt'),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getTeamInventory(String teamId) async {
    return await listDocuments(
      collectionId: 'inventory',
      queries: [
        Query.equal('teamId', teamId),
        Query.orderAsc('name'),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getTeamMeetings(String teamId) async {
    return await listDocuments(
      collectionId: 'meetings',
      queries: [
        Query.equal('teamId', teamId),
        Query.orderAsc('scheduledDate'),
      ],
    );
  }

  // Search functionality with timeout
  Future<List<Map<String, dynamic>>> searchDocuments({
    required String collectionId,
    required String searchTerm,
    List<String>? searchAttributes,
  }) async {
    try {
      final queries = [
        Query.search(searchAttributes?.first ?? 'name', searchTerm),
      ];
      final response = await _databases.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: collectionId,
        queries: queries,
      ).timeout(
        Duration(seconds: AppwriteConfig.requestTimeout),
        onTimeout: () => throw TimeoutException('Search request timed out'),
      );
      return response.documents.map((doc) => doc.data).toList();
    } catch (e) {
      if (AppwriteConfig.enableDebugLogs) {
        print('Failed to search documents: $e');
      }
      throw Exception('Failed to search documents: $e');
    }
  }

  // Batch operations with progress tracking
  Future<List<Map<String, dynamic>>> batchCreateDocuments({
    required String collectionId,
    required List<Map<String, dynamic>> documents,
  }) async {
    final createdDocuments = <Map<String, dynamic>>[];
    
    for (int i = 0; i < documents.length; i++) {
      try {
        final data = documents[i];
        final document = await createDocument(
          collectionId: collectionId,
          data: data,
        );
        createdDocuments.add(document);
        
        // Add small delay to prevent overwhelming the server
        if (i < documents.length - 1) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
      } catch (e) {
        if (AppwriteConfig.enableDebugLogs) {
          print('Failed to create document in batch: $e');
        }
      }
    }
    
    return createdDocuments;
  }
} 