import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'perseverance.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Users table
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        email TEXT NOT NULL,
        name TEXT NOT NULL,
        role TEXT NOT NULL,
        teamId TEXT,
        avatarUrl TEXT,
        lastActive TEXT,
        isOnline INTEGER,
        preferences TEXT,
        createdAt TEXT,
        updatedAt TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Teams table
    await db.execute('''
      CREATE TABLE teams (
        id TEXT PRIMARY KEY,
        teamNumber TEXT NOT NULL,
        name TEXT NOT NULL,
        region TEXT NOT NULL,
        school TEXT,
        city TEXT,
        state TEXT,
        country TEXT,
        website TEXT,
        logoUrl TEXT,
        performanceMetrics TEXT,
        strengths TEXT,
        weaknesses TEXT,
        preferredAlliancePartners TEXT,
        compatibilityScores TEXT,
        notes TEXT,
        createdAt TEXT,
        updatedAt TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Matches table
    await db.execute('''
      CREATE TABLE matches (
        id TEXT PRIMARY KEY,
        matchNumber TEXT NOT NULL,
        eventId TEXT NOT NULL,
        allianceColor TEXT NOT NULL,
        teamIds TEXT NOT NULL,
        scores TEXT NOT NULL,
        autonomousData TEXT NOT NULL,
        driverControlledData TEXT NOT NULL,
        endgameData TEXT NOT NULL,
        currentPhase TEXT NOT NULL,
        startTime TEXT NOT NULL,
        endTime TEXT,
        notes TEXT,
        scoutId TEXT,
        isLive INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Scout Reports table
    await db.execute('''
      CREATE TABLE scout_reports (
        id TEXT PRIMARY KEY,
        teamId TEXT NOT NULL,
        matchId TEXT NOT NULL,
        type TEXT NOT NULL,
        scoutId TEXT NOT NULL,
        autonomousData TEXT NOT NULL,
        driverControlledData TEXT NOT NULL,
        endgameData TEXT NOT NULL,
        scores TEXT NOT NULL,
        strengths TEXT NOT NULL,
        weaknesses TEXT NOT NULL,
        notes TEXT NOT NULL,
        photoUrls TEXT,
        additionalData TEXT,
        createdAt TEXT,
        updatedAt TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Build Logs table
    await db.execute('''
      CREATE TABLE build_logs (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        status TEXT NOT NULL,
        progress REAL NOT NULL,
        author TEXT NOT NULL,
        tags TEXT NOT NULL,
        photoUrls TEXT,
        changes TEXT,
        performanceMetrics TEXT,
        robotVersion TEXT NOT NULL,
        createdAt TEXT,
        updatedAt TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Inventory Items table
    await db.execute('''
      CREATE TABLE inventory_items (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        category TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        minimumStock INTEGER NOT NULL,
        location TEXT NOT NULL,
        partNumber TEXT NOT NULL,
        supplier TEXT,
        cost REAL,
        lastUpdated TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Tools table
    await db.execute('''
      CREATE TABLE tools (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        status TEXT NOT NULL,
        checkedOutBy TEXT,
        checkedOutAt TEXT,
        dueBackAt TEXT,
        location TEXT,
        notes TEXT,
        lastMaintenance TEXT,
        syncStatus TEXT DEFAULT 'synced'
      )
    ''');

    // Sync Queue table
    await db.execute('''
      CREATE TABLE sync_queue (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tableName TEXT NOT NULL,
        recordId TEXT NOT NULL,
        operation TEXT NOT NULL,
        data TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        retryCount INTEGER DEFAULT 0
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades here
    if (oldVersion < 2) {
      // Add new columns or tables for version 2
    }
  }

  // Generic CRUD operations
  Future<int> insert(String table, Map<String, dynamic> data, {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) async {
    final db = await database;
    return await db.insert(table, data, nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm);
  }

  Future<int> update(String table, Map<String, dynamic> data, {String? where, List<dynamic>? whereArgs, ConflictAlgorithm? conflictAlgorithm}) async {
    final db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs, conflictAlgorithm: conflictAlgorithm);
  }

  Future<int> delete(String table, {String? where, List<dynamic>? whereArgs}) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<List<Map<String, dynamic>>> query(String table, {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
    final db = await database;
    return await db.query(table, where: where, whereArgs: whereArgs, orderBy: orderBy);
  }

  // Team operations
  Future<List<Map<String, dynamic>>> getTeams({String? search}) async {
    String? where;
    List<dynamic>? whereArgs;

    if (search != null && search.isNotEmpty) {
      where = 'name LIKE ? OR teamNumber LIKE ?';
      whereArgs = ['%$search%', '%$search%'];
    }

    return await query('teams', where: where, whereArgs: whereArgs, orderBy: 'name ASC');
  }

  Future<int> insertTeam(Map<String, dynamic> team) async {
    return await insert('teams', team);
  }

  Future<int> updateTeam(Map<String, dynamic> team) async {
    return await update('teams', team, where: 'id = ?', whereArgs: [team['id']]);
  }

  // Match operations
  Future<List<Map<String, dynamic>>> getMatches({String? eventId}) async {
    String? where;
    List<dynamic>? whereArgs;

    if (eventId != null) {
      where = 'eventId = ?';
      whereArgs = [eventId];
    }

    return await query('matches', where: where, whereArgs: whereArgs, orderBy: 'startTime DESC');
  }

  Future<int> insertMatch(Map<String, dynamic> match) async {
    return await insert('matches', match);
  }

  Future<int> updateMatch(Map<String, dynamic> match) async {
    return await update('matches', match, where: 'id = ?', whereArgs: [match['id']]);
  }

  // Scout Report operations
  Future<List<Map<String, dynamic>>> getScoutReports({String? teamId, String? matchId}) async {
    String? where;
    List<dynamic>? whereArgs;

    if (teamId != null && matchId != null) {
      where = 'teamId = ? AND matchId = ?';
      whereArgs = [teamId, matchId];
    } else if (teamId != null) {
      where = 'teamId = ?';
      whereArgs = [teamId];
    } else if (matchId != null) {
      where = 'matchId = ?';
      whereArgs = [matchId];
    }

    return await query('scout_reports', where: where, whereArgs: whereArgs, orderBy: 'createdAt DESC');
  }

  Future<int> insertScoutReport(Map<String, dynamic> report) async {
    return await insert('scout_reports', report);
  }

  // Sync operations
  Future<void> addToSyncQueue(String tableName, String recordId, String operation, Map<String, dynamic> data) async {
    final syncData = {
      'tableName': tableName,
      'recordId': recordId,
      'operation': operation,
      'data': data.toString(),
      'createdAt': DateTime.now().toIso8601String(),
    };
    await insert('sync_queue', syncData);
  }

  Future<List<Map<String, dynamic>>> getSyncQueue() async {
    return await query('sync_queue', orderBy: 'createdAt ASC');
  }

  Future<void> removeFromSyncQueue(int queueId) async {
    await delete('sync_queue', where: 'id = ?', whereArgs: [queueId]);
  }

  Future<void> updateSyncQueueRetryCount(int queueId, int retryCount) async {
    await update('sync_queue', {'retryCount': retryCount}, where: 'id = ?', whereArgs: [queueId]);
  }

  // Offline data operations
  Future<List<Map<String, dynamic>>> getUnsyncedData(String table) async {
    return await query(table, where: 'syncStatus != ?', whereArgs: ['synced']);
  }

  Future<void> markAsSynced(String table, String recordId) async {
    await update(table, {'syncStatus': 'synced'}, where: 'id = ?', whereArgs: [recordId]);
  }

  Future<void> markAsPending(String table, String recordId) async {
    await update(table, {'syncStatus': 'pending'}, where: 'id = ?', whereArgs: [recordId]);
  }

  // Database maintenance
  Future<void> clearOldData() async {
    final db = await database;
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30)).toIso8601String();
    
    // Clear old sync queue entries
    await db.delete('sync_queue', where: 'createdAt < ?', whereArgs: [thirtyDaysAgo]);
  }

  Future<void> vacuum() async {
    final db = await database;
    await db.execute('VACUUM');
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
} 