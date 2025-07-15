import 'dart:io';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as appwrite_models;
import 'package:appwrite/enums.dart';
import '../config/appwrite_config.dart';

class StorageService {
  late final Client _client;
  late final Storage _storage;
  
  StorageService() {
    _client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: true);
    
    _storage = Storage(_client);
  }

  // Upload file to storage
  Future<String> uploadFile({
    required String bucketId,
    required String filePath,
    String? fileId,
  }) async {
    try {
      final file = await _storage.createFile(
        bucketId: bucketId,
        fileId: fileId ?? ID.unique(),
        file: InputFile.fromPath(path: filePath),
      );
      return file.$id;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  // Upload file from bytes
  Future<String> uploadFileFromBytes({
    required String bucketId,
    required List<int> bytes,
    required String fileName,
    String? fileId,
  }) async {
    try {
      final file = await _storage.createFile(
        bucketId: bucketId,
        fileId: fileId ?? ID.unique(),
        file: InputFile.fromBytes(bytes: bytes, filename: fileName),
      );
      return file.$id;
    } catch (e) {
      throw Exception('Failed to upload file from bytes: $e');
    }
  }

  // Get file download (returns bytes)
  Future<Uint8List> getFileDownloadUrl({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      return await _storage.getFileDownload(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to get file download: $e');
    }
  }

  // Get file preview (returns bytes)
  Future<Uint8List> getFilePreviewUrl({
    required String bucketId,
    required String fileId,
    int? width,
    int? height,
    String? gravity,
    int? quality,
    int? borderWidth,
    String? borderColor,
    int? borderRadius,
    double? opacity,
    int? rotation,
    String? background,
    String? output,
  }) async {
    try {
      return await _storage.getFilePreview(
        bucketId: bucketId,
        fileId: fileId,
        width: width,
        height: height,
        gravity: gravity != null ? ImageGravity.values.firstWhere((g) => g.name == gravity, orElse: () => ImageGravity.center) : null,
        quality: quality,
        borderWidth: borderWidth,
        borderColor: borderColor,
        borderRadius: borderRadius,
        opacity: opacity,
        rotation: rotation,
        background: background,
        output: output != null ? ImageFormat.values.firstWhere((f) => f.name == output, orElse: () => ImageFormat.jpg) : null,
      );
    } catch (e) {
      throw Exception('Failed to get file preview: $e');
    }
  }

  // Delete file
  Future<void> deleteFile({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      await _storage.deleteFile(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  // List files in bucket
  Future<List<appwrite_models.File>> listFiles({
    required String bucketId,
    List<String>? queries,
    String? search,
  }) async {
    try {
      final result = await _storage.listFiles(
        bucketId: bucketId,
        queries: queries,
        search: search,
      );
      return result.files;
    } catch (e) {
      throw Exception('Failed to list files: $e');
    }
  }

  // Get file info
  Future<appwrite_models.File> getFile({
    required String bucketId,
    required String fileId,
  }) async {
    try {
      return await _storage.getFile(
        bucketId: bucketId,
        fileId: fileId,
      );
    } catch (e) {
      throw Exception('Failed to get file info: $e');
    }
  }

  // Update file
  Future<appwrite_models.File> updateFile({
    required String bucketId,
    required String fileId,
    String? name,
    List<String>? permissions,
  }) async {
    try {
      return await _storage.updateFile(
        bucketId: bucketId,
        fileId: fileId,
        name: name,
        permissions: permissions,
      );
    } catch (e) {
      throw Exception('Failed to update file: $e');
    }
  }

  // Upload profile photo
  Future<String> uploadProfilePhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.storageBucketId,
      filePath: filePath,
    );
  }

  // Upload build photo
  Future<String> uploadBuildPhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.storageBucketId,
      filePath: filePath,
    );
  }

  // Upload competition photo
  Future<String> uploadCompetitionPhoto(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.storageBucketId,
      filePath: filePath,
    );
  }

  // Upload document
  Future<String> uploadDocument(String filePath) async {
    return await uploadFile(
      bucketId: AppwriteConfig.storageBucketId,
      filePath: filePath,
    );
  }
} 