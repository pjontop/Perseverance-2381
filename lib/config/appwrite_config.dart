import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConfig {
  // Get environment variables with fallbacks
  static String get endpoint => 
    dotenv.env['APPWRITE_ENDPOINT'] ?? 'https://cloud.appwrite.io/v1';
  
  static String get projectId => 
    dotenv.env['APPWRITE_PROJECT_ID'] ?? 'your-project-id';
  
  static String get databaseId => 
    dotenv.env['APPWRITE_DATABASE_ID'] ?? 'your-database-id';
  
  static String get apiKey => 
    dotenv.env['APPWRITE_API_KEY'] ?? 'your-api-key';
  
  static String get storageBucketId => 
    dotenv.env['APPWRITE_STORAGE_BUCKET_ID'] ?? 'your-bucket-id';
  
  // AI Service Configuration
  static String get aiApiKey => 
    dotenv.env['HACK_CLUB_AI_API_KEY'] ?? 'your-ai-api-key';
  
  static String get aiBaseUrl => 
    dotenv.env['HACK_CLUB_AI_BASE_URL'] ?? 'https://ai.hackclub.com';
  
  // App Configuration
  static String get appName => 
    dotenv.env['APP_NAME'] ?? 'Team Perseverance';
  
  static String get appVersion => 
    dotenv.env['APP_VERSION'] ?? '1.0.0';
  
  // Feature Flags
  static bool get enableAnalytics => 
    dotenv.env['ENABLE_ANALYTICS']?.toLowerCase() == 'true';
  
  static bool get enableCrashReporting => 
    dotenv.env['ENABLE_CRASH_REPORTING']?.toLowerCase() == 'true';
  
  static bool get enableOfflineMode => 
    dotenv.env['ENABLE_OFFLINE_MODE']?.toLowerCase() == 'true';
  
  // Performance Settings
  static int get maxCacheSize => 
    int.tryParse(dotenv.env['MAX_CACHE_SIZE'] ?? '100') ?? 100;
  
  static int get requestTimeout => 
    int.tryParse(dotenv.env['REQUEST_TIMEOUT'] ?? '30') ?? 30;
  
  static bool get enableCompression => 
    dotenv.env['ENABLE_COMPRESSION']?.toLowerCase() == 'true';
  
  // Development Settings
  static bool get isDevelopment => 
    dotenv.env['FLUTTER_ENV']?.toLowerCase() == 'development' || 
    dotenv.env['FLUTTER_ENV'] == null;
  
  static bool get enableDebugLogs => 
    dotenv.env['ENABLE_DEBUG_LOGS']?.toLowerCase() == 'true' || isDevelopment;
  
  // Validation
  static bool get isConfigured {
    return projectId != 'your-project-id' && 
           databaseId != 'your-database-id' && 
           apiKey != 'your-api-key';
  }
  
  // Get configuration summary for debugging
  static Map<String, dynamic> get configSummary {
    return {
      'endpoint': endpoint,
      'projectId': projectId,
      'databaseId': databaseId,
      'isConfigured': isConfigured,
      'isDevelopment': isDevelopment,
      'enableDebugLogs': enableDebugLogs,
    };
  }
} 