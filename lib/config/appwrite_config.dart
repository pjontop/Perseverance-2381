import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConfig {
  static String get endpoint => dotenv.env['APPWRITE_ENDPOINT']!;
  static String get projectId => dotenv.env['APPWRITE_PROJECT_ID']!;
  static String get apiKey => dotenv.env['APPWRITE_API_KEY']!;
  static String get databaseId => dotenv.env['APPWRITE_DATABASE_ID']!;

  // Storage bucket IDs
  static const String profilePhotosBucket = 'profile-photos';
  static const String buildPhotosBucket = 'build-photos';
  static const String competitionPhotosBucket = 'competition-photos';
  static const String documentsBucket = 'documents';
} 